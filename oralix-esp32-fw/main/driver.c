//
// Created by reinis on 18.07.20.
//
#include "driver.h"
#include <memory.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include <driver/gpio.h>
#include <driver/timer.h>
#define ARM_RELAY_GPIO 21
#define FIRE_TRIAC_GPIO 19
#define STATUS_LED_GPIO 23

//DUTY cycle of tube (if firing for 100ms, need to wait 100ms * 30 before firing again
#define TUBE_DUTY_CYCLE 30
#define ZCD_POS_GPIO 16
#define ZCD_NEG_GPIO 17

//length of mains half-cycle at 50Hz
#define PULSE_DURATION_US 20000
#define NUM_WARMUP_PULSES 6

inline void delay_ms(uint32_t ms) {
    vTaskDelay(ms / portTICK_PERIOD_MS);
}
typedef struct {
    uint32_t zcd_num_pos_rising_pulses;
    uint64_t zcd_pos_rising_pulse_us;
    uint32_t zcd_num_neg_rising_pulses;
    uint64_t zcd_neg_rising_pulse_us;

    uint64_t fire_start_us;
    uint64_t fire_end_us;

    bool fire_on_zcd;
    bool is_firing;
    bool armed;
    uint32_t fire_duration_us;
    uint32_t fire_actual_duration_us;
} timing_state_t;

static volatile timing_state_t state;

esp_timer_handle_t fire_stop_timer;

/**
 * Checks if it's safe to fire the tube (duty cycle not exceeded)
 * @return
 */
static bool driver_check_duty_cycle() {
    uint64_t time_us = esp_timer_get_time();
    if (state.fire_actual_duration_us == 0)
        return true;

    uint64_t cool_time = time_us - state.fire_end_us;
    if ((cool_time / state.fire_actual_duration_us) < TUBE_DUTY_CYCLE) {
        //duty cycle exceeded
        return false;
    }

    return true;
}
static void driver_task(void* arg) {
    for (int i = 0; i < 5; i++) {
        gpio_set_level(STATUS_LED_GPIO, 1);
        delay_ms(100);
        gpio_set_level(STATUS_LED_GPIO, 0);
        delay_ms(100);
    }

    while (1) {
        gpio_set_level(STATUS_LED_GPIO, 1);
        delay_ms(1000);
        gpio_set_level(STATUS_LED_GPIO, 0);
        delay_ms(1000);
    }
}

static void driver_int_zcd_pos(void* arg) {
    uint64_t time_us = esp_timer_get_time();
    //debounce
    if ((time_us - state.zcd_pos_rising_pulse_us) > 5000) {
        state.zcd_num_pos_rising_pulses++;
        state.zcd_pos_rising_pulse_us = time_us;

        if (state.fire_on_zcd) {
            state.fire_start_us = time_us;
            state.fire_end_us = time_us + state.fire_duration_us;
            state.fire_on_zcd = false;
            state.fire_actual_duration_us = 0;
            gpio_set_level(FIRE_TRIAC_GPIO, 1);
            esp_timer_start_once(fire_stop_timer, state.fire_duration_us);
            state.is_firing = true;
        }

    }
}

static void driver_int_zcd_neg(void* arg) {
    uint64_t time_us = esp_timer_get_time();
    //debounce
    if ((time_us - state.zcd_neg_rising_pulse_us) > 5000) {
        state.zcd_num_neg_rising_pulses++;
        state.zcd_neg_rising_pulse_us = time_us;
    }
}

static void driver_stop_fire(void* arg) {

    gpio_set_level(FIRE_TRIAC_GPIO, 0);
    uint64_t time_us = esp_timer_get_time();
    state.is_firing = false;
    state.fire_actual_duration_us = time_us - state.fire_start_us;
}

void driver_init()
{
    memset(&state, 0, sizeof(state));
    gpio_pad_select_gpio(ARM_RELAY_GPIO);
    gpio_pad_select_gpio(FIRE_TRIAC_GPIO);
    gpio_pad_select_gpio(STATUS_LED_GPIO);
    gpio_pad_select_gpio(ZCD_POS_GPIO);
    gpio_pad_select_gpio(ZCD_NEG_GPIO);

    /* Set the GPIO as a push/pull output */
    gpio_set_level(FIRE_TRIAC_GPIO, 0);
    gpio_set_direction(FIRE_TRIAC_GPIO, GPIO_MODE_OUTPUT);

    gpio_set_level(ARM_RELAY_GPIO, 0);
    gpio_set_direction(ARM_RELAY_GPIO, GPIO_MODE_OUTPUT);

    gpio_set_level(STATUS_LED_GPIO, 0);
    gpio_set_direction(STATUS_LED_GPIO, GPIO_MODE_OUTPUT);

    /* Set GPIO as inputs with pull-ups (in case the ones on board unsolder themselves */
    gpio_set_direction(ZCD_POS_GPIO, GPIO_MODE_INPUT);
    gpio_pullup_en(ZCD_POS_GPIO);
    gpio_set_direction(ZCD_NEG_GPIO, GPIO_MODE_INPUT);
    gpio_pullup_en(ZCD_NEG_GPIO);
    esp_timer_create_args_t args;
    args.name = "fire-stop-timer";
    args.arg = NULL;
    args.dispatch_method = ESP_TIMER_TASK;
    args.callback = &driver_stop_fire;
    esp_timer_create(&args, &fire_stop_timer);

    gpio_install_isr_service(0);
    gpio_isr_handler_add(ZCD_POS_GPIO, &driver_int_zcd_pos, NULL);
    gpio_set_intr_type(ZCD_POS_GPIO, GPIO_INTR_POSEDGE);
    gpio_isr_handler_add(ZCD_NEG_GPIO, &driver_int_zcd_neg, NULL);
    gpio_set_intr_type(ZCD_NEG_GPIO, GPIO_INTR_POSEDGE);
    xTaskCreatePinnedToCore(&driver_task, "xray", 8048, NULL, 5, NULL, 1);
}

bool driver_arm() {
    gpio_set_level(ARM_RELAY_GPIO, 1);
    state.armed = true;
    return true;
}

bool driver_disarm() {
    gpio_set_level(ARM_RELAY_GPIO, 0);
    state.armed = false;
    return true;
}

uint32_t driver_get_status(char *outstr, uint32_t outstrlen) {
    return snprintf(outstr, outstrlen, "armed: %d\nzcd_pos: %d\nzcd_neg: %d\nis_firing: %d\nfire_actual_duration_us: %d\n",
            state.armed,
            state.zcd_num_pos_rising_pulses,
            state.zcd_num_neg_rising_pulses,
            state.is_firing,
            state.fire_actual_duration_us
            );
}

bool driver_warmup() {
    if (driver_check_duty_cycle() && state.armed) {
        state.fire_duration_us = NUM_WARMUP_PULSES * PULSE_DURATION_US;
        state.fire_on_zcd = true;
        return true;
    }
    return false;
}

bool driver_fire_time(uint32_t milliseconds) {
    if (driver_check_duty_cycle() && state.armed) {
        //round down to nearest half-cycle length
        state.fire_duration_us = (milliseconds * 1000 + NUM_WARMUP_PULSES * PULSE_DURATION_US) / PULSE_DURATION_US * PULSE_DURATION_US;
        state.fire_on_zcd = true;
        return true;
    }
    return false;
}

bool driver_fire_time_nowarmup(uint32_t milliseconds) {
    if (driver_check_duty_cycle() && state.armed) {
        state.fire_duration_us = (milliseconds * 1000);
        state.fire_on_zcd = true;
        return true;
    }
    return false;
}

/*  WiFi softAP Example

   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "esp_log.h"
#include "nvs_flash.h"
#include "telnet.h"
#include "lwip/err.h"
#include "lwip/sys.h"
#include "driver.h"
/* The examples use WiFi configuration that you can set via project configuration menu.

   If you'd rather not, just change the below entries to strings with
   the config you want - ie #define EXAMPLE_WIFI_SSID "mywifissid"
*/
#define EXAMPLE_ESP_WIFI_SSID      CONFIG_ESP_WIFI_SSID
#define EXAMPLE_ESP_WIFI_PASS      CONFIG_ESP_WIFI_PASSWORD
#define EXAMPLE_MAX_STA_CONN       CONFIG_ESP_MAX_STA_CONN

static const char *TAG = "wifi";

static void wifi_event_handler(void* arg, esp_event_base_t event_base,
                                    int32_t event_id, void* event_data)
{
    if (event_id == WIFI_EVENT_AP_STACONNECTED) {
        wifi_event_ap_staconnected_t* event = (wifi_event_ap_staconnected_t*) event_data;
        ESP_LOGI(TAG, "station "MACSTR" join, AID=%d",
                 MAC2STR(event->mac), event->aid);
    } else if (event_id == WIFI_EVENT_AP_STADISCONNECTED) {
        wifi_event_ap_stadisconnected_t* event = (wifi_event_ap_stadisconnected_t*) event_data;
        ESP_LOGI(TAG, "station "MACSTR" leave, AID=%d",
                 MAC2STR(event->mac), event->aid);
    }
}

static char tag[] = "telnet";

void respond(const char* resp) {
    telnet_esp32_sendData((uint8_t *)resp, strlen(resp));
}

static void recvData(uint8_t *buffer, size_t size) {
	ESP_LOGD(tag, "We received: %.*s", size, buffer);

    if (strncmp((char*)buffer, "help", 4) == 0) {
        respond("Welcome brave warrior!\n");
        respond("Commands: \n");
        respond("status: driver status\n");
        respond("arm: arms the device (enables input relay)\n");
        respond("disarm: disarms\n");
        respond("warmup: warms up the tube (sends 6 pulses)\n");
        respond("fire <ms>: warms up the tube and performs an exposure of <ms> duration\n");
        respond("fire_nowarmup <ms>: fires tube for <ms> without warmup (CAUTION!)\n");
        respond("\n");
    }

    if (strncmp((char*)buffer, "status", 6) == 0) {
        char buf[256];
        uint32_t len = driver_get_status(buf, sizeof(buf));
        telnet_esp32_sendData((uint8_t *)buf, len);
    }

    if (strncmp((char*)buffer, "arm", 3) == 0) {
	    if (driver_arm()) {
	        respond("armed\n");
	    } else {
	        respond("failed to arm\n");
	    }
	}
    if (strncmp((char*)buffer, "disarm", 6) == 0) {
        if (driver_disarm()) {
            respond("disarmed\n");
        } else {
            respond("failed to disarm, run!\n");
        }
    }
    if (strncmp((char*)buffer, "warmup", 6) == 0) {
        if (driver_warmup()) {
            respond("started warmup\n");
        } else {
            respond("failed to start warmup!\n");
        }
    }
    if (strncmp((char*)buffer, "fire_nowarmup", 13) == 0) {
        int time_ms;
        if (sscanf((char*)(buffer + 14), "%d", &time_ms) == 1) {
            if (time_ms < 0 || time_ms > 3000) {
                respond("Dave, I'm afraid I can't do that.\n");
            } else {
                if (driver_fire_time_nowarmup(time_ms)) {
                    respond("firing!\n");
                } else {
                    respond("failed to fire!\n");
                }
            }
        } else {
            respond("failed to parse time!\n");
        }
    } else if (strncmp((char*)buffer, "fire", 4) == 0) {
        int time_ms;
        if (sscanf((char*)(buffer + 5), "%d", &time_ms) == 1) {
            if (time_ms < 0 || time_ms > 3000) {
                respond("Dave, I'm afraid I can't do that.\n");
            } else {
                if (driver_fire_time(time_ms)) {
                    respond("firing!\n");
                } else {
                    respond("failed to fire!\n");
                }
            }
        } else {
            respond("failed to parse time!\n");
        }
    }
}

static void telnetTask(void *data) {
	ESP_LOGD(tag, ">> telnetTask");
	telnet_esp32_listenForClients(recvData);
	ESP_LOGD(tag, "<< telnetTask");
	vTaskDelete(NULL);
}


void wifi_init_softap()
{
    tcpip_adapter_init();
    ESP_ERROR_CHECK(esp_event_loop_create_default());

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));

    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &wifi_event_handler, NULL));

    wifi_config_t wifi_config = {
        .ap = {
            .ssid = EXAMPLE_ESP_WIFI_SSID,
            .ssid_len = strlen(EXAMPLE_ESP_WIFI_SSID),
            .password = EXAMPLE_ESP_WIFI_PASS,
            .max_connection = EXAMPLE_MAX_STA_CONN,
            .authmode = WIFI_AUTH_WPA_WPA2_PSK
        },
    };
    if (strlen(EXAMPLE_ESP_WIFI_PASS) == 0) {
        wifi_config.ap.authmode = WIFI_AUTH_OPEN;
    }

    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_AP));
    ESP_ERROR_CHECK(esp_wifi_set_config(ESP_IF_WIFI_AP, &wifi_config));
    ESP_ERROR_CHECK(esp_wifi_start());

    ESP_LOGI(TAG, "wifi_init_softap finished. SSID:%s password:%s",
             EXAMPLE_ESP_WIFI_SSID, EXAMPLE_ESP_WIFI_PASS);
}

void app_main()
{
    //Initialize NVS
    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND) {
      ESP_ERROR_CHECK(nvs_flash_erase());
      ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK(ret);

    ESP_LOGI(TAG, "ESP_WIFI_MODE_AP");
    wifi_init_softap();
    xTaskCreatePinnedToCore(&telnetTask, "telnetTask", 8048, NULL, 5, NULL, 0);
    driver_init();
}

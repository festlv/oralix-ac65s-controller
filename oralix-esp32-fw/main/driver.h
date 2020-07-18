//
// Created by reinis on 18.07.20.
//

#ifndef XRAY_DRIVER_H
#define XRAY_DRIVER_H

#include <stdbool.h>
#include <stdint.h>

void driver_init();

bool driver_arm();
bool driver_disarm();

bool driver_fire_time(uint32_t milliseconds);
bool driver_fire_time_nowarmup(uint32_t milliseconds);
bool driver_warmup();

uint32_t driver_get_status(char* outstr, uint32_t outstrlen);

#endif //XRAY_DRIVER_H

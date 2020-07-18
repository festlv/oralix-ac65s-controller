# Triac driver for Gendex Oralix AC65s

This repository contains firmware for ESP32 which controls a triac and allows 
firing X-Ray tube remotely via telnet (providing ultimate galvanic isolation).

Project is built against esp-idf v4.0.x

## Building and installing

    mkdir build && cd build
    cmake ..
    make -j8
    # make menuconfig if want to customize WiFi AP name
    make flash
    
## Usage

0. ESP32 will act as WiFi access point.
1. Connect to WiFi AP (AngryPhotons by default)
2. Use telnet client to connect to 192.168.4.1:23
3. Enter help to see the list of commands (arm, disarm, fire, warmup)

//
// Created by Wu Feiyang on 2023/1/30.
//
#include "ch.hpp"
#include "hal.h"
#include "led.h"
#include "thread_priorities.h"
int main(){
    halInit();
    chibios_rt::System::init();
    Led::led_init(THREAD_LED);
}
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
    palSetPadMode(GPIOA,12,PAL_MODE_OUTPUT_PUSHPULL);
    palSetPad(GPIOA,12);
    palClearPad(GPIOA,12);
}
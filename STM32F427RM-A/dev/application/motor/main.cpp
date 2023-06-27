//
// Created by Wu Feiyang on 2023/6/26.
//
#include "ch.hpp"
#include "hal.h"
#include "led.h"
#include "thread_priorities.h"

int main(){
    halInit();
    chibios_rt::System::init();

}
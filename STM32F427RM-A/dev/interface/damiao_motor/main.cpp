//
// Created by Wu Feiyang on 2023/7/12.
//
#include "hal.h"
#include "ch.hpp"

int main(){
    halInit();
    chibios_rt::System::init();
}

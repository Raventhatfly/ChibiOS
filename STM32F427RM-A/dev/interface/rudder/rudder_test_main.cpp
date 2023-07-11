//
// Created by Wu Feiyang on 2023/7/11.
//
#include "hal.h"
#include "ch.hpp"
#include "rudder_interface.h"


int main(){
    halInit();
    chibios_rt::System::init();
    Rudder rudder1(&PWMD4,nullptr,0);
    rudder1.start();
    rudder1.set_rudder_angle(400);
    while(1){

    }
}


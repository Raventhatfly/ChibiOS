//
// Created by Wu Feiyang on 2023/7/18.
//

#include "rudder_scheduler.h"

void RudderSKD::init(tprio_t skd_prio) {
    skd_thread.start(skd_prio);
}

void RudderSKD::SKDThread::main() {
    setName("RudderSKD");
    Rudder rudder(&PWMD4, nullptr,0,Rudder::MG995);
    virtual_timer_t timer;
    chVTReset(&timer);
    rudder.start();
    while(shouldTerminate()){
        if(TIME_I2MS(chVTGetSystemTime())==1000){
            rudder.stop();
            break;
        }
    }
}

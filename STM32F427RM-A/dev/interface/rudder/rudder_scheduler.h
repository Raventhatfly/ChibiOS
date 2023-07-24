//
// Created by Wu Feiyang on 2023/7/18.
//

#ifndef EXPLORER_RUDDER_SCHEDULER_H
#define EXPLORER_RUDDER_SCHEDULER_H
#include "hal.h"
#include "ch.hpp"
#include "rudder_interface.h"
class RudderSKD{
public:
    void init(tprio_t skd_prio);

private:
    class SKDThread:public chibios_rt::BaseStaticThread<512>{
        void main() final;
    };
    SKDThread skd_thread;

};
#endif //EXPLORER_RUDDER_SCHEDULER_H

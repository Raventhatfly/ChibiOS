//
// Created by Wu Feiyang on 2023/6/26.
//
#include "ch.hpp"
#include "hal.h"
#include "led.h"
#include "thread_priorities.h"
#include "can_motor_controller.h"
#include "can_motor_interface.h"

CANInterface can1(&CAND1);
CANInterface can2(&CAND2);

int main(){
    halInit();
    chibios_rt::System::init();

    //Shell::start(HIGHPRIO);

    can1.start(NORMALPRIO+3);
    can2.start(NORMALPRIO+4);

    CANMotorController::start(LOWPRIO+1,LOWPRIO+2,&can1,&can2);
    CANMotorCFG::enable_v2i[CANMotorCFG::MOTOR_ONE] = true;
    CANMotorController::set_target_vel(CANMotorCFG::MOTOR_ONE,100);
#if CH_CFG_NO_IDLE_THREAD // see chconf.h for what this #define means
    // ChibiOS idle thread has been disabled, main() should implement infinite loop
    while (true) {}
#else
    // When main() quits, the main thread will somehow enter an infinite loop, so we set the priority to lowest
    // before quitting, to let other threads run normally
    BaseThread::setPriority(1);
#endif
    return 0;
}
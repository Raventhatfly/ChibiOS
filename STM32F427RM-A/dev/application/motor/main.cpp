//
// Created by Wu Feiyang on 2023/6/26.
//
#include "ch.hpp"
#include "hal.h"
#include "can_motor_controller.h"
#include "can_motor_interface.h"
#include "chprintf.h"
#include "shell.h"
#include "led.h"
#include "hal_serial_usb.h"

CANInterface can1(&CAND1);
CANInterface can2(&CAND2);

class flahsLightThread:public BaseStaticThread<512>{
private:
    void main() final;
}flash_light_thread;

void flahsLightThread::main(){
    setName("NewThread");
    while(!shouldTerminate()){
        Led::green_on();
        sleep(TIME_MS2I(500));
        Led::green_off();
        sleep(TIME_MS2I(500));
    }
}

class printThread: public BaseStaticThread<512>{
private:
    CANMotorFeedback feedback;
    void main() final{
        setName("print");
        while(!shouldTerminate()){
            feedback = CANMotorIF::motor_feedback[CANMotorCFG::MOTOR_ONE];
            LOG("%f\n\r",feedback.accumulate_angle());
            chprintf((BaseSequentialStream*)&USBSerialIF::SDU,"hello\r\n");
            chThdSleepMilliseconds(500);
        }

    }
}print_thread;

int main(){
    halInit();
    Led::red_on();
    chibios_rt::System::init();
    Shell::start(LOWPRIO);

    can1.start(NORMALPRIO+3);
    can2.start(NORMALPRIO+4);
    flash_light_thread.start(NORMALPRIO-1);

    CANMotorCFG::enable_v2i[CANMotorCFG::MOTOR_ONE] = true;
    CANMotorController::start(HIGHPRIO-1,HIGHPRIO-2,&can1,&can2);

    //LOG("1\r\n");
//    Shell::printf("hello\r\n");


    //CANMotorFeedback feedback = CANMotorIF::motor_feedback[CANMotorCFG::MOTOR_ONE];

    print_thread.start(HIGHPRIO);


    CANMotorController::set_target_vel(CANMotorCFG::MOTOR_ONE,1000);

    chThdSleepSeconds(5);
    chprintf((BaseSequentialStream*)&USBSerialIF::SDU,"hello world\r\n");


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

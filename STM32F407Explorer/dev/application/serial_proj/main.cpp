//
// Created by Wu Feiyang on 2023/2/1.
//

#include "ch.hpp"
#include "hal.h"
#include "hal_serial.h"
#include "chprintf.h"



//SerialInterface Serial1(&SD1);

int main(){
    halInit();
    chibios_rt::System::init();
    sdInit();
    sdStart(&SD1, NULL);            // Using default, bound rate 38400
    //const char* token= "Hohoho\r\n";
    while(1){
        chprintf((BaseSequentialStream*)&SD1,"Hello%d\r\n",10);
        chThdSleepMilliseconds(500);
    }
}


//#include "hal_can.h"
//
//int main(){
//    halInit();
//    chibios_rt::System::init();
//    CANConfig can_cfg = {
//            CAN_MCR_ABOM | CAN_MCR_AWUM | CAN_MCR_TXFP,
//            CAN_BTR_SJW(0) | CAN_BTR_TS2(3) |
//            CAN_BTR_TS1(8) | CAN_BTR_BRP(2)
//    };
//
//    canStart(&CAND1, &can_cfg);
//
//
//}

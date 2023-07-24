//
// Created by Wu Feiyang on 2023/7/23.
//

#include "hal.h"
#include "ch.hpp"
#include "can_interface.h"
#include "shell.h"
#include "damiao_motor_feedback.h"
#include "damiao_motor_controller.h"

CANInterface can1(&CAND1);
CANInterface can2(&CAND2);

static CANConfig can_cfg = {
        CAN_MCR_ABOM | CAN_MCR_AWUM | CAN_MCR_TXFP,
        CAN_BTR_SJW(0) | CAN_BTR_TS2(3) |
        CAN_BTR_TS1(8) | CAN_BTR_BRP(2)
};


static CANTxFrame can_tx_frame[2];

static uint8_t ctr_id;
static uint8_t err;
static uint16_t pos;
static uint16_t vel;
static uint16_t torque;
static uint8_t mos_avg_tempr;
static uint8_t rotor_avg_tempr;

class recieveThread : public chibios_rt::BaseStaticThread<512>{
    void main() override{
        setName("recieve");
        CANRxFrame rxmsg;
        event_listener_t el;

        // Register an event listener for the rx event source from CANInterface driver
        chEvtRegister(&(CAND1.rxfull_event), &el, 0);

        while (!shouldTerminate()) {

            // Wait until an event occurs
            waitAnyEvent(ALL_EVENTS);

            // Process every received message
            while (canReceive(&CAND1, CAN_ANY_MAILBOX, &rxmsg, TIME_IMMEDIATE) == MSG_OK) {
                if(rxmsg.SID==0x00){
                    chSysLock();
                    ctr_id = rxmsg.data8[0] & 0x0f;
                    err = rxmsg.data8[0] & 0xf0;
                    pos = rxmsg.data8[1]<<8 | rxmsg.data8[2];
                    vel = rxmsg.data8[3]<<4 | rxmsg.data8[4]>>4;
                    torque = rxmsg.data8[5];
                    mos_avg_tempr = rxmsg.data8[6];
                    rotor_avg_tempr = rxmsg.data8[7];
                    chSysUnlock();
                }
            }
            chThdSleepMilliseconds(100);
        }
    }
}recieve_thread;

class printThread : public chibios_rt::BaseStaticThread<512>{
    void main() final{
        setName("print");
        LOG("Recieve Message: ID | Error | POS | VEL | TORQUE | MOS_T | ROTOR_T");
        DamiaoMotorFeedback feedback;
        while(!shouldTerminate()){
            LOG("                 %d|%d|%d|%d|%d|%d|%d",ctr_id,err,pos,vel,torque,mos_avg_tempr,rotor_avg_tempr);
            chThdSleepMilliseconds(500);
        }
    }
}print_thread;

int main(){
    halInit();
    chibios_rt::System::init();
    can1.start(HIGHPRIO);
    can2.start(HIGHPRIO-1);
    DamiaoMotorController::start(NORMALPRIO+1,NORMALPRIO,&can1,&can2);
    DamiaoMotorController::motor_enable(DamiaoMotorCFG::YAW);
    DamiaoMotorController::set_target_vel(DamiaoMotorCFG::YAW,10);

}
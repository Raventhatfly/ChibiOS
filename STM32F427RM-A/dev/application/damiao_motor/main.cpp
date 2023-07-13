//
// Created by Wu Feiyang on 2023/7/12.
//

#include "hal.h"
#include "ch.hpp"
#include "can_interface.h"
#include "shell.h"

CANInterface can1(&CAND1);

float uint_to_float(int x_int, float x_min, float x_max, int bits){
    /// converts unsigned int to float, given range and number of bits ///
    float span = x_max - x_min;
    float offset = x_min;
    return ((float)x_int)*span/((float)((1<<bits)-1)) + offset;
}

int float_to_uint(float x, float x_min, float x_max, int bits){
    /// Converts a float to an unsigned int, given range and number of bits
    float span = x_max - x_min;
    float offset = x_min;
    return (int) ((x-offset)*((float)((1<<bits)-1))/span);
}

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
        while(!shouldTerminate()){
            LOG("                 %d|%d|%d|%d|%d|%d|%d",ctr_id,err,pos,vel,torque,mos_avg_tempr,rotor_avg_tempr);
            chThdSleepMilliseconds(500);
        }
    }
}print_thread;

int main(){
    halInit();
    chibios_rt::System::init();

    Shell::start(NORMALPRIO+1);
    can_tx_frame[0].DLC = 0x08;
    can_tx_frame[0].RTR = CAN_RTR_DATA;
    can_tx_frame[0].IDE = CAN_IDE_STD;
    can_tx_frame[0].SID = 0x201;    //TODO: Just write a ramdom number, to be modified later
    can1.start(NORMALPRIO);
    recieve_thread.start(HIGHPRIO);
    print_thread.start(NORMALPRIO-2);
    chThdSleepMilliseconds(3000);
    for(int i=5;i > 0;i--){
        can_tx_frame[0].DLC = 0x08;
        can_tx_frame[0].data64[0] = 0xfcffffffffffffff;
        can1.send_msg(&can_tx_frame[0]);
        chThdSleepMilliseconds(10);
    }



    while (true) {

        can_tx_frame[0].DLC = 0x04;
        float vel = 10.0;
        uint32_t* pvel;
        pvel = (uint32_t*) &vel;
        can_tx_frame[0].data32[0] = *pvel;
        can1.send_msg(&can_tx_frame[0]);
        chThdSleepMilliseconds(10);
    }
}
//
// Created by Chen Qian on 10/29/21.
//

/**
 * @file can_motor_interface.cpp
 * @brief Class to handle CAN motor feedback data.
 *
 * @addtogroup CAN Driver
 * @{
 */

#include "damiao_motor_interface.h"



/** @} */
void DamiaoMotorIF::init(CANInterface *can1_, CANInterface *can2_) {
    can1 = can1_;
    can2 = can2_;
    for(auto & i : motors_can_tx_frame){
        i.DLC = 0x08;
        i.RTR = CAN_RTR_DATA;
        i.IDE = CAN_IDE_STD;
    }
    for(auto & i : motors_mode){
        i = MIT_MODE;       //default mode MIT mode
    }
}

void DamiaoMotorIF::start(DamiaoMotorCFG::MotorName motorProfile) {
    chThdSleepMilliseconds(3000);
    for(int i=10;i > 0;i--){
        if(motors_mode[motorProfile] != VEL_MODE){
            motors_can_tx_frame[motorProfile].DLC = 0x08;
        }else{
            motors_can_tx_frame[motorProfile].DLC = 0x04;
        }
        motors_can_tx_frame[motorProfile].DLC = 0x08;
        motors_can_tx_frame[motorProfile].data64[0] = start_cmd;
        can1->send_msg(&motors_can_tx_frame[motorProfile]);
        chThdSleepMilliseconds(10);
    }
}

void DamiaoMotorIF::stop(DamiaoMotorCFG::MotorName motorProfile) {
    for(int i=5;i > 0;i--){
        motors_can_tx_frame[motorProfile].data64[0] = stop_cmd;
        can1->send_msg(&motors_can_tx_frame[motorProfile]);
        chThdSleepMilliseconds(10);
    }
}

void DamiaoMotorIF::set_mode(DamiaoMotorCFG::MotorName motorProfile, DamiaoMotorIF::mode_t mode) {
    motors_mode[motorProfile] = mode;
    if(motors_mode[motorProfile] != VEL_MODE){
        motors_can_tx_frame[motorProfile].DLC = 0x08;
        motors_can_tx_frame[motorProfile].SID = DamiaoMotorCFG::motorCfg[motorProfile].slaveID + 0x100;
    }else{
        motors_can_tx_frame[motorProfile].DLC = 0x04;
        motors_can_tx_frame[motorProfile].SID = DamiaoMotorCFG::motorCfg[motorProfile].slaveID + 0x200;
    }
}

void DamiaoMotorIF::set_velocity(DamiaoMotorCFG::MotorName motorProfile, float vel) {
    chSysLock();
    if(motors_mode[motorProfile]==MIT_MODE){


    }else if(motors_mode[motorProfile]==POS_VEL_MODE){
        float temp_vel = vel;
        uint32_t* pvel;
        pvel = (uint32_t*) &temp_vel;
        motors_can_tx_frame[motorProfile].data32[0] = *pvel;
    }else{ //motors_mode[motorProfile]==VEL_MODE
        float temp_vel = vel;
        uint32_t* pvel;
        pvel = (uint32_t*) &temp_vel;
        motors_can_tx_frame[motorProfile].data32[0] = *pvel;
    }
    chSysUnlock();
}

void DamiaoMotorIF::set_position(DamiaoMotorCFG::MotorName motorProfile, float pos) {
    chSysLock();
    if(motors_mode[motorProfile]==MIT_MODE){

    }else if(motors_mode[motorProfile]==POS_VEL_MODE){
        float temp_pos = pos;
        uint32_t* pvel;
        pvel = (uint32_t*) &temp_pos;
    }
    chSysUnlock();
}

void DamiaoMotorIF::set_torque(DamiaoMotorCFG::MotorName motorProfile, float torq) {
    chSysLock();
    if(motors_mode[motorProfile]==MIT_MODE){

    }
    chSysUnlock();
}



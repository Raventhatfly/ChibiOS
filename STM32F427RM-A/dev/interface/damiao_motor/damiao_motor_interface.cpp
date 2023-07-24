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

CANInterface* DamiaoMotorIF::can1;
CANInterface* DamiaoMotorIF::can2;
CANTxFrame DamiaoMotorIF::motors_can_tx_frame[DamiaoMotorCFG::MOTOR_COUNT];
motor_mode_t DamiaoMotorIF::motors_mode[DamiaoMotorCFG::MOTOR_COUNT];


/** @} */
void DamiaoMotorIF::init(CANInterface *can1_, CANInterface *can2_) {
    can1 = can1_;
    can2 = can2_;
    for(auto & i : motors_can_tx_frame){
        i.DLC = 0x08;
        i.RTR = CAN_RTR_DATA;
        i.IDE = CAN_IDE_STD;
    }
    for(int i=0; i<DamiaoMotorCFG::MOTOR_COUNT;i++){
        motors_mode[i] = DamiaoMotorCFG::motorCfg[i].mode;
        motor_feedback[i].init((DamiaoMotorCFG::MotorName)i,DamiaoMotorCFG::motorCfg[i].initial_encoder_angle);
    }
}

void DamiaoMotorIF::start(DamiaoMotorCFG::MotorName motorProfile) {
    DamiaoMotorIF::set_mode(motorProfile,DamiaoMotorCFG::motorCfg[motorProfile].mode);
    chThdSleepMilliseconds(3000);
    for(int i=10;i > 0;i--){
        if(motors_mode[motorProfile] != VEL_MODE){
            motors_can_tx_frame[motorProfile].DLC = 0x08;
        }else{
            motors_can_tx_frame[motorProfile].DLC = 0x04;
        }
        motors_can_tx_frame[motorProfile].DLC = 0x08;
        motors_can_tx_frame[motorProfile].data64[0] = start_cmd;
        if(DamiaoMotorCFG::motorCfg[motorProfile].can_driver == &CAND1){
            can1->send_msg(&motors_can_tx_frame[motorProfile]);
        }else if(DamiaoMotorCFG::motorCfg[motorProfile].can_driver == &CAND2){
            can2->send_msg(&motors_can_tx_frame[motorProfile]);
        }

        chThdSleepMilliseconds(10);
    }
}

void DamiaoMotorIF::stop(DamiaoMotorCFG::MotorName motorProfile) {
    for(int i=5;i > 0;i--){
        motors_can_tx_frame[motorProfile].data64[0] = stop_cmd;
        if(DamiaoMotorCFG::motorCfg[motorProfile].can_driver == &CAND1){
            can1->send_msg(&motors_can_tx_frame[motorProfile]);
        }else if(DamiaoMotorCFG::motorCfg[motorProfile].can_driver == &CAND2){
            can2->send_msg(&motors_can_tx_frame[motorProfile]);
        }
        chThdSleepMilliseconds(10);
    }
}

void DamiaoMotorIF::set_mode(DamiaoMotorCFG::MotorName motorProfile, motor_mode_t mode) {
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
        //TODO:MIT MODE

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

bool DamiaoMotorIF::postMsg(DamiaoMotorCFG::MotorName motorProfile) {
    CANTxFrame curr_frame = motors_can_tx_frame[motorProfile];
    if(DamiaoMotorCFG::motorCfg[motorProfile].can_driver==&CAND1){
        return can1->send_msg(&curr_frame);
    }else if(DamiaoMotorCFG::motorCfg[motorProfile].can_driver==&CAND2){
        return can2->send_msg(&curr_frame);
    }else{
        return false;
    }
}



//
// Created by Chen Qian on 10/28/21.
//

/**
 * @file can_motor_feedback.cpp
 * @brief Class to store CAN motor feedback data
 *
 * @addtogroup CAN driver
 * @{
 */

#include "damiao_motor_feedback.h"

void DamiaoMotorFeedback::init(DamiaoMotorCFG::MotorName motor_name, uint16_t initial_encoder_angle) {
    motor_name_ = motor_name;
    last_pos_raw = initial_encoder_angle;
}

void DamiaoMotorFeedback::process_feedback(const CANRxFrame *rxmsg) {

    ctr_id = rxmsg->data8[0] & 0x0f;
    err_code = rxmsg->data8[0] & 0xf0;
    pos_raw = rxmsg->data8[1]<<8 | rxmsg->data8[2];
    vel_raw = rxmsg->data8[3]<<4 | rxmsg->data8[4]>>4;
    torque_raw = rxmsg->data8[5];
    mos_avg_tempr_raw = rxmsg->data8[6];
    rotor_avg_tempr_raw = rxmsg->data8[7];

    actual_velocity = raw2actrual(vel_raw,DamiaoMotorCFG::motorCfg[motor_name_].V_max,12);
    actual_angle = raw2actrual(pos_raw,DamiaoMotorCFG::motorCfg[motor_name_].P_max,16);
    actual_torque = raw2actrual(torque_raw,DamiaoMotorCFG::motorCfg[motor_name_].T_max,12);

    if(actual_angle>=DamiaoMotorCFG::motorCfg[motor_name_].P_max){
        actual_angle -= 2 * DamiaoMotorCFG::motorCfg[motor_name_].P_max;
        round_count++;
    }
    if(actual_angle>=DamiaoMotorCFG::motorCfg[motor_name_].P_max){
        actual_angle += 2 * DamiaoMotorCFG::motorCfg[motor_name_].P_max;
        round_count--;
    }

    last_update_time        = SYSTIME;  // Update Time
}

float DamiaoMotorFeedback::accumulate_angle() {
    return actual_angle + (float)round_count * 2 * DamiaoMotorCFG::motorCfg[motor_name_].P_max;;
}

float DamiaoMotorFeedback::torque() const {
    return actual_torque;
}

void DamiaoMotorFeedback::reset_accumulate_angle() {
    round_count = 0;
    actual_angle = 0;
}

/**
 * These two functions have been tested, safe to use.
 *
 **/

float DamiaoMotorFeedback::raw2actrual(uint16_t raw,float actual_max, uint8_t bits) {
    return ((float)(raw - (2 << (bits - 2))) * 2 * actual_max)/(float)(2 << (bits - 1));
}

uint16_t DamiaoMotorFeedback::actual2raw(float actual, float actual_max,uint8_t bits) {
    return (uint16_t)(actual/(2* actual_max) * (float)(2 << (bits - 1))) + (2 << (bits - 2));
}




/** @} */
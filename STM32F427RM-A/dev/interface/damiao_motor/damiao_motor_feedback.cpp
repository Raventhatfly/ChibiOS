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
    last_rotor_angle_raw = initial_encoder_angle;
}

void DamiaoMotorFeedback::process_feedback(const CANRxFrame *rxmsg) {

    uint16_t new_rotor_angle_raw = (rxmsg->data8[0] << 8 | rxmsg->data8[1]);
    int angle_movement = (int) new_rotor_angle_raw - (int)last_rotor_angle_raw;

    // Store new_rotor_angle_raw for calculation of angle_movement next time
    last_rotor_angle_raw = new_rotor_angle_raw;

    /// If angle_movement is too extreme between two samples, we grant that it's caused by moving over the 0(8192) point
    if (angle_movement < -4096) angle_movement += 8192;
    if (angle_movement > 4096) angle_movement -= 8192;

    rotor_angle_raw         = new_rotor_angle_raw;
    rotor_rpm_raw           = (int16_t) (rxmsg->data8[2] << 8 | rxmsg->data8[3]);
    torque_current_raw      = (int16_t) (rxmsg->data8[4] << 8 | rxmsg->data8[5]);

    switch (motor_type) {
        case CANMotorBase::M3508:
            actual_angle    += ((float)angle_movement * ENCODER_ANGLE_RATIO / M3508_REDUCE_RATIO * external_reduce_ratio);
            temperature_raw =  rxmsg->data8[6];
            actual_velocity =  ((float)rotor_rpm_raw * 6.0f / M3508_REDUCE_RATIO * external_reduce_ratio); // 360.0[deg]/60[s]
            break;
        case CANMotorBase::M3508_without_deceleration:
            actual_angle    += ((float)angle_movement * ENCODER_ANGLE_RATIO * external_reduce_ratio);
            temperature_raw =  rxmsg->data8[6];
            actual_velocity =  ((float)rotor_rpm_raw * 360.0f / 60.0f * external_reduce_ratio);           // 360.0[deg]/60[s]
            break;
        case CANMotorBase::M2006:
            actual_angle    += ((float)angle_movement * ENCODER_ANGLE_RATIO / M2006_REDUCE_RATIO * external_reduce_ratio);
            actual_velocity =  ((float)rotor_rpm_raw * 6.0f / M2006_REDUCE_RATIO * external_reduce_ratio); // 360.0[deg]/60[s]
            break;
        case CANMotorBase::GM6020:
            actual_angle    += ((float)angle_movement * ENCODER_ANGLE_RATIO * external_reduce_ratio);
            actual_velocity =  ((float)rotor_rpm_raw * 360.0f / 60.0f * external_reduce_ratio);             // 360.0[deg]/60[s]
            break;
        case NONE_MOTOR:
            break;
    }

    if (actual_angle >= 180.0f) {   // Angle crop
        actual_angle -= 360.0f;
        round_count++;
    }
    if (actual_angle < -180.0f) {
        actual_angle += 360.0f;
        round_count--;
    }

    last_update_time        = SYSTIME;  // Update Time
}

float DamiaoMotorFeedback::accumulate_angle() {
    return actual_angle + (float)round_count * 360.0f;
}

float DamiaoMotorFeedback::torque() {
    return 0;
}

int DamiaoMotorFeedback::torque_current() {
    return torque_current_raw;
}

void DamiaoMotorFeedback::reset_accumulate_angle() {
    round_count = 0;
    actual_angle = 0;
}

/** @} */
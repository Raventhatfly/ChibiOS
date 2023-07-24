//
// Created by Wu Feiyang on 7/13/23.
//

#ifndef META_DAMIAO_MOTOR_CFG_H
#define META_DAMIAO_MOTOR_CFG_H

/**
 * Damiao 4310 motor.
 */
#include "hal.h"
#define can_channel_1 &CAND1
#define can_channel_2 &CAND2

typedef enum motor_mode{
    MIT_MODE,
    POS_VEL_MODE,
    VEL_MODE,
}motor_mode_t;

class DamiaoMotorBase{
public:
    CANDriver* can_driver;
    int        masterID;
    int        slaveID;
    int        mitKp;
    int        mitKd;
    float      V_max;   // maximum rotation speed. Unit is Rad/s.
    float      P_max;   // maximum Position. Unit is Rad.
    float      T_max;   // maximum Torque. Unit is N*m.
    float      initial_encoder_angle;
    motor_mode_t mode;
};

class DamiaoMotorCFG{
public:
    enum MotorName{
        YAW,
        PITCH,
        MOTOR_COUNT,
    }motor_usage_t;
    static constexpr DamiaoMotorBase motorCfg[MOTOR_COUNT] = {
            {can_channel_1,0x00,0x01,0,0,30,PI,0.0,0.0,VEL_MODE},
            {can_channel_2,0x00,0x01,0,0,30,PI,0.0,0.0,VEL_MODE}
    };
};

#endif //META_DAMIAO_MOTOR_CFG_H

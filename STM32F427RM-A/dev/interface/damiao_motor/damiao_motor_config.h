//
// Created by Wu Feiyang on 7/13/23.
//

#ifndef META_DAMIAO_MOTOR_CFG_H
#define META_DAMIAO_MOTOR_CFG_H

/**
 * Damiao 3410 motor.
 */
#include "hal.h"
#include "damiao_motor_controller.h"
#define can_channel_1 &CAND1
#define can_channel_2 &CAND2



class DamiaoMotorBase{
public:
    CANDriver* can_driver;
    int        masterID;
    int        slaveID;
    int        mitKp;
    int        mitKd;
    float      V_max;   // maximum rotation speed. Unit is Rad/s.
    float      P_max;   // maximum Position. Unit is Rad.
    float      T_max;   // maximum rotation speed. Unit is N*m.
};

class DamiaoMotorCFG{
public:
    enum MotorName{
        YAW,
        PITCH,
        MOTOR_COUNT,
    }motor_usage_t;
    static constexpr DamiaoMotorBase motorCfg[MOTOR_COUNT] = {
            {can_channel_1,0x00,0x01,0,0,45,PI},
            {can_channel_2,0x00,0x01,0,0,45,PI}
    };
private:
    friend class DamiaoMotorController;
};

#endif //META_DAMIAO_MOTOR_CFG_H

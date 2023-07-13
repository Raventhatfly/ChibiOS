//
// Created by Wu Feiyang on 7/31/23.
//

/**
 * @file can_motor_interface.h
 * @brief Class to handle CAN motor feedback data.
 *
 * @addtogroup CAN Driver
 * @{
 */

#ifndef META_DAMIAO_MOTOR_INTERFACE_H
#define META_DAMIAO_MOTOR_INTERFACE_H

#include "can_interface.h"

#include "damiao_motor_config.h"
#include "damiao_motor_controller.h"

/**
 * @author Wu Feiyang
 * @brief  Interface for Damiao motors.
 * @usage
 * @code
 * 1.   Create and include motor CANMotorCFG class.
 * 2.   Initialized the class by calling init() method.
 * 3.a. Set current to the motor on certain CAN BUS.
 * 3.b. Also can read feedback by accessing motor_feedback.
 * 3.c. After set current, publish the data on CAN-BUS by post_target_current() method.
 * *Notice: Either set motor current or get access to motor feedback should use the
 *          logical index (YAW, PITCH).
 * @endcode
 * @details 1. CANMotorCFG class structure:
 * @code
 * class CANMotorCFG{
 *     enum             motor_id_t {...,..., MOTOR_COUNT};
 *     CANMotorBase     CANMotorProfile[MOTOR_COUNT];
 *     pid_params_t     a2vParams[MOTOR_COUNT];
 *     pid_params_t     v2iParams[MOTOR_COUNT];
 *     bool             enable_a2v[MOTOR_COUNT];
 *     bool             enable_v2i[MOTOR_COUNT];}
 * @endcode
 *
 * @details 2. Single CAN motor profile structure:
 * @code
 * CANMotorBase {[CANMotorProfile::can_channel_t] can_channel,
 *               [int] CAN_SID,
 *               [CANMotorBase::motor_type_t] motor_type,
 *               [int] initial_encoder_angle}
 * @endcode TODO: comment needs to be refactored
 */

class DamiaoMotorIF{
public:

    /**
     * @brief Damiao Motor Mode
     */
    typedef enum motor_mode{
        MIT_MODE,
        POS_VEL_MODE,
        VEL_MODE,
    }mode_t;
    /**
     * @brief Motors that will be liked with logical motor id.
     */
    //static DamiaoMotorFeedback motor_feedback[MOTOR_COUNT];

private:

    /**
     * @brief Initialize the haptic arm interface.
     * @param can1_             [in] The can1 channel to use.
     * @param can2_             [in] The can2 channel to use.
     */
    static void init(CANInterface *can1_, CANInterface *can2_);

    static void start(DamiaoMotorCFG::MotorName motorProfile);

    static void stop(DamiaoMotorCFG::MotorName motorProfile);

    static void set_mode(DamiaoMotorCFG::MotorName motorProfile, mode_t mode);

    static void set_velocity(DamiaoMotorCFG::MotorName motorProfile, float vel);

    static void set_position(DamiaoMotorCFG::MotorName motorProfile, float pos);

    static void set_torque(DamiaoMotorCFG::MotorName motorProfile, float torq);

    static CANTxFrame motors_can_tx_frame[DamiaoMotorCFG::MotorName::MOTOR_COUNT];

    static mode_t motors_mode[DamiaoMotorCFG::MotorName::MOTOR_COUNT];

    static CANInterface * can1;

    static CANInterface * can2;

    static constexpr uint64_t start_cmd = 0xfcffffffffffffff;

    static constexpr uint64_t stop_cmd = 0xfdffffffffffffff;

    static constexpr uint64_t save_zero_cmd = 0xfeffffffffffffff;

    static constexpr uint64_t clear_error_cmd = 0xffffffffffffffff;

    static float uint_to_float(int x_int, float x_min, float x_max, int bits){
        /// converts unsigned int to float, given range and number of bits ///
        float span = x_max - x_min;
        float offset = x_min;
        return ((float)x_int)*span/((float)((1<<bits)-1)) + offset;
    }

    static int float_to_uint(float x, float x_min, float x_max, int bits){
        /// Converts a float to an unsigned int, given range and number of bits
        float span = x_max - x_min;
        float offset = x_min;
        return (int) ((x-offset)*((float)((1<<bits)-1))/span);
    }

    friend class DamiaoMotorController;

};

#endif //META_DAMIAO_MOTOR_INTERFACE_H

/** @} */
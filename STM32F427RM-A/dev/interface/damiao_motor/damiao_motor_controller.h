//
// Created by Chen Qian on 10/29/21.
//

/**
 * @file can_motor_scheduler.h
 * @brief Class to drive can motors.
 *
 * @addtogroup CAN Driver
 * @{
 */

#ifndef META_INFANTRY_CAN_MOTOR_SCHEDULER_H
#define META_INFANTRY_CAN_MOTOR_SCHEDULER_H

#include "damiao_motor_interface.h"
#include "pid_controller.hpp"

using namespace chibios_rt;
class DamiaoMotorController{
public:

    /**
     * @brief           Start CAN motor scheduler thread.
     * @param SKD_PRIO  [in] Scheduler thread priority, motor controllers calculations.
     * @param FB_PRIO   [in] Feedback thread priority, log motor feedback data on shell.
     * @param can1_     [in/out] CAN interface for CAN channel 1.
     * @param can2_     [in/out] CAN interface for CAN channel 2.
     */
    static void start(tprio_t SKD_PRIO, tprio_t FB_PRIO, CANInterface *can1_, CANInterface *can2_);

    static void shell_display(DamiaoMotorCFG::MotorName name, bool enable);

    static void set_target_angle(DamiaoMotorCFG::MotorName name, float target);

    /**
     * @brief Set the target velocity in velocity PID Controller mode
     * @param id        [in] Target motor id
     * @param target    [in] Target velocity of motor
     */
    static void set_target_vel(DamiaoMotorCFG::MotorName name, float target);

     /**
      * @brief Customized feedback type.
      */
     enum feedback_type_t {
         angle, ///< Feedback type is angle
         velocity, ///< Feedback type is velocity
     };

     /**
      * Register the customize feedback, like AHRS angle for gimbal.
      * @param feedback_addr    [in] The address of input variable (static), SKD will continuously read the address.
      * @param fb_type          [in] Feedback_type_t, angle/velocity.
      * @param motor_id         [in] The logical motor will affect, like YAW for gimbal control.
      */
     static void register_custom_feedback(float *feedback_addr, feedback_type_t fb_type,DamiaoMotorCFG::MotorName name);

     /**
      * Unregister the customize feedback, SKD will use build-in motor feedback for calculation.
      * @param fb_type           [in] Feedback_type_t, angle/velocity.
      * @param motor_id          [in] The logical motor will affect, like YAW for gimbal control.
      */
    static void unregister_custom_feedback(feedback_type_t fb_type,DamiaoMotorCFG::MotorName name);

    static float get_torque(DamiaoMotorCFG::MotorName name);

    static int get_error(DamiaoMotorCFG::MotorName name);

    static float get_position_angel(DamiaoMotorCFG::MotorName name);

    static float get_mos_temprature(DamiaoMotorCFG::MotorName name);

    static float get_rotor_temprature(DamiaoMotorCFG::MotorName name);

    static int get_ID(DamiaoMotorCFG::MotorName name);
private:

    class feedbackThread : public BaseStaticThread<512> {
    private:
        void main() final;
        const int THREAD_INTERVAL = 20000; // [us]
    };
    static feedbackThread FeedbackThread;

    class skdThread : public BaseStaticThread<512> {
    private:
        DamiaoMotorCFG::MotorName name;
        void main() final;
        friend feedbackThread;
        friend DamiaoMotorController;
        const int THREAD_INTERVAL = 8000; // [us] The timeout value for sending 1 CAN frame is 1ms. In the worst case, the sending time would be 6 ms if we need to send 6 frame.
    };
    static skdThread SKDThread;

};


#endif //META_INFANTRY_CAN_MOTOR_SCHEDULER_H

/** @} */
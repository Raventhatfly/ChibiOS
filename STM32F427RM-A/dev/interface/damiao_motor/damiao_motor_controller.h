//
// Created by WuFeiyang on 10/29/21.
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
#include "damiao_motor_feedback.h"


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

    static float get_torque(DamiaoMotorCFG::MotorName name);

    static int get_error(DamiaoMotorCFG::MotorName name);

    static float get_position_angel(DamiaoMotorCFG::MotorName name);

    static float get_mos_temprature(DamiaoMotorCFG::MotorName name);

    static float get_rotor_temprature(DamiaoMotorCFG::MotorName name);

    static int get_ID(DamiaoMotorCFG::MotorName name);

    static void motor_enable(DamiaoMotorCFG::MotorName name);

    static void motor_disable(DamiaoMotorCFG::MotorName name);

    static void set_target_MIT(DamiaoMotorCFG::MotorName name);

    static void set_target_POSVEL(DamiaoMotorCFG::MotorName name, float pos,float vel);

    static void set_target_VEL(DamiaoMotorCFG::MotorName name, float vel);
private:

    class feedbackThread : public BaseStaticThread<512> {
    public:
        bool enable_feedback[DamiaoMotorCFG::MOTOR_COUNT]={true};
    private:
        DamiaoMotorFeedback feedback[DamiaoMotorCFG::MOTOR_COUNT];
        void main() final;
        const int THREAD_INTERVAL = 20000; // [us]
    };
    static feedbackThread FeedbackThread;

    class skdThread : public BaseStaticThread<512> {
    private:
//        float targetP[DamiaoMotorCFG::MOTOR_COUNT];
//        float targetV[DamiaoMotorCFG::MOTOR_COUNT];
//        DamiaoMotorCFG::MotorName name;
        void main() final;
        friend feedbackThread;
        friend DamiaoMotorController;
        const int THREAD_INTERVAL = 8000; // [us] The timeout value for sending 1 CAN frame is 1ms. In the worst case, the sending time would be 6 ms if we need to send 6 frame.
    };
    static skdThread SKDThread;

};


#endif //META_INFANTRY_CAN_MOTOR_SCHEDULER_H

/** @} */
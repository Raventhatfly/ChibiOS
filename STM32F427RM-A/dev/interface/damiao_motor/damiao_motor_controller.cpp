//
// Created by Chen Qian on 10/29/21.
//

/**
 * @file can_motor_scheduler.cpp
 * @brief Class to drive can motors.
 *
 * @addtogroup CAN Driver
 * @{
 */

#include "damiao_motor_controller.h"

DamiaoMotorController::feedbackThread DamiaoMotorController::FeedbackThread;
DamiaoMotorController::skdThread DamiaoMotorController::SKDThread;

void DamiaoMotorController::start(tprio_t SKD_PRIO, tprio_t FB_PRIO, CANInterface *can1_, CANInterface *can2_) {
    DamiaoMotorIF::init(can1_, can2_);
    SKDThread.start(SKD_PRIO);
    FeedbackThread.start(FB_PRIO);
}

void DamiaoMotorController::shell_display(DamiaoMotorCFG::MotorName name, bool enable) {

}

void DamiaoMotorController::set_target_angle(DamiaoMotorCFG::MotorName name, float target) {

}

void DamiaoMotorController::set_target_vel(DamiaoMotorCFG::MotorName name, float target) {

}

void
DamiaoMotorController::register_custom_feedback(float *feedback_addr, DamiaoMotorController::feedback_type_t fb_type,
                                                DamiaoMotorCFG::MotorName name) {

}

void DamiaoMotorController::unregister_custom_feedback(DamiaoMotorController::feedback_type_t fb_type,
                                                       DamiaoMotorCFG::MotorName name) {

}

float DamiaoMotorController::get_torque(DamiaoMotorCFG::MotorName name) {
    return 0;
}

float DamiaoMotorController::get_position_angel(DamiaoMotorCFG::MotorName name) {
    return 0;
}

int DamiaoMotorController::get_error(DamiaoMotorCFG::MotorName name) {
    return 0;
}

float DamiaoMotorController::get_mos_temprature(DamiaoMotorCFG::MotorName name) {
    return 0;
}

float DamiaoMotorController::get_rotor_temprature(DamiaoMotorCFG::MotorName name) {
    return 0;
}

int DamiaoMotorController::get_ID(DamiaoMotorCFG::MotorName name) {
    return 0;
}




//void DamiaoMotorController::register_custom_feedback(float *feedback_addr, DamiaoMotorController::feedback_type_t fb_type,
//                                                  CANMotorCFG::motor_id_t motor_id) {
//    switch (fb_type) {
//
//        case angle:
//            feedbackA[motor_id] = feedback_addr;
//            break;
//        case velocity:
//            feedbackV[motor_id] = feedback_addr;
//            break;
//    }
//}
//
//void DamiaoMotorController::unregister_custom_feedback(DamiaoMotorController::feedback_type_t fb_type, CANMotorCFG::motor_id_t motor_id) {
//    switch (fb_type) {
//        case angle:
//            feedbackA[motor_id] = nullptr;
//            break;
//        case velocity:
//            feedbackV[motor_id] = nullptr;
//            break;
//    }
//}
//
//void DamiaoMotorController::skdThread::main() {
//    setName("HapticSKDThread");
//    for(int i = 0; i < MOTOR_COUNT; i++) {
//        v2iController[i].change_parameters(v2iParams[i]);
//        a2vController[i].change_parameters(a2vParams[i]);
//    }
//    for (auto &i: targetA) {
//        i = 0.0f;
//    }
//    for (auto &i: targetV) {
//        i = 0.0f;
//    }
//    for (auto &i: output) {
//        i = 0.0f;
//    }
//    while(!shouldTerminate()) {
//        chSysLock();
//        for (int i = 0; i < MOTOR_COUNT; i++) {
//            if(enable_a2v[i]) {
//                if(feedbackA[i] == nullptr) {
//                    targetV[i] = a2vController[i].calc(CANMotorIF::motor_feedback[i].accumulate_angle(), targetA[i]);
//                } else {
//                    targetV[i] = a2vController[i].calc(*feedbackA[i], targetA[i]);
//                }
//            }
//            if(enable_v2i[i]) {
//                if(feedbackV[i] == nullptr) {
//                    PID_output[i]=v2iController[i].calc(CANMotorIF::motor_feedback[i].actual_velocity, targetV[i]);
//                } else {
//                    PID_output[i]=v2iController[i].calc(*feedbackV[i], targetV[i]);
//                }
//                output[i] = (int)PID_output[i];
//            } else {
//                /// If disable the PID controller, clear the iterm so it does not bump.
//                a2vController[i].clear_i_out();
//                v2iController[i].clear_i_out();
//            }
//            CANMotorIF::set_current((motor_id_t)i, output[i]);
//        }
//        chSysUnlock();
//        /// Multi thread should take no effects on the timing as sending will cause chSysLock
//        if(CANMotorIF::enable_CAN_tx_frames[0][0]) {
//            CANMotorIF::post_target_current(CANMotorBase::can_channel_1, 0x200);
//        }
//        if(CANMotorIF::enable_CAN_tx_frames[0][1]) {
//            CANMotorIF::post_target_current(CANMotorBase::can_channel_1, 0x1FF);
//        }
//        if(CANMotorIF::enable_CAN_tx_frames[0][2]) {
//            CANMotorIF::post_target_current(CANMotorBase::can_channel_1, 0x2FF);
//        }
//        if(CANMotorIF::enable_CAN_tx_frames[1][0]) {
//            CANMotorIF::post_target_current(CANMotorBase::can_channel_2, 0x200);
//        }
//        if(CANMotorIF::enable_CAN_tx_frames[1][1]) {
//            CANMotorIF::post_target_current(CANMotorBase::can_channel_2, 0x1FF);
//        }
//        if(CANMotorIF::enable_CAN_tx_frames[1][2]) {
//            CANMotorIF::post_target_current(CANMotorBase::can_channel_2, 0x2FF);
//        }
//        // This command will adjust the sleep time to ensure controller was triggered at a constant rate.
//        // Sampling time could be critical when designing controller. Non-uniform sampling time would cause robustness problem in control system.
//        tprio_t PRIO = this->getPriorityX();
//        unsigned long sleep_time = THREAD_INTERVAL - (TIME_I2US(chVTGetSystemTimeX()) + PRIO)%THREAD_INTERVAL;
//        sleep(TIME_US2I(sleep_time));
//    }
//}
//
//void DamiaoMotorController::feedbackThread::main() {
//    setName("feedback");
//    while(!shouldTerminate()) {
//        for (int i = 0; i < CANMotorCFG::MOTOR_COUNT; i++) {
//            if(enable_feedback[i]) {
//                Shell::printf("!fb,%u,%u,%.2f,%.2f,%.2f,%.2f,%d,%d" SHELL_NEWLINE_STR,
//                              SYSTIME,
//                              i, // Motor ID
//                              CANMotorIF::motor_feedback[i].actual_angle, DamiaoMotorController::SKDThread.targetA[i],
//                              CANMotorIF::motor_feedback[i].actual_velocity, DamiaoMotorController::SKDThread.targetV[i],
//                              CANMotorIF::motor_feedback[i].torque_current(), (int)DamiaoMotorController::SKDThread.PID_output[i]);
//            }
//        }
//        tprio_t PRIO = this->getPriorityX();
//        unsigned long sleep_time = THREAD_INTERVAL - (TIME_I2US(chVTGetSystemTimeX()) + PRIO)%THREAD_INTERVAL;
//        sleep(TIME_US2I(sleep_time));
//    }
//}

/** @} */
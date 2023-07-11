//
// Created by Wu Feiyang on 2023/7/11.
//

#ifndef EXPLORER_RUDDER_INTERFACE_H
#define EXPLORER_RUDDER_INTERFACE_H
#include "ch.hpp"
#include "hal.h"
#include "hal_pwm.h"

class Rudder{
public:
    /**
 * @brief   Enables a PWM channel.
 * @pre     The PWM unit must have been activated using @p pwmStart().
 * @post    The channel is active using the specified configuration.
 * @note    Depending on the hardware implementation this function has
 *          effect starting on the next cycle (recommended implementation)
 *          or immediately (fallback implementation).
 *
 * @param[in] pwmp      pointer to a @p PWMDriver object
 * @param[in] channel   PWM channel identifier (0...channels-1)
 * @param[in] width     PWM pulse width as clock pulses number
 *
 * @api
 * TODO: to be modified later
 */
    Rudder(PWMDriver* driver,PWMConfig* config,pwmchannel_t channel);
    ~Rudder();
    void start();
    void stop();
    void set_rudder_angle(int angle);
private:
    PWMConfig pwm_default_config = {
            10000,
            100, // Default playing_note: 1Hz
            nullptr,
            {
                    {PWM_OUTPUT_ACTIVE_HIGH, nullptr},  // it's all CH1 for current support boards
                    {PWM_COMPLEMENTARY_OUTPUT_DISABLED, nullptr},
                    {PWM_COMPLEMENTARY_OUTPUT_DISABLED, nullptr},
                    {PWM_COMPLEMENTARY_OUTPUT_DISABLED, nullptr}
            },
            0,
            0
    };
    PWMDriver * driver_;
    PWMConfig * config_;
    pwmchannel_t channel_;
};

#endif //EXPLORER_RUDDER_INTERFACE_H

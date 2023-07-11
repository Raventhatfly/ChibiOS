//
// Created by Wu Feiyang on 2023/7/11.
//
#include "rudder_interface.h"
Rudder::Rudder(PWMDriver *driver, PWMConfig *config, pwmchannel_t channel) {
    if(config == nullptr){
        config_ = &pwm_default_config;
    }else{
        config_ = config;
    }
    driver_ = driver;
    channel_ = channel;
}

Rudder::~Rudder() {
    pwmStop(driver_);
}
void Rudder::start() {
    pwmStart(driver_,config_);
}

void Rudder::set_rudder_angle(int angle) {
    int percentage = angle * 10;
    pwmEnableChannel(driver_,channel_,PWM_PERCENTAGE_TO_WIDTH(driver_, percentage));
}
void Rudder::stop() {
    pwmDisableChannel(driver_,channel_);
}



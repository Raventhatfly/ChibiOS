//
// Created by Wu Feiyang on 2023/2/25.
//
#include "ch.hpp"
#include "hal.h"
#include "buzzer_scheduler.h"
#include "led.h"


int main(){
    halInit();
    chibios_rt::System::init();
    BuzzerSKD::init(HIGHPRIO);
    Led::led_init(LOWPRIO);
    chThdSleepS(TIME_MS2I(500));
    BuzzerSKD::play_sound(BuzzerSKD::sound_da_bu_zi_duo_ge);
#if CH_CFG_NO_IDLE_THREAD  // See chconf.h for what this #define means.
    // ChibiOS idle thread has been disabled, main() should implement infinite loop
    while (true) {}
#else
    // When vehicle() quits, the vehicle thread will somehow enter an infinite loop, so we set the
    // priority to lowest before quitting, to let other threads run normally
    chibios_rt::BaseThread::setPriority(IDLEPRIO);
#endif
    return 0;
}

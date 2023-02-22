//
// Created by Wu Feiyang on 2023/1/30.
//

#ifndef EXPLORER_LED_H
#define EXPLORER_LED_H

#include "ch.hpp"
#include "hal.h"
#include "board.h"

#define GREEN_PORT      GPIOF
#define RED_PORT        GPIOE


/**
 * @brief class Led operates on two leds in two macros,
 * LED_RED and LED_GREEN. Change the settings board.h
 * and macro LED_PORT to map the leds to differnet GPIO Pins.
 */
class Led{
public:
    Led(){
        palSetPadMode(GPIOF,LED_RED,PAL_MODE_OUTPUT_PUSHPULL);
        palSetPadMode(GPIOE,LED_GREEN,PAL_MODE_OUTPUT_PUSHPULL);
    }

    static void green_on(){
        palClearPad(GREEN_PORT,LED_GREEN);
    }

    static void green_off(){
        palSetPad(GREEN_PORT,LED_GREEN);
    }

    static void green_toggle(){
        palTogglePad(GREEN_PORT,LED_GREEN);
    }

    static void red_on(){
        palClearPad(RED_PORT,LED_RED);
    }

    static void red_off(){
        palSetPad(RED_PORT,LED_RED);
    }

    static void red_toggle(){
        palTogglePad(RED_PORT,LED_RED);
    }

    static void led_init(tprio_t prio);

    static void terminate_blink();

    static bool blink_flag;

#ifdef RM2018A
    static void led_stream();
#endif
private:
    class LedThread : public chibios_rt::BaseStaticThread<256>{
    private:
        void main() override;
    };
#ifdef RM2018A
    class LedStreamThread : public chibios_rt::BaseStaticThread<256>{
    private:
        void main() override;
    };

    static LedThread led_thread;
    static LedStreamThread ledstream_thread;
};
#endif
#endif //EXPLORER_LED_H

//
// Created by Wu Feiyang on 2023/1/30.
//

#include "led.h"

Led::LedThread Led::led_thread;
#ifdef RM2018A
Led::LedStreamThread Led::ledstream_thread;
#endif
void Led::led_init(tprio_t prio) {
    led_thread.start(prio);
#ifdef RM2018A
    ledstream_thread.start(prio);
#endif
}
#ifdef RM2018A
void Led::led_stream(){
    for(int i=1;i<9;i++){
        palClearPad(GPIOG,i);
        chThdSleepMilliseconds(500);
        palSetPad(GPIOG,i);
    }
}
#endif
void Led::LedThread::main(){
    setName("Led");
    while(!shouldTerminate()){
        green_on();
        red_off();
        chThdSleepMilliseconds(500);
        green_off();
        red_on();
        chThdSleepMilliseconds(500);
    }
}
#ifdef RM2018A
void Led::LedStreamThread::main() {
    setName("LedStream");
    while(!shouldTerminate()){
        Led::led_stream();
    }
}
#endif
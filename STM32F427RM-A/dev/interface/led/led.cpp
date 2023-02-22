//
// Created by Wu Feiyang on 2023/1/30.
//

#include "led.h"

bool Led::blink_flag;
Led::LedThread Led::led_thread;
Led::LedStreamThread Led::ledstream_thread;

void Led::led_init(tprio_t prio) {
    led_thread.start(prio);
    ledstream_thread.start(prio);
}
#ifdef RM2018A
void Led::led_stream(){
    for(int i=1;i<9;i++){
        palClearPad(GPIOG,i);
        chThdSleepMilliseconds(500);
        palSetPad(GPIOG,i);
    }
}

void Led::terminate_blink() {
    Led::green_off();
    Led::red_off();
    Led::blink_flag = false;

}

#endif
void Led::LedThread::main(){
    static virtual_timer_t led_vt;
    chSysLock();
    Led::blink_flag = true;
    chSysUnlock();
    setName("Led");
    chVTObjectInit(&led_vt);
    chVTSet(&led_vt, TIME_MS2I(10000), (vtfunc_t) terminate_blink, nullptr);
    while(!shouldTerminate()){
        if(blink_flag) {
            green_on();
            red_off();
        }
            chThdSleepMilliseconds(500);
        if(blink_flag) {
            green_off();
            red_on();
            chThdSleepMilliseconds(500);
        }
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
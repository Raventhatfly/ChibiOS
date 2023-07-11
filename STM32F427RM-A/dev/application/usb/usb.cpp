//
// Created by Wu Feiyang on 2023/7/9.
//
/***
 * This haven't been tested yet;
 * It might contain lots of
 */
#include "hal.h"
#include "ch.hpp"

static char buff;
static int rx_status;
static char str[50];
static int length = 0;
static int should_send = false;
static uint8_t next_line[2];
enum rx_status_t {
    WAIT_FIRST_END,  // receive bytes one by one, waiting for 0xA5
    WAIT_SECOND_END,         // receive cmd_id
    SEND       // receive data section and 1-byte CRC8 data
};

void uart_rx_callback(UARTDriver *uartp){
    (void) uartp;
    next_line[0] = '\n';
    next_line[1] = '\r';
    chSysLockFromISR();  /// --- ENTER I-Locked state. DO NOT use LOG, printf, non I-Class functions or return ---
    {
        auto pak_uint8 = (uint8_t *) &buff;

        switch (rx_status) {

            case WAIT_FIRST_END:
                if(buff == '\n'){
                    rx_status = WAIT_SECOND_END;
                }else{
                    str[length] = buff;
                    length++;
                }
                break;
            case WAIT_SECOND_END:
                if (buff == '\r') {
                    uartStartSendI(&UARTD7,length,str);
                    uartStartSendI(&UARTD7,2,next_line);
                }
                rx_status = WAIT_FIRST_END;
                break;

        }
    }
    chSysUnlockFromISR();  /// --- EXIT I-Locked state ---

}
const UARTConfig UART_CONFIG = {
        nullptr,
        nullptr,
        uart_rx_callback,  // callback function when the buffer is filled
        nullptr,
        nullptr,
        nullptr,
        115200, // speed
        0,
        0,
        0
};

class sendThread: public chibios_rt::BaseStaticThread<256>{
private:
    void main() final;
}send_thrad;

void sendThread::main() {
    setName("send_thread");
    while(!shouldTerminate()){
        chSysLock();

        chSysUnlock();
    }
}

int main(){
    halInit();
    chibios_rt::System::init();
    uartInit();
    uartStart(&UARTD7,&UART_CONFIG);
    send_thrad.start(NORMALPRIO);
    uartStartReceive(&UARTD7,sizeof(char),&buff);

}
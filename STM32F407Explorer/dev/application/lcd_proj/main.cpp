//
// Created by Wu Feiyang on 2023/1/30.
//
#include "ch.hpp"
#include "hal.h"
#include "lcd.h"
#include "led.h"
#include <cstdio>
#include <stm32f407xx.h>
static SRAMConfig sram_cfg = {
        (FSMC_BCR_MWID_16 | FSMC_BCR_MTYP_SRAM | FSMC_BCR_WREN | FSMC_BCR_EXTMOD |FSMC_BCR_MBKEN ),
        (0 << 16) | (60 << 8) | (15 << 0),
        (0 << 16) | (8 << 8) | (9 << 0) //BWTR time can be a bit larger
};


int main(){
    halInit();
    chibios_rt::System::init();
    sramInit();
    /* Using sramInit(), no need to use fsmcInit()*/
    /* Using SRAM4 means using bank1 NE4 of FSMC SRAM bank
     * once sranStart, no need to use fsmcStart(&FSMCD1); */
    sramStart(&SRAMD4,&sram_cfg);
    u16 POINT_COLOR=0x0000;
    u16 BACK_COLOR=0xFFFF;
    u8 x=0;
    u8 lcd_id[12];
    LCD_Init();
    POINT_COLOR=RED;
    sprintf((char*)lcd_id,"LCD ID:%04X",lcddev.id);

    while(true)
    {
        switch(x)
        {
            case 0:LCD_Clear(WHITE);break;
            case 1:LCD_Clear(BLACK);break;
            case 2:LCD_Clear(BLUE);break;
            case 3:LCD_Clear(RED);break;
            case 4:LCD_Clear(MAGENTA);break;
            case 5:LCD_Clear(GREEN);break;
            case 6:LCD_Clear(CYAN);break;
            case 7:LCD_Clear(YELLOW);break;
            case 8:LCD_Clear(BRRED);break;
            case 9:LCD_Clear(GRAY);break;
            case 10:LCD_Clear(LGRAY);break;
            case 11:LCD_Clear(BROWN);break;
        }
        POINT_COLOR=RED;
        LCD_ShowString(30, 40, 210, 24, 24, (uint8_t *) "Explorer STM32F4");
        LCD_ShowString(30, 70, 200, 16, 16, (uint8_t *) "TFTLCD TEST");
        LCD_ShowString(30, 90, 200, 16, 16, (uint8_t *) "ATOM@ALIENTEK");
        LCD_ShowString(30,110,200,16,16,lcd_id);
        LCD_ShowString(30, 130, 200, 12, 12, (uint8_t *) "2014/5/4");
        LCD_Draw_Circle(50,50,50);
        x++;
        if(x==12)x=0;
        Led::green_toggle();
        chThdSleepMilliseconds(1000);
    }


}
//
// Created by Wu Feiyang on 2023/1/30.
//
#include "ch.hpp"
#include "hal.h"
#include "lcd.h"
#include "thread_priorities.h"
#include "hal_fsmc.h"
#include "hal_sram.h"
//FSMCDriver FSMCD1;
//SRAMDriver SRAMD1;

int main(){
    halInit();
    chibios_rt::System::init();
    //fsmcInit();
    sramInit(); /* Using sramInit(), no need to use fsmcInit()*/
    SRAMConfig sram_cfg;
    sram_cfg = {FSMC_BCR_MTYP_SRAM|FSMC_BCR_EXTMOD|FSMC_BCR_WREN
                |FSMC_BCR_MWID_16|FSMC_BCR_MBKEN,
                (uint32_t)60<<8|(uint32_t)15,    /* 60 and 15 cycles*/
                (uint32_t)3<<8|(uint32_t)3};    /* both three cycles*/

    /* Using SRAM1 means using bank 1 of FSMC
     * once sranStart, no need to use fsmcStart(&FSMCD1); */
    sramStart(&SRAMD1,&sram_cfg);
    LCD_Init();
    LCD_Draw_Circle(50,50,50);
    chThdSleepMilliseconds(10000);
    //LCD_DisplayOff();




}
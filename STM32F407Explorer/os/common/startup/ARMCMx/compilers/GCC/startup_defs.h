/*
    ChibiOS - Copyright (C) 2006..2018 Giovanni Di Sirio

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

/**
 * @file    ARMCMx/compilers/GCC/startup_defs.h
 * @brief   Startup macros and structures.
 *
 * @addtogroup STARTUP_DEFS
 * @details Startup-related information.
 * @{
 */

#ifndef STARTUP_DEFS_H
#define STARTUP_DEFS_H

/*===========================================================================*/
/* Module constants.                                                         */
/*===========================================================================*/

#define STARTUP_FLASH0_BASE             ((uint32_t)&__flash0_base__)
#define STARTUP_FLASH0_END              ((uint32_t)&__flash0_end__)
#define STARTUP_FLASH1_BASE             ((uint32_t)&__flash1_base__)
#define STARTUP_FLASH1_END              ((uint32_t)&__flash1_end__)
#define STARTUP_FLASH2_BASE             ((uint32_t)&__flash2_base__)
#define STARTUP_FLASH2_END              ((uint32_t)&__flash2_end__)
#define STARTUP_FLASH3_BASE             ((uint32_t)&__flash3_base__)
#define STARTUP_FLASH3_END              ((uint32_t)&__flash3_end__)
#define STARTUP_FLASH4_BASE             ((uint32_t)&__flash4_base__)
#define STARTUP_FLASH4_END              ((uint32_t)&__flash4_end__)
#define STARTUP_FLASH5_BASE             ((uint32_t)&__flash5_base__)
#define STARTUP_FLASH5_END              ((uint32_t)&__flash5_end__)
#define STARTUP_FLASH6_BASE             ((uint32_t)&__flash6_base__)
#define STARTUP_FLASH6_END              ((uint32_t)&__flash6_end__)
#define STARTUP_FLASH7_BASE             ((uint32_t)&__flash7_base__)
#define STARTUP_FLASH7_END              ((uint32_t)&__flash7_end__)

#define STARTUP_RAM0_BASE               ((uint32_t)&__ram0_base__)
#define STARTUP_RAM0_END                ((uint32_t)&__ram0_end__)
#define STARTUP_RAM1_BASE               ((uint32_t)&__ram1_base__)
#define STARTUP_RAM1_END                ((uint32_t)&__ram1_end__)
#define STARTUP_RAM2_BASE               ((uint32_t)&__ram2_base__)
#define STARTUP_RAM2_END                ((uint32_t)&__ram2_end__)
#define STARTUP_RAM3_BASE               ((uint32_t)&__ram3_base__)
#define STARTUP_RAM3_END                ((uint32_t)&__ram3_end__)
#define STARTUP_RAM4_BASE               ((uint32_t)&__ram4_base__)
#define STARTUP_RAM4_END                ((uint32_t)&__ram4_end__)
#define STARTUP_RAM5_BASE               ((uint32_t)&__ram5_base__)
#define STARTUP_RAM5_END                ((uint32_t)&__ram5_end__)
#define STARTUP_RAM6_BASE               ((uint32_t)&__ram6_base__)
#define STARTUP_RAM6_END                ((uint32_t)&__ram6_end__)
#define STARTUP_RAM7_BASE               ((uint32_t)&__ram7_base__)
#define STARTUP_RAM7_END                ((uint32_t)&__ram7_end__)

/*===========================================================================*/
/* Module pre-compile time settings.                                         */
/*===========================================================================*/

/*===========================================================================*/
/* Derived constants and error checks.                                       */
/*===========================================================================*/

/*===========================================================================*/
/* Module data structures and types.                                         */
/*===========================================================================*/

/*===========================================================================*/
/* Module macros.                                                            */
/*===========================================================================*/

/*===========================================================================*/
/* External declarations.                                                    */
/*===========================================================================*/

extern uint32_t __flash0_base__, __flash0_end__;
extern uint32_t __flash1_base__, __flash1_end__;
extern uint32_t __flash2_base__, __flash2_end__;
extern uint32_t __flash3_base__, __flash3_end__;
extern uint32_t __flash4_base__, __flash4_end__;
extern uint32_t __flash5_base__, __flash5_end__;
extern uint32_t __flash6_base__, __flash6_end__;
extern uint32_t __flash7_base__, __flash7_end__;
extern uint32_t __ram0_base__, __ram0_end__;
extern uint32_t __ram1_base__, __ram1_end__;
extern uint32_t __ram2_base__, __ram2_end__;
extern uint32_t __ram3_base__, __ram3_end__;
extern uint32_t __ram4_base__, __ram4_end__;
extern uint32_t __ram5_base__, __ram5_end__;
extern uint32_t __ram6_base__, __ram6_end__;
extern uint32_t __ram7_base__, __ram7_end__;

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif

/*===========================================================================*/
/* Module inline functions.                                                  */
/*===========================================================================*/

#endif /* STARTUP_DEFS_H */

/** @} */

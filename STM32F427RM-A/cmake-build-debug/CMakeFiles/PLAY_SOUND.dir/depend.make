# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.20

CMakeFiles/PLAY_SOUND.dir/dev/application/play_sound/paly_sound.cpp.obj: \
 ../dev/board_cfg/board.h \
 ../dev/board_cfg/chconf.h \
 ../dev/board_cfg/halconf.h \
 ../dev/board_cfg/mcuconf.h \
 ../dev/interface/buzzer/buzzer_interface.h \
 ../dev/interface/buzzer/buzzer_scheduler.h \
 ../dev/interface/led/led.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_armcc.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_armclang.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_compiler.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_gcc.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_iccarm.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_version.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/core_cm4.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/mpu_armv7.h \
 ../os/common/ext/ST/STM32F4xx/stm32f401xc.h \
 ../os/common/ext/ST/STM32F4xx/stm32f401xe.h \
 ../os/common/ext/ST/STM32F4xx/stm32f405xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f407xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f410cx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f410rx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f410tx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f411xe.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412cx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412rx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412vx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412zx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f413xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f415xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f417xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f423xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f427xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f429xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f437xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f439xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f446xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f469xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f479xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f4xx.h \
 ../os/common/ext/ST/STM32F4xx/system_stm32f4xx.h \
 ../os/common/portability/GCC/ccportab.h \
 ../os/common/ports/ARM-common/chtypes.h \
 ../os/common/ports/ARMv7-M/chcore.h \
 ../os/common/ports/ARMv7-M/mpu.h \
 ../os/common/startup/ARMCMx/devices/STM32F4xx/cmparams.h \
 ../os/hal/include/hal.h \
 ../os/hal/include/hal_adc.h \
 ../os/hal/include/hal_buffers.h \
 ../os/hal/include/hal_can.h \
 ../os/hal/include/hal_channels.h \
 ../os/hal/include/hal_crypto.h \
 ../os/hal/include/hal_dac.h \
 ../os/hal/include/hal_efl.h \
 ../os/hal/include/hal_files.h \
 ../os/hal/include/hal_flash.h \
 ../os/hal/include/hal_gpt.h \
 ../os/hal/include/hal_i2c.h \
 ../os/hal/include/hal_i2s.h \
 ../os/hal/include/hal_icu.h \
 ../os/hal/include/hal_ioblock.h \
 ../os/hal/include/hal_mac.h \
 ../os/hal/include/hal_mmc_spi.h \
 ../os/hal/include/hal_mmcsd.h \
 ../os/hal/include/hal_objects.h \
 ../os/hal/include/hal_pal.h \
 ../os/hal/include/hal_persistent.h \
 ../os/hal/include/hal_pwm.h \
 ../os/hal/include/hal_queues.h \
 ../os/hal/include/hal_rtc.h \
 ../os/hal/include/hal_sdc.h \
 ../os/hal/include/hal_serial.h \
 ../os/hal/include/hal_serial_usb.h \
 ../os/hal/include/hal_sio.h \
 ../os/hal/include/hal_spi.h \
 ../os/hal/include/hal_spi_v1.h \
 ../os/hal/include/hal_spi_v2.h \
 ../os/hal/include/hal_st.h \
 ../os/hal/include/hal_streams.h \
 ../os/hal/include/hal_trng.h \
 ../os/hal/include/hal_uart.h \
 ../os/hal/include/hal_usb.h \
 ../os/hal/include/hal_usb_cdc.h \
 ../os/hal/include/hal_wdg.h \
 ../os/hal/include/hal_wspi.h \
 ../os/hal/osal/rt-nil/chcore_timer.h \
 ../os/hal/osal/rt-nil/osal.h \
 ../os/hal/ports/STM32/LLD/ADCv2/hal_adc_lld.h \
 ../os/hal/ports/STM32/LLD/CANv1/hal_can_lld.h \
 ../os/hal/ports/STM32/LLD/DACv1/hal_dac_lld.h \
 ../os/hal/ports/STM32/LLD/DMAv2/stm32_dma.h \
 ../os/hal/ports/STM32/LLD/EXTIv1/stm32_exti.h \
 ../os/hal/ports/STM32/LLD/GPIOv2/hal_pal_lld.h \
 ../os/hal/ports/STM32/LLD/GPIOv2/stm32_gpio.h \
 ../os/hal/ports/STM32/LLD/I2Cv1/hal_i2c_lld.h \
 ../os/hal/ports/STM32/LLD/MACv1/hal_mac_lld.h \
 ../os/hal/ports/STM32/LLD/OTGv1/hal_usb_lld.h \
 ../os/hal/ports/STM32/LLD/OTGv1/stm32_otg.h \
 ../os/hal/ports/STM32/LLD/QUADSPIv1/hal_wspi_lld.h \
 ../os/hal/ports/STM32/LLD/RTCv2/hal_rtc_lld.h \
 ../os/hal/ports/STM32/LLD/SDIOv1/hal_sdc_lld.h \
 ../os/hal/ports/STM32/LLD/SPIv1/hal_i2s_lld.h \
 ../os/hal/ports/STM32/LLD/SPIv1/hal_spi_lld.h \
 ../os/hal/ports/STM32/LLD/SPIv1/hal_spi_v2_lld.h \
 ../os/hal/ports/STM32/LLD/SYSTICKv1/hal_st_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/hal_gpt_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/hal_icu_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/hal_pwm_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/stm32_tim.h \
 ../os/hal/ports/STM32/LLD/USARTv1/hal_serial_lld.h \
 ../os/hal/ports/STM32/LLD/USARTv1/hal_uart_lld.h \
 ../os/hal/ports/STM32/LLD/xWDGv1/hal_wdg_lld.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_efl_lld.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_lld.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_lld_type1.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_lld_type2.h \
 ../os/hal/ports/STM32/STM32F4xx/stm32_isr.h \
 ../os/hal/ports/STM32/STM32F4xx/stm32_rcc.h \
 ../os/hal/ports/STM32/STM32F4xx/stm32_registry.h \
 ../os/hal/ports/common/ARMCMx/cache.h \
 ../os/hal/ports/common/ARMCMx/mpu_v7m.h \
 ../os/hal/ports/common/ARMCMx/nvic.h \
 ../os/license/chcustomer.h \
 ../os/license/chlicense.h \
 ../os/license/chversion.h \
 ../os/oslib/include/chbsem.h \
 ../os/oslib/include/chdelegates.h \
 ../os/oslib/include/chfactory.h \
 ../os/oslib/include/chjobs.h \
 ../os/oslib/include/chlib.h \
 ../os/oslib/include/chmboxes.h \
 ../os/oslib/include/chmemcore.h \
 ../os/oslib/include/chmemheaps.h \
 ../os/oslib/include/chmempools.h \
 ../os/oslib/include/chobjcaches.h \
 ../os/oslib/include/chobjfifos.h \
 ../os/oslib/include/chpipes.h \
 ../os/rt/include/ch.h \
 ../os/rt/include/chalign.h \
 ../os/rt/include/chchecks.h \
 ../os/rt/include/chcond.h \
 ../os/rt/include/chdebug.h \
 ../os/rt/include/chdynamic.h \
 ../os/rt/include/chearly.h \
 ../os/rt/include/chevents.h \
 ../os/rt/include/chinstances.h \
 ../os/rt/include/chlists.h \
 ../os/rt/include/chmsg.h \
 ../os/rt/include/chmtx.h \
 ../os/rt/include/chobjects.h \
 ../os/rt/include/chport.h \
 ../os/rt/include/chregistry.h \
 ../os/rt/include/chrestrictions.h \
 ../os/rt/include/chrfcu.h \
 ../os/rt/include/chschd.h \
 ../os/rt/include/chsem.h \
 ../os/rt/include/chstats.h \
 ../os/rt/include/chsys.h \
 ../os/rt/include/chthreads.h \
 ../os/rt/include/chtime.h \
 ../os/rt/include/chtm.h \
 ../os/rt/include/chtrace.h \
 ../os/rt/include/chvt.h \
 ../os/various/cpp_wrappers/ch.hpp \
 ../dev/application/play_sound/paly_sound.cpp
CMakeFiles/PLAY_SOUND.dir/dev/interface/buzzer/buzzer_interface.cpp.obj: \
 ../dev/board_cfg/board.h \
 ../dev/board_cfg/chconf.h \
 ../dev/board_cfg/halconf.h \
 ../dev/board_cfg/mcuconf.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_armcc.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_armclang.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_compiler.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_gcc.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_iccarm.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_version.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/core_cm4.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/mpu_armv7.h \
 ../os/common/ext/ST/STM32F4xx/stm32f401xc.h \
 ../os/common/ext/ST/STM32F4xx/stm32f401xe.h \
 ../os/common/ext/ST/STM32F4xx/stm32f405xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f407xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f410cx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f410rx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f410tx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f411xe.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412cx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412rx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412vx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412zx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f413xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f415xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f417xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f423xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f427xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f429xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f437xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f439xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f446xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f469xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f479xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f4xx.h \
 ../os/common/ext/ST/STM32F4xx/system_stm32f4xx.h \
 ../os/common/portability/GCC/ccportab.h \
 ../os/common/ports/ARM-common/chtypes.h \
 ../os/common/ports/ARMv7-M/chcore.h \
 ../os/common/ports/ARMv7-M/mpu.h \
 ../os/common/startup/ARMCMx/devices/STM32F4xx/cmparams.h \
 ../os/hal/include/hal.h \
 ../os/hal/include/hal_adc.h \
 ../os/hal/include/hal_buffers.h \
 ../os/hal/include/hal_can.h \
 ../os/hal/include/hal_channels.h \
 ../os/hal/include/hal_crypto.h \
 ../os/hal/include/hal_dac.h \
 ../os/hal/include/hal_efl.h \
 ../os/hal/include/hal_files.h \
 ../os/hal/include/hal_flash.h \
 ../os/hal/include/hal_gpt.h \
 ../os/hal/include/hal_i2c.h \
 ../os/hal/include/hal_i2s.h \
 ../os/hal/include/hal_icu.h \
 ../os/hal/include/hal_ioblock.h \
 ../os/hal/include/hal_mac.h \
 ../os/hal/include/hal_mmc_spi.h \
 ../os/hal/include/hal_mmcsd.h \
 ../os/hal/include/hal_objects.h \
 ../os/hal/include/hal_pal.h \
 ../os/hal/include/hal_persistent.h \
 ../os/hal/include/hal_pwm.h \
 ../os/hal/include/hal_queues.h \
 ../os/hal/include/hal_rtc.h \
 ../os/hal/include/hal_sdc.h \
 ../os/hal/include/hal_serial.h \
 ../os/hal/include/hal_serial_usb.h \
 ../os/hal/include/hal_sio.h \
 ../os/hal/include/hal_spi.h \
 ../os/hal/include/hal_spi_v1.h \
 ../os/hal/include/hal_spi_v2.h \
 ../os/hal/include/hal_st.h \
 ../os/hal/include/hal_streams.h \
 ../os/hal/include/hal_trng.h \
 ../os/hal/include/hal_uart.h \
 ../os/hal/include/hal_usb.h \
 ../os/hal/include/hal_usb_cdc.h \
 ../os/hal/include/hal_wdg.h \
 ../os/hal/include/hal_wspi.h \
 ../os/hal/osal/rt-nil/chcore_timer.h \
 ../os/hal/osal/rt-nil/osal.h \
 ../os/hal/ports/STM32/LLD/ADCv2/hal_adc_lld.h \
 ../os/hal/ports/STM32/LLD/CANv1/hal_can_lld.h \
 ../os/hal/ports/STM32/LLD/DACv1/hal_dac_lld.h \
 ../os/hal/ports/STM32/LLD/DMAv2/stm32_dma.h \
 ../os/hal/ports/STM32/LLD/EXTIv1/stm32_exti.h \
 ../os/hal/ports/STM32/LLD/GPIOv2/hal_pal_lld.h \
 ../os/hal/ports/STM32/LLD/GPIOv2/stm32_gpio.h \
 ../os/hal/ports/STM32/LLD/I2Cv1/hal_i2c_lld.h \
 ../os/hal/ports/STM32/LLD/MACv1/hal_mac_lld.h \
 ../os/hal/ports/STM32/LLD/OTGv1/hal_usb_lld.h \
 ../os/hal/ports/STM32/LLD/OTGv1/stm32_otg.h \
 ../os/hal/ports/STM32/LLD/QUADSPIv1/hal_wspi_lld.h \
 ../os/hal/ports/STM32/LLD/RTCv2/hal_rtc_lld.h \
 ../os/hal/ports/STM32/LLD/SDIOv1/hal_sdc_lld.h \
 ../os/hal/ports/STM32/LLD/SPIv1/hal_i2s_lld.h \
 ../os/hal/ports/STM32/LLD/SPIv1/hal_spi_lld.h \
 ../os/hal/ports/STM32/LLD/SPIv1/hal_spi_v2_lld.h \
 ../os/hal/ports/STM32/LLD/SYSTICKv1/hal_st_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/hal_gpt_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/hal_icu_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/hal_pwm_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/stm32_tim.h \
 ../os/hal/ports/STM32/LLD/USARTv1/hal_serial_lld.h \
 ../os/hal/ports/STM32/LLD/USARTv1/hal_uart_lld.h \
 ../os/hal/ports/STM32/LLD/xWDGv1/hal_wdg_lld.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_efl_lld.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_lld.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_lld_type1.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_lld_type2.h \
 ../os/hal/ports/STM32/STM32F4xx/stm32_isr.h \
 ../os/hal/ports/STM32/STM32F4xx/stm32_rcc.h \
 ../os/hal/ports/STM32/STM32F4xx/stm32_registry.h \
 ../os/hal/ports/common/ARMCMx/cache.h \
 ../os/hal/ports/common/ARMCMx/mpu_v7m.h \
 ../os/hal/ports/common/ARMCMx/nvic.h \
 ../os/license/chcustomer.h \
 ../os/license/chlicense.h \
 ../os/license/chversion.h \
 ../os/oslib/include/chbsem.h \
 ../os/oslib/include/chdelegates.h \
 ../os/oslib/include/chfactory.h \
 ../os/oslib/include/chjobs.h \
 ../os/oslib/include/chlib.h \
 ../os/oslib/include/chmboxes.h \
 ../os/oslib/include/chmemcore.h \
 ../os/oslib/include/chmemheaps.h \
 ../os/oslib/include/chmempools.h \
 ../os/oslib/include/chobjcaches.h \
 ../os/oslib/include/chobjfifos.h \
 ../os/oslib/include/chpipes.h \
 ../os/rt/include/ch.h \
 ../os/rt/include/chalign.h \
 ../os/rt/include/chchecks.h \
 ../os/rt/include/chcond.h \
 ../os/rt/include/chdebug.h \
 ../os/rt/include/chdynamic.h \
 ../os/rt/include/chearly.h \
 ../os/rt/include/chevents.h \
 ../os/rt/include/chinstances.h \
 ../os/rt/include/chlists.h \
 ../os/rt/include/chmsg.h \
 ../os/rt/include/chmtx.h \
 ../os/rt/include/chobjects.h \
 ../os/rt/include/chport.h \
 ../os/rt/include/chregistry.h \
 ../os/rt/include/chrestrictions.h \
 ../os/rt/include/chrfcu.h \
 ../os/rt/include/chschd.h \
 ../os/rt/include/chsem.h \
 ../os/rt/include/chstats.h \
 ../os/rt/include/chsys.h \
 ../os/rt/include/chthreads.h \
 ../os/rt/include/chtime.h \
 ../os/rt/include/chtm.h \
 ../os/rt/include/chtrace.h \
 ../os/rt/include/chvt.h \
 ../os/various/cpp_wrappers/ch.hpp \
 ../dev/interface/buzzer/buzzer_interface.cpp \
 ../dev/interface/buzzer/buzzer_interface.h
CMakeFiles/PLAY_SOUND.dir/dev/interface/buzzer/buzzer_scheduler.cpp.obj: \
 ../dev/board_cfg/board.h \
 ../dev/board_cfg/chconf.h \
 ../dev/board_cfg/halconf.h \
 ../dev/board_cfg/mcuconf.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_armcc.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_armclang.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_compiler.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_gcc.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_iccarm.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_version.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/core_cm4.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/mpu_armv7.h \
 ../os/common/ext/ST/STM32F4xx/stm32f401xc.h \
 ../os/common/ext/ST/STM32F4xx/stm32f401xe.h \
 ../os/common/ext/ST/STM32F4xx/stm32f405xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f407xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f410cx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f410rx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f410tx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f411xe.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412cx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412rx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412vx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412zx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f413xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f415xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f417xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f423xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f427xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f429xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f437xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f439xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f446xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f469xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f479xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f4xx.h \
 ../os/common/ext/ST/STM32F4xx/system_stm32f4xx.h \
 ../os/common/portability/GCC/ccportab.h \
 ../os/common/ports/ARM-common/chtypes.h \
 ../os/common/ports/ARMv7-M/chcore.h \
 ../os/common/ports/ARMv7-M/mpu.h \
 ../os/common/startup/ARMCMx/devices/STM32F4xx/cmparams.h \
 ../os/hal/include/hal.h \
 ../os/hal/include/hal_adc.h \
 ../os/hal/include/hal_buffers.h \
 ../os/hal/include/hal_can.h \
 ../os/hal/include/hal_channels.h \
 ../os/hal/include/hal_crypto.h \
 ../os/hal/include/hal_dac.h \
 ../os/hal/include/hal_efl.h \
 ../os/hal/include/hal_files.h \
 ../os/hal/include/hal_flash.h \
 ../os/hal/include/hal_gpt.h \
 ../os/hal/include/hal_i2c.h \
 ../os/hal/include/hal_i2s.h \
 ../os/hal/include/hal_icu.h \
 ../os/hal/include/hal_ioblock.h \
 ../os/hal/include/hal_mac.h \
 ../os/hal/include/hal_mmc_spi.h \
 ../os/hal/include/hal_mmcsd.h \
 ../os/hal/include/hal_objects.h \
 ../os/hal/include/hal_pal.h \
 ../os/hal/include/hal_persistent.h \
 ../os/hal/include/hal_pwm.h \
 ../os/hal/include/hal_queues.h \
 ../os/hal/include/hal_rtc.h \
 ../os/hal/include/hal_sdc.h \
 ../os/hal/include/hal_serial.h \
 ../os/hal/include/hal_serial_usb.h \
 ../os/hal/include/hal_sio.h \
 ../os/hal/include/hal_spi.h \
 ../os/hal/include/hal_spi_v1.h \
 ../os/hal/include/hal_spi_v2.h \
 ../os/hal/include/hal_st.h \
 ../os/hal/include/hal_streams.h \
 ../os/hal/include/hal_trng.h \
 ../os/hal/include/hal_uart.h \
 ../os/hal/include/hal_usb.h \
 ../os/hal/include/hal_usb_cdc.h \
 ../os/hal/include/hal_wdg.h \
 ../os/hal/include/hal_wspi.h \
 ../os/hal/osal/rt-nil/chcore_timer.h \
 ../os/hal/osal/rt-nil/osal.h \
 ../os/hal/ports/STM32/LLD/ADCv2/hal_adc_lld.h \
 ../os/hal/ports/STM32/LLD/CANv1/hal_can_lld.h \
 ../os/hal/ports/STM32/LLD/DACv1/hal_dac_lld.h \
 ../os/hal/ports/STM32/LLD/DMAv2/stm32_dma.h \
 ../os/hal/ports/STM32/LLD/EXTIv1/stm32_exti.h \
 ../os/hal/ports/STM32/LLD/GPIOv2/hal_pal_lld.h \
 ../os/hal/ports/STM32/LLD/GPIOv2/stm32_gpio.h \
 ../os/hal/ports/STM32/LLD/I2Cv1/hal_i2c_lld.h \
 ../os/hal/ports/STM32/LLD/MACv1/hal_mac_lld.h \
 ../os/hal/ports/STM32/LLD/OTGv1/hal_usb_lld.h \
 ../os/hal/ports/STM32/LLD/OTGv1/stm32_otg.h \
 ../os/hal/ports/STM32/LLD/QUADSPIv1/hal_wspi_lld.h \
 ../os/hal/ports/STM32/LLD/RTCv2/hal_rtc_lld.h \
 ../os/hal/ports/STM32/LLD/SDIOv1/hal_sdc_lld.h \
 ../os/hal/ports/STM32/LLD/SPIv1/hal_i2s_lld.h \
 ../os/hal/ports/STM32/LLD/SPIv1/hal_spi_lld.h \
 ../os/hal/ports/STM32/LLD/SPIv1/hal_spi_v2_lld.h \
 ../os/hal/ports/STM32/LLD/SYSTICKv1/hal_st_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/hal_gpt_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/hal_icu_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/hal_pwm_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/stm32_tim.h \
 ../os/hal/ports/STM32/LLD/USARTv1/hal_serial_lld.h \
 ../os/hal/ports/STM32/LLD/USARTv1/hal_uart_lld.h \
 ../os/hal/ports/STM32/LLD/xWDGv1/hal_wdg_lld.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_efl_lld.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_lld.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_lld_type1.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_lld_type2.h \
 ../os/hal/ports/STM32/STM32F4xx/stm32_isr.h \
 ../os/hal/ports/STM32/STM32F4xx/stm32_rcc.h \
 ../os/hal/ports/STM32/STM32F4xx/stm32_registry.h \
 ../os/hal/ports/common/ARMCMx/cache.h \
 ../os/hal/ports/common/ARMCMx/mpu_v7m.h \
 ../os/hal/ports/common/ARMCMx/nvic.h \
 ../os/license/chcustomer.h \
 ../os/license/chlicense.h \
 ../os/license/chversion.h \
 ../os/oslib/include/chbsem.h \
 ../os/oslib/include/chdelegates.h \
 ../os/oslib/include/chfactory.h \
 ../os/oslib/include/chjobs.h \
 ../os/oslib/include/chlib.h \
 ../os/oslib/include/chmboxes.h \
 ../os/oslib/include/chmemcore.h \
 ../os/oslib/include/chmemheaps.h \
 ../os/oslib/include/chmempools.h \
 ../os/oslib/include/chobjcaches.h \
 ../os/oslib/include/chobjfifos.h \
 ../os/oslib/include/chpipes.h \
 ../os/rt/include/ch.h \
 ../os/rt/include/chalign.h \
 ../os/rt/include/chchecks.h \
 ../os/rt/include/chcond.h \
 ../os/rt/include/chdebug.h \
 ../os/rt/include/chdynamic.h \
 ../os/rt/include/chearly.h \
 ../os/rt/include/chevents.h \
 ../os/rt/include/chinstances.h \
 ../os/rt/include/chlists.h \
 ../os/rt/include/chmsg.h \
 ../os/rt/include/chmtx.h \
 ../os/rt/include/chobjects.h \
 ../os/rt/include/chport.h \
 ../os/rt/include/chregistry.h \
 ../os/rt/include/chrestrictions.h \
 ../os/rt/include/chrfcu.h \
 ../os/rt/include/chschd.h \
 ../os/rt/include/chsem.h \
 ../os/rt/include/chstats.h \
 ../os/rt/include/chsys.h \
 ../os/rt/include/chthreads.h \
 ../os/rt/include/chtime.h \
 ../os/rt/include/chtm.h \
 ../os/rt/include/chtrace.h \
 ../os/rt/include/chvt.h \
 ../os/various/cpp_wrappers/ch.hpp \
 ../dev/interface/buzzer/buzzer_interface.h \
 ../dev/interface/buzzer/buzzer_scheduler.cpp \
 ../dev/interface/buzzer/buzzer_scheduler.h
CMakeFiles/PLAY_SOUND.dir/dev/interface/led/led.cpp.obj: \
 ../dev/board_cfg/board.h \
 ../dev/board_cfg/chconf.h \
 ../dev/board_cfg/halconf.h \
 ../dev/board_cfg/mcuconf.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_armcc.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_armclang.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_compiler.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_gcc.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_iccarm.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/cmsis_version.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/core_cm4.h \
 ../os/common/ext/ARM/CMSIS/Core/Include/mpu_armv7.h \
 ../os/common/ext/ST/STM32F4xx/stm32f401xc.h \
 ../os/common/ext/ST/STM32F4xx/stm32f401xe.h \
 ../os/common/ext/ST/STM32F4xx/stm32f405xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f407xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f410cx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f410rx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f410tx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f411xe.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412cx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412rx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412vx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f412zx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f413xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f415xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f417xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f423xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f427xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f429xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f437xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f439xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f446xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f469xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f479xx.h \
 ../os/common/ext/ST/STM32F4xx/stm32f4xx.h \
 ../os/common/ext/ST/STM32F4xx/system_stm32f4xx.h \
 ../os/common/portability/GCC/ccportab.h \
 ../os/common/ports/ARM-common/chtypes.h \
 ../os/common/ports/ARMv7-M/chcore.h \
 ../os/common/ports/ARMv7-M/mpu.h \
 ../os/common/startup/ARMCMx/devices/STM32F4xx/cmparams.h \
 ../os/hal/include/hal.h \
 ../os/hal/include/hal_adc.h \
 ../os/hal/include/hal_buffers.h \
 ../os/hal/include/hal_can.h \
 ../os/hal/include/hal_channels.h \
 ../os/hal/include/hal_crypto.h \
 ../os/hal/include/hal_dac.h \
 ../os/hal/include/hal_efl.h \
 ../os/hal/include/hal_files.h \
 ../os/hal/include/hal_flash.h \
 ../os/hal/include/hal_gpt.h \
 ../os/hal/include/hal_i2c.h \
 ../os/hal/include/hal_i2s.h \
 ../os/hal/include/hal_icu.h \
 ../os/hal/include/hal_ioblock.h \
 ../os/hal/include/hal_mac.h \
 ../os/hal/include/hal_mmc_spi.h \
 ../os/hal/include/hal_mmcsd.h \
 ../os/hal/include/hal_objects.h \
 ../os/hal/include/hal_pal.h \
 ../os/hal/include/hal_persistent.h \
 ../os/hal/include/hal_pwm.h \
 ../os/hal/include/hal_queues.h \
 ../os/hal/include/hal_rtc.h \
 ../os/hal/include/hal_sdc.h \
 ../os/hal/include/hal_serial.h \
 ../os/hal/include/hal_serial_usb.h \
 ../os/hal/include/hal_sio.h \
 ../os/hal/include/hal_spi.h \
 ../os/hal/include/hal_spi_v1.h \
 ../os/hal/include/hal_spi_v2.h \
 ../os/hal/include/hal_st.h \
 ../os/hal/include/hal_streams.h \
 ../os/hal/include/hal_trng.h \
 ../os/hal/include/hal_uart.h \
 ../os/hal/include/hal_usb.h \
 ../os/hal/include/hal_usb_cdc.h \
 ../os/hal/include/hal_wdg.h \
 ../os/hal/include/hal_wspi.h \
 ../os/hal/osal/rt-nil/chcore_timer.h \
 ../os/hal/osal/rt-nil/osal.h \
 ../os/hal/ports/STM32/LLD/ADCv2/hal_adc_lld.h \
 ../os/hal/ports/STM32/LLD/CANv1/hal_can_lld.h \
 ../os/hal/ports/STM32/LLD/DACv1/hal_dac_lld.h \
 ../os/hal/ports/STM32/LLD/DMAv2/stm32_dma.h \
 ../os/hal/ports/STM32/LLD/EXTIv1/stm32_exti.h \
 ../os/hal/ports/STM32/LLD/GPIOv2/hal_pal_lld.h \
 ../os/hal/ports/STM32/LLD/GPIOv2/stm32_gpio.h \
 ../os/hal/ports/STM32/LLD/I2Cv1/hal_i2c_lld.h \
 ../os/hal/ports/STM32/LLD/MACv1/hal_mac_lld.h \
 ../os/hal/ports/STM32/LLD/OTGv1/hal_usb_lld.h \
 ../os/hal/ports/STM32/LLD/OTGv1/stm32_otg.h \
 ../os/hal/ports/STM32/LLD/QUADSPIv1/hal_wspi_lld.h \
 ../os/hal/ports/STM32/LLD/RTCv2/hal_rtc_lld.h \
 ../os/hal/ports/STM32/LLD/SDIOv1/hal_sdc_lld.h \
 ../os/hal/ports/STM32/LLD/SPIv1/hal_i2s_lld.h \
 ../os/hal/ports/STM32/LLD/SPIv1/hal_spi_lld.h \
 ../os/hal/ports/STM32/LLD/SPIv1/hal_spi_v2_lld.h \
 ../os/hal/ports/STM32/LLD/SYSTICKv1/hal_st_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/hal_gpt_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/hal_icu_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/hal_pwm_lld.h \
 ../os/hal/ports/STM32/LLD/TIMv1/stm32_tim.h \
 ../os/hal/ports/STM32/LLD/USARTv1/hal_serial_lld.h \
 ../os/hal/ports/STM32/LLD/USARTv1/hal_uart_lld.h \
 ../os/hal/ports/STM32/LLD/xWDGv1/hal_wdg_lld.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_efl_lld.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_lld.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_lld_type1.h \
 ../os/hal/ports/STM32/STM32F4xx/hal_lld_type2.h \
 ../os/hal/ports/STM32/STM32F4xx/stm32_isr.h \
 ../os/hal/ports/STM32/STM32F4xx/stm32_rcc.h \
 ../os/hal/ports/STM32/STM32F4xx/stm32_registry.h \
 ../os/hal/ports/common/ARMCMx/cache.h \
 ../os/hal/ports/common/ARMCMx/mpu_v7m.h \
 ../os/hal/ports/common/ARMCMx/nvic.h \
 ../os/license/chcustomer.h \
 ../os/license/chlicense.h \
 ../os/license/chversion.h \
 ../os/oslib/include/chbsem.h \
 ../os/oslib/include/chdelegates.h \
 ../os/oslib/include/chfactory.h \
 ../os/oslib/include/chjobs.h \
 ../os/oslib/include/chlib.h \
 ../os/oslib/include/chmboxes.h \
 ../os/oslib/include/chmemcore.h \
 ../os/oslib/include/chmemheaps.h \
 ../os/oslib/include/chmempools.h \
 ../os/oslib/include/chobjcaches.h \
 ../os/oslib/include/chobjfifos.h \
 ../os/oslib/include/chpipes.h \
 ../os/rt/include/ch.h \
 ../os/rt/include/chalign.h \
 ../os/rt/include/chchecks.h \
 ../os/rt/include/chcond.h \
 ../os/rt/include/chdebug.h \
 ../os/rt/include/chdynamic.h \
 ../os/rt/include/chearly.h \
 ../os/rt/include/chevents.h \
 ../os/rt/include/chinstances.h \
 ../os/rt/include/chlists.h \
 ../os/rt/include/chmsg.h \
 ../os/rt/include/chmtx.h \
 ../os/rt/include/chobjects.h \
 ../os/rt/include/chport.h \
 ../os/rt/include/chregistry.h \
 ../os/rt/include/chrestrictions.h \
 ../os/rt/include/chrfcu.h \
 ../os/rt/include/chschd.h \
 ../os/rt/include/chsem.h \
 ../os/rt/include/chstats.h \
 ../os/rt/include/chsys.h \
 ../os/rt/include/chthreads.h \
 ../os/rt/include/chtime.h \
 ../os/rt/include/chtm.h \
 ../os/rt/include/chtrace.h \
 ../os/rt/include/chvt.h \
 ../os/various/cpp_wrappers/ch.hpp \
 ../dev/interface/led/led.cpp \
 ../dev/interface/led/led.h
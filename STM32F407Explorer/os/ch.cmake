# This file set sources of ChibiOS to ${CHIBIOS_XASM_SRC} ${CHIBIOS_C_SRC}, ${CHIBIOS_CPP_SRC}, and add corresponding
#   directory to include_directories. Extract from Makefiles and .mk files from ChibiOS.

# By liuzikai 2018-01-29

set(CHIBIOS .) # this file is included in the CMakeLists.txt in the upper directory.

# $(CHIBIOS)/os/license/license.mk
include_directories(${CHIBIOS}/os/license)


# $(CHIBIOS)/os/common/startup/ARMCMx/compilers/GCC/mk/startup_stm32f4xx.mk
set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC}
        ${CHIBIOS}/os/common/startup/ARMCMx/compilers/GCC/crt1.c)

set(CHIBIOS_XASM_SRC ${CHIBIOS_XASM_SRC}
        ${CHIBIOS}/os/common/startup/ARMCMx/compilers/GCC/crt0_v7m.S
        ${CHIBIOS}/os/common/startup/ARMCMx/compilers/GCC/vectors.S)

include_directories(${CHIBIOS}/os/common/portability/GCC
        ${CHIBIOS}/os/common/startup/ARMCMx/compilers/GCC
        ${CHIBIOS}/os/common/startup/ARMCMx/devices/STM32F4xx
        ${CHIBIOS}/os/common/ext/ARM/CMSIS/Core/Include
        ${CHIBIOS}/os/common/ext/ST/STM32F4xx)


# $(CHIBIOS)/os/hal/hal.mk
set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC}
        ${CHIBIOS}/os/hal/src/hal.c
        ${CHIBIOS}/os/hal/src/hal_st.c
        ${CHIBIOS}/os/hal/src/hal_buffers.c
        ${CHIBIOS}/os/hal/src/hal_queues.c
        ${CHIBIOS}/os/hal/src/hal_flash.c
        ${CHIBIOS}/os/hal/src/hal_mmcsd.c
        ${CHIBIOS}/os/hal/src/hal_adc.c
        ${CHIBIOS}/os/hal/src/hal_can.c
        ${CHIBIOS}/os/hal/src/hal_crypto.c
        ${CHIBIOS}/os/hal/src/hal_dac.c
        ${CHIBIOS}/os/hal/src/hal_efl.c
        ${CHIBIOS}/os/hal/src/hal_gpt.c
        ${CHIBIOS}/os/hal/src/hal_i2c.c
        ${CHIBIOS}/os/hal/src/hal_i2s.c
        ${CHIBIOS}/os/hal/src/hal_icu.c
        ${CHIBIOS}/os/hal/src/hal_mac.c
        ${CHIBIOS}/os/hal/src/hal_mmc_spi.c
        ${CHIBIOS}/os/hal/src/hal_pal.c
        ${CHIBIOS}/os/hal/src/hal_pwm.c
        ${CHIBIOS}/os/hal/src/hal_rtc.c
        ${CHIBIOS}/os/hal/src/hal_sdc.c
        ${CHIBIOS}/os/hal/src/hal_serial.c
        ${CHIBIOS}/os/hal/src/hal_serial_usb.c
        ${CHIBIOS}/os/hal/src/hal_sio.c
        ${CHIBIOS}/os/hal/src/hal_spi.c
        ${CHIBIOS}/os/hal/src/hal_trng.c
        ${CHIBIOS}/os/hal/src/hal_uart.c
        ${CHIBIOS}/os/hal/src/hal_usb.c
        ${CHIBIOS}/os/hal/src/hal_wdg.c
        ${CHIBIOS}/os/hal/src/hal_wspi.c
        ${CHIBIOS}/os/hal/src/hal_community.c   # Community C file
        )
# Contriubuted sources
set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC}
        ${CHIBIOS}/os/hal/src/hal_fsmc.c
        ${CHIBIOS}/os/hal/src/hal_sdram.c
        ${CHIBIOS}/os/hal/src/hal_sram.c
        ${CHIBIOS}/os/hal/src/hal_nand.c)
include_directories(${CHIBIOS}/os/hal/include)


# $(CHIBIOS)/os/hal/ports/STM32/STM32F4xx/platform.mk
set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC}
        ${CHIBIOS}/os/hal/ports/common/ARMCMx/nvic.c
        ${CHIBIOS}/os/hal/ports/STM32/STM32F4xx/stm32_isr.c
        ${CHIBIOS}/os/hal/ports/STM32/STM32F4xx/hal_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/STM32F4xx/hal_efl_lld.c)

set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC}
        ${CHIBIOS}/os/hal/ports/STM32/LLD/ADCv2/hal_adc_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/CANv1/hal_can_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/DACv1/hal_dac_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/DMAv2/stm32_dma.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/EXTIv1/stm32_exti.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/FSMCv1/hal_sdram_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/FSMCv1/hal_sram_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/FSMCv1/hal_nand_lld.c

        ${CHIBIOS}/os/hal/ports/STM32/LLD/GPIOv2/hal_pal_lld.c
#        ${CHIBIOS}/os/hal/lib/fallback/I2C/hal_i2c_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/I2Cv1/hal_i2c_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/MACv1/hal_mac_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/OTGv1/hal_usb_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/QUADSPIv1/hal_wspi_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/RTCv2/hal_rtc_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/SPIv1/hal_i2s_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/SPIv1/hal_spi_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/SDIOv1/hal_sdc_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/TIMv1/hal_gpt_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/TIMv1/hal_icu_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/TIMv1/hal_pwm_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/USARTv1/hal_serial_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/USARTv1/hal_uart_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/xWDGv1/hal_wdg_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/SYSTICKv1/hal_st_lld.c)

include_directories(${CHIBIOS}/os/hal/ports/common/ARMCMx
        ${CHIBIOS}/os/hal/ports/STM32/STM32F4xx)

include_directories(${CHIBIOS}/os/hal/ports/STM32/LLD/ADCv2
        ${CHIBIOS}/os/hal/ports/STM32/LLD/CANv1
        ${CHIBIOS}/os/hal/ports/STM32/LLD/DACv1
        ${CHIBIOS}/os/hal/ports/STM32/LLD/DMAv2
        ${CHIBIOS}/os/hal/ports/STM32/LLD/EXTIv1
        ${CHIBIOS}/os/hal/ports/STM32/LLD/FSMCv1
        ${CHIBIOS}/os/hal/ports/STM32/LLD/GPIOv2
        ${CHIBIOS}/os/hal/ports/STM32/LLD/I2Cv1
        ${CHIBIOS}/os/hal/ports/STM32/LLD/MACv1
        ${CHIBIOS}/os/hal/ports/STM32/LLD/OTGv1
        ${CHIBIOS}/os/hal/ports/STM32/LLD/QUADSPIv1
        ${CHIBIOS}/os/hal/ports/STM32/LLD/RTCv2
        ${CHIBIOS}/os/hal/ports/STM32/LLD/SPIv1
        ${CHIBIOS}/os/hal/ports/STM32/LLD/SDIOv1
        ${CHIBIOS}/os/hal/ports/STM32/LLD/SYSTICKv1
        ${CHIBIOS}/os/hal/ports/STM32/LLD/TIMv1
        ${CHIBIOS}/os/hal/ports/STM32/LLD/USART
        ${CHIBIOS}/os/hal/ports/STM32/LLD/USARTv1
        ${CHIBIOS}/os/hal/ports/STM32/LLD/xWDGv1)

# $(CHIBIOS)/os/hal/ports/STM32/LLD/TIMv1/driver.mk
set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC}
        ${CHIBIOS}/os/hal/ports/STM32/LLD/TIMv1/hal_gpt_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/TIMv1/hal_icu_lld.c
        ${CHIBIOS}/os/hal/ports/STM32/LLD/TIMv1/hal_pwm_lld.c)

include_directories(${CHIBIOS}/os/hal/ports/STM32/LLD/TIMv1)

# $(CHIBIOS)/dev/board/board.mk
set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC}
        ${CHIBIOS}/dev/board_cfg/board.c)

include_directories(${CHIBIOS}/dev/board)


# $(CHIBIOS)/os/hal/osal/rt-nil/osal.mk
set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC}
        ${CHIBIOS}/os/hal/osal/rt-nil/osal.c)

include_directories(${CHIBIOS}/os/hal/osal/rt-nil
        ${CHIBIOS}/os/hal/osal/lib)



# $(CHIBIOS)/os/rt/rt.mk
set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC}
        ${CHIBIOS}/os/rt/src/chsys.c
        ${CHIBIOS}/os/rt/src/chrfcu.c
        ${CHIBIOS}/os/rt/src/chdebug.c
        ${CHIBIOS}/os/rt/src/chtrace.c
        ${CHIBIOS}/os/rt/src/chvt.c
        ${CHIBIOS}/os/rt/src/chschd.c
        ${CHIBIOS}/os/rt/src/chinstances.c
        ${CHIBIOS}/os/rt/src/chthreads.c
        ${CHIBIOS}/os/rt/src/chtm.c
        ${CHIBIOS}/os/rt/src/chstats.c
        ${CHIBIOS}/os/rt/src/chregistry.c
        ${CHIBIOS}/os/rt/src/chsem.c
        ${CHIBIOS}/os/rt/src/chmtx.c
        ${CHIBIOS}/os/rt/src/chcond.c
        ${CHIBIOS}/os/rt/src/chevents.c
        ${CHIBIOS}/os/rt/src/chmsg.c
        ${CHIBIOS}/os/rt/src/chdynamic.c)

include_directories(${CHIBIOS}/os/rt/include)

# $(CHIBIOS)/os/oslib/oslib.mk
set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC}
        ${CHIBIOS}/os/oslib/src/chmboxes.c
        ${CHIBIOS}/os/oslib/src/chmemcore.c
        ${CHIBIOS}/os/oslib/src/chmemheaps.c
        ${CHIBIOS}/os/oslib/src/chmempools.c
        ${CHIBIOS}/os/oslib/src/chpipes.c
        ${CHIBIOS}/os/oslib/src/chobjcaches.c
        ${CHIBIOS}/os/oslib/src/chdelegates.c
        ${CHIBIOS}/os/oslib/src/chfactory.c)
include_directories(${CHIBIOS}/os/oslib/include)


# $(CHIBIOS)/os/common/ports/ARMv7-M/compilers/GCC/mk/port.mk
set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC}
        ${CHIBIOS}/os/common/ports/ARMv7-M/chcore.c)

set(CHIBIOS_XASM_SRC ${CHIBIOS_XASM_SRC}
        ${CHIBIOS}/os/common/ports/ARMv7-M/compilers/GCC/chcoreasm.S)

include_directories(
        ${CHIBIOS}/os/common/portability/GCC
        ${CHIBIOS}/os/common/ports/ARM-common
        ${CHIBIOS}/os/common/ports/ARMv7-M
)


# $(CHIBIOS)/os/various/cpp_wrappers/chcpp.mk
set(CHIBIOS_CPP_SRC ${CHIBIOS_CPP_SRC}
        ${CHIBIOS}/os/various/cpp_wrappers/ch.cpp)
#set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC} ${CHIBIOS}/os/various/syscalls.c)
#set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC}  # contributed lcd display file
#        ${CHIBIOS}/os/various/devices_lib/lcd/ili9341.c)
include_directories(${CHIBIOS}/os/various/cpp_wrappers)
        #${CHIBIOS}/os/various/devices_lib/lcd)


# $(CHIBIOS)/os/hal/lib/streams/streams.mk
set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC}
        ${CHIBIOS}/os/hal/lib/streams/chprintf.c        # Delete it in the future
        ${CHIBIOS}/os/hal/lib/streams/chscanf.c         # Delete it in the future
        ${CHIBIOS}/os/hal/lib/streams/memstreams.c
        ${CHIBIOS}/os/hal/lib/streams/nullstreams.c
        ${CHIBIOS}/os/hal/lib/streams/bufstreams.c)     # Delete it in the future

include_directories(${CHIBIOS}/os/hal/lib/streams)


# $(CHIBIOS)/os/various/shell/shell.mk
#set(CHIBIOS_C_SRC ${CHIBIOS_C_SRC}
#        ${CHIBIOS}/os/various/shell/shell.c
#        ${CHIBIOS}/os/various/shell/shell_cmd.c)
#
#include_directories(${CHIBIOS}/os/various/shell)

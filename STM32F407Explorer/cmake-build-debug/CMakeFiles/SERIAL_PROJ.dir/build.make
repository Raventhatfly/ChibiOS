# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "D:\Program Files\JetBrains\CLion 2021.2.3\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "D:\Program Files\JetBrains\CLion 2021.2.3\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\Program\STM32F407Explorer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\Program\STM32F407Explorer\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/SERIAL_PROJ.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/SERIAL_PROJ.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/SERIAL_PROJ.dir/flags.make

CMakeFiles/SERIAL_PROJ.dir/dev/application/serial_proj/main.cpp.obj: CMakeFiles/SERIAL_PROJ.dir/flags.make
CMakeFiles/SERIAL_PROJ.dir/dev/application/serial_proj/main.cpp.obj: ../dev/application/serial_proj/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Program\STM32F407Explorer\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/SERIAL_PROJ.dir/dev/application/serial_proj/main.cpp.obj"
	D:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\SERIAL_PROJ.dir\dev\application\serial_proj\main.cpp.obj -c D:\Program\STM32F407Explorer\dev\application\serial_proj\main.cpp

CMakeFiles/SERIAL_PROJ.dir/dev/application/serial_proj/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SERIAL_PROJ.dir/dev/application/serial_proj/main.cpp.i"
	D:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\Program\STM32F407Explorer\dev\application\serial_proj\main.cpp > CMakeFiles\SERIAL_PROJ.dir\dev\application\serial_proj\main.cpp.i

CMakeFiles/SERIAL_PROJ.dir/dev/application/serial_proj/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SERIAL_PROJ.dir/dev/application/serial_proj/main.cpp.s"
	D:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\Program\STM32F407Explorer\dev\application\serial_proj\main.cpp -o CMakeFiles\SERIAL_PROJ.dir\dev\application\serial_proj\main.cpp.s

CMakeFiles/SERIAL_PROJ.dir/dev/interface/serial/serial.cpp.obj: CMakeFiles/SERIAL_PROJ.dir/flags.make
CMakeFiles/SERIAL_PROJ.dir/dev/interface/serial/serial.cpp.obj: ../dev/interface/serial/serial.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Program\STM32F407Explorer\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/SERIAL_PROJ.dir/dev/interface/serial/serial.cpp.obj"
	D:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\SERIAL_PROJ.dir\dev\interface\serial\serial.cpp.obj -c D:\Program\STM32F407Explorer\dev\interface\serial\serial.cpp

CMakeFiles/SERIAL_PROJ.dir/dev/interface/serial/serial.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SERIAL_PROJ.dir/dev/interface/serial/serial.cpp.i"
	D:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\Program\STM32F407Explorer\dev\interface\serial\serial.cpp > CMakeFiles\SERIAL_PROJ.dir\dev\interface\serial\serial.cpp.i

CMakeFiles/SERIAL_PROJ.dir/dev/interface/serial/serial.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SERIAL_PROJ.dir/dev/interface/serial/serial.cpp.s"
	D:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\Program\STM32F407Explorer\dev\interface\serial\serial.cpp -o CMakeFiles\SERIAL_PROJ.dir\dev\interface\serial\serial.cpp.s

CMakeFiles/SERIAL_PROJ.dir/dev/interface/shell/shell.cpp.obj: CMakeFiles/SERIAL_PROJ.dir/flags.make
CMakeFiles/SERIAL_PROJ.dir/dev/interface/shell/shell.cpp.obj: ../dev/interface/shell/shell.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Program\STM32F407Explorer\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/SERIAL_PROJ.dir/dev/interface/shell/shell.cpp.obj"
	D:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\SERIAL_PROJ.dir\dev\interface\shell\shell.cpp.obj -c D:\Program\STM32F407Explorer\dev\interface\shell\shell.cpp

CMakeFiles/SERIAL_PROJ.dir/dev/interface/shell/shell.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SERIAL_PROJ.dir/dev/interface/shell/shell.cpp.i"
	D:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\Program\STM32F407Explorer\dev\interface\shell\shell.cpp > CMakeFiles\SERIAL_PROJ.dir\dev\interface\shell\shell.cpp.i

CMakeFiles/SERIAL_PROJ.dir/dev/interface/shell/shell.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SERIAL_PROJ.dir/dev/interface/shell/shell.cpp.s"
	D:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\Program\STM32F407Explorer\dev\interface\shell\shell.cpp -o CMakeFiles\SERIAL_PROJ.dir\dev\interface\shell\shell.cpp.s

# Object files for target SERIAL_PROJ
SERIAL_PROJ_OBJECTS = \
"CMakeFiles/SERIAL_PROJ.dir/dev/application/serial_proj/main.cpp.obj" \
"CMakeFiles/SERIAL_PROJ.dir/dev/interface/serial/serial.cpp.obj" \
"CMakeFiles/SERIAL_PROJ.dir/dev/interface/shell/shell.cpp.obj"

# External object files for target SERIAL_PROJ
SERIAL_PROJ_EXTERNAL_OBJECTS = \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/common/startup/ARMCMx/compilers/GCC/crt0_v7m.S.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/common/startup/ARMCMx/compilers/GCC/vectors.S.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/common/ports/ARMv7-M/compilers/GCC/chcoreasm.S.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/common/startup/ARMCMx/compilers/GCC/crt1.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_st.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_buffers.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_queues.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_flash.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_mmcsd.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_adc.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_can.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_crypto.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_dac.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_efl.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_gpt.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_i2c.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_i2s.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_icu.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_mac.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_mmc_spi.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_pal.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_pwm.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_rtc.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_sdc.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_serial.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_serial_usb.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_sio.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_spi.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_trng.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_uart.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_usb.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_wdg.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_wspi.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_fsmc.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_sdram.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_sram.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_nand.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/common/ARMCMx/nvic.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/STM32F4xx/stm32_isr.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/STM32F4xx/hal_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/STM32F4xx/hal_efl_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/ADCv2/hal_adc_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/CANv1/hal_can_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/DACv1/hal_dac_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/DMAv2/stm32_dma.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/EXTIv1/stm32_exti.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/FSMCv1/hal_sdram_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/FSMCv1/hal_sram_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/FSMCv1/hal_nand_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/GPIOv2/hal_pal_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/I2Cv1/hal_i2c_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/MACv1/hal_mac_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/OTGv1/hal_usb_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/QUADSPIv1/hal_wspi_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/RTCv2/hal_rtc_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SPIv1/hal_i2s_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SPIv1/hal_spi_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SDIOv1/hal_sdc_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/TIMv1/hal_gpt_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/TIMv1/hal_icu_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/TIMv1/hal_pwm_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/USARTv1/hal_serial_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/USARTv1/hal_uart_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/xWDGv1/hal_wdg_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SYSTICKv1/hal_st_lld.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/dev/board_cfg/board.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/osal/rt-nil/osal.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chsys.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chrfcu.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chdebug.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chtrace.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chvt.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chschd.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chinstances.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chthreads.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chtm.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chstats.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chregistry.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chsem.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chmtx.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chcond.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chevents.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chmsg.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chdynamic.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chmboxes.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chmemcore.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chmemheaps.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chmempools.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chpipes.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chobjcaches.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chdelegates.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chfactory.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/common/ports/ARMv7-M/chcore.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/lib/streams/chprintf.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/lib/streams/chscanf.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/lib/streams/memstreams.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/lib/streams/nullstreams.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/lib/streams/bufstreams.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/various/cpp_wrappers/ch.cpp.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/CommonTables/arm_common_tables.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/CommonTables/arm_const_structs.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_add_f32.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_cmplx_mult_f32.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_init_f32.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_inverse_f32.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_mult_f32.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_scale_f32.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_sub_f32.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_trans_f32.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/FastMathFunctions/arm_cos_f32.c.obj" \
"D:/Program/STM32F407Explorer/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/FastMathFunctions/arm_sin_f32.c.obj"

../build/meta.elf: CMakeFiles/SERIAL_PROJ.dir/dev/application/serial_proj/main.cpp.obj
../build/meta.elf: CMakeFiles/SERIAL_PROJ.dir/dev/interface/serial/serial.cpp.obj
../build/meta.elf: CMakeFiles/SERIAL_PROJ.dir/dev/interface/shell/shell.cpp.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/common/startup/ARMCMx/compilers/GCC/crt0_v7m.S.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/common/startup/ARMCMx/compilers/GCC/vectors.S.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/common/ports/ARMv7-M/compilers/GCC/chcoreasm.S.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/common/startup/ARMCMx/compilers/GCC/crt1.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_st.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_buffers.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_queues.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_flash.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_mmcsd.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_adc.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_can.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_crypto.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_dac.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_efl.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_gpt.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_i2c.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_i2s.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_icu.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_mac.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_mmc_spi.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_pal.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_pwm.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_rtc.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_sdc.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_serial.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_serial_usb.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_sio.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_spi.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_trng.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_uart.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_usb.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_wdg.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_wspi.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_fsmc.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_sdram.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_sram.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_nand.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/common/ARMCMx/nvic.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/STM32F4xx/stm32_isr.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/STM32F4xx/hal_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/STM32F4xx/hal_efl_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/ADCv2/hal_adc_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/CANv1/hal_can_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/DACv1/hal_dac_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/DMAv2/stm32_dma.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/EXTIv1/stm32_exti.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/FSMCv1/hal_sdram_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/FSMCv1/hal_sram_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/FSMCv1/hal_nand_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/GPIOv2/hal_pal_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/I2Cv1/hal_i2c_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/MACv1/hal_mac_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/OTGv1/hal_usb_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/QUADSPIv1/hal_wspi_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/RTCv2/hal_rtc_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SPIv1/hal_i2s_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SPIv1/hal_spi_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SDIOv1/hal_sdc_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/TIMv1/hal_gpt_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/TIMv1/hal_icu_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/TIMv1/hal_pwm_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/USARTv1/hal_serial_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/USARTv1/hal_uart_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/xWDGv1/hal_wdg_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SYSTICKv1/hal_st_lld.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/dev/board_cfg/board.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/osal/rt-nil/osal.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chsys.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chrfcu.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chdebug.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chtrace.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chvt.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chschd.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chinstances.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chthreads.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chtm.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chstats.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chregistry.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chsem.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chmtx.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chcond.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chevents.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chmsg.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chdynamic.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chmboxes.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chmemcore.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chmemheaps.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chmempools.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chpipes.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chobjcaches.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chdelegates.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chfactory.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/common/ports/ARMv7-M/chcore.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/lib/streams/chprintf.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/lib/streams/chscanf.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/lib/streams/memstreams.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/lib/streams/nullstreams.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/lib/streams/bufstreams.c.obj
../build/meta.elf: CMakeFiles/ChibiOS.dir/os/various/cpp_wrappers/ch.cpp.obj
../build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/CommonTables/arm_common_tables.c.obj
../build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/CommonTables/arm_const_structs.c.obj
../build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_add_f32.c.obj
../build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_cmplx_mult_f32.c.obj
../build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_init_f32.c.obj
../build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_inverse_f32.c.obj
../build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_mult_f32.c.obj
../build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_scale_f32.c.obj
../build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_sub_f32.c.obj
../build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_trans_f32.c.obj
../build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/FastMathFunctions/arm_cos_f32.c.obj
../build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/FastMathFunctions/arm_sin_f32.c.obj
../build/meta.elf: CMakeFiles/SERIAL_PROJ.dir/build.make
../build/meta.elf: CMakeFiles/SERIAL_PROJ.dir/objects1.rsp
../build/meta.elf: CMakeFiles/SERIAL_PROJ.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\Program\STM32F407Explorer\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable ..\build\meta.elf"
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Build for EXPLORER"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\SERIAL_PROJ.dir\link.txt --verbose=$(VERBOSE)
	echo
	arm-none-eabi-size D:/Program/STM32F407Explorer/build/meta.elf
	echo

# Rule to build all files generated by this target.
CMakeFiles/SERIAL_PROJ.dir/build: ../build/meta.elf
.PHONY : CMakeFiles/SERIAL_PROJ.dir/build

CMakeFiles/SERIAL_PROJ.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\SERIAL_PROJ.dir\cmake_clean.cmake
.PHONY : CMakeFiles/SERIAL_PROJ.dir/clean

CMakeFiles/SERIAL_PROJ.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\Program\STM32F407Explorer D:\Program\STM32F407Explorer D:\Program\STM32F407Explorer\cmake-build-debug D:\Program\STM32F407Explorer\cmake-build-debug D:\Program\STM32F407Explorer\cmake-build-debug\CMakeFiles\SERIAL_PROJ.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/SERIAL_PROJ.dir/depend

# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.25

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
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2023.1.3\bin\cmake\win\x64\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2023.1.3\bin\cmake\win\x64\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\robomaster\ChibiOS\STM32F427RM-A

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\robomaster\ChibiOS\STM32F427RM-A\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/RUDDER_TEST.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/RUDDER_TEST.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/RUDDER_TEST.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/RUDDER_TEST.dir/flags.make

CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_test_main.cpp.obj: CMakeFiles/RUDDER_TEST.dir/flags.make
CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_test_main.cpp.obj: D:/robomaster/ChibiOS/STM32F427RM-A/dev/interface/rudder/rudder_test_main.cpp
CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_test_main.cpp.obj: CMakeFiles/RUDDER_TEST.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\robomaster\ChibiOS\STM32F427RM-A\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_test_main.cpp.obj"
	C:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_test_main.cpp.obj -MF CMakeFiles\RUDDER_TEST.dir\dev\interface\rudder\rudder_test_main.cpp.obj.d -o CMakeFiles\RUDDER_TEST.dir\dev\interface\rudder\rudder_test_main.cpp.obj -c D:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\rudder\rudder_test_main.cpp

CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_test_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_test_main.cpp.i"
	C:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\rudder\rudder_test_main.cpp > CMakeFiles\RUDDER_TEST.dir\dev\interface\rudder\rudder_test_main.cpp.i

CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_test_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_test_main.cpp.s"
	C:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\rudder\rudder_test_main.cpp -o CMakeFiles\RUDDER_TEST.dir\dev\interface\rudder\rudder_test_main.cpp.s

CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_interface.cpp.obj: CMakeFiles/RUDDER_TEST.dir/flags.make
CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_interface.cpp.obj: D:/robomaster/ChibiOS/STM32F427RM-A/dev/interface/rudder/rudder_interface.cpp
CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_interface.cpp.obj: CMakeFiles/RUDDER_TEST.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\robomaster\ChibiOS\STM32F427RM-A\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_interface.cpp.obj"
	C:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_interface.cpp.obj -MF CMakeFiles\RUDDER_TEST.dir\dev\interface\rudder\rudder_interface.cpp.obj.d -o CMakeFiles\RUDDER_TEST.dir\dev\interface\rudder\rudder_interface.cpp.obj -c D:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\rudder\rudder_interface.cpp

CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_interface.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_interface.cpp.i"
	C:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\rudder\rudder_interface.cpp > CMakeFiles\RUDDER_TEST.dir\dev\interface\rudder\rudder_interface.cpp.i

CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_interface.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_interface.cpp.s"
	C:\PROGRA~2\GNUARM~1\102021~1.10\bin\AR10B2~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\rudder\rudder_interface.cpp -o CMakeFiles\RUDDER_TEST.dir\dev\interface\rudder\rudder_interface.cpp.s

# Object files for target RUDDER_TEST
RUDDER_TEST_OBJECTS = \
"CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_test_main.cpp.obj" \
"CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_interface.cpp.obj"

# External object files for target RUDDER_TEST
RUDDER_TEST_EXTERNAL_OBJECTS = \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/common/startup/ARMCMx/compilers/GCC/crt0_v7m.S.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/common/startup/ARMCMx/compilers/GCC/vectors.S.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/common/ports/ARMv7-M/compilers/GCC/chcoreasm.S.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/common/startup/ARMCMx/compilers/GCC/crt1.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_st.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_buffers.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_queues.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_flash.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_mmcsd.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_adc.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_can.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_crypto.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_dac.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_efl.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_gpt.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_i2c.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_i2s.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_icu.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_mac.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_mmc_spi.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_pal.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_pwm.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_rtc.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_sdc.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_serial.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_serial_usb.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_sio.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_spi.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_trng.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_uart.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_usb.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_wdg.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/src/hal_wspi.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/common/ARMCMx/nvic.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/STM32F4xx/stm32_isr.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/STM32F4xx/hal_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/STM32F4xx/hal_efl_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/ADCv2/hal_adc_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/CANv1/hal_can_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/DACv1/hal_dac_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/DMAv2/stm32_dma.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/EXTIv1/stm32_exti.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/GPIOv2/hal_pal_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/I2Cv1/hal_i2c_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/MACv1/hal_mac_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/OTGv1/hal_usb_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/QUADSPIv1/hal_wspi_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/RTCv2/hal_rtc_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SPIv1/hal_i2s_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SPIv1/hal_spi_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SDIOv1/hal_sdc_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/TIMv1/hal_gpt_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/TIMv1/hal_icu_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/TIMv1/hal_pwm_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/USARTv1/hal_serial_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/USARTv1/hal_uart_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/xWDGv1/hal_wdg_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SYSTICKv1/hal_st_lld.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/dev/board_cfg/board.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/osal/rt-nil/osal.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chsys.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chrfcu.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chdebug.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chtrace.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chvt.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chschd.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chinstances.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chthreads.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chtm.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chstats.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chregistry.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chsem.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chmtx.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chcond.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chevents.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chmsg.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/rt/src/chdynamic.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chmboxes.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chmemcore.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chmemheaps.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chmempools.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chpipes.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chobjcaches.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chdelegates.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/oslib/src/chfactory.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/common/ports/ARMv7-M/chcore.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/lib/streams/memstreams.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/hal/lib/streams/nullstreams.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/CMakeFiles/ChibiOS.dir/os/various/cpp_wrappers/ch.cpp.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/CommonTables/arm_common_tables.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/CommonTables/arm_const_structs.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_add_f32.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_cmplx_mult_f32.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_init_f32.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_inverse_f32.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_mult_f32.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_scale_f32.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_sub_f32.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_trans_f32.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/FastMathFunctions/arm_cos_f32.c.obj" \
"D:/robomaster/ChibiOS/STM32F427RM-A/cmake-build-debug/cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/FastMathFunctions/arm_sin_f32.c.obj"

D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_test_main.cpp.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/RUDDER_TEST.dir/dev/interface/rudder/rudder_interface.cpp.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/common/startup/ARMCMx/compilers/GCC/crt0_v7m.S.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/common/startup/ARMCMx/compilers/GCC/vectors.S.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/common/ports/ARMv7-M/compilers/GCC/chcoreasm.S.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/common/startup/ARMCMx/compilers/GCC/crt1.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_st.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_buffers.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_queues.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_flash.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_mmcsd.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_adc.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_can.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_crypto.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_dac.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_efl.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_gpt.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_i2c.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_i2s.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_icu.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_mac.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_mmc_spi.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_pal.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_pwm.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_rtc.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_sdc.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_serial.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_serial_usb.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_sio.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_spi.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_trng.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_uart.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_usb.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_wdg.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/src/hal_wspi.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/common/ARMCMx/nvic.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/STM32F4xx/stm32_isr.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/STM32F4xx/hal_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/STM32F4xx/hal_efl_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/ADCv2/hal_adc_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/CANv1/hal_can_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/DACv1/hal_dac_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/DMAv2/stm32_dma.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/EXTIv1/stm32_exti.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/GPIOv2/hal_pal_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/I2Cv1/hal_i2c_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/MACv1/hal_mac_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/OTGv1/hal_usb_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/QUADSPIv1/hal_wspi_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/RTCv2/hal_rtc_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SPIv1/hal_i2s_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SPIv1/hal_spi_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SDIOv1/hal_sdc_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/TIMv1/hal_gpt_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/TIMv1/hal_icu_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/TIMv1/hal_pwm_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/USARTv1/hal_serial_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/USARTv1/hal_uart_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/xWDGv1/hal_wdg_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/ports/STM32/LLD/SYSTICKv1/hal_st_lld.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/dev/board_cfg/board.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/osal/rt-nil/osal.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chsys.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chrfcu.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chdebug.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chtrace.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chvt.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chschd.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chinstances.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chthreads.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chtm.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chstats.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chregistry.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chsem.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chmtx.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chcond.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chevents.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chmsg.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/rt/src/chdynamic.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chmboxes.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chmemcore.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chmemheaps.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chmempools.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chpipes.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chobjcaches.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chdelegates.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/oslib/src/chfactory.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/common/ports/ARMv7-M/chcore.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/lib/streams/memstreams.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/hal/lib/streams/nullstreams.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/ChibiOS.dir/os/various/cpp_wrappers/ch.cpp.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/CommonTables/arm_common_tables.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/CommonTables/arm_const_structs.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_add_f32.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_cmplx_mult_f32.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_init_f32.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_inverse_f32.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_mult_f32.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_scale_f32.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_sub_f32.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/MatrixFunctions/arm_mat_trans_f32.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/FastMathFunctions/arm_cos_f32.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: cmsis/CMakeFiles/CMSIS_DSP.dir/dsp/src/FastMathFunctions/arm_sin_f32.c.obj
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/RUDDER_TEST.dir/build.make
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/RUDDER_TEST.dir/objects1
D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf: CMakeFiles/RUDDER_TEST.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\robomaster\ChibiOS\STM32F427RM-A\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable D:\robomaster\ChibiOS\STM32F427RM-A\build\meta.elf"
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Build for RM2018A"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\RUDDER_TEST.dir\link.txt --verbose=$(VERBOSE)
	echo
	arm-none-eabi-size D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf
	echo

# Rule to build all files generated by this target.
CMakeFiles/RUDDER_TEST.dir/build: D:/robomaster/ChibiOS/STM32F427RM-A/build/meta.elf
.PHONY : CMakeFiles/RUDDER_TEST.dir/build

CMakeFiles/RUDDER_TEST.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\RUDDER_TEST.dir\cmake_clean.cmake
.PHONY : CMakeFiles/RUDDER_TEST.dir/clean

CMakeFiles/RUDDER_TEST.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\robomaster\ChibiOS\STM32F427RM-A D:\robomaster\ChibiOS\STM32F427RM-A D:\robomaster\ChibiOS\STM32F427RM-A\cmake-build-debug D:\robomaster\ChibiOS\STM32F427RM-A\cmake-build-debug D:\robomaster\ChibiOS\STM32F427RM-A\cmake-build-debug\CMakeFiles\RUDDER_TEST.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/RUDDER_TEST.dir/depend


# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.25

# compile ASM with C:/Program Files (x86)/GNU Arm Embedded Toolchain/10 2021.10/bin/arm-none-eabi-gcc.exe
# compile C with C:/Program Files (x86)/GNU Arm Embedded Toolchain/10 2021.10/bin/arm-none-eabi-gcc.exe
# compile CXX with C:/Program Files (x86)/GNU Arm Embedded Toolchain/10 2021.10/bin/arm-none-eabi-g++.exe
ASM_DEFINES = -DARM_MATH_CM4 -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -DBUILD_TARGET_NAME=\"DAMIAO_CTRL\" -DDAMIAO_CTRL -D__FPU_PRESENT=1U

ASM_INCLUDES = -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\license -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\portability\GCC -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\startup\ARMCMx\compilers\GCC -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\startup\ARMCMx\devices\STM32F4xx -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\ext\ARM\CMSIS\Core\Include -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\ext\ST\STM32F4xx -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\include -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\common\ARMCMx -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\STM32F4xx -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\ADCv2 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\CANv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\DACv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\DMAv2 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\EXTIv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\GPIOv2 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\I2Cv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\MACv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\OTGv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\QUADSPIv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\RTCv2 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\SPIv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\SDIOv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\SYSTICKv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\TIMv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\USART -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\USARTv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\xWDGv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\dev\board -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\osal\rt-nil -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\osal\lib -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\rt\include -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\oslib\include -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\ports\ARM-common -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\ports\ARMv7-M -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\various\cpp_wrappers -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\lib\streams -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\board_cfg -ID:\robomaster\ChibiOS\STM32F427RM-A\common -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\buzzer -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\led -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\usb_com -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\shell -ID:\robomaster\ChibiOS\STM32F427RM-A\os\hal\include -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\can -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\application\damiao_ctrl -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\damiao_motor -ID:\robomaster\ChibiOS\STM32F427RM-A\cmsis\dsp\include

ASM_FLAGS = -x assembler-with-cpp -mcpu=cortex-m4 -fomit-frame-pointer -falign-functions=16 -ffunction-sections -fdata-sections -fno-common -flto -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DCORTEX_USE_FPU=TRUE -mthumb -DTHUMB -DTHUMB_PRESENT -mno-thumb-interwork -DTHUMB_NO_INTERWORKING -g

C_DEFINES = -DARM_MATH_CM4 -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -DBUILD_TARGET_NAME=\"DAMIAO_CTRL\" -DDAMIAO_CTRL -D__FPU_PRESENT=1U

C_INCLUDES = -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\license -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\portability\GCC -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\startup\ARMCMx\compilers\GCC -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\startup\ARMCMx\devices\STM32F4xx -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\ext\ARM\CMSIS\Core\Include -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\ext\ST\STM32F4xx -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\include -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\common\ARMCMx -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\STM32F4xx -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\ADCv2 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\CANv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\DACv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\DMAv2 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\EXTIv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\GPIOv2 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\I2Cv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\MACv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\OTGv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\QUADSPIv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\RTCv2 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\SPIv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\SDIOv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\SYSTICKv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\TIMv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\USART -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\USARTv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\xWDGv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\dev\board -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\osal\rt-nil -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\osal\lib -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\rt\include -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\oslib\include -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\ports\ARM-common -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\ports\ARMv7-M -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\various\cpp_wrappers -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\lib\streams -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\board_cfg -ID:\robomaster\ChibiOS\STM32F427RM-A\common -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\buzzer -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\led -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\usb_com -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\shell -ID:\robomaster\ChibiOS\STM32F427RM-A\os\hal\include -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\can -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\application\damiao_ctrl -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\damiao_motor -ID:\robomaster\ChibiOS\STM32F427RM-A\cmsis\dsp\include

C_FLAGS = -mcpu=cortex-m4 -fomit-frame-pointer -falign-functions=16 -ffunction-sections -fdata-sections -fno-common -flto -mfloat-abi=hard -mfpu=fpv4-sp-d16  -Wall -Wextra -Wundef -Wstrict-prototypes -DCORTEX_USE_FPU=TRUE -DSHELL_CONFIG_FILE -mthumb -DTHUMB -DTHUMB_PRESENT -mno-thumb-interwork -DTHUMB_NO_INTERWORKING -g -fdiagnostics-color=always

CXX_DEFINES = -DARM_MATH_CM4 -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -DBUILD_TARGET_NAME=\"DAMIAO_CTRL\" -DDAMIAO_CTRL -D__FPU_PRESENT=1U

CXX_INCLUDES = -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\license -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\portability\GCC -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\startup\ARMCMx\compilers\GCC -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\startup\ARMCMx\devices\STM32F4xx -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\ext\ARM\CMSIS\Core\Include -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\ext\ST\STM32F4xx -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\include -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\common\ARMCMx -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\STM32F4xx -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\ADCv2 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\CANv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\DACv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\DMAv2 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\EXTIv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\GPIOv2 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\I2Cv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\MACv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\OTGv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\QUADSPIv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\RTCv2 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\SPIv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\SDIOv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\SYSTICKv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\TIMv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\USART -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\USARTv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\ports\STM32\LLD\xWDGv1 -ID:\robomaster\ChibiOS\STM32F427RM-A\.\dev\board -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\osal\rt-nil -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\osal\lib -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\rt\include -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\oslib\include -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\ports\ARM-common -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\common\ports\ARMv7-M -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\various\cpp_wrappers -ID:\robomaster\ChibiOS\STM32F427RM-A\.\os\hal\lib\streams -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\board_cfg -ID:\robomaster\ChibiOS\STM32F427RM-A\common -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\buzzer -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\led -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\usb_com -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\shell -ID:\robomaster\ChibiOS\STM32F427RM-A\os\hal\include -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\can -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\application\damiao_ctrl -ID:\robomaster\ChibiOS\STM32F427RM-A\dev\interface\damiao_motor -ID:\robomaster\ChibiOS\STM32F427RM-A\cmsis\dsp\include

CXX_FLAGS = -mcpu=cortex-m4 -fomit-frame-pointer -falign-functions=16 -ffunction-sections -fdata-sections -fno-common -flto -mfloat-abi=hard -mfpu=fpv4-sp-d16 -std=gnu++11 -fno-exceptions -fno-rtti -Wall -Wextra -Wundef -DCORTEX_USE_FPU=TRUE -DSHELL_CONFIG_FILE -mthumb -DTHUMB -DTHUMB_PRESENT -mno-thumb-interwork -DTHUMB_NO_INTERWORKING -g -fdiagnostics-color=always -std=gnu++11


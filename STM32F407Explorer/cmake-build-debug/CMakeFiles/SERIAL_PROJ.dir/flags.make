# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.20

# compile ASM with D:/Program Files (x86)/GNU Arm Embedded Toolchain/10 2021.10/bin/arm-none-eabi-gcc.exe
# compile C with D:/Program Files (x86)/GNU Arm Embedded Toolchain/10 2021.10/bin/arm-none-eabi-gcc.exe
# compile CXX with D:/Program Files (x86)/GNU Arm Embedded Toolchain/10 2021.10/bin/arm-none-eabi-g++.exe
ASM_DEFINES = -DARM_MATH_CM4 -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -DBUILD_TARGET_NAME=\"SERIAL_PROJ\" -DSERIAL_PROJ -D__FPU_PRESENT=1U

ASM_INCLUDES = -ID:\Program\STM32F407Explorer\.\os\license -ID:\Program\STM32F407Explorer\.\os\common\portability\GCC -ID:\Program\STM32F407Explorer\.\os\common\startup\ARMCMx\compilers\GCC -ID:\Program\STM32F407Explorer\.\os\common\startup\ARMCMx\devices\STM32F4xx -ID:\Program\STM32F407Explorer\.\os\common\ext\ARM\CMSIS\Core\Include -ID:\Program\STM32F407Explorer\.\os\common\ext\ST\STM32F4xx -ID:\Program\STM32F407Explorer\.\os\hal\include -ID:\Program\STM32F407Explorer\.\os\hal\ports\common\ARMCMx -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\STM32F4xx -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\ADCv2 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\CANv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\DACv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\DMAv2 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\EXTIv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\FSMCv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\GPIOv2 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\I2Cv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\MACv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\OTGv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\QUADSPIv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\RTCv2 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\SPIv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\SDIOv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\SYSTICKv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\TIMv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\USART -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\USARTv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\xWDGv1 -ID:\Program\STM32F407Explorer\.\dev\board -ID:\Program\STM32F407Explorer\.\os\hal\osal\rt-nil -ID:\Program\STM32F407Explorer\.\os\hal\osal\lib -ID:\Program\STM32F407Explorer\.\os\rt\include -ID:\Program\STM32F407Explorer\.\os\oslib\include -ID:\Program\STM32F407Explorer\.\os\common\ports\ARM-common -ID:\Program\STM32F407Explorer\.\os\common\ports\ARMv7-M -ID:\Program\STM32F407Explorer\.\os\various\cpp_wrappers -ID:\Program\STM32F407Explorer\.\os\hal\lib\streams -ID:\Program\STM32F407Explorer\dev\board_cfg -ID:\Program\STM32F407Explorer\dev\interface\serial -ID:\Program\STM32F407Explorer\dev\application\serial_proj -ID:\Program\STM32F407Explorer\dev\interface\shell -ID:\Program\STM32F407Explorer\cmsis\dsp\include

ASM_FLAGS = -x assembler-with-cpp -mcpu=cortex-m4 -fomit-frame-pointer -falign-functions=16 -ffunction-sections -fdata-sections -fno-common -flto -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DCORTEX_USE_FPU=TRUE -mthumb -DTHUMB -DTHUMB_PRESENT -mno-thumb-interwork -DTHUMB_NO_INTERWORKING -g

C_DEFINES = -DARM_MATH_CM4 -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -DBUILD_TARGET_NAME=\"SERIAL_PROJ\" -DSERIAL_PROJ -D__FPU_PRESENT=1U

C_INCLUDES = -ID:\Program\STM32F407Explorer\.\os\license -ID:\Program\STM32F407Explorer\.\os\common\portability\GCC -ID:\Program\STM32F407Explorer\.\os\common\startup\ARMCMx\compilers\GCC -ID:\Program\STM32F407Explorer\.\os\common\startup\ARMCMx\devices\STM32F4xx -ID:\Program\STM32F407Explorer\.\os\common\ext\ARM\CMSIS\Core\Include -ID:\Program\STM32F407Explorer\.\os\common\ext\ST\STM32F4xx -ID:\Program\STM32F407Explorer\.\os\hal\include -ID:\Program\STM32F407Explorer\.\os\hal\ports\common\ARMCMx -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\STM32F4xx -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\ADCv2 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\CANv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\DACv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\DMAv2 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\EXTIv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\FSMCv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\GPIOv2 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\I2Cv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\MACv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\OTGv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\QUADSPIv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\RTCv2 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\SPIv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\SDIOv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\SYSTICKv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\TIMv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\USART -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\USARTv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\xWDGv1 -ID:\Program\STM32F407Explorer\.\dev\board -ID:\Program\STM32F407Explorer\.\os\hal\osal\rt-nil -ID:\Program\STM32F407Explorer\.\os\hal\osal\lib -ID:\Program\STM32F407Explorer\.\os\rt\include -ID:\Program\STM32F407Explorer\.\os\oslib\include -ID:\Program\STM32F407Explorer\.\os\common\ports\ARM-common -ID:\Program\STM32F407Explorer\.\os\common\ports\ARMv7-M -ID:\Program\STM32F407Explorer\.\os\various\cpp_wrappers -ID:\Program\STM32F407Explorer\.\os\hal\lib\streams -ID:\Program\STM32F407Explorer\dev\board_cfg -ID:\Program\STM32F407Explorer\dev\interface\serial -ID:\Program\STM32F407Explorer\dev\application\serial_proj -ID:\Program\STM32F407Explorer\dev\interface\shell -ID:\Program\STM32F407Explorer\cmsis\dsp\include

C_FLAGS = -mcpu=cortex-m4 -fomit-frame-pointer -falign-functions=16 -ffunction-sections -fdata-sections -fno-common -flto -mfloat-abi=hard -mfpu=fpv4-sp-d16  -Wall -Wextra -Wundef -Wstrict-prototypes -DCORTEX_USE_FPU=TRUE -DSHELL_CONFIG_FILE -mthumb -DTHUMB -DTHUMB_PRESENT -mno-thumb-interwork -DTHUMB_NO_INTERWORKING -g

CXX_DEFINES = -DARM_MATH_CM4 -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -DBUILD_TARGET_NAME=\"SERIAL_PROJ\" -DSERIAL_PROJ -D__FPU_PRESENT=1U

CXX_INCLUDES = -ID:\Program\STM32F407Explorer\.\os\license -ID:\Program\STM32F407Explorer\.\os\common\portability\GCC -ID:\Program\STM32F407Explorer\.\os\common\startup\ARMCMx\compilers\GCC -ID:\Program\STM32F407Explorer\.\os\common\startup\ARMCMx\devices\STM32F4xx -ID:\Program\STM32F407Explorer\.\os\common\ext\ARM\CMSIS\Core\Include -ID:\Program\STM32F407Explorer\.\os\common\ext\ST\STM32F4xx -ID:\Program\STM32F407Explorer\.\os\hal\include -ID:\Program\STM32F407Explorer\.\os\hal\ports\common\ARMCMx -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\STM32F4xx -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\ADCv2 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\CANv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\DACv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\DMAv2 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\EXTIv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\FSMCv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\GPIOv2 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\I2Cv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\MACv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\OTGv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\QUADSPIv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\RTCv2 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\SPIv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\SDIOv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\SYSTICKv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\TIMv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\USART -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\USARTv1 -ID:\Program\STM32F407Explorer\.\os\hal\ports\STM32\LLD\xWDGv1 -ID:\Program\STM32F407Explorer\.\dev\board -ID:\Program\STM32F407Explorer\.\os\hal\osal\rt-nil -ID:\Program\STM32F407Explorer\.\os\hal\osal\lib -ID:\Program\STM32F407Explorer\.\os\rt\include -ID:\Program\STM32F407Explorer\.\os\oslib\include -ID:\Program\STM32F407Explorer\.\os\common\ports\ARM-common -ID:\Program\STM32F407Explorer\.\os\common\ports\ARMv7-M -ID:\Program\STM32F407Explorer\.\os\various\cpp_wrappers -ID:\Program\STM32F407Explorer\.\os\hal\lib\streams -ID:\Program\STM32F407Explorer\dev\board_cfg -ID:\Program\STM32F407Explorer\dev\interface\serial -ID:\Program\STM32F407Explorer\dev\application\serial_proj -ID:\Program\STM32F407Explorer\dev\interface\shell -ID:\Program\STM32F407Explorer\cmsis\dsp\include

CXX_FLAGS = -mcpu=cortex-m4 -fomit-frame-pointer -falign-functions=16 -ffunction-sections -fdata-sections -fno-common -flto -mfloat-abi=hard -mfpu=fpv4-sp-d16 -std=gnu++11 -fno-exceptions -fno-rtti -Wall -Wextra -Wundef -DCORTEX_USE_FPU=TRUE -DSHELL_CONFIG_FILE -mthumb -DTHUMB -DTHUMB_PRESENT -mno-thumb-interwork -DTHUMB_NO_INTERWORKING -g -std=gnu++11

# This file includes configurations for ARM embedded development and toolchain.
# liuzikai 2018-02-09

# CMake system configs. These configs affects the way to pass flags.
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR arm)

# ---------- Toolchain Configurations ----------

# The following lines set the toolchain. Setting toolchain in CLion preference is also valid.

set(TOOLCHAIN_PREFIX arm-none-eabi-)
set(CMAKE_C_COMPILER   ${TOOLCHAIN_PREFIX}gcc    )
set(CMAKE_ASM_COMPILER ${TOOLCHAIN_PREFIX}gcc    )
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}g++    )
set(CMAKE_OBJCOPY      ${TOOLCHAIN_PREFIX}objcopy)
set(CMAKE_SIZE_UTILITY ${TOOLCHAIN_PREFIX}size)
set(CMAKE_EXE_LINKER_FLAGS "--specs=nosys.specs")


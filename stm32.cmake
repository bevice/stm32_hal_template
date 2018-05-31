# Путь к тулчейну
if(DEFINED ENV{ARM_TOOLCHAIN_PATH})
	SET(TOOLCHAIN_DIR $ENV{ARM_TOOLCHAIN_PATH})
else()
	message(FATAL_ERROR "Please set ARM_TOOLCHAIN_PATH environment value")
endif()



# Другие полезные пути
SET(TOOLCHAIN_BIN_DIR ${TOOLCHAIN_DIR}/bin)
SET(TOOLCHAIN_LIBC_DIR ${TOOLCHAIN_DIR}/arm-none-eabi/libc)
SET(TOOLCHAIN_INC_DIR ${TOOLCHAIN_LIBC_DIR}/include)
SET(TOOLCHAIN_LIB_DIR ${TOOLCHAIN_DIR}/arm-none-eabi/lib/)
link_directories(${TOOLCHAIN_LIB_DIR})

SET(CMAKE_SYSTEM_NAME Linux CACHE INTERNAL "system name")
SET(CMAKE_SYSTEM_PROCESSOR arm CACHE INTERNAL "processor")

if(WIN32)
    SET(EXE_SUFFIX ".exe")
else()
    SET(EXE_SUFFIX "")
endif()
# Компиляторы
SET(CMAKE_C_COMPILER "${TOOLCHAIN_BIN_DIR}/arm-none-eabi-gcc${EXE_SUFFIX}" CACHE INTERNAL "")
SET(CMAKE_CXX_COMPILER "${TOOLCHAIN_BIN_DIR}/arm-none-eabi-g++${EXE_SUFFIX}" CACHE INTERNAL "")
SET(CMAKE_ASM_COMPILER "${TOOLCHAIN_BIN_DIR}/arm-none-eabi-gcc${EXE_SUFFIX}" CACHE INTERNAL "")
# objcopy и objdump для создания хексов и бинариков
SET(CMAKE_OBJCOPY "${TOOLCHAIN_BIN_DIR}/arm-none-eabi-objcopy${EXE_SUFFIX}" CACHE INTERNAL "")
SET(CMAKE_OBJDUMP "${TOOLCHAIN_BIN_DIR}/arm-none-eabi-objdump${EXE_SUFFIX}" CACHE INTERNAL "")
SET(CMAKE_SIZE "${TOOLCHAIN_BIN_DIR}/arm-none-eabi-size${EXE_SUFFIX}" CACHE INTERNAL "")

# Включаем ассемблер
ENABLE_LANGUAGE(ASM)

SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)
SET(CMAKE_CROSSCOMPILING 1)
# IF(SEMIHOSTING STREQUAL "enable")
#   message(STATUS "Arm semihosting: Enabled")
#   ADD_DEFINITIONS(-DSEMIHOSTING_ENABLE)
#   SET(EXTRA_FLAGS_SEMIHOSTING "--specs=rdimon.specs -lc -lrdimon")
# else()
#   message(STATUS "Arm semihosting: Disabled")

# ENDIF()

# Установка HSE_VALUE
if(NOT HSE_VALUE)
    message(STATUS "Setting HSE to default")
else()
    message(STATUS "Setting HSE to ${HSE_VALUE}")
    ADD_DEFINITIONS("-DHSE_VALUE=${HSE_VALUE}")

endif()

# Флаги компиляторов, тут можно подкрутить
SET(CMAKE_C_FLAGS "-isystem ${TOOLCHAIN_INC_DIR} -mthumb-interwork -mcpu=cortex-m3 -fno-builtin -Wall  -ffunction-sections -fdata-sections -mfloat-abi=soft -std=gnu99 ${EXTRA_FLAGS_SEMIHOSTING}" CACHE INTERNAL "c compiler flags")
SET(CMAKE_CXX_FLAGS "-isystem ${TOOLCHAIN_INC_DIR} -mthumb-interwork -mcpu=cortex-m3 -fno-builtin -Wall " CACHE INTERNAL "cxx compiler flags")
SET(CMAKE_EXE_LINKER_FLAGS "--specs=nano.specs -nostartfiles -Wl,-Map -Wl,main.map -mthumb-interwork -mcpu=cortex-m3 -Wl,--gc-sections" CACHE INTERNAL "exe link flags")
SET(CMAKE_MODULE_LINKER_FLAGS "-L${TOOLCHAIN_LIB_DIR}" CACHE INTERNAL "module link flags")
SET(CMAKE_SHARED_LINKER_FLAGS "-L${TOOLCHAIN_LIB_DIR}" CACHE INTERNAL "shared lnk flags")
SET(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS)

SET(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_LIBC_DIR} CACHE INTERNAL "cross root directory")
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH CACHE INTERNAL "")
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY CACHE INTERNAL "")
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY CACHE INTERNAL "")




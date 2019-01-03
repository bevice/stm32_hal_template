cmake_minimum_required(VERSION 3.8 FATAL_ERROR)




## LL Modules
SET(LL_FSMC_ENABLED TRUE)
SET(LL_SDMMC_ENABLED TRUE)
SET(LL_USB_ENABLED TRUE)
SET(LL_ADC_ENABLED TRUE)
SET(LL_CRC_ENABLED TRUE)
SET(LL_DAC_ENABLED TRUE)
SET(LL_DMA_ENABLED TRUE)
SET(LL_EXTI_ENABLED TRUE)
SET(LL_GPIO_ENABLED TRUE)
SET(LL_I2C_ENABLED TRUE)
SET(LL_PWR_ENABLED TRUE)
SET(LL_RCC_ENABLED TRUE)
SET(LL_RTC_ENABLED TRUE)
SET(LL_SPI_ENABLED TRUE)
SET(LL_TIM_ENABLED TRUE)
SET(LL_USART_ENABLED TRUE)
SET(LL_UTILS_ENABLED TRUE)

include(ll_stm32f1xx.cmake)
include(hal_stm32f1xx.cmake)
include(hal_defines.cmake)


SET(CMSIS_INCLUDE_DIRECTORIES
        ${CMAKE_CURRENT_SOURCE_DIR}/CMSIS/Include/
        ${CMAKE_CURRENT_SOURCE_DIR}/CMSIS/Device/ST/STM32F1xx/Include/
        )

set(STM32F1XX_LL_INCLUDE_DIRECTORIES
        ${CMAKE_CURRENT_SOURCE_DIR}/STM32F1xx_HAL_Driver/Inc
        )
set(STM32F1XX_HAL_INCLUDE_DIRECTORIES
        ${CMAKE_CURRENT_SOURCE_DIR}/STM32F1xx_HAL_Driver/Inc
        )





add_library(stm32f1xx_ll
        ${STM32F1XX_LL_HEADERS}
        ${STM32F1XX_LL_SOURCES}
        )

add_library(stm32f1xx_hal
        ${STM32F1XX_HAL_HEADERS}
        ${STM32F1XX_HAL_SOURCES}
        )

target_include_directories(stm32f1xx_hal
        PUBLIC STM32F1xx_HAL_Driver/Inc
        PUBLIC ${CMSIS_INCLUDE_DIRECTORIES}
        )
target_include_directories(stm32f1xx_ll
        PUBLIC STM32F1xx_HAL_Driver/Inc
        PUBLIC ${CMSIS_INCLUDE_DIRECTORIES}
        )


#
#add_definitions(-DARM_MATH_CM3)
#include(dsp.cmake)
#link_directories(drivers/CMSIS/Lib/GCC)
#link_directories(CMSIS/Lib/GCC)
#add_library(stm32f1xx_dsp
#        ${DSL_SOURCES}
#        )
#target_include_directories(stm32f1xx_dsp
#        PUBLIC ${CMSIS_INCLUDE_DIRECTORIES}
#        )
#
#
#
#target_link_libraries(stm32f1xx_dsp m)

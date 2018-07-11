set(HAL_DIR ${PROJECT_SOURCE_DIR}/drivers/STM32F1xx_HAL_Driver)
set(CMSIS_DIR ${PROJECT_SOURCE_DIR}/drivers/CMSIS)
set(BASELIBC_DIR ${PROJECT_SOURCE_DIR}/Baselibc)
set(STARTUP_DIR ${PROJECT_SOURCE_DIR}/startup)

message(STATUS "PROJECT_SOURCE_DIR : ${PROJECT_SOURCE_DIR}")
message(STATUS "HAL_DIR : ${HAL_DIR}")
message(STATUS "CMSIS_DIR : ${CMSIS_DIR}")
message(STATUS "BASELIBC_DIR : ${BASELIBC_DIR}")
# Пути, где лежат заголовки
SET(DRV_INCLUDE_DIRS
    ${HAL_DIR}/Inc/
    ${CMSIS_DIR}/Device/ST/STM32F1xx/Include/
    ${CMSIS_DIR}/Include/
)



# Стартовые файлы - в них происходит низкоуровневая (начальная) инициализация чипа
#SET(STM32_STARTUP_F103X6 ${CMSIS_DIR}/Device/ST/STM32F1xx/Source/Templates/gcc/startup_stm32f103xb.s)
SET(STM32_STARTUP ${STARTUP_DIR}/startup.c)
# Исходники CMSIS
SET(STM32_SYSTEM_SOURCE ${CMSIS_DIR}/Device/ST/STM32F1xx/Source/Templates/system_stm32f1xx.c)

# Модули библиотеки HAL
SET(STM32_HAL_ADC_FNAME stm32f1xx_hal_adc)
SET(STM32_HAL_ADC_EX_FNAME stm32f1xx_hal_adc_ex)
SET(STM32_HAL_CAN_FNAME stm32f1xx_hal_can)
SET(STM32_HAL_CEC_FNAME stm32f1xx_hal_cec)
SET(STM32_HAL_CORTEX_FNAME stm32f1xx_hal_cortex)
SET(STM32_HAL_CRC_FNAME stm32f1xx_hal_crc)
SET(STM32_HAL_DAC_FNAME stm32f1xx_hal_dac)
SET(STM32_HAL_DAC_EX_FNAME stm32f1xx_hal_dac_ex)
SET(STM32_HAL_DMA_FNAME stm32f1xx_hal_dma)
SET(STM32_HAL_ETH_FNAME stm32f1xx_hal_eth)
SET(STM32_HAL_FLASH_FNAME stm32f1xx_hal_flash)
SET(STM32_HAL_FLASH_EX_FNAME stm32f1xx_hal_flash_ex)
SET(STM32_HAL_GPIO_FNAME stm32f1xx_hal_gpio)
SET(STM32_HAL_GPIO_EX_FNAME stm32f1xx_hal_gpio_ex)
SET(STM32_HAL_HCD_FNAME stm32f1xx_hal_hcd)
SET(STM32_HAL_I2C_FNAME stm32f1xx_hal_i2c)
SET(STM32_HAL_I2S_FNAME stm32f1xx_hal_i2s)
SET(STM32_HAL_IRDA_FNAME stm32f1xx_hal_irda)
SET(STM32_HAL_IWDG_FNAME stm32f1xx_hal_iwdg)
SET(STM32_HAL_NAND_FNAME stm32f1xx_hal_nand)
SET(STM32_HAL_NOR_FNAME stm32f1xx_hal_nor)
SET(STM32_HAL_PCCARD_FNAME stm32f1xx_hal_pccard)
SET(STM32_HAL_PCD_FNAME stm32f1xx_hal_pcd)
SET(STM32_HAL_PCD_EX_FNAME stm32f1xx_hal_pcd_ex)
SET(STM32_HAL_PWR_FNAME stm32f1xx_hal_pwr)
SET(STM32_HAL_RCC_FNAME stm32f1xx_hal_rcc)
SET(STM32_HAL_RCC_EX_FNAME stm32f1xx_hal_rcc_ex)

SET(STM32_HAL_SD_FNAME stm32f1xx_hal_sd)
SET(STM32_HAL_SMARTCARD_FNAME stm32f1xx_hal_smartcard)
SET(STM32_HAL_SPI_FNAME stm32f1xx_hal_spi)
SET(STM32_HAL_SPI_EX_FNAME stm32f1xx_hal_spi_ex)
SET(STM32_HAL_SRAM_FNAME stm32f1xx_hal_sram)
SET(STM32_HAL_TIM_FNAME stm32f1xx_hal_tim)
SET(STM32_HAL_TIM_EX_FNAME stm32f1xx_hal_tim_ex)
SET(STM32_HAL_UART_FNAME stm32f1xx_hal_uart)
SET(STM32_HAL_USART_FNAME stm32f1xx_hal_usart)
SET(STM32_HAL_WWDG_FNAME stm32f1xx_hal_wwdg)
SET(STM32_HAL_FNAME stm32f1xx_hal)
SET(STM32_HAL_MMC_FNAME stm32f1xx_hal_mmc)
SET(STM32_HAL_RTC_FNAME stm32f1xx_hal_rtc)
SET(STM32_HAL_RTC_EX_FNAME stm32f1xx_hal_rtc_ex)


SET(STM32_LL_FSMC_FNAME stm32f1xx_ll_fsmc)
SET(STM32_LL_SDMMC_FNAME stm32f1xx_ll_sdmmc)
SET(STM32_LL_USB_FNAME stm32f1xx_ll_usb)
SET(STM32_LL_ADC_FNAME stm32f1xx_ll_adc)
SET(STM32_LL_CRC_FNAME stm32f1xx_ll_crc)
SET(STM32_LL_DAC_FNAME stm32f1xx_ll_dac)
SET(STM32_LL_DMA_FNAME stm32f1xx_ll_dma)
SET(STM32_LL_EXTI_FNAME stm32f1xx_ll_exti)
SET(STM32_LL_GPIO_FNAME stm32f1xx_ll_gpio)
SET(STM32_LL_I2C_FNAME stm32f1xx_ll_i2c)
SET(STM32_LL_PWR_FNAME stm32f1xx_ll_pwr)
SET(STM32_LL_RCC_FNAME stm32f1xx_ll_rcc)
SET(STM32_LL_RTC_FNAME stm32f1xx_ll_rtc)
SET(STM32_LL_SPI_FNAME stm32f1xx_ll_spi)
SET(STM32_LL_TIM_FNAME stm32f1xx_ll_tim)
SET(STM32_LL_USART_FNAME stm32f1xx_ll_usart)
SET(STM32_LL_UTILS_FNAME stm32f1xx_ll_utils)


add_definitions(-DHAL_MODULE_ENABLED)

##define HAL_MODULE_ENABLED
#HAL_ADC_MODULE_ENABLED
#HAL_CRYP_MODULE_ENABLED
#HAL_CAN_MODULE_ENABLED
#HAL_CEC_MODULE_ENABLED
#HAL_CORTEX_MODULE_ENABLED
#HAL_CRC_MODULE_ENABLED
#HAL_DAC_MODULE_ENABLED
#HAL_DMA_MODULE_ENABLED
#HAL_ETH_MODULE_ENABLED
#HAL_FLASH_MODULE_ENABLED
#
#HAL_I2C_MODULE_ENABLED
#HAL_I2S_MODULE_ENABLED
#HAL_IRDA_MODULE_ENABLED
#HAL_IWDG_MODULE_ENABLED
#HAL_NOR_MODULE_ENABLED
#HAL_NAND_MODULE_ENABLED
#HAL_PCCARD_MODULE_ENABLED
#HAL_PCD_MODULE_ENABLED
#HAL_HCD_MODULE_ENABLED
#HAL_PWR_MODULE_ENABLED
#HAL_RCC_MODULE_ENABLED
#HAL_RTC_MODULE_ENABLED
#HAL_SD_MODULE_ENABLED
#HAL_MMC_MODULE_ENABLED
#HAL_SDRAM_MODULE_ENABLED
#HAL_SMARTCARD_MODULE_ENABLED
#HAL_SPI_MODULE_ENABLED
#HAL_SRAM_MODULE_ENABLED
#HAL_TIM_MODULE_ENABLED
#HAL_UART_MODULE_ENABLED
#HAL_USART_MODULE_ENABLED
#HAL_WWDG_MODULE_ENABLED
#HAL_EXTI_MODULE_ENABLED

#HAL_CORTEX_MODULE_ENABLED
#HAL_DMA_MODULE_ENABLED
#HAL_FLASH_MODULE_ENABLED
#HAL_GPIO_MODULE_ENABLED
#HAL_PWR_MODULE_ENABLED
#HAL_RCC_MODULE_ENABLED
#HAL_GPIO_MODULE_ENABLED

SET(HAL_RCC_MODULE_ENABLED TRUE)

SET(HAL_SOURCES
        ${HAL_DIR}/Src/${STM32_HAL_FNAME}.c
        ${HAL_DIR}/Inc/${STM32_HAL_FNAME}.h
        )


############
if(HAL_ADC_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_ADC_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_ADC_FNAME}.h
            ${HAL_DIR}/Src/${STM32_HAL_ADC_EX_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_ADC_EX_FNAME}.h
            )
    add_definitions(-DHAL_ADC_MODULE_ENABLED)
    message(STATUS "Using HAL ADC")
endif()


if(HAL_CRYP_MODULE_ENABLED)
    #### SOURCES NOT FOUND
    add_definitions(-DHAL_CRYP_MODULE_ENABLED)
    message(STATUS "Using HAL CRYP")
endif()


if(HAL_CAN_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_CAN_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_CAN_FNAME}.h
            )
    add_definitions(-DHAL_CAN_MODULE_ENABLED)
    message(STATUS "Using HAL CAN")
endif()


if(HAL_CEC_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_CEC_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_CEC_FNAME}.h
            )
    add_definitions(-DHAL_CEC_MODULE_ENABLED)
    message(STATUS "Using HAL CEC")
endif()


if(HAL_CORTEX_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_CORTEX_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_CORTEX_FNAME}.h
            )
    add_definitions(-DHAL_CORTEX_MODULE_ENABLED)
    message(STATUS "Using HAL CORTEX")
endif()


if(HAL_CRC_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_CRC_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_CRC_FNAME}.h
            )
    add_definitions(-DHAL_CRC_MODULE_ENABLED)
    message(STATUS "Using HAL CRC")
endif()


if(HAL_DAC_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_DAC_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_DAC_FNAME}.h
            ${HAL_DIR}/Src/${STM32_HAL_DAC_EX_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_DAC_EX_FNAME}.h
            )
    add_definitions(-DHAL_DAC_MODULE_ENABLED)
    message(STATUS "Using HAL DAC")
endif()


if(HAL_DMA_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_DMA_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_DMA_FNAME}.h
            )
    add_definitions(-DHAL_DMA_MODULE_ENABLED)
    message(STATUS "Using HAL DMA")
endif()


if(HAL_ETH_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_ETH_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_ETH_FNAME}.h
            )
    add_definitions(-DHAL_ETH_MODULE_ENABLED)
    message(STATUS "Using HAL ETH")
endif()


if(HAL_FLASH_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_FLASH_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_FLASH_FNAME}.h
            ${HAL_DIR}/Src/${STM32_HAL_FLASH_EX_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_FLASH_EX_FNAME}.h
            )
    add_definitions(-DHAL_FLASH_MODULE_ENABLED)
    message(STATUS "Using HAL FLASH")
endif()


if(HAL_I2C_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_I2C_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_I2C_FNAME}.h
            )
    add_definitions(-DHAL_I2C_MODULE_ENABLED)
    message(STATUS "Using HAL I2C")
endif()


if(HAL_I2S_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_I2S_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_I2S_FNAME}.h
            )
    add_definitions(-DHAL_I2S_MODULE_ENABLED)
    message(STATUS "Using HAL I2S")
endif()


if(HAL_IRDA_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_IRDA_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_IRDA_FNAME}.h
            )
    add_definitions(-DHAL_IRDA_MODULE_ENABLED)
    message(STATUS "Using HAL IRDA")
endif()


if(HAL_IWDG_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_IWDG_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_IWDG_FNAME}.h
            )
    add_definitions(-DHAL_IWDG_MODULE_ENABLED)
    message(STATUS "Using HAL IWDG")
endif()


if(HAL_NOR_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_NOR_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_NOR_FNAME}.h
            )
    add_definitions(-DHAL_NOR_MODULE_ENABLED)
    message(STATUS "Using HAL NOR")
endif()


if(HAL_NAND_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_NAND_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_NAND_FNAME}.h
            )
    add_definitions(-DHAL_NAND_MODULE_ENABLED)
    message(STATUS "Using HAL NAND")
endif()


if(HAL_PCCARD_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_PCCARD_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_PCCARD_FNAME}.h
            )
    add_definitions(-DHAL_PCCARD_MODULE_ENABLED)
    message(STATUS "Using HAL PCCARD")
endif()


if(HAL_PCD_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_PCD_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_PCD_FNAME}.h
            ${HAL_DIR}/Src/${STM32_HAL_PCD_EX_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_PCD_EX_FNAME}.h
            )
    add_definitions(-DHAL_PCD_MODULE_ENABLED)
    message(STATUS "Using HAL PCD")
endif()


if(HAL_HCD_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_HCD_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_HCD_FNAME}.h
            )
    add_definitions(-DHAL_HCD_MODULE_ENABLED)
    message(STATUS "Using HAL HCD")
endif()


if(HAL_PWR_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_PWR_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_PWR_FNAME}.h
            )
    add_definitions(-DHAL_PWR_MODULE_ENABLED)
    message(STATUS "Using HAL PWR")
endif()


if(HAL_RCC_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_RCC_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_RCC_FNAME}.h
            ${HAL_DIR}/Src/${STM32_HAL_RCC_EX_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_RCC_EX_FNAME}.h
            )
    add_definitions(-DHAL_RCC_MODULE_ENABLED)
    message(STATUS "Using HAL RCC")
endif()


if(HAL_RTC_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_RTC_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_RTC_FNAME}.h
            ${HAL_DIR}/Src/${STM32_HAL_RTC_EX_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_RTC_EX_FNAME}.h
            )
    add_definitions(-DHAL_RTC_MODULE_ENABLED)
    message(STATUS "Using HAL RTC")
endif()


if(HAL_SD_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_SD_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_SD_FNAME}.h
            )
    add_definitions(-DHAL_SD_MODULE_ENABLED)
    message(STATUS "Using HAL SD")
endif()


if(HAL_MMC_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_MMC_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_MMC_FNAME}.h
            )
    add_definitions(-DHAL_MMC_MODULE_ENABLED)
    message(STATUS "Using HAL MMC")
endif()


if(HAL_SDRAM_MODULE_ENABLED)
    #### SOURCES NOT FOUND
    add_definitions(-DHAL_SDRAM_MODULE_ENABLED)
    message(STATUS "Using HAL SDRAM")
endif()


if(HAL_SMARTCARD_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_SMARTCARD_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_SMARTCARD_FNAME}.h
            )
    add_definitions(-DHAL_SMARTCARD_MODULE_ENABLED)
    message(STATUS "Using HAL SMARTCARD")
endif()


if(HAL_SPI_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_SPI_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_SPI_FNAME}.h
            ${HAL_DIR}/Src/${STM32_HAL_SPI_EX_FNAME}.c
#            ${HAL_DIR}/Inc/${STM32_HAL_SPI_EX_FNAME}.h
            )
    add_definitions(-DHAL_SPI_MODULE_ENABLED)
    message(STATUS "Using HAL SPI")
endif()


if(HAL_SRAM_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_SRAM_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_SRAM_FNAME}.h
            )
    add_definitions(-DHAL_SRAM_MODULE_ENABLED)
    message(STATUS "Using HAL SRAM")
endif()


if(HAL_TIM_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_TIM_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_TIM_FNAME}.h
            ${HAL_DIR}/Src/${STM32_HAL_TIM_EX_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_TIM_EX_FNAME}.h
            )
    add_definitions(-DHAL_TIM_MODULE_ENABLED)
    message(STATUS "Using HAL TIM")
endif()


if(HAL_UART_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_UART_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_UART_FNAME}.h
            )
    add_definitions(-DHAL_UART_MODULE_ENABLED)
    message(STATUS "Using HAL UART")
endif()


if(HAL_USART_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_USART_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_USART_FNAME}.h
            )
    add_definitions(-DHAL_USART_MODULE_ENABLED)
    message(STATUS "Using HAL USART")
endif()


if(HAL_WWDG_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_WWDG_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_WWDG_FNAME}.h
            )
    add_definitions(-DHAL_WWDG_MODULE_ENABLED)
    message(STATUS "Using HAL WWDG")
endif()


if(HAL_EXTI_MODULE_ENABLED)
    #### SOURCES NOT FOUND
    add_definitions(-DHAL_EXTI_MODULE_ENABLED)
    message(STATUS "Using HAL EXTI")
endif()


if(HAL_GPIO_MODULE_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_HAL_GPIO_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_GPIO_FNAME}.h
            ${HAL_DIR}/Src/${STM32_HAL_GPIO_EX_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_HAL_GPIO_EX_FNAME}.h
            )
    add_definitions(-DHAL_GPIO_MODULE_ENABLED)
    message(STATUS "Using HAL GPIO")
endif()



if(LL_FSMC_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_FSMC_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_FSMC_FNAME}.h
            )
    message(STATUS "Using LL_FSMC")
endif()


if(LL_SDMMC_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_SDMMC_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_SDMMC_FNAME}.h
            )
    message(STATUS "Using LL_SDMMC")
endif()


if(LL_USB_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_USB_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_USB_FNAME}.h
            )
    message(STATUS "Using LL_USB")
endif()


if(LL_ADC_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_ADC_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_ADC_FNAME}.h
            )
    message(STATUS "Using LL_ADC")
endif()


if(LL_CRC_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_CRC_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_CRC_FNAME}.h
            )
    message(STATUS "Using LL_CRC")
endif()


if(LL_DAC_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_DAC_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_DAC_FNAME}.h
            )
    message(STATUS "Using LL_DAC")
endif()


if(LL_DMA_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_DMA_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_DMA_FNAME}.h
            )
    message(STATUS "Using LL_DMA")
endif()


if(LL_EXTI_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_EXTI_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_EXTI_FNAME}.h
            )
    message(STATUS "Using LL_EXTI")
endif()


if(LL_GPIO_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_GPIO_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_GPIO_FNAME}.h
            )
    message(STATUS "Using LL_GPIO")
endif()


if(LL_I2C_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_I2C_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_I2C_FNAME}.h
            )
    message(STATUS "Using LL_I2C")
endif()


if(LL_PWR_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_PWR_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_PWR_FNAME}.h
            )
    message(STATUS "Using LL_PWR")
endif()


if(LL_RCC_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_RCC_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_RCC_FNAME}.h
            )
    message(STATUS "Using LL_RCC")
endif()


if(LL_RTC_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_RTC_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_RTC_FNAME}.h
            )
    message(STATUS "Using LL_RTC")
endif()


if(LL_SPI_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_SPI_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_SPI_FNAME}.h
            )
    message(STATUS "Using LL_SPI")
endif()


if(LL_TIM_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_TIM_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_TIM_FNAME}.h
            )
    message(STATUS "Using LL_TIM")
endif()


if(LL_USART_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_USART_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_USART_FNAME}.h
            )
    message(STATUS "Using LL_USART")
endif()


if(LL_UTILS_ENABLED)

    SET(HAL_SOURCES
            ${HAL_SOURCES}
            ${HAL_DIR}/Src/${STM32_LL_UTILS_FNAME}.c
            ${HAL_DIR}/Inc/${STM32_LL_UTILS_FNAME}.h
            )
    message(STATUS "Using LL_UTILS")
endif()
cmake_minimum_required(VERSION 3.8)

add_definitions(-DHAL_MODULE_ENABLED)

if(HAL_ADC_MODULE_ENABLED)
    add_definitions(-DHAL_ADC_MODULE_ENABLED)
    message(STATUS "Using HAL ADC")
endif()


if(HAL_CRYP_MODULE_ENABLED)
    add_definitions(-DHAL_CRYP_MODULE_ENABLED)
    message(STATUS "Using HAL CRYP")
endif()


if(HAL_CAN_MODULE_ENABLED)
    add_definitions(-DHAL_CAN_MODULE_ENABLED)
    message(STATUS "Using HAL CAN")
endif()


if(HAL_CEC_MODULE_ENABLED)
    add_definitions(-DHAL_CEC_MODULE_ENABLED)
    message(STATUS "Using HAL CEC")
endif()


if(HAL_CORTEX_MODULE_ENABLED)
    add_definitions(-DHAL_CORTEX_MODULE_ENABLED)
    message(STATUS "Using HAL CORTEX")
endif()


if(HAL_CRC_MODULE_ENABLED)
    add_definitions(-DHAL_CRC_MODULE_ENABLED)
    message(STATUS "Using HAL CRC")
endif()


if(HAL_DAC_MODULE_ENABLED)
    add_definitions(-DHAL_DAC_MODULE_ENABLED)
    message(STATUS "Using HAL DAC")
endif()


if(HAL_DMA_MODULE_ENABLED)
    add_definitions(-DHAL_DMA_MODULE_ENABLED)
    message(STATUS "Using HAL DMA")
endif()


if(HAL_ETH_MODULE_ENABLED)
    add_definitions(-DHAL_ETH_MODULE_ENABLED)
    message(STATUS "Using HAL ETH")
endif()


if(HAL_FLASH_MODULE_ENABLED)
    add_definitions(-DHAL_FLASH_MODULE_ENABLED)
    message(STATUS "Using HAL FLASH")
endif()


if(HAL_I2C_MODULE_ENABLED)
    add_definitions(-DHAL_I2C_MODULE_ENABLED)
    message(STATUS "Using HAL I2C")
endif()


if(HAL_I2S_MODULE_ENABLED)
    add_definitions(-DHAL_I2S_MODULE_ENABLED)
    message(STATUS "Using HAL I2S")
endif()


if(HAL_IRDA_MODULE_ENABLED)
    add_definitions(-DHAL_IRDA_MODULE_ENABLED)
    message(STATUS "Using HAL IRDA")
endif()


if(HAL_IWDG_MODULE_ENABLED)
    add_definitions(-DHAL_IWDG_MODULE_ENABLED)
    message(STATUS "Using HAL IWDG")
endif()


if(HAL_NOR_MODULE_ENABLED)
    add_definitions(-DHAL_NOR_MODULE_ENABLED)
    message(STATUS "Using HAL NOR")
endif()


if(HAL_NAND_MODULE_ENABLED)
    add_definitions(-DHAL_NAND_MODULE_ENABLED)
    message(STATUS "Using HAL NAND")
endif()


if(HAL_PCCARD_MODULE_ENABLED)
    add_definitions(-DHAL_PCCARD_MODULE_ENABLED)
    message(STATUS "Using HAL PCCARD")
endif()


if(HAL_PCD_MODULE_ENABLED)
    add_definitions(-DHAL_PCD_MODULE_ENABLED)
    message(STATUS "Using HAL PCD")
endif()


if(HAL_HCD_MODULE_ENABLED)
    add_definitions(-DHAL_HCD_MODULE_ENABLED)
    message(STATUS "Using HAL HCD")
endif()


if(HAL_PWR_MODULE_ENABLED)
    add_definitions(-DHAL_PWR_MODULE_ENABLED)
    message(STATUS "Using HAL PWR")
endif()


if(HAL_RCC_MODULE_ENABLED)
    add_definitions(-DHAL_RCC_MODULE_ENABLED)
    message(STATUS "Using HAL RCC")
endif()


if(HAL_RTC_MODULE_ENABLED)
    add_definitions(-DHAL_RTC_MODULE_ENABLED)
    message(STATUS "Using HAL RTC")
endif()


if(HAL_SD_MODULE_ENABLED)
    add_definitions(-DHAL_SD_MODULE_ENABLED)
    message(STATUS "Using HAL SD")
endif()


if(HAL_MMC_MODULE_ENABLED)
    add_definitions(-DHAL_MMC_MODULE_ENABLED)
    message(STATUS "Using HAL MMC")
endif()


if(HAL_SDRAM_MODULE_ENABLED)
    add_definitions(-DHAL_SDRAM_MODULE_ENABLED)
    message(STATUS "Using HAL SDRAM")
endif()


if(HAL_SMARTCARD_MODULE_ENABLED)
    add_definitions(-DHAL_SMARTCARD_MODULE_ENABLED)
    message(STATUS "Using HAL SMARTCARD")
endif()


if(HAL_SPI_MODULE_ENABLED)
    add_definitions(-DHAL_SPI_MODULE_ENABLED)
    message(STATUS "Using HAL SPI")
endif()


if(HAL_SRAM_MODULE_ENABLED)
    add_definitions(-DHAL_SRAM_MODULE_ENABLED)
    message(STATUS "Using HAL SRAM")
endif()


if(HAL_TIM_MODULE_ENABLED)
    add_definitions(-DHAL_TIM_MODULE_ENABLED)
    message(STATUS "Using HAL TIM")
endif()


if(HAL_UART_MODULE_ENABLED)
    add_definitions(-DHAL_UART_MODULE_ENABLED)
    message(STATUS "Using HAL UART")
endif()


if(HAL_USART_MODULE_ENABLED)
    add_definitions(-DHAL_USART_MODULE_ENABLED)
    message(STATUS "Using HAL USART")
endif()


if(HAL_WWDG_MODULE_ENABLED)
    add_definitions(-DHAL_WWDG_MODULE_ENABLED)
    message(STATUS "Using HAL WWDG")
endif()


if(HAL_EXTI_MODULE_ENABLED)
    #### SOURCES NOT FOUND
    add_definitions(-DHAL_EXTI_MODULE_ENABLED)
    message(STATUS "Using HAL EXTI")
endif()


if(HAL_GPIO_MODULE_ENABLED)
    add_definitions(-DHAL_GPIO_MODULE_ENABLED)
    message(STATUS "Using HAL GPIO")
endif()
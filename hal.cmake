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
    ${HAL_DIR}/inc/
    ${CMSIS_DIR}/Device/ST/STM32F1xx/Include/
    ${CMSIS_DIR}/Include/
    ${BASELIBC_DIR}/include/
    ${BASELIBC_DIR}/src/templates
)

file(GLOB BASELIBC_FILES ${BASELIBC_DIR}/src/*.c)

# Стартовые файлы - в них происходит низкоуровневая (начальная) инициализация чипа
#SET(STM32_STARTUP_F103X6 ${CMSIS_DIR}/Device/ST/STM32F1xx/Source/Templates/gcc/startup_stm32f103xb.s)
SET(STM32_STARTUP ${STARTUP_DIR}/startup.c)
# Исходники CMSIS
SET(STM32_SYSTEM_SOURCE ${CMSIS_DIR}/Device/ST/STM32F1xx/Source/Templates/system_stm32f1xx.c)

# Модули библиотеки HAL
SET(STM32_HAL_ADC_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_adc.c)
SET(STM32_HAL_ADC_EX_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_adc_ex.c)
SET(STM32_HAL_CAN_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_can.c)
SET(STM32_HAL_CEC_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_cec.c)
SET(STM32_HAL_CORTEX_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_cortex.c)
SET(STM32_HAL_CRC_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_crc.c)
SET(STM32_HAL_DAC_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_dac.c)
SET(STM32_HAL_DAC_EX_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_dac_ex.c)
SET(STM32_HAL_DMA_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_dma.c)
SET(STM32_HAL_ETH_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_eth.c)
SET(STM32_HAL_FLASH_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_flash.c)
SET(STM32_HAL_FLASH_EX_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_flash_ex.c)
SET(STM32_HAL_GPIO_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_gpio.c)
SET(STM32_HAL_GPIO_EX_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_gpio_ex.c)
SET(STM32_HAL_HCD_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_hcd.c)
SET(STM32_HAL_I2C_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_i2c.c)
SET(STM32_HAL_I2S_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_i2s.c)
SET(STM32_HAL_IRDA_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_irda.c)
SET(STM32_HAL_IWDG_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_iwdg.c)
SET(STM32_HAL_MSP_TEMPLATE_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_msp_template.c)
SET(STM32_HAL_NAND_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_nand.c)
SET(STM32_HAL_NOR_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_nor.c)
SET(STM32_HAL_PCCARD_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_pccard.c)
SET(STM32_HAL_PCD_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_pcd.c)
SET(STM32_HAL_PCD_EX_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_pcd_ex.c)
SET(STM32_HAL_PWR_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_pwr.c)
SET(STM32_HAL_RCC_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_rcc.c)
SET(STM32_HAL_RCC_EX_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_rcc_ex.c)
SET(STM32_HAL_SD_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_sd.c)
SET(STM32_HAL_SMARTCARD_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_smartcard.c)
SET(STM32_HAL_SPI_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_spi.c)
SET(STM32_HAL_SPI_EX_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_spi_ex.c)
SET(STM32_HAL_SRAM_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_sram.c)
SET(STM32_HAL_TIM_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_tim.c)
SET(STM32_HAL_TIM_EX_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_tim_ex.c)
SET(STM32_HAL_UART_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_uart.c)
SET(STM32_HAL_USART_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_usart.c)
SET(STM32_HAL_WWDG_SOURCE ${HAL_DIR}/src/stm32f1xx_hal_wwdg.c)
SET(STM32_HAL_SOURCE ${HAL_DIR}/src/stm32f1xx_hal.c)
SET(STM32_LL_FSMC_SOURCE ${HAL_DIR}/src/stm32f1xx_ll_fsmc.c)
SET(STM32_LL_SDMMC_SOURCE ${HAL_DIR}/src/stm32f1xx_ll_sdmmc.c)
SET(STM32_LL_USB_SOURCE ${HAL_DIR}/src/stm32f1xx_ll_usb.c)
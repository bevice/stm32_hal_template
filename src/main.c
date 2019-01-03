#include "stm32f1xx_hal.h"
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "clocker/clock.h"

int main(void) {


    HAL_Init();
    clock_set_pre(CLOCK_SOURCE_PLL, CLOCK_AHB_PRE_1, CLOCK_APB_PRE_1, CLOCK_APB_PRE_1);
    clock_set_systick(CLOCK_DEFAULT_SYSTICK_FQ);
    clock_start(CLOCK_SOURCE_PLL, 8000000, CLOCK_PLL_MUL_9);


    __HAL_RCC_GPIOC_CLK_ENABLE();
    GPIO_InitTypeDef g;
    g.Mode = GPIO_MODE_OUTPUT_PP;
    g.Speed = GPIO_SPEED_FREQ_LOW;
    g.Pin = GPIO_PIN_13;
    HAL_GPIO_Init(GPIOC, &g);

    while (1) {
        HAL_GPIO_TogglePin(GPIOC, GPIO_PIN_13);
        HAL_Delay(1000);
    }


}

void SysTick_Handler(void) {
    HAL_IncTick();
    HAL_SYSTICK_IRQHandler();
}



#ifdef USE_FULL_ASSERT

/**
   * @brief Reports the name of the source file and the source line number
   * where the assert_param error has occurred.
   * @param file: pointer to the source file name
   * @param line: assert_param error line source number
   * @retval None
   */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
    ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */

}

#endif

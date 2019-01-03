/**
* \file
* \date 12.08.2018
* \authors Alexander A. Kuzkin <xbevice@gmail.com>
*/

#ifndef STM32_CLOCKER_
#define STM32_CLOCKER_

#include <stdint.h>

#define CLOCK_DEFAULT_SYSTICK_FQ 1000


#ifndef HSI_VALUE
#define HSI_VALUE 8000000ul
#endif

typedef enum {
    CLOCK_OK = 0,
    CLOCK_TIMEOUT,
    CLOCK_NOT_READY,
    CLOCK_FAIL,
} clock_status_t;

typedef enum {
    CLOCK_SOURCE_HSI = 0,
    CLOCK_SOURCE_HSE = 1,
    CLOCK_SOURCE_PLL = 2,
} clock_source_t;

typedef enum {
    CLOCK_PLL_MUL_2 = 2, // для удобства, двойку потом вычтем
    CLOCK_PLL_MUL_3,
    CLOCK_PLL_MUL_4,
    CLOCK_PLL_MUL_5,
    CLOCK_PLL_MUL_6,
    CLOCK_PLL_MUL_7,
    CLOCK_PLL_MUL_8,
    CLOCK_PLL_MUL_9,
    CLOCK_PLL_MUL_10,
    CLOCK_PLL_MUL_11,
    CLOCK_PLL_MUL_12,
    CLOCK_PLL_MUL_13,
    CLOCK_PLL_MUL_14,
    CLOCK_PLL_MUL_15,
    CLOCK_PLL_MUL_16,
}
        clock_pll_mul_t;


typedef enum {
    CLOCK_APB_PRE_1 = 0,
    CLOCK_APB_PRE_2 = 0b100,
    CLOCK_APB_PRE_4 = 0b101,
    CLOCK_APB_PRE_8 = 0b110,
    CLOCK_APB_PRE_16 = 0b111,
} clock_apb_pre_t;

typedef enum {
    CLOCK_AHB_PRE_1 = 0,
    CLOCK_AHB_PRE_2 = 0b1000,
    CLOCK_AHB_PRE_4 = 0b1001,
    CLOCK_AHB_PRE_8 = 0b1010,
    CLOCK_AHB_PRE_16 = 0b1011,
    CLOCK_AHB_PRE_64 = 0b1100,
    CLOCK_AHB_PRE_128 = 0b1101,
    CLOCK_AHB_PRE_256 = 0b1110,
    CLOCK_AHB_PRE_512 = 0b1111,

} clock_ahb_pre_t;
typedef volatile struct {
    uint32_t SystemCoreClock;
    uint32_t SystemAHBClock;
    uint32_t SystemAPB1Clock;
    uint32_t SystemAPB2Clock;
    uint32_t SysTickClock;
    uint32_t HSEClock;
    clock_source_t Source;

} clock_values_t;

extern clock_values_t clock_values;

/**
 * Установка предделителей для шин для выбранного источника.
 * При изменении источника тактовых сингалов переключение предделителей произойдет автоматически
 * в соответсвии с заданными значениями. Если кристалл сейчас работает на source - изменение
 * произойдет незамедлительно. Если частоты изменились после пересчета вызовется коллбек clock_was_updated(...)
 *
 * @param source Выбранный источник
 * @param ahb_pre Делитель для шины AHB (относительно SystemClock)
 * @param apb1_pre Делитель для шины APB1 (относительно AHB),
 *                 если частота шины получается более 36МГц (ahb_pre = 1, apb1_pre = 1)
 *                 делитель будет установлен в CLOCK_APB_PRE_2
 * @param apb2_pre Делитель для шины APB2 (относительно AHB)
 * @return
 */
clock_status_t clock_set_pre(clock_source_t source,
                             clock_ahb_pre_t ahb_pre,
                             clock_apb_pre_t apb1_pre,
                             clock_apb_pre_t apb2_pre);

/**
 * Настройка и запуск тактового генератора. Переход на выбранный источник произойдет сразу же по возможности,
 * или в прерывании по готовности источника. После перехода вызовется коллбек clock_was_updated(...)
 * Если выбран источник HSI - PLL и HSE будет отключен.
 *
 * @param source Выбранный источник тактовых сигналов
 * @param hse_clock частота в герцах внешнего кварцевого резонатора (HSE)
 * @param pllmul множитель частоты для PLL
 * @return
 */
clock_status_t clock_start(clock_source_t source, uint32_t hse_clock, clock_pll_mul_t pllmul);

/**
 * Устанавливает частоту срабатывания SysTick
 * При переходах на другие источники тактовых сингалов значения регистров SysTick обновятся автоматически.
 * @param clock частота в герцах
 */
void clock_set_systick(uint32_t clock);


/**
 * Изменяет множитель частоты PLL. Дергать можно только при работе от PLL,
 * в других случаях вызывать clock_start(...)
 * @param pllmul
 * @return
 */
clock_status_t clock_change_pll_mul(clock_pll_mul_t pllmul);


/**
 * Коллбек, вызывается при любых изменениях частот.
 * @param current_clocks структура содержащая текущие частоты шин и ядра
 * @param status статус, если произошел срыв генерации HSE/PLL - CLOCK_FAIL
 */
void clock_was_updated(const clock_values_t *current_clocks, clock_status_t status);

#endif

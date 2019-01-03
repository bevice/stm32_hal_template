/**
* \file
* \date 12.08.2018
* \authors Alexander A. Kuzkin <xbevice@gmail.com>
*/

#include "clock.h"
#include <stm32f1xx.h>

#define HSE_FAIL (1<<0)

clock_values_t clock_values = {
        HSI_VALUE,   // System
        HSI_VALUE,   // AHB
        HSI_VALUE,   // APB1
        HSI_VALUE,   // APB2
        CLOCK_SOURCE_HSI,
        0,           // частота SysTick
        0,           // частота HSE

};
typedef struct {
    clock_ahb_pre_t ahb;
    clock_apb_pre_t apb1;
    clock_apb_pre_t apb2;
} _pre_t;

static _pre_t deviders[3] = {
        {CLOCK_AHB_PRE_1, CLOCK_APB_PRE_1, CLOCK_APB_PRE_1}, // HSI
        {CLOCK_AHB_PRE_1, CLOCK_APB_PRE_1, CLOCK_APB_PRE_1}, // HSE
        {CLOCK_AHB_PRE_1, CLOCK_APB_PRE_2, CLOCK_APB_PRE_2}, // PLL
};


static volatile uint8_t clock_flags = 0;

static volatile clock_source_t target_source = CLOCK_SOURCE_HSI;
static volatile uint8_t target_pllmul = 0xFF;

uint32_t _pll_calc();

clock_status_t clock_select_source(clock_source_t src);

clock_source_t _clock_get_current_source();

void _clock_update();

clock_status_t clock_start(clock_source_t source, uint32_t hse_clock, clock_pll_mul_t pllmul) {
    if (hse_clock * pllmul > 72000000)
        return CLOCK_FAIL;

    __enable_irq();
    RCC->CR |= RCC_CR_CSSON; // включаем защиту
    RCC->CIR |= RCC_CIR_HSERDYIE | RCC_CIR_PLLRDYIE; // включаем прерывание по готовности HSE и PLL
    NVIC_EnableIRQ(RCC_IRQn);

    target_source = source;
    clock_values.HSEClock = hse_clock;
    if (target_pllmul != pllmul) {
        // нужно погасить PLL если включен
        target_pllmul = pllmul;
        if (clock_values.Source == CLOCK_SOURCE_PLL) {
            clock_select_source(CLOCK_SOURCE_HSI); // перейдем на HSI
        }
        if (RCC->CR & RCC_CR_PLLON)
            RCC->CR &= ~RCC_CR_PLLON; // выключим PLL если включен

        // Запишем новый множитель
        RCC->CFGR |= RCC_CFGR_PLLSRC;
        RCC->CFGR = (RCC->CFGR & ~RCC_CFGR_PLLMULL_Msk) | (((uint8_t) target_pllmul - 2) << RCC_CFGR_PLLMULL_Pos);

    }
    if (target_source != _clock_get_current_source())
        switch (target_source) {
            case CLOCK_SOURCE_HSE:
                if (clock_select_source(CLOCK_SOURCE_HSE) == CLOCK_NOT_READY)
                    RCC->CR |= RCC_CR_HSEON; // заводим HSE, прерывание уже включено target установлен
                break;
            case CLOCK_SOURCE_PLL:
                if (RCC->CR & RCC_CR_HSERDY) {
                    if (RCC->CR & RCC_CR_PLLRDY)
                        clock_select_source(CLOCK_SOURCE_PLL);
                    else
                        RCC->CR |= RCC_CR_PLLON;

                } else
                    RCC->CR |= RCC_CR_HSEON;// заводим HSE

                break;
            case CLOCK_SOURCE_HSI:
                clock_select_source(CLOCK_SOURCE_HSI); // он типа всегда готов
                break;
        }
    return CLOCK_OK;
}

void _clock_set_pre(clock_ahb_pre_t ahb_pre, clock_apb_pre_t apb1_pre, clock_apb_pre_t apb2_pre, uint8_t update) {
    // Проверим, не превышаем ли мы частоту APB1?
    if (_clock_get_current_source() == CLOCK_SOURCE_PLL) {
        uint32_t fq = _pll_calc();
        if (fq > 36000000 && ahb_pre == CLOCK_AHB_PRE_1) {
            // APB1 не может быть выше 36МГц  (RM0008 стр.103)
            if (apb1_pre == CLOCK_APB_PRE_1)
                apb1_pre = CLOCK_APB_PRE_2;
        }

    }
    // проверим, нужно ли изменить частоты?
    if (((RCC->CFGR & RCC_CFGR_HPRE_Msk) >> RCC_CFGR_HPRE_Pos != ahb_pre)
        ||
        ((RCC->CFGR & RCC_CFGR_PPRE1_Msk) >> RCC_CFGR_PPRE1_Pos != apb1_pre)
        ||
        ((RCC->CFGR & RCC_CFGR_PPRE2_Msk) >> RCC_CFGR_PPRE2_Pos != apb2_pre)
            ) {

        RCC->CFGR = (RCC->CFGR & (~(RCC_CFGR_HPRE_Msk | RCC_CFGR_PPRE1_Msk | RCC_CFGR_PPRE2_Msk)))
                    | (ahb_pre << RCC_CFGR_HPRE_Pos) | (apb1_pre << RCC_CFGR_PPRE1_Pos) |
                    (apb2_pre << RCC_CFGR_PPRE2_Pos);
        if (update)
            _clock_update(); // ну и обновим частоты если нужно
    }
}


clock_status_t clock_enable_hse(uint32_t wait, uint32_t hse_value) {
    clock_values.HSEClock = hse_value;
    RCC->CR |= RCC_CR_HSEON;
    RCC->CR |= RCC_CR_CSSON;
    RCC->CIR |= RCC_CIR_HSERDYIE;
    __enable_irq();
    NVIC_EnableIRQ(RCC_IRQn);

    if (wait)
        while (!(RCC->CR & RCC_CR_HSERDY) && --wait);
    else
        return CLOCK_OK;
    if (wait) {
        clock_flags &= ~HSE_FAIL;
        return CLOCK_OK;
    }
    return CLOCK_TIMEOUT;
}

clock_status_t clock_select_source(clock_source_t src) {
    if (clock_values.Source == src)
        return CLOCK_OK; // мы как бы уже
    switch (src) {
        default:
        case CLOCK_SOURCE_HSI:
            if (!(RCC->CR & RCC_CR_HSIRDY))
                return CLOCK_NOT_READY;
            RCC->CR &= ~(RCC_CR_PLLON | RCC_CR_HSEON); // потушим PLL и HSE

            RCC->CFGR &= ~RCC_CFGR_SW_Msk; // переходим на на HSI
            FLASH->ACR &= ~FLASH_ACR_PRFTBE; // выключаем буффер предвыборки
            FLASH->ACR &= ((uint32_t) ~FLASH_ACR_LATENCY); // выключаем задержку чтения
            break;
        case CLOCK_SOURCE_HSE:
            if (!(RCC->CR & RCC_CR_HSERDY))
                return CLOCK_NOT_READY; // HSE не готов, выходим
            RCC->CR &= ~(RCC_CR_PLLON); // потушим PLL
            FLASH->ACR |= FLASH_ACR_PRFTBE; // включаем буффер предвыборки
            //на всякий случай включим максимальную задержку
            FLASH->ACR = (FLASH->ACR & ~FLASH_ACR_LATENCY_Msk) | FLASH_ACR_LATENCY_2;
            // переходим на HSE
            RCC->CFGR = (RCC->CFGR & ~RCC_CFGR_SW_Msk) | RCC_CFGR_SW_HSE;
            if (clock_values.HSEClock < 24000000) {
                FLASH->ACR &= ~FLASH_ACR_PRFTBE; // выключаем буффер предвыборки
                FLASH->ACR &= ((uint32_t) ~FLASH_ACR_LATENCY); // выключаем задержку чтения
            } else {
                FLASH->ACR = (FLASH->ACR & ~FLASH_ACR_LATENCY_Msk) |
                             FLASH_ACR_LATENCY_1;// больше 48кварцы все равно не ставят
            }

            break;
        case CLOCK_SOURCE_PLL:
            if (!(RCC->CR & RCC_CR_PLLRDY))
                return CLOCK_NOT_READY;
            // расчитаем скорость ядра.
            FLASH->ACR |= FLASH_ACR_PRFTBE; // включаем буффер предвыборки
            //на всякий случай включим максимальную задержку
            FLASH->ACR = (FLASH->ACR & ~FLASH_ACR_LATENCY_Msk) | FLASH_ACR_LATENCY_2;
            // переходим на PLL
            RCC->CFGR = (RCC->CFGR & ~RCC_CFGR_SW_Msk) | RCC_CFGR_SW_PLL;
            uint32_t clk = _pll_calc();
            if (clk <= 24000000) {
                FLASH->ACR &= ~FLASH_ACR_PRFTBE; // выключаем буффер предвыборки
                FLASH->ACR &= ((uint32_t) ~FLASH_ACR_LATENCY); // выключаем задержку чтения
            } else if (clk < 48000000)
                FLASH->ACR = (FLASH->ACR & ~FLASH_ACR_LATENCY_Msk) |
                             FLASH_ACR_LATENCY_2;// задержка в 2 цикла
            break;

    }
    clock_source_t current_source = _clock_get_current_source();
    _clock_set_pre(deviders[current_source].ahb, deviders[current_source].apb1, deviders[current_source].apb2, 0);
    _clock_update();

    return CLOCK_OK;
}


static void _update_systick() {
    SysTick_Config(clock_values.SystemAHBClock / clock_values.SysTickClock);

}

void clock_set_systick(uint32_t clock) {
    clock_values.SysTickClock = clock;
    _update_systick();
}

clock_status_t
clock_set_pre(clock_source_t source, clock_ahb_pre_t ahb_pre, clock_apb_pre_t apb1_pre, clock_apb_pre_t apb2_pre) {
    deviders[source].ahb = ahb_pre;
    deviders[source].apb1 = apb1_pre;
    deviders[source].apb2 = apb2_pre;
    if (source == clock_values.Source)
        _clock_set_pre(deviders[clock_values.Source].ahb, deviders[clock_values.Source].apb1,
                       deviders[clock_values.Source].apb2, 1);
    return CLOCK_OK;
}

uint32_t _pll_calc() {
    uint32_t pll_in_fq;
    if (!(RCC->CFGR & RCC_CFGR_PLLSRC))
        pll_in_fq = HSI_VALUE / 2;
    else {
        //питаемся от HSE
        if (RCC->CFGR & RCC_CFGR_PLLXTPRE)
            pll_in_fq = clock_values.HSEClock / 2; // бит делителя установлен, на входе HSE/2
        else
            pll_in_fq = clock_values.HSEClock;   // бит делителя не установлен, на выходе HSE
    }
    // считаем множитель
    uint8_t pllmul = (uint8_t) ((RCC->CFGR & RCC_CFGR_PLLMULL) >> RCC_CFGR_PLLMULL_Pos);
    if (pllmul >= 0b1110)return pll_in_fq * 16;
    return pll_in_fq * (pllmul + 2); //RM0008
}

clock_source_t _clock_get_current_source() {
    switch (RCC->CFGR & RCC_CFGR_SWS_Msk) {
        default:
        case RCC_CFGR_SWS_HSI:
            return CLOCK_SOURCE_HSI;
        case RCC_CFGR_SWS_HSE:
            return CLOCK_SOURCE_HSE;
        case RCC_CFGR_SWS_PLL:
            return CLOCK_SOURCE_PLL;
    }
}

void _clock_update() {
    // пересчитаем все клоки и сурсы

    switch (RCC->CFGR & RCC_CFGR_SWS_Msk) {
        default:
        case RCC_CFGR_SWS_HSI:
            clock_values.Source = CLOCK_SOURCE_HSI;
            SystemCoreClock = HSI_VALUE;
            break;
        case RCC_CFGR_SWS_HSE:
            clock_values.Source = CLOCK_SOURCE_HSE;
            SystemCoreClock = clock_values.HSEClock;
            break;
        case RCC_CFGR_SWS_PLL:
            SystemCoreClock = _pll_calc();
            clock_values.Source = CLOCK_SOURCE_PLL;
            break;
    }

    clock_values.SystemCoreClock = SystemCoreClock;

    if (!(RCC_CFGR_HPRE_3 & RCC->CFGR))
        clock_values.SystemAHBClock = clock_values.SystemCoreClock; // бит сброшен - шина на частоте ядра
    else {
        uint8_t x = (uint8_t) ((RCC->CFGR & (RCC_CFGR_HPRE_0 | RCC_CFGR_HPRE_1 | RCC_CFGR_HPRE_2))
                >> RCC_CFGR_HPRE_Pos);
        if (x > 3)x++;
        clock_values.SystemAHBClock = clock_values.SystemCoreClock >> (x + 1);
    }

    if (!(RCC_CFGR_PPRE1_2 & RCC->CFGR))
        clock_values.SystemAPB1Clock = clock_values.SystemAHBClock;
    else {
        uint8_t x = (uint8_t) ((RCC->CFGR & (RCC_CFGR_PPRE1_0 | RCC_CFGR_PPRE1_1)) >> RCC_CFGR_PPRE1_Pos);
        clock_values.SystemAPB1Clock = clock_values.SystemAHBClock >> (x + 1);
    }

    if (!(RCC_CFGR_PPRE2_2 & RCC->CFGR))
        clock_values.SystemAPB2Clock = clock_values.SystemAHBClock;
    else {
        uint8_t x = (uint8_t) ((RCC->CFGR & (RCC_CFGR_PPRE2_0 | RCC_CFGR_PPRE2_1)) >> RCC_CFGR_PPRE2_Pos);
        clock_values.SystemAPB2Clock = clock_values.SystemAHBClock >> (x + 1);
    }

    // обновляем частоту SysTick
    _update_systick();

    // дергаем коллбек
    clock_was_updated(&clock_values, clock_flags & HSE_FAIL ? CLOCK_FAIL : CLOCK_OK);
}


void clock_security_isr() {
    if (RCC->CIR & RCC_CIR_CSSF) {
        RCC->CIR |= RCC_CIR_CSSC; // сбрасываем бит
        clock_flags |= HSE_FAIL;
        clock_source_t current_source = _clock_get_current_source();
        _clock_set_pre(deviders[current_source].ahb, deviders[current_source].apb1, deviders[current_source].apb2, 1);
    }
}


void NMI_Handler(void) {
    clock_security_isr();
}

__attribute__((__weak__))
void clock_was_updated(const clock_values_t *current_clocks, clock_status_t status) {

}

clock_status_t clock_change_pll_mul(clock_pll_mul_t pllmul) {
    if (clock_values.Source != CLOCK_SOURCE_PLL)
        return CLOCK_NOT_READY;
    return clock_start(CLOCK_SOURCE_PLL, clock_values.HSEClock, pllmul);

}

void RCC_IRQHandler(void) {
    // мы сюда прибегаем когда заводятся HSE или PLL
    if (RCC->CIR & RCC_CIR_HSERDYF) {
        RCC->CIR |= RCC_CIR_HSERDYC; // сбрасываем флаг
        if (target_source == CLOCK_SOURCE_PLL && !(RCC->CR & RCC_CR_PLLRDY)) {
            RCC->CR |= RCC_CR_PLLON;
            return;
        }
        clock_select_source(target_source);
    }
    if (RCC->CIR & RCC_CIR_PLLRDYF) {
        RCC->CIR |= RCC_CIR_PLLRDYC;
        clock_select_source(target_source);
    }

    asm("nop;");
}
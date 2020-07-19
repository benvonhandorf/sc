/**
 * Copyright (c) 2016 - 2019, Nordic Semiconductor ASA
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form, except as embedded into a Nordic
 *    Semiconductor ASA integrated circuit in a product or a software update for
 *    such product, must reproduce the above copyright notice, this list of
 *    conditions and the following disclaimer in the documentation and/or other
 *    materials provided with the distribution.
 *
 * 3. Neither the name of Nordic Semiconductor ASA nor the names of its
 *    contributors may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * 4. This software, with or without modification, must only be used with a
 *    Nordic Semiconductor ASA integrated circuit.
 *
 * 5. Any software provided in binary form under this license must not be reverse
 *    engineered, decompiled, modified and/or disassembled.
 *
 * THIS SOFTWARE IS PROVIDED BY NORDIC SEMICONDUCTOR ASA "AS IS" AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY, NONINFRINGEMENT, AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */
#ifndef E73_SCR_V1
#define E73_SCR_V1

#ifdef __cplusplus
extern "C" {
#endif

#include "nrf_gpio.h"

#define SCR_BOARD_VERSION 2

#if SCR_BOARD_VERSION == 1

// LEDs definitions for E73_SCR_V1
#define LEDS_NUMBER    1

#define LED_1          NRF_GPIO_PIN_MAP(1,10)
#define LED_START      LED_1

#define LEDS_ACTIVE_STATE 1

#define LEDS_LIST { LED_1 }

#define LEDS_INV_MASK  LEDS_MASK

#define BSP_LED_0      LED_1

#define J5_3    NRF_GPIO_PIN_MAP(0,30)
#define J5_4    NRF_GPIO_PIN_MAP(0,5)
#define J5_5    NRF_GPIO_PIN_MAP(1,11)
#define J5_6    NRF_GPIO_PIN_MAP(1,9)

#define J6_3    NRF_GPIO_PIN_MAP(0,31)
#define J6_4    NRF_GPIO_PIN_MAP(0,29)
#define J6_5    NRF_GPIO_PIN_MAP(0,2)
#define J6_6    NRF_GPIO_PIN_MAP(0,03)

#define BUTTONS_NUMBER 2

#define BUTTON_1       J6_3
#define BUTTON_2       J6_4
#define BUTTON_PULL    NRF_GPIO_PIN_PULLUP

#define BUTTONS_ACTIVE_STATE 0

#define BUTTONS_LIST { BUTTON_1, BUTTON_2 }


#define UART_GND  J6_6
#define UART_TX_PIN_NUMBER  J6_5

#define SPI_COPI  J5_4
#define SPI_CIPO  J5_5
#define SPI_SCK   J5_6
#define SPI_CS    J5_3

#elif SCR_BOARD_VERSION==2

// LEDs definitions for E73_SCR_V2
#define LEDS_NUMBER    1

#define LED_1          NRF_GPIO_PIN_MAP(1,06)
#define LED_R          NRF_GPIO_PIN_MAP(0,3)
#define LED_G          NRF_GPIO_PIN_MAP(1,10)
#define LED_B          NRF_GPIO_PIN_MAP(1,11)
#define LED_START      LED_1

#define LEDS_ACTIVE_STATE 1

#define LEDS_LIST { LED_1 }

#define LEDS_INV_MASK  LEDS_MASK

#define BSP_LED_0      LED_1

//For all peripheral connectors, Pin 1 = GND, Pin 2 = 3.3V
//Closest to board edge away from USB.  
#define J3_3    NRF_GPIO_PIN_MAP(0,28)
#define J3_4    NRF_GPIO_PIN_MAP(0,5)
#define J3_5    NRF_GPIO_PIN_MAP(1,2)
#define J3_6    NRF_GPIO_PIN_MAP(0,13)

#define J4_3    NRF_GPIO_PIN_MAP(0,17)
#define J4_4    NRF_GPIO_PIN_MAP(0,20)
#define J4_5    NRF_GPIO_PIN_MAP(0,22)
#define J4_6    NRF_GPIO_PIN_MAP(1,00)

//Closest to center of board 25
#define J5_3    NRF_GPIO_PIN_MAP(0,26)
#define J5_4    NRF_GPIO_PIN_MAP(0,6)
#define J5_5    NRF_GPIO_PIN_MAP(0,8)
#define J5_6    NRF_GPIO_PIN_MAP(1,9)
#define J5_7    NRF_GPIO_PIN_MAP(0,4)
#define J5_8    NRF_GPIO_PIN_MAP(0,12)
#define J5_9    NRF_GPIO_PIN_MAP(0,7)
#define J5_10    NRF_GPIO_PIN_MAP(0,15)

#define BUTTONS_NUMBER 2

#define BUTTON_1       J4_3
#define BUTTON_2       J4_4
#define BUTTON_PULL    NRF_GPIO_PIN_PULLUP

#define BUTTONS_ACTIVE_STATE 0

#define BUTTONS_LIST { BUTTON_1, BUTTON_2 }

#define UART_GND  J4_6
#define UART_TX_PIN_NUMBER  J4_5

#define SPI_COPI  J3_4
#define SPI_CIPO  J3_5
#define SPI_SCK   J3_6
#define SPI_CS    J3_3

#define SPEAKER   NRF_GPIO_PIN_MAP(0,24)

#endif

#ifdef __cplusplus
}
#endif

#endif // E73_SCR_V1


#include "LatchingButton.h"
#include <nrfx_gpiote.h>
#include <nrf_gpio.h>

#define DEFAULT_LATCH_MS 400

static LatchingButton*[64] ITEMS= { NULL };

static void gpiote_event(nrfx_gpiote_pin_t pin, nrf_gpiote_polarity_t action) {
  LatchingButton *item = ITEMS[pin];

  if(item != NULL) {
    item->onChange(action);
  }
}

LatchingButton::LatchingButton(uint32_t pin) {
  this(pin, DEFAULT_LATCH_MS);
}

LatchingButton::LatchingButton(uint32_t pin, uint32_t latchMs) {
  isLatched = false;
  clickedMs = 0;

  this->pin = pin;
  this->latchMs = latchMs;

  ITEMS[pin] = this;

  nrfx_gpiote_in_config_t cfg = {
    .sense = NRF_GPIOTE_POLARITY_TOGGLE,
    .pull = NRF_GPIO_PIN_PULLUP,
    .is_watcher = false,
    .hi_accuracy = true,
    .skip_gpio_setup = false,
  };

  if(!nrfx_gpiote_is_init()) {
    APP_ERROR_CHECK(nrfx_gpiote_init());
  }

  APP_ERROR_CHECK(nrfx_gpiote_in_init(pin, &cfg, gpiote_event));

  NRF_LOG_INFO("Button initialized");
}

void LatchingButton::onChange(

bool LatchingButton::isPressed() {
  return isLatched || clickedMs > 0;
}
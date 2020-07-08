
#include <nrfx_gpiote.h>
#include <nrf_gpio.h>
#include <nrf_log.h>
#include "app_scheduler.h"
#include "LatchingButton.h"

static LatchingButton* ITEMS[64] { NULL };

static void handleEvent(void * p_event_data, uint16_t event_size) {
  uint32_t pin = *((uint32_t *)p_event_data);

  //Pins are low when clicked
  uint32_t value = !nrf_gpio_pin_read(pin);

  LatchingButton *item = ITEMS[pin];

  if(item != NULL) {
    item->onChange(value);
  }
}

static void gpiote_event(nrfx_gpiote_pin_t pin, nrf_gpiote_polarity_t action) {
  LatchingButton *item = ITEMS[pin];

  uint32_t newValue = !((nrf_gpio_port_in_read(item->registerConfiguration) >> pin) & 1UL);

  if(item->pinValue != newValue) {
    app_sched_event_put((void *)&pin, sizeof(pin), handleEvent);
  }
}

LatchingButton::LatchingButton(uint32_t pin, uint32_t latchMs) {
  _isLatched = false;
  _clickedMs = 0;

  this->_pin = pin;
  this->_latchMs = latchMs;

  this->registerConfiguration = nrf_gpio_pin_port_decode(&(this->_pin));

  this->pinValue = 0;
  this->_isDirty = false;

  ITEMS[pin] = this;

  nrfx_gpiote_in_config_t cfg = {
    .sense = NRF_GPIOTE_POLARITY_TOGGLE,
    .pull = NRF_GPIO_PIN_PULLUP,
    .is_watcher = false,
    .hi_accuracy = true,
    .skip_gpio_setup = false,
  };

  if(!nrfx_gpiote_is_init()) {
    NRF_LOG_INFO("Initializing GPIOTE");
    APP_ERROR_CHECK(nrfx_gpiote_init());
  }

  APP_ERROR_CHECK(nrfx_gpiote_in_init(pin, &cfg, gpiote_event));

  nrfx_gpiote_in_event_enable(pin, true);

  NRF_LOG_INFO("Button initialized - Pin %d", pin);
}

void LatchingButton::onChange(uint32_t isClicked) {
  if(pinValue != isClicked) {
    pinValue = isClicked;
    this->_isDirty = true;
  }
}

bool LatchingButton::isPressed() {
  this->_isDirty = false;

  return _isLatched || pinValue;
}

bool LatchingButton::isDirty() {
  return _isDirty;
}
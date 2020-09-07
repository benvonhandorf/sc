#include "sdk_config.h"
#include "nordic_common.h"
#include <nrfx_twim.h> 
#include "app_scheduler.h"
#include <nrf_gpio.h>
#include <nrfx_gpiote.h>
#include "pimoroni_trackball.h"
#include "nrf_log.h"

//Based on reverse engineering https://github.com/pimoroni/trackball-python/blob/master/library/trackball/__init__.py

//Currently no support for alternative I2C addresses or resetting the address
#define I2C_ADDR 0x0A

#define REG_LED_RED 0x00
#define REG_LED_GRN 0x01
#define REG_LED_BLU 0x02
#define REG_LED_WHT 0x03
//LED values can be written with one data byte each or by writing
//REG_LED_RED and 4 data bytes.


#define REG_LEFT 0x04
#define REG_RIGHT 0x05
#define REG_UP 0x06
#define REG_DOWN 0x07
#define REG_SWITCH 0x08
//Data is read by writing REG_LEFT with no data and reading
//5 bytes: left, right, up, down, switch

//Read ChipID with a write to REG_CHIP_ID_L, read 2 bytes in return
#define REG_CHIP_ID_L 0xFA
#define RED_CHIP_ID_H 0xFB

#define CHIP_ID 0xBA11

#define REG_INT 0xF9
#define MSK_INT_TRIGGERED 0b00000001
#define MSK_INT_OUT_EN 0b00000010

static PimoroniTrackball *instance = NULL;

static nrfx_twim_t  twim_t_;

static void ProcessResults(void * p_event_data, uint16_t event_size) {
  instance->ProcessResults();
}

static void TwimHandler(nrfx_twim_evt_t const *p_event, void *p_context) {
  if(p_event->type == NRFX_TWIM_EVT_DONE) {
    app_sched_event_put(NULL, 0, ProcessResults);
  }
}

static void RetrievePosition(void * p_event_data, uint16_t event_size) {
  NRF_LOG_INFO("Retrieving position from interrupt");
  instance->RetrievePosition();
}

static void InterruptEvent(nrfx_gpiote_pin_t pin, nrf_gpiote_polarity_t action) {
  app_sched_event_put(NULL, 0, RetrievePosition);
}

PimoroniTrackball::PimoroniTrackball(uint8_t scl, uint8_t sda, uint8_t interruptPin) {
  this->i2c_address_ = I2C_ADDR;
  this->scl_pin_ = scl;
  this->sda_pin_ = sda;
  this->interrupt_pin_ = interruptPin;

  x_ = 0;
  y_ = 0;

  instance = this;
}

bool PimoroniTrackball::isBusy() {
  return false;
}

bool PimoroniTrackball::Initialize() {
  ret_code_t err_code;

  twim_t_ = NRFX_TWIM_INSTANCE(1);

  nrfx_twim_config_t twim_config = NRFX_TWIM_DEFAULT_CONFIG;

  twim_config.scl = scl_pin_;
  twim_config.sda = sda_pin_;

  err_code = nrfx_twim_init(&twim_t_, &twim_config, TwimHandler, NULL);
  APP_ERROR_CHECK(err_code);

  nrfx_twim_enable(&twim_t_);

  nrfx_gpiote_in_config_t cfg = {
    .sense = NRF_GPIOTE_POLARITY_LOTOHI,
    .pull = NRF_GPIO_PIN_NOPULL,
    .is_watcher = false,
    .hi_accuracy = true,
    .skip_gpio_setup = false,
  };

  if(!nrfx_gpiote_is_init()) {
    NRF_LOG_INFO("Initializing GPIOTE");
    APP_ERROR_CHECK(nrfx_gpiote_init());
  }

  APP_ERROR_CHECK(nrfx_gpiote_in_init(interrupt_pin_, &cfg, InterruptEvent));

  NRF_LOG_INFO("Interrupt pin initialized - Pin %d", interrupt_pin_);

  //Retrieve Chip ID to ensure valid peripheral
  buf_out_[0] = REG_CHIP_ID_L;
  Transfer(1, 5);

  return true;
}

bool PimoroniTrackball::isInitialized() {
  return initialized_;
}

bool PimoroniTrackball::Poll() {
  if(initialized_ && !request_outstanding_) {
    RetrievePosition();
  }
  return true;
}

void PimoroniTrackball::RetrievePosition() {
  buf_out_[0] = REG_LEFT;
  Transfer(1, 5);
}

void PimoroniTrackball::ArmInterrupt() {
  buf_out_[0] = REG_INT;
  buf_out_[1] = 0x00;

  Transfer(1, 1);
}

void PimoroniTrackball::ProcessResults() {
  switch(buf_out_[0]) {
    case REG_INT: {
      //We both read and write this value so to discriminate we use a null in the second byte
      //for the read operation.
      if(buf_out_[1] == 0) {
        uint8_t value = buf_in_[0];
        
        NRF_LOG_INFO("Interrupt Register: %d", value);

        if(value & MSK_INT_OUT_EN != MSK_INT_OUT_EN) {
          value = (value | MSK_INT_OUT_EN);
          
          buf_out_[0] = REG_INT;
          buf_out_[1] = value;
          
          Transfer(2,0);
        } else {
          NRF_LOG_INFO("Interrupt already enabled");
//          nrfx_gpiote_in_event_enable(interrupt_pin_, true);
          initialized_ = true;
        }
      } else {
        //Write is complete
        NRF_LOG_INFO("Interrupt enable complete");
//        nrfx_gpiote_in_event_enable(interrupt_pin_, true);
        initialized_ = true;
      }
      break;
    }
    case REG_CHIP_ID_L: {
      if(buf_in_[0] != (CHIP_ID & 0xFF)
          || buf_in_[1] != (CHIP_ID >> 8)) {
          NRF_LOG_WARNING("Chip ID does not match expectations: %x %x vs %x", buf_in_[0], buf_in_[1], CHIP_ID);
      } else {
        NRF_LOG_INFO("Chip ID matches");

        ArmInterrupt();
      }

      break;
    }
    case REG_LEFT: {
      uint8_t left = buf_in_[0];
      uint8_t right = buf_in_[1];
      uint8_t up = buf_in_[2];
      uint8_t down = buf_in_[3];
      uint8_t sw = buf_in_[4];

      //This looks odd because we're transforming from the rotated
      //trackball space
      x_ = down - up;
      y_ = left - right;

      if(x_ != 0 || y_ != 0) {
        NRF_LOG_INFO("Movement %d, %d", x_, y_);
      }

      break;
    }
    default:
      NRF_LOG_INFO("Unknown xfer type %x", buf_out_[0]);
  }

  request_outstanding_ = false;
}

void PimoroniTrackball::Transfer(uint8_t tx_length, uint8_t rx_length) {
  request_outstanding_ = true;

  const nrfx_twim_xfer_desc_t xfer = NRFX_TWIM_XFER_DESC_TXRX(
                    I2C_ADDR,
                    buf_out_,
                    tx_length,
                    buf_in_,
                    rx_length);

  nrfx_twim_xfer(&twim_t_, &xfer, 0);
}


bool PimoroniTrackball::hasData() {
  return x_ != 0 || y_ != 0;
}

int8_t PimoroniTrackball::getX() {
  int8_t result = x_;
  x_ = 0;
  return result;
}

int8_t PimoroniTrackball::getY() {
  int8_t result = y_;
  y_ = 0;
  return result;
}
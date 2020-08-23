#include "nrfx_spim.h"
#include "app_util_platform.h"
#include "nrf_gpio.h"
#include "nrf_delay.h"
#include "boards.h"
#include "app_error.h"
#include <string.h>
#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"
#include "app_scheduler.h"

#include "initialization.h"
#include "poll.h"

#include "SPITrackball.h"

static SPITrackball* instance;

void processTransferResults(void * p_event_data, uint16_t event_size) {
    switch(instance->responseAction) {
      case 1:
        instance->initializePhase1Response();
        break;
      case 2:
        instance->initializePhase2Response();
        break;
      case 10:
        instance->pollPhase1Response();
        break;
      case 11:
        instance->pollPhase2Response();
        break;
    }
}

void spim_event_handler(nrfx_spim_evt_t const * p_event,
                       void *                  p_context) {
  app_sched_event_put(NULL, 0, processTransferResults);
}


#define SPI_INSTANCE  3                                           /**< SPI instance index. */
static const nrfx_spim_t spi = NRFX_SPIM_INSTANCE(SPI_INSTANCE);  /**< SPI instance. */

SPITrackball::SPITrackball(uint8_t csPin) {
  responseAction = 0;

  this->csPin = csPin;

  initialized = false;
  spimInitialized = false;
  instance = this;
}

bool SPITrackball::transferInProcess() {
  return responseAction != 0;
}

bool SPITrackball::isInitialized() {
  return initialized;
}

bool SPITrackball::initialize() {
  initialized = false;

  NRF_LOG_INFO("Initialize 1 - %u", csPin);
  NRF_LOG_FLUSH();

  if(!spimInitialized) {
    nrf_gpio_cfg_output(csPin);

    nrf_delay_ms(50);
    
    nrf_gpio_pin_set(csPin);

    nrf_delay_ms(50);

    nrfx_spim_config_t spi_config = NRFX_SPIM_DEFAULT_CONFIG;
    spi_config.frequency      = NRF_SPIM_FREQ_125K;
    spi_config.ss_pin         = csPin;
    spi_config.miso_pin       = SPI_CIPO;
    spi_config.mosi_pin       = SPI_COPI;
    spi_config.sck_pin        = SPI_SCK;
    spi_config.use_hw_ss      = true;
    spi_config.ss_active_high = false;
    nrfx_err_t retval = nrfx_spim_init(&spi, &spi_config, spim_event_handler, NULL);
    APP_ERROR_CHECK(retval);

    spimInitialized = true;
  }

  responseAction = 1;

  //Initialization phase 1

  nrfx_spim_xfer_desc_t xfer_desc = NRFX_SPIM_XFER_TRX(transmitBuffer, sizeof(transmitBuffer), receiveBuffer, sizeof(receiveBuffer));

  transferBuffer(initialize_cmd_1, sizeof(initialize_cmd_1));

  xDelta = 0;
  yDelta = 0;

  return true;
}

void SPITrackball::initializePhase1Response() {
  if(!validateResponse(initialize_response_1, sizeof(initialize_response_1))) {
    NRF_LOG_INFO("Initialize cmd 1 returned unexpected data");
    NRF_LOG_INFO("Expected:");
    printBuffer(initialize_response_1, sizeof(initialize_response_1));
    NRF_LOG_INFO("Got");
    printBuffer(receiveBuffer, sizeof(initialize_response_1));

    if(isNullResponse(sizeof(initialize_response_1))) {
      NRF_LOG_INFO("Null response");

      initialized = false;

      responseAction = 0;
      
      return;
    }
  }

  NRF_LOG_INFO("Initialize 2");

  responseAction = 2;

  transferBuffer(initialize_cmd_2, sizeof(initialize_cmd_2));
}

void SPITrackball::initializePhase2Response(){
  if(!validateResponse(initialize_response_2, sizeof(initialize_response_2))) {
    NRF_LOG_INFO("Initialize cmd 2 returned unexpected data");
    NRF_LOG_INFO("Expected vs Got");
    printBuffer(initialize_response_2, sizeof(initialize_response_2));
    printBuffer(this->receiveBuffer, sizeof(initialize_response_2));

    if(isNullResponse(sizeof(initialize_response_2))) {
      initialized = false;

      return;
    }
  }

  responseAction = 0;
  initialized = true;

  NRF_LOG_INFO("SPITrackball Initialized");
  NRF_LOG_FLUSH();
}

void SPITrackball::pollPhase1Response(){
  if(!validateResponse(poll_response_1, sizeof(poll_response_1))) {
    NRF_LOG_INFO("Poll cmd 1 returned unexpected data");
    printBuffer(this->receiveBuffer, sizeof(poll_response_1));

    this->yDelta = (int8_t) 0;
    this->xDelta = (int8_t) 0;

    responseAction = 0;

    return;
  }

  responseAction = 11;
  transferBuffer(poll_cmd_2, sizeof(poll_cmd_2));
}

void SPITrackball::pollPhase2Response(){
  yDelta = (int8_t) receiveBuffer[1];
  xDelta = (int8_t) receiveBuffer[2];

  responseAction = 0;
  pollInProcess = false;
}

bool SPITrackball::poll() {
  if(!initialized) {
    return false;
  }

  pollInProcess = true;
  responseAction = 10;

  transferBuffer(poll_cmd_1, sizeof(poll_cmd_1));

  return true;
}

bool SPITrackball::pollResults() {
  return !pollInProcess;
}

int8_t SPITrackball::getX() {
  return xDelta;
}

int8_t SPITrackball::getY() {
  return yDelta;
}

void SPITrackball::transferBuffer(const uint8_t *source, uint8_t length) {
  memcpy(this->transmitBuffer, source, length);
  memset(this->receiveBuffer, 0, length);

  nrfx_spim_xfer_desc_t xfer_desc = NRFX_SPIM_XFER_TRX(transmitBuffer, length, receiveBuffer, length);

  APP_ERROR_CHECK(nrfx_spim_xfer(&spi, &xfer_desc, 0));
}

bool SPITrackball::validateResponse(const uint8_t *expectedData, uint8_t length) {
  for(int i = 0; i < length; i++) {
    if(expectedData[i] != 0xFF
        && this->receiveBuffer[i] != expectedData[i]) {
      return false;
    }
  }

  return true;
}


bool SPITrackball::isNullResponse(uint8_t length) {
  for(int i = 0; i < length; i++) {
    if(this->receiveBuffer[i] != 0x00) {
      return false;
    }
  }

  return true;
}

void SPITrackball::printBuffer(const uint8_t *data, uint8_t length) {
  NRF_LOG_HEXDUMP_INFO(data, length);
}


#include "battery_adc.h"

#include <nrf_log.h>
#include <app_scheduler.h>

static int16_t buffer[10] = {0};
static uint8_t percentage = 0;
volatile static bool conversion_in_process = false;

static battery_adc_sample_handler sample_handler = NULL;

static void post_event_handler(void * p_event_data, uint16_t event_size) {
  uint32_t pin = *((uint32_t *)p_event_data);

  sample_handler(percentage);
}

void saadc_event_handler(nrfx_saadc_evt_t const * p_event) {
  if(p_event->type == NRFX_SAADC_EVT_DONE) {
    conversion_in_process = false;

    if(p_event->data.done.size != 1) {
      APP_ERROR_CHECK(-1);
    } else {
      //Circuit board has a 100k/100k voltage divider on the battery line with the ADC sample at the halfway point.  
      //Peak expected voltage = 4.5/2 == 2.25
      //ADC configured with the 1/4 VDD (3.3V) reference and 1/4 gain, so full scale == 3.3.
      //Thus full scale should be 68.1% == 172/255.  Converting this to a straight percentage ~*0.6
      percentage = (uint8_t) (p_event->data.done.p_buffer[0] * 0.6);

      app_sched_event_put(NULL, 0, post_event_handler);
    }
  }
}

BatteryAdc::BatteryAdc(nrf_saadc_input_t adc_channel, battery_adc_sample_handler handler) {

  sample_handler = handler;

  nrfx_saadc_config_t config = NRFX_SAADC_DEFAULT_CONFIG;

  nrfx_err_t err_code = nrfx_saadc_init(&config, saadc_event_handler);

  APP_ERROR_CHECK(err_code);

  nrf_saadc_channel_config_t channel_config = NRFX_SAADC_DEFAULT_CHANNEL_CONFIG_SE(adc_channel);

  channel_config.gain = NRF_SAADC_GAIN1_4;
  channel_config.reference = NRF_SAADC_REFERENCE_VDD4;

  err_code = nrfx_saadc_channel_init(0, &channel_config);

  APP_ERROR_CHECK(err_code);

  err_code = nrfx_saadc_buffer_convert(buffer, 1);

  APP_ERROR_CHECK(err_code);

  NRF_LOG_INFO("Init complete");
}

void BatteryAdc::sample() {
  if(!conversion_in_process) {
    conversion_in_process = true;

    nrfx_err_t err_code = nrfx_saadc_buffer_convert(buffer, 1);

    APP_ERROR_CHECK(err_code);

    err_code = nrfx_saadc_sample();

    APP_ERROR_CHECK(err_code);
  } else {
    NRF_LOG_INFO("Skipping battery update - WIP - %d", conversion_in_process);
  }
}

uint8_t BatteryAdc::getPercentage() {
  return percentage;
}
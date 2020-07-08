
#ifndef __PERIPHERALS_BATTERY_BATTERY_ADC
#define __PERIPHERALS_BATTERY_BATTERY_ADC

#include <nrfx_saadc.h>

typedef void (* battery_adc_sample_handler)(uint8_t percentage);

class BatteryAdc {
public:
  BatteryAdc(nrf_saadc_input_t adc_channel, battery_adc_sample_handler handler);

  void sample();

  uint8_t getPercentage();
private:
};

#endif // __PERIPHERALS_BATTERY_BATTERY_ADC
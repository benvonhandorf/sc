

#include "boards.h"
#include <nrfx_pwm.h>
#include "status_indicator.h"

static nrfx_pwm_t pwmR = NRFX_PWM_INSTANCE(0);
static nrfx_pwm_t pwmG = NRFX_PWM_INSTANCE(1);
static nrfx_pwm_t pwmB = NRFX_PWM_INSTANCE(2);
static nrfx_pwm_t pwmSPKR = NRFX_PWM_INSTANCE(3);

#define FADE_STEP_COUNT 20

static nrf_pwm_values_common_t fade_values[2 * FADE_STEP_COUNT];
static nrf_pwm_sequence_t fade_sequence;

#define CLIP_STEP_COUNT 1024

static nrf_pwm_values_common_t upward_clip_values[CLIP_STEP_COUNT];
static nrf_pwm_sequence_t upward_clip_sequence;

static nrf_pwm_values_common_t downward_clip_values[CLIP_STEP_COUNT];
static nrf_pwm_sequence_t downward_clip_sequence;


static nrf_pwm_values_common_t up_clip_values[1] = {127};
static nrf_pwm_sequence_t up_clip_sequence;

StatusIndicator::StatusIndicator() {
}

void StatusIndicator::initialize() {
  uint16_t value = 0;
  uint16_t step  = NRFX_PWM_DEFAULT_CONFIG_TOP_VALUE / FADE_STEP_COUNT;
  uint16_t  i;
  for (i = 0; i < FADE_STEP_COUNT; ++i)
  {
    value                       += step;
    fade_values[i]              = value;
    fade_values[FADE_STEP_COUNT + i] = NRFX_PWM_DEFAULT_CONFIG_TOP_VALUE - value;
  }

  for (i = 0; i < 256; ++i)
  {
    upward_clip_values[i]              = (i % 6) < 3 ? 255 : 0;
    downward_clip_values[1023 - i]     = (i % 6) < 3 ? 255 : 0;
  }

  for (i = 256; i < 512; ++i)
  {
    upward_clip_values[i]              = (i % 4) < 2 ? 255 : 0;
    downward_clip_values[1023 - i]     = (i % 4) < 2 ? 255 : 0;
  }

  for (i = 512; i < 768; ++i)
  {
    upward_clip_values[i]              = (i % 2) ? 255 : 0;
    downward_clip_values[1023 - i]     = (i % 2) ? 255 : 0;
  }

  for (i = 768; i < CLIP_STEP_COUNT; ++i)
  {
    upward_clip_values[i]              =  127;
    downward_clip_values[1023 - i]     =  127;
  }

  static nrf_pwm_values_t fade_definition = {
    .p_common = fade_values
  };

  fade_sequence.values = fade_definition;
  fade_sequence.length = 2 * FADE_STEP_COUNT;
  fade_sequence.end_delay = 100;

  nrfx_pwm_config_t pwmRConfig = NRFX_PWM_DEFAULT_CONFIG;
  pwmRConfig.output_pins[0] = LED_R | NRFX_PWM_PIN_INVERTED;
  nrfx_pwm_init(&pwmR, &pwmRConfig, NULL);

  nrfx_pwm_config_t pwmGConfig = NRFX_PWM_DEFAULT_CONFIG;
  pwmGConfig.output_pins[0] = LED_G | NRFX_PWM_PIN_INVERTED;
  nrfx_pwm_init(&pwmG, &pwmGConfig, NULL);

  nrfx_pwm_config_t pwmBConfig = NRFX_PWM_DEFAULT_CONFIG;
  pwmBConfig.output_pins[0] = LED_B | NRFX_PWM_PIN_INVERTED;
  nrfx_pwm_init(&pwmB, &pwmBConfig, NULL);

  nrfx_pwm_config_t pwmSPKRConfig = NRFX_PWM_DEFAULT_CONFIG;
  pwmSPKRConfig.output_pins[0] = SPEAKER;
  pwmSPKRConfig.top_value = 255;
  pwmSPKRConfig.base_clock = NRF_PWM_CLK_500kHz;
  nrfx_pwm_init(&pwmSPKR, &pwmSPKRConfig, NULL);

  static nrf_pwm_values_t upward_clip_definition = {
    .p_common = upward_clip_values
  };

  upward_clip_sequence.values = upward_clip_definition;
  upward_clip_sequence.length = CLIP_STEP_COUNT;
  upward_clip_sequence.end_delay = 0;

  static nrf_pwm_values_t up_clip_definition = {
    .p_common = up_clip_values
  };

  up_clip_sequence.values = up_clip_definition;
  up_clip_sequence.length = 1;
  up_clip_sequence.end_delay = 0;

  static nrf_pwm_values_t downward_clip_definition = {
    .p_common = downward_clip_values
  };

  downward_clip_sequence.values = downward_clip_definition;
  downward_clip_sequence.length = CLIP_STEP_COUNT;
  downward_clip_sequence.end_delay = 0;

  nrfx_pwm_simple_playback(&pwmB, &fade_sequence, 1, NRFX_PWM_FLAG_LOOP );
}

void StatusIndicator::latchSet() {
  latch_set = true;
  nrfx_pwm_simple_playback(&pwmR, &fade_sequence, 1, NRFX_PWM_FLAG_LOOP );
  nrfx_pwm_complex_playback(&pwmSPKR, &upward_clip_sequence, &up_clip_sequence, 1, NRFX_PWM_FLAG_LOOP);
}

void StatusIndicator::latchCleared() {
  if(latch_set) {
    latch_set = false;

    nrfx_pwm_stop(&pwmR, false);
    nrfx_pwm_simple_playback(&pwmSPKR, &downward_clip_sequence, 1, NRFX_PWM_FLAG_STOP);
  }
}

void StatusIndicator::advertisingStarted() {
  nrfx_pwm_simple_playback(&pwmG, &fade_sequence, 1, NRFX_PWM_FLAG_LOOP );
}

void StatusIndicator::bindingComplete() {
  nrfx_pwm_stop(&pwmG, false);
}

void StatusIndicator::initializationComplete() {
  nrfx_pwm_stop(&pwmB, false);
}
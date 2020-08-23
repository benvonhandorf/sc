

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

#define CLIP_STEP_COUNT 100

static nrf_pwm_values_common_t upward_clip_values[CLIP_STEP_COUNT];
static nrf_pwm_sequence_t upward_clip_sequence;

StatusIndicator::StatusIndicator() {
}

void StatusIndicator::initialize() {
  uint16_t value = 0;
  uint16_t step  = NRFX_PWM_DEFAULT_CONFIG_TOP_VALUE / FADE_STEP_COUNT;
  uint8_t  i;
  for (i = 0; i < FADE_STEP_COUNT; ++i)
  {
    value                       += step;
    fade_values[i]              = value;
    fade_values[FADE_STEP_COUNT + i] = NRFX_PWM_DEFAULT_CONFIG_TOP_VALUE - value;
  }

  nrf_pwm_values_t fade_definition = {
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
  pwmSPKRConfig.base_clock = NRF_PWM_CLK_1MHz;

  nrfx_pwm_init(&pwmSPKR, &pwmSPKRConfig, NULL);

  nrfx_pwm_simple_playback(&pwmB, &fade_sequence, 1, NRFX_PWM_FLAG_LOOP );
}

void StatusIndicator::latchSet() {
  nrfx_pwm_simple_playback(&pwmR, &fade_sequence, 1, NRFX_PWM_FLAG_LOOP );
}

void StatusIndicator::latchCleared() {
  nrfx_pwm_stop(&pwmR, false);
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
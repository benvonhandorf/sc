
#ifndef LATCHING_BUTTON_H_
#define LATCHING_BUTTON_H_

#define DEFAULT_LATCH_MS 20000

typedef uint32_t (* TIME_PROVIDER)() ;

class LatchingButton {
public:
  LatchingButton(uint32_t pin, TIME_PROVIDER timeProvider) : LatchingButton(pin, DEFAULT_LATCH_MS, timeProvider) {} ;
  LatchingButton(uint32_t pin, uint32_t latchMs, TIME_PROVIDER timeProvider);

  bool rawValue();
  bool isPressed();
  bool isDirty();
  bool isLatched();

  void onChange(uint32_t isClicked);

  NRF_GPIO_Type * registerConfiguration;
  volatile uint32_t pinValue;

private:
  bool _isDirty;
  bool _isLatched;
  uint32_t _debounceValue;
  uint32_t _pin;
  uint32_t _clickedMs;
  uint32_t _latchMs;
  TIME_PROVIDER _timeProvider;
};

#endif

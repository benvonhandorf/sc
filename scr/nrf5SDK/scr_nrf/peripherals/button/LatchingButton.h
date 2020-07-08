
#ifndef LATCHING_BUTTON_H_
#define LATCHING_BUTTON_H_

#define DEFAULT_LATCH_MS 400

class LatchingButton {
public:
  LatchingButton(uint32_t pin) : LatchingButton(pin, DEFAULT_LATCH_MS) {} ;
  LatchingButton(uint32_t pin, uint32_t latchMs);

  bool isPressed();
  bool isDirty();

  void onChange(uint32_t isClicked);

  NRF_GPIO_Type * registerConfiguration;
  volatile uint32_t pinValue;

private:
  bool _isDirty;
  bool _isLatched;
  uint32_t _pin;
  uint32_t _clickedMs;
  uint32_t _latchMs;
};

#endif

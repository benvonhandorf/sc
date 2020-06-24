
#ifndef LATCHING_BUTTON_H_
#define LATCHING_BUTTON_H_

class LatchingButton {
public:
    LatchingButton(uint32_t pin);
    LatchingButton(uint32_t pin, uint32_t latchMs);

    bool isPressed();

    void onChange(nrf_gpiote_polarity_t action);

private:
  bool isLatched;
  uint32_t pin;
  uint32_t clickedMs;
  uint32_t latchMs;
}

#endif

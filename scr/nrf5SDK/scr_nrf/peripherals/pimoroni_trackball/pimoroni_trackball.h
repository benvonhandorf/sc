

#ifndef PIMORONI_TRACKBALL_H_
#define PIMORONI_TRACKBALL_H_

#include "../pointer/pointer.h"

class PimoroniTrackball : public Pointer {
public:
  PimoroniTrackball(uint8_t scl, uint8_t sda, uint8_t interruptPin);

  bool isBusy();

  bool Initialize();
  bool isInitialized();

  bool Poll();
  bool hasData();

  int8_t getX();
  int8_t getY();

  void ProcessResults();

  void FlushColors();

  void RetrievePosition();
private:
  bool initialized_ = false;
  bool request_outstanding_ = false;

  uint8_t i2c_address_ ;
  uint8_t scl_pin_;
  uint8_t sda_pin_;
  uint8_t interrupt_pin_;

  uint8_t  buf_out_[5];
  uint8_t  buf_in_[5];

  int8_t previous_x_ = 0;
  int8_t previous_y_ = 0;

  int8_t x_ = 0;
  int8_t y_ = 0;

  uint32_t deceleration_delay_ = 0;
  uint32_t acceleration_delay_ = 0;
  uint8_t acceleration_factor_ = 0;

  uint8_t r_;
  uint8_t g_;
  uint8_t b_;
  uint8_t w_;

  void SetColor(uint8_t r, uint8_t g, uint8_t b, uint8_t w);

  void AdjustScaling(int8_t x, int8_t y);
  int8_t ScaleReading(int8_t reading);
  void Transfer(uint8_t tx_length, uint8_t rx_length);
  void ArmInterrupt();
};

#endif
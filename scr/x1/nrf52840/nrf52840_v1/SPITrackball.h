

#ifndef SPI_TRACKBALL_H_
#define SPI_TRACKBALL_H_

class SPITrackball {
public:
  SPITrackball(uint8_t spiPin);

  bool initialize();

  bool poll();

  int8_t getX();
  int8_t getY();

private:
  uint8_t ssPin;

  int8_t xDelta = 0;
  int8_t yDelta = 0;

  byte buffer[107];

  void transferBuffer(const byte *source, uint8_t length);

  bool validateResponse(const byte *expectedData, uint8_t length);

  void printBuffer(const byte *data, uint8_t length);
};

#endif

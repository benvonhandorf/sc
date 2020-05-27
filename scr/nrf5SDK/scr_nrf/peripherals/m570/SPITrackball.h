

#ifndef SPI_TRACKBALL_H_
#define SPI_TRACKBALL_H_

class SPITrackball {
public:
  SPITrackball(uint32_t csPin);

  bool initialize();

  bool poll();
  bool pollResults();

  int8_t getX();
  int8_t getY();

  uint8_t responseAction;

  void initializePhase1Response();
  void initializePhase2Response();
  void pollPhase1Response();
  void pollPhase2Response();

private:
  bool initialized;
  uint8_t csPin;

  int8_t xDelta;
  int8_t yDelta;

  uint8_t transmitBuffer[107];
  uint8_t receiveBuffer[107];

  void transferBuffer(const uint8_t *source, uint8_t length);

  bool validateResponse(const uint8_t *expectedData, uint8_t length);

  bool isNullResponse(uint8_t length);

  void printBuffer(const uint8_t *data, uint8_t length);
};

#endif

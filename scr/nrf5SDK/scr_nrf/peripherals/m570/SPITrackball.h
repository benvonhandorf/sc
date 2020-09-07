

#ifndef SPI_TRACKBALL_H_
#define SPI_TRACKBALL_H_

#include "../pointer/pointer.h"

class SPITrackball : public Pointer {
public:
  SPITrackball(uint8_t csPin);

  bool isBusy();

  bool Initialize();
  bool isInitialized();

  bool Poll();
  bool hasData();

  int8_t getX();
  int8_t getY();

//Implementation items that need to be public
  uint8_t responseAction;

  void initializePhase1Response();
  void initializePhase2Response();
  void pollPhase1Response();
  void pollPhase2Response();

private:
  bool initialized;
  bool spimInitialized;
  uint8_t pollInProcess;
  uint8_t csPin;

  int8_t xDelta;
  int8_t yDelta;

  uint8_t transmitBuffer[107];
  uint8_t receiveBuffer[107];

  void transferBuffer(const uint8_t *source, uint8_t length);

  bool validateResponse(const uint8_t *expectedData, uint8_t length);

  bool isNullResponse(uint8_t length);

  void printBuffer(const uint8_t *data, uint8_t length);

  uint8_t errorCount = 0;
};

#endif

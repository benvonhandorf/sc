#include <SPI.h>

#include "initialization.h"
#include "poll.h"

#include "SPITrackball.h"

SPISettings spiSettings;

byte buffer[107]; //Send buffer for buffer transfers

SPITrackball::SPITrackball(uint8_t ssPin) {
  this->ssPin = ssPin;
}

bool SPITrackball::initialize() {
  spiSettings = SPISettings(500000, MSBFIRST, SPI_MODE0);

  SPI.begin();

  //Initialization phase 1
  SPI.beginTransaction(spiSettings);

  digitalWrite(this->ssPin, 0);

  transferBuffer(initialize_cmd_1, sizeof(initialize_cmd_1));

  if(!validateResponse(initialize_response_1, sizeof(initialize_response_1))) {
    Serial.println("Initialize cmd 1 returned unexpected data");
    printBuffer(this->buffer, sizeof(initialize_response_1));
  }

  digitalWrite(this->ssPin, 1);

  SPI.beginTransaction(spiSettings);

  digitalWrite(this->ssPin, 0);

  transferBuffer(initialize_cmd_2, sizeof(initialize_cmd_2));

  if(!validateResponse(initialize_response_2, sizeof(initialize_response_2))) {
    Serial.println("Initialize cmd 2 returned unexpected data");
    printBuffer(this->buffer, sizeof(initialize_response_2));
  }

  digitalWrite(this->ssPin, 1);

  SPI.endTransaction();

  this->xDelta = 0;
  this->yDelta = 0;

  return true;
}

bool SPITrackball::poll() {
  SPI.beginTransaction(spiSettings);

  digitalWrite(this->ssPin, 0);

  transferBuffer(poll_cmd_1, sizeof(poll_cmd_1));

  if(!validateResponse(poll_response_1, sizeof(poll_response_1))) {
    Serial.println("Poll cmd 1 returned unexpected data");
    printBuffer(this->buffer, sizeof(poll_response_1));
  }

  digitalWrite(this->ssPin, 1);

  SPI.endTransaction();

  SPI.beginTransaction(spiSettings);

  digitalWrite(this->ssPin, 0);

  transferBuffer(poll_cmd_2, sizeof(poll_cmd_2));

  digitalWrite(this->ssPin, 1);

  SPI.endTransaction();

  this->yDelta = buffer[1];
  this->xDelta = buffer[2];

  return this->xDelta != 0 || this->yDelta != 0;
}

int8_t SPITrackball::getX() {
  return this->xDelta;
}

int8_t SPITrackball::getY() {
  return this->yDelta;
}

void SPITrackball::transferBuffer(const byte *source, uint8_t length) {
  memcpy(this->buffer, source, length);

  SPI.transfer(this->buffer, length);
}

bool SPITrackball::validateResponse(const byte *expectedData, uint8_t length) {
  for(int i = 0; i < length; i++) {
    if(expectedData[i] != 0xFF
        && this->buffer[i] != expectedData[i]) {
      return false;
    }
  }

  return true;
}

void SPITrackball::printBuffer(const byte *data, uint8_t length) {
    for(int i = 0; i < length; i++) {
    Serial.print(data[i], HEX);
    Serial.print(" ");
  }
  Serial.println();
}

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

  pinMode(this->ssPin, OUTPUT);
  pinMode(SCK, OUTPUT);
  pinMode(MOSI, OUTPUT);
  pinMode(MISO, INPUT);

  digitalWrite(this->ssPin, 1);

  delay(10);

  SPI.begin();

  //Initialization phase 1

  transferBuffer(initialize_cmd_1, sizeof(initialize_cmd_1));

  if(!validateResponse(initialize_response_1, sizeof(initialize_response_1))) {
    Serial.println("Initialize cmd 1 returned unexpected data");
    printBuffer(this->buffer, sizeof(initialize_response_1));
  }

  transferBuffer(initialize_cmd_2, sizeof(initialize_cmd_2));

  if(!validateResponse(initialize_response_2, sizeof(initialize_response_2))) {
    Serial.println("Initialize cmd 2 returned unexpected data");
    printBuffer(this->buffer, sizeof(initialize_response_2));
  }

  this->xDelta = 0;
  this->yDelta = 0;

  return true;
}

bool SPITrackball::poll() {
  transferBuffer(poll_cmd_1, sizeof(poll_cmd_1));

  if(!validateResponse(poll_response_1, sizeof(poll_response_1))) {
    Serial.println("Poll cmd 1 returned unexpected data");
    printBuffer(this->buffer, sizeof(poll_response_1));
  }

  transferBuffer(poll_cmd_2, sizeof(poll_cmd_2));

  this->yDelta = (int8_t) buffer[1];
  this->xDelta = (int8_t) buffer[2];

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

  SPI.beginTransaction(spiSettings);

  digitalWrite(this->ssPin, 0);

  SPI.transfer(this->buffer, length);

  digitalWrite(this->ssPin, 1);

  SPI.endTransaction();
}

bool SPITrackball::validateResponse(const byte *expectedData, uint8_t length) {
  return true;
  
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

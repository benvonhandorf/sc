/*********************************************************************
 This is an example for our nRF52 based Bluefruit LE modules

 Pick one up today in the adafruit shop!

 Adafruit invests time and resources providing this open source code,
 please support Adafruit and open-source hardware by purchasing
 products from Adafruit!

 MIT license, check LICENSE for more information
 All text above, and the splash screen below must be included in
 any redistribution
*********************************************************************/
#include <bluefruit.h>

BLEDis bledis;
BLEHidAdafruit blehid;

#define LCLICK_PIN 12
#define RCLICK_PIN 11

void setup() 
{
  Serial.begin(115200);
  while ( !Serial ) delay(10);   // for nrf52840 with native usb

  Serial.println("Preparing Bluetooth");

  Bluefruit.begin();
  // HID Device can have a min connection interval of 9*1.25 = 11.25 ms
  Bluefruit.setConnInterval(9, 16); // min = 9*1.25=11.25 ms, max = 16*1.25=20ms
  // Set max power. Accepted values are: -40, -30, -20, -16, -12, -8, -4, 0, 4
  Bluefruit.setTxPower(0);
  Bluefruit.setName("SCR-X1");

  // Configure and Start Device Information Service
  bledis.setManufacturer("BVH");
  bledis.setModel("SCR-X1");
  bledis.begin();

  // BLE HID
  blehid.begin();
  
  // Set up and start advertising
  startAdv();

  Serial.println("Advertising started");

  pinMode(LCLICK_PIN, INPUT_PULLUP);
  pinMode(RCLICK_PIN, INPUT_PULLUP);
}

void startAdv(void)
{  
  // Advertising packet
  Bluefruit.Advertising.addFlags(BLE_GAP_ADV_FLAGS_LE_ONLY_GENERAL_DISC_MODE);
  Bluefruit.Advertising.addTxPower();
  Bluefruit.Advertising.addAppearance(BLE_APPEARANCE_HID_MOUSE);
  Bluefruit.Advertising.addAppearance(BLE_APPEARANCE_HID_KEYBOARD);
  
  // Include BLE HID service
  Bluefruit.Advertising.addService(blehid);

  // There is enough room for 'Name' in the advertising packet
  Bluefruit.Advertising.addName();
  
  /* Start Advertising
   * - Enable auto advertising if disconnected
   * - Interval:  fast mode = 20 ms, slow mode = 152.5 ms
   * - Timeout for fast mode is 30 seconds
   * - Start(timeout) with timeout = 0 will advertise forever (until connected)
   * 
   * For recommended advertising interval
   * https://developer.apple.com/library/content/qa/qa1931/_index.html   
   */
  Bluefruit.Advertising.restartOnDisconnect(true);
  Bluefruit.Advertising.setInterval(32, 244);    // in unit of 0.625 ms
  Bluefruit.Advertising.setFastTimeout(30);      // number of seconds in fast mode
  Bluefruit.Advertising.start(0);                // 0 = Don't stop advertising after n seconds  
}

#define MOUSE_X_PIN A0
#define MOUSE_Y_PIN A1

#define MOUSE_CENTER 465
#define DEAD_ZONE_SIDE 15
#define DEAD_ZONE_LOW (MOUSE_CENTER - DEAD_ZONE_SIDE)
#define DEAD_ZONE_HIGH (MOUSE_CENTER + DEAD_ZONE_SIDE)
#define MOUSE_SCALE 16
#define MOUSE_MAX 127

int8_t mouseX = 0;
int8_t mouseY = 0;

int8_t readingToMouseDelta(int value) {
  if(value > DEAD_ZONE_LOW
      && value < DEAD_ZONE_HIGH) {
    return 0;
  }

  value = (value - MOUSE_CENTER) / MOUSE_SCALE;

  if(value > MOUSE_MAX) {
    value = MOUSE_MAX;
  } else if(value < -MOUSE_MAX) {
    value = -MOUSE_MAX;
  }

  return value;
}

void updateMousePosition() {
  int rawX = analogRead(MOUSE_X_PIN);
  int rawY = analogRead(MOUSE_Y_PIN);

  mouseX = -readingToMouseDelta(rawX);
  mouseY = -readingToMouseDelta(rawY);
  

  Serial.print(rawX);
  Serial.print(", ");
  Serial.print(rawY);
  Serial.println();
}

#define DEBOUNCE_LOCKOUT_MS 10

uint8_t lclick_debounced = 0;
int64_t lclick_time_changed = 0;
uint8_t rclick_debounced = 0;
int64_t rclick_time_changed = 0;

void updateButtonState() {
  unsigned long now = millis();

  if(now > lclick_time_changed + DEBOUNCE_LOCKOUT_MS) {
    uint8_t lstate = digitalRead(LCLICK_PIN);

//    Serial.print("lbutton: ");
//    Serial.println(lstate, HEX);
    
    if(lstate != lclick_debounced) {
      lclick_debounced = lstate;
      lclick_time_changed = now;
    }
  }

  if(now > rclick_time_changed + DEBOUNCE_LOCKOUT_MS) {
    uint8_t rstate = digitalRead(RCLICK_PIN);

    
//    Serial.print("rbutton: ");
//    Serial.println(rstate, HEX);
    
    if(rstate != rclick_debounced) {
      rclick_debounced = rstate;
      rclick_time_changed = now;
    }
  }
}

uint8_t previousButtons = 0;

void sendUpdate() {
  uint8_t buttons = lclick_debounced ? MOUSE_BUTTON_LEFT : 0
                || rclick_debounced ? MOUSE_BUTTON_RIGHT : 0;

//  Serial.print("RPT: ");
//  Serial.print(buttons, HEX);
//  Serial.print(" : ");
//  Serial.print(mouseX);
//  Serial.print(" : ");
//  Serial.print(mouseY);
//  Serial.println();

  if(buttons != previousButtons
    || mouseX != 0
    || mouseY != 0) {            
    blehid.mouseReport(buttons, mouseX, mouseY);
    previousButtons = buttons;
  }
}

void updateMouseState() {
  updateButtonState();
  updateMousePosition();

  sendUpdate();
}

void loop() 
{    

  updateMouseState();
 
}

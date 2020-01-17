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

#define MOUSE_X_PIN A1
#define MOUSE_Y_PIN A0

#define LCLICK_PIN 11
#define RCLICK_PIN 12

typedef struct {
  int pin;
  uint8_t state = 0;
  uint8_t latch = 0;
  int64_t update = 0;
} ButtonState;

ButtonState leftButton ;
ButtonState rightButton ;

typedef struct {
  int pin;
  int8_t value = 0;
  int16_t center = 465;
  int16_t deadZone = 2;
  int16_t deadZoneHigh;
  int16_t deadZoneLow;
  int16_t scale = 10;
} Axis;

Axis xAxis;
Axis yAxis;

void setup()
{
  pinMode(LED_BLUE, OUTPUT);

  digitalWrite(LED_BLUE, HIGH);
  
  Serial.begin(115200);
  for(int i=100; i > 0; i--) {
    if( Serial ) {
      break;
    } else {
      delay(10);   // for nrf52840 with native usb
    }
  }

  Serial.println("Preparing Bluetooth");

  digitalWrite(LED_BLUE, LOW);

  Bluefruit.begin();

    digitalWrite(LED_BLUE, HIGH);

    Bluefruit.setName("CRAP-1");

  // HID Device can have a min connection interval of 9*1.25 = 11.25 ms
  Bluefruit.Periph.setConnInterval(9, 16); // min = 9*1.25=11.25 ms, max = 16*1.25=20ms
  // Set max power. Accepted values are: -40, -30, -20, -16, -12, -8, -4, 0, 4
  Bluefruit.setTxPower(0);

  // Configure and Start Device Information Service
  bledis.setManufacturer("BVH");
  bledis.setModel("CRAP-R");
  bledis.begin();

  // BLE HID
  blehid.begin();

  // Set up and start advertising
  startAdv();

  Serial.println("Advertising started");

  pinMode(LCLICK_PIN, INPUT_PULLUP);
  pinMode(RCLICK_PIN, INPUT_PULLUP);

  leftButton.pin = LCLICK_PIN;
  rightButton.pin = RCLICK_PIN;

  xAxis.pin = MOUSE_X_PIN;
  xAxis.center = analogRead(xAxis.pin);
  xAxis.deadZoneHigh = xAxis.center + xAxis.deadZone;
  xAxis.deadZoneLow = xAxis.center - xAxis.deadZone;
  yAxis.pin = MOUSE_Y_PIN;
  yAxis.center = analogRead(yAxis.pin);
  yAxis.deadZoneHigh = yAxis.center + yAxis.deadZone;
  yAxis.deadZoneLow = yAxis.center - yAxis.deadZone;

  Serial.print("xAxis: ");
  Serial.println(xAxis.center);

  Serial.print("yAxis: ");
  Serial.println(yAxis.center);
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
     - Enable auto advertising if disconnected
     - Interval:  fast mode = 20 ms, slow mode = 152.5 ms
     - Timeout for fast mode is 30 seconds
     - Start(timeout) with timeout = 0 will advertise forever (until connected)

     For recommended advertising interval
     https://developer.apple.com/library/content/qa/qa1931/_index.html
  */
  Bluefruit.Advertising.restartOnDisconnect(true);
  Bluefruit.Advertising.setInterval(32, 244);    // in unit of 0.625 ms
  Bluefruit.Advertising.setFastTimeout(30);      // number of seconds in fast mode
  Bluefruit.Advertising.start(0);                // 0 = Don't stop advertising after n seconds
}

#define MOUSE_MAX 127

int8_t readingToMouseDelta(int value, Axis* axis) {
  if (value > axis->deadZoneLow
      && value < axis->deadZoneHigh) {
    return 0;
  }

  value = (value - axis->center) / axis->scale;

  if (value > MOUSE_MAX) {
    value = MOUSE_MAX;
  } else if (value < -MOUSE_MAX) {
    value = -MOUSE_MAX;
  }

  return value;
}

void updateMousePosition() {
  int rawX = analogRead(MOUSE_X_PIN);
  int rawY = analogRead(MOUSE_Y_PIN);

  xAxis.value = readingToMouseDelta(rawX, &xAxis);
  yAxis.value = readingToMouseDelta(rawY, &yAxis);

//  Serial.print(rawX);
//  Serial.print(", ");
//  Serial.print(rawY);
//  Serial.println();
}

#define DEBOUNCE_LOCKOUT_MS 10
#define BUTTON_LATCH_MS 1000

void updateButtonState(unsigned long now, ButtonState* buttonState) {
  if (now > buttonState->update + DEBOUNCE_LOCKOUT_MS) {
    uint8_t state = digitalRead(buttonState->pin);

    if (buttonState->latch == 1) {
      if (state == 1) {
        //clear the latch
        buttonState->latch = 0;
        buttonState->update = now;

        Serial.print(buttonState->pin);
        Serial.println(" latch cleared");
      }
    } 

    if(buttonState->latch == 1) {
      //latched.  Current state is immaterial until latch is cleared
        buttonState->state = 1;
    } else if (state != buttonState->state) {
      if (state == 0 && now > buttonState->update + BUTTON_LATCH_MS) {
        //We were 1 long enough to latch the input
        buttonState->latch = 1;
        buttonState->state = 1;
        buttonState->update = now;

        Serial.print(buttonState->pin);
        Serial.println(" latch set");
      } else {
        buttonState->state = state;
        buttonState->update = now;
        
        Serial.print(buttonState->pin);
        Serial.print(" = ");
        Serial.println(buttonState->state);
      }
    }
  }
}

uint8_t previousButtons = 0;

void sendUpdate() {
  uint8_t buttons = leftButton.state ? MOUSE_BUTTON_LEFT : 0
                    || rightButton.state ? MOUSE_BUTTON_RIGHT : 0;

  //  Serial.print("RPT: ");
  //  Serial.print(buttons, HEX);
  //  Serial.print(" : ");
  //  Serial.print(mouseX);
  //  Serial.print(" : ");
  //  Serial.print(mouseY);
  //  Serial.println();

  if (buttons != previousButtons
      || xAxis.value != 0
      || yAxis.value != 0) {
    blehid.mouseReport(buttons, xAxis.value, yAxis.value);
    previousButtons = buttons;
  }
}

void updateMouseState() {
  unsigned long now = millis();
  updateButtonState(now, &leftButton);
  updateButtonState(now, &rightButton);
  updateMousePosition();

  sendUpdate();
}

void loop()
{
  updateMouseState();
}

/*
  ANNAH - Smart Gas Detection (Prototype Rebuild)
  Board: Arduino Mega 2560
  Sensors: MQ-9 / MQ-135 (analog)
  Output: Buzzer + Serial logs

  Notes:
  - MQ sensors need a warm-up period for stable readings.
  - Calibrate GAS_THRESHOLD based on your environment.
*/

#define MQ9_PIN A0
#define MQ135_PIN A1
#define BUZZER_PIN 8

// Start conservative; calibrate after warm-up.
const int GAS_THRESHOLD = 420;

unsigned long lastPrintMs = 0;

int readStableAnalog(uint8_t pin, uint8_t samples = 10) {
  long sum = 0;
  for (uint8_t i = 0; i < samples; i++) {
    sum += analogRead(pin);
    delay(5);
  }
  return (int)(sum / samples);
}

void setup() {
  Serial.begin(9600);
  pinMode(BUZZER_PIN, OUTPUT);
  digitalWrite(BUZZER_PIN, LOW);

  Serial.println(F("ANNAH Prototype Started"));
  Serial.println(F("Warming up sensors... (recommended 30-60s for demo)"));
}

void loop() {
  int mq9 = readStableAnalog(MQ9_PIN);
  int mq135 = readStableAnalog(MQ135_PIN);

  bool leak = (mq9 > GAS_THRESHOLD) || (mq135 > GAS_THRESHOLD);

  // Local alarm first: always works.
  digitalWrite(BUZZER_PIN, leak ? HIGH : LOW);

  // Print once per second
  if (millis() - lastPrintMs >= 1000) {
    lastPrintMs = millis();
    Serial.print(F("MQ-9: "));
    Serial.print(mq9);
    Serial.print(F(" | MQ-135: "));
    Serial.print(mq135);
    Serial.print(F(" | Status: "));
    Serial.println(leak ? F("GAS ALERT!") : F("OK"));
  }

  // Optional: You can send a simple text message to ESP8266 via Serial1 in a real build.
}

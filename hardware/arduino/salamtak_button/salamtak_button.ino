// Salamtak Smart Button
const int buttonPin = 2;

void setup() {
  pinMode(buttonPin, INPUT_PULLUP);
  Serial.begin(9600);
}

void loop() {
  if (digitalRead(buttonPin) == LOW) {
    Serial.println("MED_CONFIRMED");
    delay(500);
  }
}

# Wiring Notes (Prototype)

This is a simple demo wiring guide. Pin choices can be changed.

## Arduino Mega
- MQ-9 AO  -> A0
- MQ-135 AO -> A1
- Buzzer + -> D8
- Buzzer - -> GND

Power:
- MQ modules typically use 5V + GND
- Ensure common ground between all modules

## ESP8266
For demo, ESP8266 runs standalone and sends webhook alerts.
For full integration, connect:
- Arduino Serial1 TX (pin 18) -> ESP8266 RX (level shifting recommended)
- Arduino Serial1 RX (pin 19) -> ESP8266 TX

⚠️ IMPORTANT:
ESP8266 is 3.3V logic. Use a level shifter when connecting Arduino 5V TX to ESP RX.

# ANNAH (ANAA) — Smart Gas Detection System 🛡️🔥
> لا تدع الغاز يسرق أنفاسك

**ANNAH** is a smart gas detection prototype I built for a Jordanian university student competition during **Global Entrepreneurship Week (GEW)**.
It focuses on early leak detection and loud local alarms, plus mobile notifications when connected.

## Why this project?
Gas-related accidents increase in winter. I wanted a simple, affordable device that warns people early — even if the phone is not connected.

## What ANNAH does
- Detects gas leaks using MQ-series sensors (MQ-9 / MQ-135)
- Triggers a **loud buzzer** immediately on dangerous readings
- (Prototype) Sends a **Wi‑Fi alert** using ESP8266 when available
- Designed to be **family-friendly** (multiple phones, simple alerts)

## System overview
**Sensors → Arduino Mega → ESP8266 → Mobile Alert (prototype) + Local Buzzer**

## Repository notes (important)
This repo contains a **recreated prototype implementation** (clean re-build) because the original competition demo code was not preserved.
It’s written to be understandable and believable for a student embedded/IOT project.

## Hardware used
- Arduino Mega 2560 Pro
- ESP8266 (ESP-12)
- MQ-9 Gas Sensor Module
- MQ-135 Air Quality Sensor
- Rechargeable battery module
- Active buzzer / beeper

## Folder structure
```text
ANNAH-Smart-Gas-Detection-System/
├─ src/
│  ├─ arduino/
│  │  └─ annah_arduino.ino
│  └─ esp8266/
│     └─ annah_esp8266.ino
├─ hardware/
│  ├─ BOM.md
│  └─ Wiring_Notes.md
├─ docs/
│  ├─ ANNAH_poster.pdf
│  └─ README_MEDIA.md
├─ images/
│  └─ (add images here)
├─ LICENSE
└─ .gitignore
```

## How to run (prototype)
### 1) Arduino (sensor + buzzer)
1. Open `src/arduino/annah_arduino.ino` in Arduino IDE.
2. Select **Board: Arduino Mega 2560**.
3. Upload and open Serial Monitor at **9600**.
4. Adjust `GAS_THRESHOLD` after calibrating your sensor.

### 2) ESP8266 (Wi‑Fi alert)
1. Open `src/esp8266/annah_esp8266.ino`.
2. Select your ESP8266 board (NodeMCU/Generic).
3. Set your Wi‑Fi SSID/PASSWORD.
4. Upload and check Serial Monitor.

> Tip: For a competition demo, you can simulate “mobile alerts” using a simple HTTP request to a webhook (e.g., IFTTT/Webhook.site).

## Demo screenshots / poster
- Poster: `docs/ANNAH_poster.pdf`
- Add images into `images/` and include them in the README later.

## Future improvements
- Push notifications via Firebase
- SMS fallback (no internet)
- Automatic gas shut‑off valve
- Calibration wizard + adaptive thresholding
- Enclosure + battery safety improvements

---

If you use this repository in your portfolio, keep it honest:
**“Recreated prototype after the competition for documentation and learning.”**

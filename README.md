# Salamtak

<p align="center">
  <img src="assets/poster/salamtak-poster-page1.png" width="850" alt="Salamtak Poster">
</p>

Salamtak is a smart medication reminder system that supports both patients and caregivers.
It combines a Flutter mobile app, voice reminders, and an Arduino-based Bluetooth smart button to confirm medication intake.

## What’s Included in This Repo
- **Flutter demo app UI** (`app/lib/main.dart`) showing the main screens (Main, Easy Mode, Bluetooth, Caregiver)
- **Arduino button sketch** (`hardware/arduino/salamtak_button/salamtak_button.ino`)
- **Poster + screenshots** inside `assets/`

## Screens (from design)
<p align="center">
  <img src="assets/screenshots/app-page1.png" width="800" alt="App Screens Page 1">
</p>

<p align="center">
  <img src="assets/screenshots/app-page2.png" width="800" alt="App Screens Page 2">
</p>

## Run (Flutter)
```bash
cd app
flutter pub get
flutter run
```

## Hardware (Arduino)
Open `hardware/arduino/salamtak_button/salamtak_button.ino` in Arduino IDE and upload.

## License
MIT License (see LICENSE)

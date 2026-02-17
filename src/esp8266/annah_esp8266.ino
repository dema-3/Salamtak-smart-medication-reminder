/*
  ANNAH - ESP8266 Wi‑Fi Alert (Prototype Rebuild)
  Board: ESP8266 (ESP-12 / NodeMCU)

  This file is intentionally simple for a believable competition prototype.
  It demonstrates how an alert could be sent to a webhook when a leak is detected.

  How it works (demo):
  - When you open Serial Monitor and type: ALERT
    it sends an HTTP GET request to a webhook URL.

  In a full build, Arduino would send "ALERT" over Serial to ESP8266.
*/

#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

const char* WIFI_SSID = "YOUR_WIFI_NAME";
const char* WIFI_PASS = "YOUR_WIFI_PASSWORD";

// Replace with any webhook URL you control (IFTTT/Webhook.site/etc.)
const char* WEBHOOK_URL = "http://example.com/annah-alert";

void connectWiFi() {
  WiFi.mode(WIFI_STA);
  WiFi.begin(WIFI_SSID, WIFI_PASS);

  Serial.print("Connecting to WiFi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("\nWiFi connected!");
  Serial.print("IP: ");
  Serial.println(WiFi.localIP());
}

void sendAlert() {
  if (WiFi.status() != WL_CONNECTED) return;

  WiFiClient client;
  HTTPClient http;

  Serial.println("Sending alert...");
  if (http.begin(client, WEBHOOK_URL)) {
    int code = http.GET();
    Serial.print("HTTP code: ");
    Serial.println(code);
    http.end();
  } else {
    Serial.println("Failed to start HTTP request.");
  }
}

void setup() {
  Serial.begin(115200);
  delay(500);
  Serial.println("ANNAH ESP8266 Alert Module");
  connectWiFi();
  Serial.println("Type ALERT in Serial Monitor to simulate a gas alert.");
}

void loop() {
  if (Serial.available()) {
    String msg = Serial.readStringUntil('\n');
    msg.trim();
    if (msg.equalsIgnoreCase("ALERT")) {
      sendAlert();
    }
  }
}

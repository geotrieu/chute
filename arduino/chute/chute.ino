#include <Adafruit_MQTT.h>
#include <Adafruit_MQTT_Client.h>

#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <ESP8266WiFi.h>
#include <Servo.h> 
 
Servo lidservo;

//MQTT Details
#define MQTT_SERVER "192.168.9.201"
#define MQTT_PORT 1883                    
#define MQTT_USERNAME "" 
#define MQTT_PASSWORD "" 

char ssid[10] = "echacks";
char password[20] = "Fall2020";

WiFiClient client; 
Adafruit_MQTT_Client mqtt(&client, MQTT_SERVER, MQTT_PORT, MQTT_USERNAME, MQTT_PASSWORD); 
Adafruit_MQTT_Publish chute = Adafruit_MQTT_Publish(&mqtt, MQTT_USERNAME "chute");
Adafruit_MQTT_Subscribe chute_p = Adafruit_MQTT_Subscribe(&mqtt, MQTT_USERNAME "chute-p");

//Constants
const int pResistor = A0; // Photoresistor at Arduino analog pin A0
#define ledPin D4       // Led pin at Arduino pin 9
String arduinoprocess = "";
bool isManual = false;

//Variables
int value;          // Store value from photoresistor (0-1023)
bool mqttConnected;

LiquidCrystal_I2C lcd(0x3F, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);

void setup(){
  Serial.begin(9600);
  lidservo.attach(D8);
  //LCD Init
  lcd.begin(16,2);               // initialize the lcd 
  lcd.clear();

  WiFi.begin(ssid, password);     //Connect to your WiFi router
  Serial.println("");
 
  // Wait for connection
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  //MQTT Init
  mqtt.subscribe(&chute_p);
  mqttConnected = MQTT_connect();
  
 pinMode(ledPin, OUTPUT);  // Set lepPin - 9 pin as an output
 digitalWrite(ledPin, HIGH);
 pinMode(pResistor, INPUT_PULLUP);
}

void loop(){
    Adafruit_MQTT_Subscribe *subscription;
    while ((subscription = mqtt.readSubscription())) {
      if (subscription == &chute_p) {
        String lastread;
        lastread = ((char *)chute_p.lastread);
        Serial.println(lastread);
        if (lastread == "OPEN") {
          OpenChute();
          isManual = true;
        } else if (lastread == "CLOSE") {
          CloseChute();
          isManual = true;
        } else if (lastread == "AUTO") {
          isManual = false;
        }
      }
    }
  arduinoprocess = "";
  arduinoprocess = readSerial();
  char arduinoprocesschar[arduinoprocess.length() + 1];
  arduinoprocess.toCharArray(arduinoprocesschar, arduinoprocess.length() + 1);
  if (mqttConnected) {
    if (arduinoprocess != "") {
      if (arduinoprocess == "F100") {
        if (!isManual)
          CloseChute();
      } else {
        if (!isManual)
          OpenChute();
      }
      chute.publish(arduinoprocesschar);
      Serial.println(arduinoprocesschar);
    }
    //chute.publish(value);
  }
  lcd.clear();
  lcd.print(arduinoprocess);
  //Serial.println(value);
  delay(500); //Small delay
}

String readSerial() {
  String input;
  while (Serial.available()) {
    char c = (char)Serial.read();
    if (c != 0x0A && c != 0x0D) {
      //Block Newline / Carriage Return Characters
      input += c;
    }
  }
  return input;
}

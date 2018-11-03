#include <Adafruit_MQTT.h>
#include <Adafruit_MQTT_Client.h>

#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <ESP8266WiFi.h>

//MQTT Details
#define MQTT_SERVER "192.168.10.214"
#define MQTT_PORT 1883                    
#define MQTT_USERNAME "" 
#define MQTT_PASSWORD "" 

char ssid[10] = "echacks";
char password[20] = "Fall2020";

WiFiClient client; 
Adafruit_MQTT_Client mqtt(&client, MQTT_SERVER, MQTT_PORT, MQTT_USERNAME, MQTT_PASSWORD); 
Adafruit_MQTT_Publish chute = Adafruit_MQTT_Publish(&mqtt, MQTT_USERNAME "chute");

//Constants
const int pResistor = A0; // Photoresistor at Arduino analog pin A0
#define ledPin D4       // Led pin at Arduino pin 9

//Variables
int value;          // Store value from photoresistor (0-1023)
bool mqttConnected;

LiquidCrystal_I2C lcd(0x3F, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);

void setup(){
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
  mqttConnected = MQTT_connect();
  
 pinMode(ledPin, OUTPUT);  // Set lepPin - 9 pin as an output
 digitalWrite(ledPin, HIGH);
 pinMode(pResistor, INPUT_PULLUP);// Set pResistor - A0 pin as an input (optional)
 Serial.begin(9600);
}

void loop(){
  value = analogRead(pResistor);
  if (mqttConnected) {
      chute.publish(value);
    }
  lcd.clear();
  lcd.print(value);
  Serial.println(value);
  delay(500); //Small delay
}

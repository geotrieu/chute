/* Use a photoresistor (or photocell) to turn on an LED in the dark
   More info and circuit schematic: http://www.ardumotive.com/how-to-use-a-photoresistor-en.html
   Dev: Michalis Vasilakis // Date: 8/6/2015 // www.ardumotive.com */
   

//Constants
const int pResistor = A0; // Photoresistor at Arduino analog pin A0
const int ledPin=12;       // Led pin at Arduino pin 9

//Variables
int value;          // Store value from photoresistor (0-1023)

void setup(){
 pinMode(ledPin, OUTPUT);  // Set lepPin - 9 pin as an output
 digitalWrite(ledPin, HIGH);
 pinMode(pResistor, INPUT_PULLUP);// Set pResistor - A0 pin as an input (optional)
 Serial.begin(9600);
}

void loop(){
  value = analogRead(pResistor);
  
  Serial.println(value);
  delay(500); //Small delay
}

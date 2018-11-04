void setup() {
  Serial.begin(9600);
  pinMode(A0, INPUT_PULLUP);
  pinMode(A1, INPUT_PULLUP);
  pinMode(A2, INPUT_PULLUP);
  pinMode(A3, INPUT_PULLUP);
  pinMode(A4, INPUT_PULLUP);
  pinMode(A5, INPUT_PULLUP);
}


void loop() {
  int twentyfive = analogRead(A0);
  int fifty = analogRead(A1);
  int seventyfive = analogRead(A3);
  int hundred = analogRead(A5);
  if (hundred >= 950) {
    Serial.println("F100");
  } else if (seventyfive >= 950) {
    Serial.println("F75");
  } else if (fifty >= 950) {
    Serial.println("F50");
  } else if (twentyfive >= 250) {
    Serial.println("F25");  
  } else {
    Serial.println("F0"); //Write the serial data
  }
  delay(500);
}


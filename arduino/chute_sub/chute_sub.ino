String lastAttempt;
int numInRow;

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
    if (numInRow == 2 && lastAttempt == "F100") {
      Serial.println("F100");
    } else if (lastAttempt == "F100") {
      numInRow++;
    } else {
      lastAttempt = "F100";
      numInRow = 1;
    }
  } else if (seventyfive >= 950) {
    if (numInRow == 2 && lastAttempt == "F75") {
      Serial.println("F75");
    } else if (lastAttempt == "F75") {
      numInRow++;
    } else {
      lastAttempt = "F75";
      numInRow = 1;
    }
  } else if (fifty >= 950) {
    if (numInRow == 2 && lastAttempt == "F50") {
      Serial.println("F50");
    } else if (lastAttempt == "F50") {
      numInRow++;
    } else {
      lastAttempt = "F50";
      numInRow = 1;
    }
  } else if (twentyfive >= 950) {
    if (numInRow == 2 && lastAttempt == "F25") {
      Serial.println("F25");
    } else if (lastAttempt == "F25") {
      numInRow++;
    } else {
      lastAttempt = "F25";
      numInRow = 1;
    }  
  } else {
    if (numInRow == 2 && lastAttempt == "F0") {
      Serial.println("F0");
    } else if (lastAttempt == "F0") {
      numInRow++;
    } else {
      lastAttempt = "F0";
      numInRow = 1;
    }
  }
  delay(2000);
}


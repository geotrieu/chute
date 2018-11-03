bool OpenChute() {
  lidservo.write(100);
  return false;
}

bool CloseChute() {
  lidservo.write(0);
  return false;
}


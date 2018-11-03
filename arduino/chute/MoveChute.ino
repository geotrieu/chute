bool OpenChute() {
  lidservo.write(180);
  return false;
}

bool CloseChute() {
  lidservo.write(0);
  return false;
}


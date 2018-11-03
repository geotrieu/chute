bool OpenChute() {
  lidservo.write(120);
  return false;
}

bool CloseChute() {
  lidservo.write(0);
  return false;
}


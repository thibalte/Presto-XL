#include <Servo.h>
Servo servo;

// pins
int servoPin = 9;
int motorOn = 2;
int motorDir = 3;

// positions
int parking = 25;
int printing = 80;
int up = 100;

void setup()
{
  pinMode(motorOn, INPUT);
  pinMode(motorDir, INPUT);
  servo.attach(servoPin);
}

void loop()
{
  if (digitalRead(motorOn)){
    // down
    if (digitalRead(motorDir)){
      servo.write(parking);
    } else {
      servo.write(printing);
    }
  } else {
    // up
    servo.write(up);
  }
  delay(50);
}

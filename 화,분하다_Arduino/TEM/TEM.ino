#include <LiquidCrystal_I2C.h>
#include <DHT11.h>
LiquidCrystal_I2C lcd(0x27, 16, 2);


int cds = A0;
int water_pin = A3;
int pin = 4; 
DHT11 dht11(pin);

int dust_Pin = A1;
int sensor_led = 12;

float dust_value = 0;
float dustDensityug = 0;

int sampling = 280;
int waiting = 40;
float stop_time = 9680;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  lcd.begin();
  pinMode(sensor_led, OUTPUT);
  pinMode(4, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:

  int err;
  float temp, humi;
  int val_water = analogRead(A3);
  int val_light = analogRead(A0);

  digitalWrite(sensor_led, LOW);
  delayMicroseconds(sampling);

  dust_value = analogRead(dust_Pin);

  delayMicroseconds(waiting);
  digitalWrite(sensor_led, HIGH);
  delayMicroseconds(stop_time);

   dustDensityug = (0.17 * (dust_value * (5.0 / 1024.0)) - 0.1) * 1000;

    lcd.setCursor(0,0);
    lcd.print("Dust Density = ");
    lcd.setCursor(0,1);
    lcd.print(dustDensityug);
    lcd.print(" ug/m3");
    delay(5000);
    
    lcd.clear();
    delay(1000);

    lcd.setCursor(0,0);
    lcd.print("Water = ");
    lcd.print(val_water);
    lcd.setCursor(0,1);
    lcd.print("Light = ");
    lcd.print(val_light);
    delay(5000);
    
    lcd.clear();
    delay(1000);
    
  if((err = dht11.read(humi, temp)) == 0)
  {
    lcd.setCursor(0,0);
    lcd.print("Temp = ");
    lcd.print(temp);
    lcd.setCursor(0,1);
    lcd.print("Humi = ");
    lcd.print(humi);
    delay(5000);

    lcd.clear();
    delay(1000);
  }
  else
  {
    Serial.println();
    Serial.print("Error No : ");
    Serial.print(err);
    Serial.println();
  }
  delay(DHT11_RETRY_DELAY);
}

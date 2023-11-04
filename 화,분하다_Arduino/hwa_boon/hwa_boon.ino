#include <SoftwareSerial.h> // 블루투스 모듈 연결 라이브러리
#include <LiquidCrystal_I2C.h>  // LCD 라이브러리
#include <DHT11.h> // 온습도센서 라이브러리

LiquidCrystal_I2C lcd(0x27, 16, 2); // LCD 주소값 - 0x27

SoftwareSerial BTSerial(2,3); // 블루투스 모듈 TX, RX 핀번호
 byte buffer[1024]; // 데이터를 수신 받을 버퍼
 int bufferPosition; // 버퍼에 데이타를 저장할 때 기록할 위치

int cds = A0; // 조도센서 핀번호
int water_pin = A3; // 수분수위센서 핀번호Q
int pin = 4; 
DHT11 dht11(pin); // 온습도센서 아날로그 핀번호

int dust_Pin = A1;  // 먼지센서 핀번호
int sensor_led = 12;  // 먼지센서 센싱 아날로그 핀번호

float dust_value = 0; // 센서에 값지된 먼지 수치 변수
float dustDensityug = 0;  // 미세먼지 연산을 위한 변수
float Voltage = 0;

int sampling = 280;
int waiting = 40;
float stop_time = 9680;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600); // 시리얼 모니터 시작
  BTSerial.begin(9600);  // set the data rate for the BT port
  
  lcd.begin();  // lcd 시작

  pinMode(sensor_led, OUTPUT);  // ledPower를 출력 단자로 설정합니다.
  pinMode(dust_Pin, INPUT); 
}


void loop() {
  // put your main code here, to run repeatedly:
   
   // BT –> Data –> Serial
  if (BTSerial.available()) {
    Serial.write(BTSerial.read());
    char toSend = (char)BTSerial.read();
    Serial.print(toSend);  
  }
  // Serial –> Data –> BT
  if (Serial.available()) {
    BTSerial.write(Serial.read());
    char toSend = (char)Serial.read();
    BTSerial.print(toSend);
  }
  
  int err;  // 온습도 수치값에 대한 에러값 처리
  float temp, humi; // 온도, 습도 변수
  int val_water = analogRead(A3); // 감지된 토양습도센서 값 읽기
  int val_light = analogRead(A0); // 감지된 조도센서 값 읽기

  digitalWrite(sensor_led, LOW);
  delayMicroseconds(sampling);

  dust_value = analogRead(dust_Pin);  // 감지된 먼지센서 값 읽기

  delayMicroseconds(waiting);
  digitalWrite(sensor_led, HIGH);
  delayMicroseconds(stop_time);
  
   dustDensityug = (0.17 * (dust_value * (5.0/1024) - 0.1)) * 100;

    lcd.setCursor(0,0);
    // 첫 번째 줄에 첫 번째 커서부터 시작
    lcd.print("Dust Density = ");
    lcd.setCursor(0,1);
    // 두 번째 줄에 첫 번째 커서부터 시작
// if (dustDensityug > 30){ // 잡음을 막기 위해
    lcd.print(dustDensityug);

// }
    lcd.print(" ug/m3");
    
    delay(3000);
    // 3초간 유지 (1000 = 1초)
 
    lcd.clear();
    // lcd 화면 지우기
    delay(1000);

    lcd.setCursor(0,0);
    lcd.print("Water = ");
    lcd.print(val_water);
    lcd.setCursor(0,1);
    lcd.print("Light = ");
    lcd.print(val_light);
    delay(3000);
    
    lcd.clear();
    delay(1000);
    
  if((err = dht11.read(humi, temp)) == 0) // 온습도 값에 대한 에러 처리문
  {
    lcd.setCursor(0,0);
    lcd.print("Temp = ");
    lcd.print(temp);
    lcd.setCursor(0,1);
    lcd.print("Humi = ");
    lcd.print(humi);
    delay(3000);

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
  
  String sensor = " ";
  sensor = (String)temp + "/" + (String)humi + "/" + (String)val_light + "/" + (String)dustDensityug + "/" + (String)val_water;
  Serial.println(sensor);
  BTSerial.println(sensor);
  delay(1000);
}

//Carrega a biblioteca do sensor ultrassonico
#include <Ultrasonic.h>
//Define os pinos para o trigger e echo
#define pino_trigger 9
#define pino_echo 8

//Inicializa o sensor nos pinos definidos acima
Ultrasonic ultrasonic(pino_trigger, pino_echo);
void setup()
{
  Serial.begin(9600);
  pinMode (13,OUTPUT);
}

void loop()
{
  delay(1500);
  float cmMsec,last;
  long microsec = ultrasonic.timing();
  cmMsec = ultrasonic.convert(microsec, Ultrasonic::CM); //Primeira Amostra
  if (cmMsec < 80){
    delay(1500);
    microsec = ultrasonic.timing();
    last = ultrasonic.convert(microsec, Ultrasonic::CM); //Segunda Amostra
    if ( last < cmMsec ){
        digitalWrite(13,HIGH);
        Serial.print("Move:");
        Serial.println(cmMsec); 
        delay(2000);
      
    }
  }     
  else{
    digitalWrite(13, LOW);  
 }
}


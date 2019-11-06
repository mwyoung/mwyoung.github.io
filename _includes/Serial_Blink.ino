//Blink - turns on LED on Arduino, modified Arduino's Blink.ino
// Pin 13 has an LED connected on most Arduino boards.
// give it a name:
#define LED 13
volatile bool led_state = 0;
String str;
volatile uint16_t loopNum = 0;

void toggleLED(){
    led_state = !led_state;
    digitalWrite(LED, led_state);
}

// the setup routine runs once when you press reset:
void setup() {
    Serial.begin(9600);
    // initialize the digital pin as an output.
    pinMode(LED, OUTPUT);
    Serial.write("Startup\n");
}

// the loop routine runs over and over again forever:
void loop() {
    Serial.print("L"); Serial.print(loopNum); Serial.print("\n");
    loopNum++;
    toggleLED();
    if (Serial.available()>0){
        str = Serial.readStringUntil('\n');
        Serial.print("rcv: ");
        Serial.print(str);
    }
    delay(1000);               // wait for a second
}

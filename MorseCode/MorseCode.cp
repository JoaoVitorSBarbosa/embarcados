#line 1 "C:/Temp/MorseCode/MorseCode.c"
#line 16 "C:/Temp/MorseCode/MorseCode.c"
void morsePonto() {
 portd = 0b11111111;
 delay_ms(200);
 portd = 0b00000000;
}
void morseTraco() {
 portd = 0b11111111;
 delay_ms(600);
 portd = 0b00000000;
}
void morseJ () {
 morsePonto();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
}
void morseV () {
 morsePonto();
 delay_ms(900);
 morsePonto();
 delay_ms(900);
 morsePonto();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
}
void morseS () {
 morsePonto();
 delay_ms(900);
 morsePonto();
 delay_ms(900);
 morsePonto();
 delay_ms(900);
}
void morseB () {
 morseTraco();
 delay_ms(900);
 morsePonto();
 delay_ms(900);
 morsePonto();
 delay_ms(900);
 morsePonto();
 delay_ms(900);
}
void morse2 () {
 morsePonto();
 delay_ms(900);
 morsePonto();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
}
void morse0 () {
 morseTraco();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
}
void morse1 () {
 morsePonto();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
}
void morse3 () {
 morsePonto();
 delay_ms(900);
 morsePonto();
 delay_ms(900);
 morsePonto();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
 morseTraco();
 delay_ms(900);
}
void emiteMatricula() {
 morse2();
 morse0();
 morse2();
 morse1();
 morse1();
 morse0();
 morse3();
 morse3();
 morse1();
}
void emiteIniciais() {
 morseJ();
 morseV();
 morseS();
 morseB();
}

void main() {

 trisb = 1;
 trisd = 0;

 while(1) {
 if(portb.rb0 == 0) {
 emiteIniciais();
 }
 if(portb.rb1 == 0) {
 emiteMatricula();
 }
 portd = 0b00000000;
 }

}

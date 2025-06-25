#line 1 "C:/Temp/interruptTimer/interruptTimer.c"
#line 12 "C:/Temp/interruptTimer/interruptTimer.c"
unsigned contagem;





void interrupt(void) {
 contagem++;


 TMR0H = 0x85;
 TMR0L = 0xEE;

 INTCON.TMR0IF = 0;
}

void main() {

 TRISB = 0;
 PORTB = 0xFF;


 T0CON = 0b10000111;
#line 50 "C:/Temp/interruptTimer/interruptTimer.c"
 TMR0H = 0x85;
 TMR0L = 0xEE;

 INTCON = 0b11100000;









 contagem = 0;

 do {
 if (contagem == 5) {
 PORTB = ~PORTB;
 contagem = 0;
 }
 } while(1);
}

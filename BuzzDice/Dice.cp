#line 1 "C:/Temp/BuzzDice/Dice.c"
void main () {
 int result1 = 0;
 int result2 = 0;



 trisc = 0xFD;
 trisb = 0b000000001;
 trisd = 0x00;

 portd = 0x00;
 portb = 0x00;

 while (1) {

 while ( portb.rb0 == 0) {
 result1 = (rand() % 6) + 1;
 portb = 1 << result1;
 result2 = (rand() % 6) + 1;
 portd = 1 << result2;
 }

 portc.rc1 = ((result1 == 6) && (result2 == 6));
 }
 }

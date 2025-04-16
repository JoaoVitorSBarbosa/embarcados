#line 1 "C:/Temp/BuzzDice/BuzzDice.c"
void main () {
 int result1 = 0;
 int result2 = 0;

 trisc = 0b11111101;
 trisb = 0b00000001;
 trisd = 0b00000001;

 portd = 0b00000000;
 portb = 0b00000000;
 portc = 0b00000010;

 while (1) {

 while ( portb.rb0 == 0) {
 result1 = (rand() % 6) + 1;
 portb = 1 << result1;
 result2 = (rand() % 6) + 1;
 portd = 1 << result2;
 }

 portc.rc1 = !((result1 == 6) && (result2 == 6));

 }
}

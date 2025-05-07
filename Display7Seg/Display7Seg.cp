#line 1 "C:/Temp/Display7Seg/Display7Seg.c"
#line 25 "C:/Temp/Display7Seg/Display7Seg.c"
unsigned short mask(unsigned short num) {
 switch (num) {
 case 0 : return 0x3F;
 case 1 : return 0x06;
 case 2 : return 0x5B;
 case 3 : return 0x4F;
 case 4 : return 0x66;
 case 5 : return 0x6D;
 case 6 : return 0x7D;
 case 7 : return 0x07;
 case 8 : return 0x7F;
 case 9 : return 0x6F;
 }
}

void escreve4Displays(int num1, int num2, int num3, int num4) {
 PORTD = mask(num1);
 porta.f2 = 1;
 Delay_ms( 5 );
 porta.f2 = 0;


 PORTD = mask(num2);
 porta.f3 = 1;
 Delay_ms( 5 );
 porta.f3 = 0;


 PORTD = mask(num3);
 porta.f4 = 1;
 Delay_ms( 5 );
 porta.f4 = 0;


 PORTD = mask(num4);
 porta.f5 = 1;
 Delay_ms( 5 );
 porta.f5 = 0;
}


void main(void) {
 int segundos;
 int minutos;
 int tempAux;
 ADCON0 = 0X00;
 ADCON1 = 0X06;
 INTCON = 0;
 TRISA = 0;
 PORTA = 0;
 TRISD = 0;
 PORTD = 0;
 TRISB = 0xFF;
 TRISC = 0b11111101;
 while(1) {
 segundos = 0;
 minutos = 0;
  portc.rc1  = 1;

 while( portb.rb2  == 1) {
 if( portb.rb0  == 0) {
 escreve4Displays(minutos / 10, minutos % 10, segundos / 10, segundos % 10 );
 segundos++;
 if(segundos > 59) {
 segundos = 0;
 minutos++;
 }
 }
 if( portb.rb1  == 0) {
 escreve4Displays(minutos / 10, minutos % 10, segundos / 10, segundos % 10 );
 segundos--;
 if(segundos <=0) {
 if(minutos == 0) {
 segundos = 0;
 } else {
 segundos = 59;
 minutos--;
 }
 }
 }
 escreve4Displays(minutos / 10, minutos % 10, segundos / 10, segundos % 10 );
 }
 while((minutos > 0) || (segundos > 0)) {
 tempAux = 50;
 while(tempAux > 0) {
 escreve4Displays(minutos / 10, minutos % 10, segundos / 10, segundos % 10 );
 tempAux--;
 }
 segundos--;
 if(segundos < 0) {
 segundos = 59;
 minutos--;
 }
 }
 while(1) {
  portc.rc1  = 0;
 escreve4Displays(minutos / 10, minutos % 10, segundos / 10, segundos % 10 );
 }
 }

}

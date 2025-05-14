#line 1 "C:/Users/luis.reis1/Desktop/Pratica6/Pratica6.c"
#line 17 "C:/Users/luis.reis1/Desktop/Pratica6/Pratica6.c"
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;


void main(){

 int contador = 0;
 int contaux = 0;
 char contadorString[7];
 ADCON0 = 0x00;
 ADCON1 = 0x06;

 trisd = 0;
 portd = 0;
 trisb = 0b00000001;
 trisc = 1;
 portc.rc2 = 1;
 Lcd_Init();
 delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);
 delay_ms(100);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 delay_ms(100);

 Lcd_Out(1,3,"LCD Pronto!!");
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 delay_ms(100);
 while(1) {


 while (portc.rc0 == 0)
 delay_ms(1);
 while (portc.rc0 == 1){
 delay_ms(1);
 contaux = contaux + 1;
 if(contaux >= 8) {
 contador = contador + 1;
 portd = contador;
 contaux = 0;
 }
 }

 IntToStr(contador,contadorString);
 Lcd_Out(1,1,"Numero de voltas");
 Lcd_Out(2,6,contadorString);
 if(portb.rb0 == 0) contador = 0;

 }
}

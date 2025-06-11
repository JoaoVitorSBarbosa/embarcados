#line 1 "C:/Temp/ContLCD/ContLCD.c"
#line 13 "C:/Temp/ContLCD/ContLCD.c"
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



char *texto[16];
unsigned int contador = 0;


void main() {

 ADCON0 = 0X00;


 ADCON1 = 0x06;

 TRISD = 0;
 TRISE = 0;



 TRISC = 0x01;
 portc.rc2 = 1;


 Lcd_Init();
 Delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);
 Delay_ms(100);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Delay_ms(100);
#line 80 "C:/Temp/ContLCD/ContLCD.c"
 T1CON = 0b10000011;


 TMR1H = 0x00;
 TMR1L = 0x00;

 Lcd_Out(1, 1,"Contagem: ");
 Delay_ms(100);

 do {
 contador = TMR1L;
 contador = contador + TMR1H*256;

 WordToStr(contador, texto);
 Lcd_Out(2, 1,texto);
 Delay_ms(100);
 } while(1);
}

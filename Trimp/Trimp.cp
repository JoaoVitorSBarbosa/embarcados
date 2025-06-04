#line 1 "C:/Temp/Trimp/Trimp.c"









unsigned int valor_AD = 0;



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



void main() {
 char texto[16];
 unsigned int valor_AD;
 float temperatura;
 int cont = 0;
 char unidade[16];
 ADCON0 = 0X00;


 ADCON1 = 0x06;


 trisd = 0x00;
 trisa = 0x04;
 trise = 0x00;
 trisb = 0xFF;
#line 53 "C:/Temp/Trimp/Trimp.c"
 ADCON1 = 0b10001110;
#line 62 "C:/Temp/Trimp/Trimp.c"
 ADCON0 = 0b11000001;

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

 do {
 Lcd_Out(1,3,"Temperatura:");
 strcpy(texto,"");
 strcpy(unidade,"");
 if(portb.rb0 == 0) {
 cont = cont +1;
 if(cont > 3) {
 cont = 0;
 }
 }


 valor_AD = ADC_Get_Sample(2);
 temperatura = (float)valor_AD*((float)500/(float)1024);
 if(cont == 0) {
 strcpy(unidade," C");
 } else if(cont == 1) {
 strcpy(unidade," F");
 temperatura = (temperatura * 1.8) + 32;
 } else if(cont == 2) {
 strcpy(unidade," K");
 temperatura = temperatura + 273;
 }
 FloatToStr(temperatura, texto);
 strcat(texto, unidade);
 Lcd_Out(2,4,texto);

 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 } while (1);
}

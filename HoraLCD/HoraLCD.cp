#line 1 "C:/Temp/HoraLCD/HoraLCD.c"
#line 15 "C:/Temp/HoraLCD/HoraLCD.c"
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
 int hora = 0;
 int minuto = 0;
 int segundo = 0;
 char horario[9];

 char horaString[7];
 char minutoString[7];
 char segundoString[7];

 char *horaPtr;
 char *minutoPtr;
 char *segundoPtr;

 ADCON0 = 0x00;
 ADCON1 = 0x06;

 trisb = 0xFF;

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


 IntToStr(hora,horaString);
 IntToStr(minuto,minutoString);
 IntToStr(segundo,segundoString);

 horaPtr = Ltrim(horaString);
 minutoPtr = Ltrim(minutoString);
 segundoPtr = Ltrim(segundoString);

 strcpy(horaString,horaPtr);
 strcpy(minutoString,minutoPtr);
 strcpy(segundoString,segundoPtr);

 strcpy(horario,"");

 if(hora < 10) {
 strcat(horario, "0");
 }
 strcat(horario, horaPtr);
 strcat(horario, ":");

 if(minuto < 10) {
 strcat(horario, "0");
 }
 strcat(horario, minutoPtr);
 strcat(horario, ":");

 if(segundo < 10) {
 strcat(horario, "0");
 }
 strcat(horario, segundoPtr);


 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,4,horario);

 segundo = segundo + 1;

 if(segundo > 59) {
 segundo = 0;
 minuto = minuto + 1;
 }

 if(minuto > 59) {
 minuto = 0;
 hora = hora + 1;
 }
 if(hora > 23) {
 hora = 0;
 }



 if(portb.rb0 == 1) {
 delay_ms(1000);
 }
 else {
 delay_ms(10);
 }

 }


}

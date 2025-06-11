/**************************************************************************
Este programa tem por objetivo contar o numero de pulsos recebidos em T1CKI
(gerados pela ventoinha) e enviar o valor para o LCD.
O pino RC0 e' a entrada de clock do contador TIMER1 (T1CKI).
No Kit PicGenios RC0 e' conectado ao sensor infravermelho (DIP INFR).
**************************************************************************/
// Compilador: MikroC PRO PIC v.6.40
// Placa: Kit PICGenios v3 com microcontrolador PIC18F452
// Data: 2016
// Obs.: fechar os dip swtchs: LCD, INFR, VENT

// Conexoes LCD do kit PICGenios com 18F452
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
// Fim das conexoes

// Declaracao das variaveis
char *texto[16];
unsigned int contador = 0;

// Programa principal
void main() {

  ADCON0 = 0X00;    // Desliga CAD

  //todos os pinos do porta (AN0-AN4) e porte (AN5-AN7) como i/o de uso geral
  ADCON1 = 0x06;

  TRISD = 0;                // programa portD como saida
  TRISE = 0;                // programa portE como saida

  // configura PortC como entrada no pino RC0 (Sensor Infra-vermelho)
  // e saida nos demais pinos
  TRISC = 0x01;
  portc.rc2 = 1;   // liga a ventoinha do Kit PicGenios

  // Inicializa o LCD
  Lcd_Init();                      //Inicializa o Display
  Delay_ms(100);                   // delay de 100 milisegundos
  Lcd_Cmd(_LCD_CLEAR);
  Delay_ms(100);                   // delay de 100 milisegundos
  Lcd_Cmd(_LCD_CURSOR_OFF);        //Desabilita o cursor
  Delay_ms(100);                   // delay de 100 milisegundos

  // configura Timer 1
  //liga TIMER1, prescaler 1:1, modo 16bits, clock externo
  T1CON = 0b10000011;    /*
  Bit 7: modo de contagem
             0 - 8 bits
             1 - 16 bits
  Bit 6: NC
  Bit 5 e 4: Prescaler
             11 - 1:8
             10 - 1:4
             01 - 1:2
             00 - 1:1
  Bit 3: Oscilador
             1 - habilita
             0 - desabilita
  Bit 2: Sincronizacao de clock
             1 - nao sincroniza
             0 - sincroniza
  Bit 1: Fonte de clock
             1 - pino externo RC0
             0 - interno (Fosc/4)
  Bit 0: Timer1
             1 - habilita
             0 - desabilita
  */

  //carrega valor de contagem inicial do TIMER1
  TMR1H = 0x00;
  TMR1L = 0x00;

  Lcd_Out(1, 3,"Contagem: ");
  Delay_ms(100);                   // delay de 100 milisegundos

  do {
       contador = TMR1L;                // le o valor do timer1, parte baixa
       contador = contador + TMR1H*256; // le o valor do timer1, parte alta

       WordToStr(contador, texto);      //converte valor para string
       Lcd_Out(2, 5,texto);             // escreve variavel texto
       Delay_ms(100);
  } while(1);
} // Fim
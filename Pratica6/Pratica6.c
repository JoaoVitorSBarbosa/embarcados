/*****************************************************************
**                          Exemplo 06                          **
**                                                              **
**       Exemplo para utilizacao do sensor otico                **
**       presente no kit PICGenios com microcontrolador 18F452. **
**       Liga a ventoinha e mostra a contagem de pulsos nos     **
**       LEDs da porta D.                                       **
**                                                              **
** Arquivo: sensor_infra.c                                      **
** Compilador: MikroC PRO PIC v.6.4.0                           **
**                                                              **
** Obs: Ativar dips switchs: INFR, VENT e LED1                  **
** Nome: João Vitor S Barbosa                                   **
** UFLA - Lavras/MG - 14/05/2025                                **
******************************************************************/
// Conexoes LCD do kit PICGenios com 18F
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

void main(){

   unsigned long int contador = 0;
   int contaux = 0;
   char contadorString[7];
   ADCON0  = 0x00; // Configura todos pinos para digital e
   ADCON1  = 0x06; // desabilita o conversor A/D

   trisd = 0;      // configura porta D como saida
   portd = 0;      // apaga todos os LEDs da porta D
   trisb = 0b00000001;
   trisc = 1;      // Entrada: RC0 ; os outros pinos sao saida
   portc.rc2 = 1;  // liga a ventoinha
   Lcd_Init();                  	//Inicializa o Display
   delay_ms(100);
   Lcd_Cmd(_LCD_CLEAR);         	//Limpa o Display
   delay_ms(100);
   Lcd_Cmd(_LCD_CURSOR_OFF);    	//Desabilita o cursor
   delay_ms(100);

   Lcd_Out(1,3,"LCD Pronto!!");	// Escreve no LCD na linha 1 coluna 4
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

        IntToStr(contador,contadorString);        // Converte int em String para ser exibido no LCD
        Lcd_Out(1,1,"Numero de voltas");          // Exibe Numero de voltas na primeira linha do LCD
        Lcd_Out(2,6,contadorString);      // Exibe no LCD o contador
        if(portb.rb0 == 0) contador = 0;  // Zera o contador

   }
} // fim do programa
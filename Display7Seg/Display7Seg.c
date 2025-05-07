/*****************************************************************
**                          Exemplo 05                          **
**                                                              **
**       Exemplo para utilizacao dos displays de 7 segmentos    **
**       presente no kit PIC 18F452. Cada um dos 4 displays  	**
**       são acessos, um de cada, vez, exibindo seu indice	**
**       Ex: display 1 = 1, display 2 = 2, etc...		**
**                                                              **
** Arquivo: display7seg.c                                       **
** Compilador: MikroC PRO PIC v.6.4.0                           **
**								**
** Obs: Ativar dips switchs: DISP1 a DISP4 			**
**                                                              **
** UFLA - Lavras/MG - 12/07/2017                                **
******************************************************************/

// Define o tempo de acendimento do display em ms.
#define tempo 5
#define Buzzer portc.rc1
#define BotDecremento portb.rb1
#define BotIncremento portb.rb0
#define BotInit portb.rb2

// Converte valor numerico decimal para codigo 7 segmentos
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
    porta.f2 = 1;     // Ativa display 1.
    Delay_ms(tempo);
    porta.f2 = 0;     // Desativa display 1.

    // Escreve valor 2 no display 2 em codigo 7 segmentos.
    PORTD = mask(num2);
    porta.f3 = 1;     // Ativa display 2.
    Delay_ms(tempo);
    porta.f3 = 0;     // Desativa display 2.

    // Escreve valor 3 no display 3 em codigo 7 segmentos
    PORTD = mask(num3);
    porta.f4 = 1;     // Ativa display 3.
    Delay_ms(tempo);
    porta.f4 = 0;     // Desativa display 3.

    // Escreve valor 4 no display 4 em codigo 7 segmentos.
    PORTD = mask(num4);
    porta.f5 = 1;     // Ativa display 4.
    Delay_ms(tempo);
    porta.f5 = 0;     // desativa display 4.
}


void main(void) {
  int segundos;
  int minutos;
  int tempAux;
  ADCON0 = 0X00;
  ADCON1 = 0X06;  	// desabilita conversor A/D.
  INTCON = 0;    	// desabilita interrupcoes.
  TRISA  = 0;    	// configura portA como saida.
  PORTA  = 0;
  TRISD  = 0;    	// configura portD como saida.
  PORTD  = 0;
  TRISB = 0xFF; //Configura PORTB como saida
  TRISC = 0b11111101; //Configura PORTC 1 como saida e o resto entrada
  while(1) { 			// inicio do loop infinito.
    segundos = 0;
    minutos = 0;
    Buzzer = 1;
    // Escreve valor 1 no display 1 em codigo 7 segmentos.
    while(BotInit == 1) {
        if(BotIncremento == 0) {
            escreve4Displays(minutos / 10, minutos % 10, segundos / 10, segundos % 10 );
            segundos++;
            if(segundos > 59) {
                 segundos = 0;
                 minutos++;
            }
        }
        if(BotDecremento == 0) {
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
             Buzzer = 0;
             escreve4Displays(minutos / 10, minutos % 10, segundos / 10, segundos % 10 );
    }
  } // Fim do loop infinito

}   // Fim do programa principal.
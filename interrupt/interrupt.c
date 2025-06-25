/**************************************************************************
Programa: Interrupcao por push-botton
Objetivo: incrementar uma unidade no portd a cada interrupcao externa INT0,
          pino RB0/INT0 conectado ao pushbotton
Placa: Kit PICGenios v3 com microcontrolador PIC 18F452
Chaves de funcoes do kit: LED1
Compilador: MikroC PRO v6.4
Data: marco/2025
***************************************************************************/

unsigned contador = 0;

//********************* rotina de interrupcao *****************************

void interrupt(){  //vetor de interrupcao

  contador++;
  portd = contador;
  delay_ms(500);
  intcon.int0if = 0;  // apaga flag sinalizador de interrupcao externa INT0
                      // para que uma nova interrupcao ocorra
}

//******************* programa principal **********************************

void main() {  //funcao principal do programa

  trisb.rb0 = 1;    // configura pino RB0 como entrada - push-botton
  trisd = 0;        // configura portd como saida - LEDs
  portd = 0;        // resseta todos os pinos do portd - apaga LEDs

  intcon2.rbpu = 0; // programa resistor de pull up interno do pic
                    // habilitado em 0
  intcon2.intedg0 = 0;  //aciona interrupcao por borda de descida

  // Habilita interrupcao pelo pino externo INT0/RB0
  intcon = 0b11010000;
  //bit 7: habilita interrupcao geral
  //bit 6: habilita interrupcao de perifericos
  //bit 5: habilita interrupcao por overflow do TIMER0
  //bit 4: habilita interrupcao externa INT0
  //bit 3: habilita interrupcao por troca dos bits porta B
  //bit 2: flag da interrupcao por overflow no TIMER0
  //bit 1: flag da interrupcao EXTERNA INT0
  //bit 0: flag da interrupcao por troca dos bits porta B

  while(1);             // loop infinito aguardando a interrupcao

}  // fim
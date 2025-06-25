/*********************************************************************
Programa: Interrupcao com Timer0
Objetivo: Este programa tem por objetivo  piscar os leds do portb em
intervalo de 5 segundos (ligado e desligado) utilizando o TIMER0 do PIC
que gera o pedido de interrupcao para contagem a cada um segundo.
Placa: Kit PICGenios v3
Chaves de funcoes do kit: LED2
Compilador: MikroC PRO v6.4 - usar: "HS oscilator PLL enable"
Data: junho/2025
/*********************************************************************/

unsigned contagem;

// Esta funcao e' executada toda vez que o Timer0 muda de 65535 para 0.
// Para clock do sistema de 8MHz, prescaler = 256, entao 8MHz/256 = 31250Hz
// O Timer0 conta de 34286 ate 65535 (31250 pulsos de clock), e entao gera
// uma interrupcao a cada segundo.
void interrupt(void) {
  contagem++;          // incrementa vari?vel de contagem

  // reinicia o valor de contagem com 0d34286 = 0x85EE
  TMR0H = 0x85;
  TMR0L = 0xEE;

  INTCON.TMR0IF = 0;  // limpa flag de interrupcao do Timer0
}

void main() {

  TRISB = 0;           // configura PORTB como saida
  PORTB = 0xFF;        // Initializa PORTB

  // Habilita o Timer0 (TMR0) para clock de 31250Hz = 8MHz/256
  T0CON = 0b10000111;
  // bit 7: 0 - desabilita Timer0
  //        1 - habilita Timer0
  // bit 6: 0 - configura contagem em 16 bits
  //        1 - configura contagem em 8 bits
  // bit 5: 0 - fonte de clock do sistema
  //        1 - fonte de clock do pino T0CKI
  // bit 4: 0 - clock de T0CKI na transicao positiva
  //        1 - clock de T0CKI na transicao negativa
  // bit 3: 0 - clock vem do prescaler
  //        1 - clock nao passa pelo prescaler
  // bit 2-0: 000 - prescaler 1:2
  //          111 - prescaler 1:256

  // Inicia Timer0 com 0d34286 = 0x85EE

  TMR0H = 0x85;
  TMR0L = 0xEE;

  INTCON = 0b11100000;       // Configura a interrupcao pelo TMR0
  //bit 7: habilita interrupcao geral
  //bit 6: habilita interrupcao de perifericos
  //bit 5: habilita interrupcao por overflow do TIMER0
  //bit 4: habilita interrupcao externa INT0
  //bit 3: habilita interrupcao por troca dos bits porta B
  //bit 2: flag da interrupcao por overflow no TIMER0
  //bit 1: flag da interrupcao EXTERNA INT0
  //bit 0: flag da interrupcao por troca dos bits porta B

  contagem = 0;              // Initializa contagem

  do {
    if (contagem == 5) {
      PORTB = ~PORTB;  // inverte estado dos LEDs
      contagem = 0;    // Reinicia contagem
    }
  } while(1);          // Fim do loop
}                      // Fim do programa
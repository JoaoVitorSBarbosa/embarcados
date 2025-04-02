/* ****************************************************************
**                      Código Morse Gen                         **
**                                                               **
**           Exemplo para utilizacao  implementação de           **
**           Um código morse                                     **
**                                                               **
**           Arquivo: MorseCode.c                                **
**           Compilador : MikroC PRO PIC v6.4.0                  **
**                                                               **
**           UFLA - Lavras /MG - 02/05/2025                      **
**           Autor: João Vitor Santos Barbosa                    **
**           Matricula: 202120331                                **
******************************************************************/

// O programa deve transmitir as informações: JVSB e 202120331
void morsePonto() { //Ligam os leds durande 0.2s
     portd = 0b11111111;
     delay_ms(200);
     portd = 0b00000000;
}
void morseTraco() { //Ligam os leds durande 0.6s
     portd = 0b11111111;
     delay_ms(600);
     portd = 0b00000000;
}
void morseJ () {  // Codifica a letra "J" em codigo morse
     morsePonto();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
}
void morseV () {  // Codifica a letra "V" em codigo morse
     morsePonto();
     delay_ms(900);
     morsePonto();
     delay_ms(900);
     morsePonto();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
}
void morseS () {  // Codifica a letra "S" em codigo morse
     morsePonto();
     delay_ms(900);
     morsePonto();
     delay_ms(900);
     morsePonto();
     delay_ms(900);
}
void morseB () {  // Codifica a letra "B" em codigo morse
     morseTraco();
     delay_ms(900);
     morsePonto();
     delay_ms(900);
     morsePonto();
     delay_ms(900);
     morsePonto();
     delay_ms(900);
}
void morse2 () {  // Codifica o numero "2" em codigo morse
     morsePonto();
     delay_ms(900);
     morsePonto();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
}
void morse0 () {  // Codifica o numero "0" em codigo morse
     morseTraco();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
}
void morse1 () {  // Codifica o numero "1" em codigo morse
     morsePonto();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
}
void morse3 () {  // Codifica o numero "3" em codigo morse
     morsePonto();
     delay_ms(900);
     morsePonto();
     delay_ms(900);
     morsePonto();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
     morseTraco();
     delay_ms(900);
}
void emiteMatricula() {   // Codifica 202110331 em morse
     morse2();
     morse0();
     morse2();
     morse1();
     morse1();
     morse0();
     morse3();
     morse3();
     morse1();
}
void emiteIniciais() {   // Codifica JVSB em morse
     morseJ();
     morseV();
     morseS();
     morseB();
}

void main() {

     trisb = 1; //Seta PORTB para entrada;
     trisd = 0; //Seta PORTD para saida;
     
     while(1) {               //Loop infinito
            if(portb.rb0 == 0) {
                        emiteIniciais(); //Caso o PUSH BOTTOM RB0 seja precionado emite iniciais
            }
            if(portb.rb1 == 0) {
                         emiteMatricula(); //Caso o PUSH BOTTOM RB1 seja precionado emite matricula
            }
            portd = 0b00000000;
     }
     
}
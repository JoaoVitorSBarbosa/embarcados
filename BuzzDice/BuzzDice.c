void main () {
    int result1 = 0;
    int result2 = 0;

    trisc = 0b11111101; //Define todas as portas do PORT C como entrada menos a 1 que é saida
    trisb = 0b00000001; //Define todas as portas do PORT B como saida menos a 0 que é entrada
    trisd = 0b00000001; //Define todas as portas do PORT D como saida menos a 0 que é entrada

    portd = 0b00000000;      //Desliga todos os leds do potd
    portb = 0b00000000;      //Desliga todos os leds do potb
    portc = 0b00000010;  //Buzzer desligado
    // Loop infinito .
    while (1) {

          while ( portb.rb0 == 0) {
                result1  = (rand() % 6) + 1; //Aqui o primeiro resultado é calculado com o resto da divisão por 6 de um numero aleatorio, isso nos da um numero de 0 a 5, por isso somamos 1
                portb =  1 << result1;  //Desloca o bit 1 para 1 a 6 casas a esquerda
                result2  = (rand() % 6) + 1;  //Mesma forma que o primeiro resultaod
                portd =  1 << result2;  //Desloca o bit 1 para 1 a 6 casas a esquerda
          }

          portc.rc1 = !((result1 == 6) && (result2 == 6)); //Caso os dois resultados dee 6, liga o buzzer

   }
}
void main () {
     int result1 = 0;
     int result2 = 0;
     // trisc e uma posicao ( registrador ) na memoria de dados
     // do microcontrolador . Configura o pino RC1 como saida para
     // comunicacao com o buzzer .
    trisc = 0xFD; //Define todas as portas do PORT C como saida
    trisb = 0b000000001; //Define todas as portas do PORT B como saida menos a 0 que é entrada
    trisd = 0x00; //Define todas as portas do PORT D como saida

    portd = 0x00;
    portb = 0x00;
    // Loop infinito .
    while (1) {

          while ( portb.rb0 == 0) {
                result1  = (rand() % 6) + 1;
                portb =  1 << result1;
                result2  = (rand() % 6) + 1;
                portd =  1 << result2;
          }
          
          portc.rc1 = ((result1 == 6) && (result2 == 6));
    }
 }

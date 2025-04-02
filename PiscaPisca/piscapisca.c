/* ****************************************************************
**                          Exemplo 01                           **
**                                                               **
**     Exemplo para utilizacao de LEDs e pushbuttons do          **
**     kit com PIC18F452. Enquanto pushbutton RB0 estiver        **
**     presisonado, os LEDs (LED1 PORTD) piscarao alternando     **
**     o estado entre ligado e desligado.                        **
**                                                               **
**     Arquivo: piscapisca.c                                     **
**     Compilador : MikroC PRO PIC v6.4.0                        **
**                                                               **
**     UFLA - Lavras /MG - 10/05/2017                            **
******************************************************************/

void main ()
{
        // Ativa somente o pino RB0 como entrada da PORTB.
        // Os demais pinos sao configurados como saida.
        // Seta macro "trisb" com valor 0b00000001 (bin) = 0d1 (dec)
        trisb = 1;

        // Todos os pinos da PORTD (RD) sao configurados como saida.
        // Seta macro "trisd" com valor 0b0000000 (bin) = 0d0 (dec)
        trisd = 0;

        // Loop Infinito
        while (1)
        {
                // Le o estado do push button conectado ao pinon RB0.
                // Caso esteja pressionado (valor = 0), executa laco.
                while (portb.rb0 == 0)
                {
                        // Desliga todos os LEDs - 0b00000000 (bin) ou 0d0 (dec)
                        portd = 0;

                        // Aguarda 1 segundo
                        delay_ms(1000);

                        // Liga todos os LEDs - 0b11111111 (bin) ou 0d255 (dec)
                        portd = 0b11001010;

                        // Aguarda 1 segundo
                        delay_ms(1000) ;
                }
        }
}
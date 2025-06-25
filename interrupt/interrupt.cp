#line 1 "C:/Temp/interrupt/interrupt.c"
#line 11 "C:/Temp/interrupt/interrupt.c"
unsigned contador = 0;



void interrupt(){

 contador++;
 portd = contador;
 delay_ms(500);
 intcon.int0if = 0;

}



void main() {

 trisb.rb0 = 1;
 trisd = 0;
 portd = 0;

 intcon2.rbpu = 0;

 intcon2.intedg0 = 0;


 intcon = 0b11010000;









 while(1);

}

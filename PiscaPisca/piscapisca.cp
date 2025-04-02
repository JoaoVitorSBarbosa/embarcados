#line 1 "C:/Temp/PiscaPisca/piscapisca.c"
#line 15 "C:/Temp/PiscaPisca/piscapisca.c"
void main ()
{



 trisb = 1;



 trisd = 0;


 while (1)
 {


 while (portb.rb0 == 0)
 {

 portd = 0;


 delay_ms(1000);


 portd = 0b11001010;


 delay_ms(1000) ;
 }
 }
}

#line 1 "C:/Temp/PWM/PWM.c"
#line 12 "C:/Temp/PWM/PWM.c"
void main()
{
 int p;
#line 23 "C:/Temp/PWM/PWM.c"
 ADCON1 = 0b10001110;
#line 32 "C:/Temp/PWM/PWM.c"
 ADCON0 = 0b11000001;
 ADC_Init();
 trisa.ra0 = 1;
 PWM1_Init(2000);
 PWM1_Set_Duty(0);
 PWM1_start();


 while(1) {
 p=ADC_Get_Sample(0);
 p=p>>2;
 PWM1_Set_Duty(p);
 Delay_ms(100);
 }
 PWM1_Stop();
}

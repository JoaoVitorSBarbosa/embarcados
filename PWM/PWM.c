/****************************************************************************
Programa: Leitura AD e PWM
Objetivo: variar a velocidade da ventoinha a partir da variacao da tensao do
trimpot Anal0.
****************************************************************************/

// Compilador: MikroC PRO PIC v.6.40
// Placa: Kit PICGenios v3 com microcontrolador 18F452
// Chaves da placa: VENT, AN0
// Data: 2016

void main()
{
 int p;    //declara variavel p como int

  /*reconfigura e define pinos de A/D - ADCON1
  B7 - 1: justificado a direita
       0: justificado a esquerda
  B6 - 0: fonte de clock  oscilador RC interno do ADC
  B5 - NC
  B4 - NC
  B3:B0 = 0b1110 = apenas AN0, Vref+ = VDD, Vref- = GND  */
  ADCON1 = 0b10001110;

  /*reconfigura A/D - ADCON0
  B7:B6 - 0b11: fonte de clock e' o oscilador RC interno do ADC
  B5:B3 - 0b000: canal 0 - AN0
  B2 - status do CAD
  B1 - NC
  B0 - 1: ADC ligado
       0: ADC desligado                    */
  ADCON0 = 0b11000001;
  ADC_Init();
  trisa.ra0 = 1;     //programa pino RA0 como entrada - AN0
  PWM1_Init(2000);  //inicializa PWM, canal CCP1, com 2kHz
  PWM1_Set_Duty(0); //inicializa duty com 0
  PWM1_start();     //inicializa PWM

  
  while(1) {
        p=ADC_Get_Sample(0);      //le o canal AN0 e salva em P
        p=p>>2;          //converte o valor do AN0 em byte
        PWM1_Set_Duty(p);  //atribui o valor de p ao duty do PWM
        Delay_ms(100);      //aguarda delay de 100ms
  }
  PWM1_Stop();
}
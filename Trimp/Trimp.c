//************************************************************************
// Placa: KIT PICGENIOS com microcontrolador 18F452
// Objetivo: Ler o canal AN0 (RA0 - potenciometro) e mostrar nos LEDs
// Compilador: MikroC PRO v6.4
// Data: agosto 2017
// Obs.: fechar os dip-switchs LED1 e AN0
//************************************************************************

//**************** definicao de variaveis ********************************
unsigned int valor_AD = 0;     //define variavel
//************************************************************************

// Conexoes LCD do kit PICGenios com 18F
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
// Fim das conexoes

//************** programa principal **************************************
void main() {
  char         texto[16];        // string para envio de mensagens ao LCD
  unsigned int valor_AD;         // resultado da conversao AD
  float        temperatura;      // temperatura em graus Celsius
  int cont = 0;
  char unidade[16];
  ADCON0 = 0X00;    // Desliga CAD

  //todos os pinos do porta (AN0-AN4) e porte (AN5-AN7) como i/o de uso geral
  ADCON1 = 0x06;

  //trisd = 0x00;     //define portd como saida - LEDs
  trisd = 0x00;     //define todos pinos do portd como saida - LCD
  trisa = 0x04;     // define RA2/AN2 como entrada, outros pinos como saida
  trise = 0x00;     // define todos pinos do porte como sa?da - LCD
  trisb = 0xFF; //Define todas as portas to registrador B como entrada
  /*reconfigura e define pinos de A/D - ADCON1
  B7 - 1: justificado a direita
       0: justificado a esquerda
  B6 - 0: fonte de clock oscilador RC interno do ADC
  B5 - NC
  B4 - NC
  B3:B0 = 0b1110 = apenas AN0, Vref+ = VDD, Vref- = GND  */
  ADCON1 = 0b10001110;

  /*reconfigura A/D - ADCON0
  B7:B6 - 0b11: fonte de clock oscilador RC interno do ADC
  B5:B3 - 0b000: canal 0 - AN0
  B2 - status do CAD
  B1 - NC
  B0 - 1: ADC ligado
       0: ADC desligado                    */
  ADCON0 = 0b11000001;
  
  Lcd_Init();                  	//Inicializa o Display
  delay_ms(100);
  Lcd_Cmd(_LCD_CLEAR);         	//Limpa o Display
  delay_ms(100);
  Lcd_Cmd(_LCD_CURSOR_OFF);    	//Desabilita o cursor
  delay_ms(100);

  Lcd_Out(1,3,"LCD Pronto!!");	// Escreve no LCD na linha 1 coluna 4
  delay_ms(1000);
  Lcd_Cmd(_LCD_CLEAR);
  delay_ms(100);

  do {
    Lcd_Out(1,3,"Temperatura:");
    strcpy(texto,"");
    strcpy(unidade,"");
    if(portb.rb0 == 0) {
      cont = cont +1;
      if(cont > 3) {
        cont = 0;
      }
    }


    valor_AD =  ADC_Get_Sample(2);      //le canal 2 e salva
    temperatura = (float)valor_AD*((float)500/(float)1024); //converte para oC
    if(cont == 0) {
      strcpy(unidade," C");
    } else if(cont == 1) {
      strcpy(unidade," F");
      temperatura = (temperatura * 1.8) + 32;
    } else if(cont == 2) {
      strcpy(unidade," K");
      temperatura = temperatura + 273;
    }
    FloatToStr(temperatura, texto);   //converte valor temperatura em string
    strcat(texto, unidade);
    Lcd_Out(2,4,texto);
    
    delay_ms(1000);                  //delay de 100ms
    Lcd_Cmd(_LCD_CLEAR);
  } while (1);
}
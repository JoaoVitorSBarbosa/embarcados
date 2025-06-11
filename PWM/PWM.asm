
_main:

;PWM.c,12 :: 		void main()
;PWM.c,23 :: 		ADCON1 = 0b10001110;
	MOVLW       142
	MOVWF       ADCON1+0 
;PWM.c,32 :: 		ADCON0 = 0b11000001;
	MOVLW       193
	MOVWF       ADCON0+0 
;PWM.c,33 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;PWM.c,34 :: 		trisa.ra0 = 1;     //programa pino RA0 como entrada - AN0
	BSF         TRISA+0, 0 
;PWM.c,35 :: 		PWM1_Init(2000);  //inicializa PWM, canal CCP1, com 2kHz
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;PWM.c,36 :: 		PWM1_Set_Duty(0); //inicializa duty com 0
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;PWM.c,37 :: 		PWM1_start();     //inicializa PWM
	CALL        _PWM1_Start+0, 0
;PWM.c,40 :: 		while(1) {
L_main0:
;PWM.c,41 :: 		p=ADC_Get_Sample(0);      //le o canal AN0 e salva em P
	CLRF        FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
;PWM.c,42 :: 		p=p>>2;          //converte o valor do AN0 em byte
	MOVF        R0, 0 
	MOVWF       R2 
	MOVF        R1, 0 
	MOVWF       R3 
	RRCF        R3, 1 
	RRCF        R2, 1 
	BCF         R3, 7 
	BTFSC       R3, 6 
	BSF         R3, 7 
	RRCF        R3, 1 
	RRCF        R2, 1 
	BCF         R3, 7 
	BTFSC       R3, 6 
	BSF         R3, 7 
;PWM.c,43 :: 		PWM1_Set_Duty(p);  //atribui o valor de p ao duty do PWM
	MOVF        R2, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;PWM.c,44 :: 		Delay_ms(100);      //aguarda delay de 100ms
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;PWM.c,45 :: 		}
	GOTO        L_main0
;PWM.c,47 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

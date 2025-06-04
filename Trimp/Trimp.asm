
_main:

;Trimp.c,30 :: 		void main() {
;Trimp.c,34 :: 		int cont = 0;
	CLRF        main_cont_L0+0 
	CLRF        main_cont_L0+1 
;Trimp.c,36 :: 		ADCON0 = 0X00;    // Desliga CAD
	CLRF        ADCON0+0 
;Trimp.c,39 :: 		ADCON1 = 0x06;
	MOVLW       6
	MOVWF       ADCON1+0 
;Trimp.c,42 :: 		trisd = 0x00;     //define todos pinos do portd como saida - LCD
	CLRF        TRISD+0 
;Trimp.c,43 :: 		trisa = 0x04;     // define RA2/AN2 como entrada, outros pinos como saida
	MOVLW       4
	MOVWF       TRISA+0 
;Trimp.c,44 :: 		trise = 0x00;     // define todos pinos do porte como sa?da - LCD
	CLRF        TRISE+0 
;Trimp.c,45 :: 		trisb = 0xFF; //Define todas as portas to registrador B como entrada
	MOVLW       255
	MOVWF       TRISB+0 
;Trimp.c,53 :: 		ADCON1 = 0b10001110;
	MOVLW       142
	MOVWF       ADCON1+0 
;Trimp.c,62 :: 		ADCON0 = 0b11000001;
	MOVLW       193
	MOVWF       ADCON0+0 
;Trimp.c,64 :: 		Lcd_Init();                  	//Inicializa o Display
	CALL        _Lcd_Init+0, 0
;Trimp.c,65 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;Trimp.c,66 :: 		Lcd_Cmd(_LCD_CLEAR);         	//Limpa o Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Trimp.c,67 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
	NOP
;Trimp.c,68 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);    	//Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Trimp.c,69 :: 		delay_ms(100);
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
;Trimp.c,71 :: 		Lcd_Out(1,3,"LCD Pronto!!");	// Escreve no LCD na linha 1 coluna 4
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Trimp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Trimp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Trimp.c,72 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;Trimp.c,73 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Trimp.c,74 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
;Trimp.c,76 :: 		do {
L_main5:
;Trimp.c,77 :: 		Lcd_Out(1,3,"Temperatura:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Trimp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Trimp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Trimp.c,78 :: 		strcpy(texto,"");
	MOVLW       main_texto_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr3_Trimp+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr3_Trimp+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;Trimp.c,79 :: 		strcpy(unidade,"");
	MOVLW       main_unidade_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(main_unidade_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr4_Trimp+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr4_Trimp+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;Trimp.c,80 :: 		if(portb.rb0 == 0) {
	BTFSC       PORTB+0, 0 
	GOTO        L_main8
;Trimp.c,81 :: 		cont = cont +1;
	INFSNZ      main_cont_L0+0, 1 
	INCF        main_cont_L0+1, 1 
;Trimp.c,82 :: 		if(cont > 3) {
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_cont_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main17
	MOVF        main_cont_L0+0, 0 
	SUBLW       3
L__main17:
	BTFSC       STATUS+0, 0 
	GOTO        L_main9
;Trimp.c,83 :: 		cont = 0;
	CLRF        main_cont_L0+0 
	CLRF        main_cont_L0+1 
;Trimp.c,84 :: 		}
L_main9:
;Trimp.c,85 :: 		}
L_main8:
;Trimp.c,88 :: 		valor_AD =  ADC_Get_Sample(2);      //le canal 2 e salva
	MOVLW       2
	MOVWF       FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
;Trimp.c,89 :: 		temperatura = (float)valor_AD*((float)500/(float)1024); //converte para oC
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       main_temperatura_L0+0 
	MOVF        R1, 0 
	MOVWF       main_temperatura_L0+1 
	MOVF        R2, 0 
	MOVWF       main_temperatura_L0+2 
	MOVF        R3, 0 
	MOVWF       main_temperatura_L0+3 
;Trimp.c,90 :: 		if(cont == 0) {
	MOVLW       0
	XORWF       main_cont_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main18
	MOVLW       0
	XORWF       main_cont_L0+0, 0 
L__main18:
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
;Trimp.c,91 :: 		strcpy(unidade," C");
	MOVLW       main_unidade_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(main_unidade_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr5_Trimp+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr5_Trimp+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;Trimp.c,92 :: 		} else if(cont == 1) {
	GOTO        L_main11
L_main10:
	MOVLW       0
	XORWF       main_cont_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main19
	MOVLW       1
	XORWF       main_cont_L0+0, 0 
L__main19:
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
;Trimp.c,93 :: 		strcpy(unidade," F");
	MOVLW       main_unidade_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(main_unidade_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr6_Trimp+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr6_Trimp+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;Trimp.c,94 :: 		temperatura = (temperatura * 1.8) + 32;
	MOVF        main_temperatura_L0+0, 0 
	MOVWF       R0 
	MOVF        main_temperatura_L0+1, 0 
	MOVWF       R1 
	MOVF        main_temperatura_L0+2, 0 
	MOVWF       R2 
	MOVF        main_temperatura_L0+3, 0 
	MOVWF       R3 
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       102
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       main_temperatura_L0+0 
	MOVF        R1, 0 
	MOVWF       main_temperatura_L0+1 
	MOVF        R2, 0 
	MOVWF       main_temperatura_L0+2 
	MOVF        R3, 0 
	MOVWF       main_temperatura_L0+3 
;Trimp.c,95 :: 		} else if(cont == 2) {
	GOTO        L_main13
L_main12:
	MOVLW       0
	XORWF       main_cont_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main20
	MOVLW       2
	XORWF       main_cont_L0+0, 0 
L__main20:
	BTFSS       STATUS+0, 2 
	GOTO        L_main14
;Trimp.c,96 :: 		strcpy(unidade," K");
	MOVLW       main_unidade_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(main_unidade_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr7_Trimp+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr7_Trimp+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;Trimp.c,97 :: 		temperatura = temperatura + 273;
	MOVF        main_temperatura_L0+0, 0 
	MOVWF       R0 
	MOVF        main_temperatura_L0+1, 0 
	MOVWF       R1 
	MOVF        main_temperatura_L0+2, 0 
	MOVWF       R2 
	MOVF        main_temperatura_L0+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       128
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       main_temperatura_L0+0 
	MOVF        R1, 0 
	MOVWF       main_temperatura_L0+1 
	MOVF        R2, 0 
	MOVWF       main_temperatura_L0+2 
	MOVF        R3, 0 
	MOVWF       main_temperatura_L0+3 
;Trimp.c,98 :: 		}
L_main14:
L_main13:
L_main11:
;Trimp.c,99 :: 		FloatToStr(temperatura, texto);   //converte valor temperatura em string
	MOVF        main_temperatura_L0+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        main_temperatura_L0+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        main_temperatura_L0+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        main_temperatura_L0+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Trimp.c,100 :: 		strcat(texto, unidade);
	MOVLW       main_texto_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       main_unidade_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(main_unidade_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;Trimp.c,101 :: 		Lcd_Out(2,4,texto);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Trimp.c,103 :: 		delay_ms(1000);                  //delay de 100ms
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
	NOP
	NOP
;Trimp.c,104 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Trimp.c,105 :: 		} while (1);
	GOTO        L_main5
;Trimp.c,106 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

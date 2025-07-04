
_main:

;Pratica6.c,32 :: 		void main(){
;Pratica6.c,35 :: 		unsigned long int contador = 0;
	CLRF        main_contador_L0+0 
	CLRF        main_contador_L0+1 
	CLRF        main_contador_L0+2 
	CLRF        main_contador_L0+3 
	CLRF        main_contaux_L0+0 
	CLRF        main_contaux_L0+1 
;Pratica6.c,38 :: 		ADCON0  = 0x00; // Configura todos pinos para digital e
	CLRF        ADCON0+0 
;Pratica6.c,39 :: 		ADCON1  = 0x06; // desabilita o conversor A/D
	MOVLW       6
	MOVWF       ADCON1+0 
;Pratica6.c,41 :: 		trisd = 0;      // configura porta D como saida
	CLRF        TRISD+0 
;Pratica6.c,42 :: 		portd = 0;      // apaga todos os LEDs da porta D
	CLRF        PORTD+0 
;Pratica6.c,43 :: 		trisb = 0b00000001;
	MOVLW       1
	MOVWF       TRISB+0 
;Pratica6.c,44 :: 		trisc = 1;      // Entrada: RC0 ; os outros pinos sao saida
	MOVLW       1
	MOVWF       TRISC+0 
;Pratica6.c,45 :: 		portc.rc2 = 1;  // liga a ventoinha
	BSF         PORTC+0, 2 
;Pratica6.c,46 :: 		Lcd_Init();                  	//Inicializa o Display
	CALL        _Lcd_Init+0, 0
;Pratica6.c,47 :: 		delay_ms(100);
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
;Pratica6.c,48 :: 		Lcd_Cmd(_LCD_CLEAR);         	//Limpa o Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Pratica6.c,49 :: 		delay_ms(100);
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
;Pratica6.c,50 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);    	//Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Pratica6.c,51 :: 		delay_ms(100);
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
;Pratica6.c,53 :: 		Lcd_Out(1,3,"LCD Pronto!!");	// Escreve no LCD na linha 1 coluna 4
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Pratica6+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Pratica6+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Pratica6.c,54 :: 		delay_ms(1000);
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
;Pratica6.c,55 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Pratica6.c,56 :: 		delay_ms(100);
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
;Pratica6.c,57 :: 		Lcd_Out(1,1,"Numero de voltas");          // Exibe Numero de voltas na primeira linha do LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Pratica6+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Pratica6+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Pratica6.c,58 :: 		while(1) {
L_main5:
;Pratica6.c,61 :: 		while (portc.rc0 == 0)
L_main7:
	BTFSC       PORTC+0, 0 
	GOTO        L_main8
;Pratica6.c,62 :: 		delay_us(1);
	NOP
	NOP
	GOTO        L_main7
L_main8:
;Pratica6.c,63 :: 		while (portc.rc0 == 1)
L_main9:
	BTFSS       PORTC+0, 0 
	GOTO        L_main10
;Pratica6.c,64 :: 		delay_us(1);
	NOP
	NOP
	GOTO        L_main9
L_main10:
;Pratica6.c,66 :: 		contaux = contaux + 1;
	INFSNZ      main_contaux_L0+0, 1 
	INCF        main_contaux_L0+1, 1 
;Pratica6.c,67 :: 		if(contaux >= 7) {
	MOVLW       128
	XORWF       main_contaux_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main14
	MOVLW       7
	SUBWF       main_contaux_L0+0, 0 
L__main14:
	BTFSS       STATUS+0, 0 
	GOTO        L_main11
;Pratica6.c,68 :: 		contador = contador + 1;
	MOVLW       1
	ADDWF       main_contador_L0+0, 1 
	MOVLW       0
	ADDWFC      main_contador_L0+1, 1 
	ADDWFC      main_contador_L0+2, 1 
	ADDWFC      main_contador_L0+3, 1 
;Pratica6.c,69 :: 		contaux = 0;
	CLRF        main_contaux_L0+0 
	CLRF        main_contaux_L0+1 
;Pratica6.c,70 :: 		}
L_main11:
;Pratica6.c,71 :: 		IntToStr(contador,contadorString);        // Converte int em String para ser exibido no LCD
	MOVF        main_contador_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        main_contador_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_contadorString_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_contadorString_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Pratica6.c,73 :: 		Lcd_Out(2,6,contadorString);      // Exibe no LCD o contador
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_contadorString_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_contadorString_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Pratica6.c,74 :: 		if(portb.rb0 == 0) contador = 0;  // Zera o contador
	BTFSC       PORTB+0, 0 
	GOTO        L_main12
	CLRF        main_contador_L0+0 
	CLRF        main_contador_L0+1 
	CLRF        main_contador_L0+2 
	CLRF        main_contador_L0+3 
L_main12:
;Pratica6.c,76 :: 		}
	GOTO        L_main5
;Pratica6.c,77 :: 		} // fim do programa
L_end_main:
	GOTO        $+0
; end of _main

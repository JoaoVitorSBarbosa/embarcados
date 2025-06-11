
_main:

;ContLCD.c,33 :: 		void main() {
;ContLCD.c,35 :: 		ADCON0 = 0X00;    // Desliga CAD
	CLRF        ADCON0+0 
;ContLCD.c,38 :: 		ADCON1 = 0x06;
	MOVLW       6
	MOVWF       ADCON1+0 
;ContLCD.c,40 :: 		TRISD = 0;                // programa portD como saida
	CLRF        TRISD+0 
;ContLCD.c,41 :: 		TRISE = 0;                // programa portE como saida
	CLRF        TRISE+0 
;ContLCD.c,45 :: 		TRISC = 0x01;
	MOVLW       1
	MOVWF       TRISC+0 
;ContLCD.c,46 :: 		portc.rc2 = 1;   // liga a ventoinha do Kit PicGenios
	BSF         PORTC+0, 2 
;ContLCD.c,49 :: 		Lcd_Init();                      //Inicializa o Display
	CALL        _Lcd_Init+0, 0
;ContLCD.c,50 :: 		Delay_ms(100);                   // delay de 100 milisegundos
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
;ContLCD.c,51 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ContLCD.c,52 :: 		Delay_ms(100);                   // delay de 100 milisegundos
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
;ContLCD.c,53 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        //Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ContLCD.c,54 :: 		Delay_ms(100);                   // delay de 100 milisegundos
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
;ContLCD.c,80 :: 		*/
	MOVLW       131
	MOVWF       T1CON+0 
;ContLCD.c,83 :: 		TMR1H = 0x00;
	CLRF        TMR1H+0 
;ContLCD.c,84 :: 		TMR1L = 0x00;
	CLRF        TMR1L+0 
;ContLCD.c,86 :: 		Lcd_Out(1, 1,"Contagem: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_ContLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_ContLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ContLCD.c,87 :: 		Delay_ms(100);                   // delay de 100 milisegundos
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;ContLCD.c,89 :: 		do {
L_main4:
;ContLCD.c,90 :: 		contador = TMR1L;                // le o valor do timer1, parte baixa
	MOVF        TMR1L+0, 0 
	MOVWF       _contador+0 
	MOVLW       0
	MOVWF       _contador+1 
;ContLCD.c,91 :: 		contador = contador + TMR1H*256; // le o valor do timer1, parte alta
	MOVF        TMR1H+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        _contador+0, 0 
	ADDWF       R0, 1 
	MOVF        _contador+1, 0 
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       _contador+0 
	MOVF        R1, 0 
	MOVWF       _contador+1 
;ContLCD.c,93 :: 		WordToStr(contador, texto);      //converte valor para string
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _texto+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;ContLCD.c,94 :: 		Lcd_Out(2, 1,texto);             // escreve variavel texto
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _texto+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ContLCD.c,95 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
;ContLCD.c,96 :: 		} while(1);
	GOTO        L_main4
;ContLCD.c,97 :: 		} // Fim
L_end_main:
	GOTO        $+0
; end of _main

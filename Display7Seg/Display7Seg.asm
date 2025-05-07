
_mask:

;Display7Seg.c,25 :: 		unsigned short mask(unsigned short num) {
;Display7Seg.c,26 :: 		switch (num) {
	GOTO        L_mask0
;Display7Seg.c,27 :: 		case 0 : return 0x3F;
L_mask2:
	MOVLW       63
	MOVWF       R0 
	GOTO        L_end_mask
;Display7Seg.c,28 :: 		case 1 : return 0x06;
L_mask3:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_mask
;Display7Seg.c,29 :: 		case 2 : return 0x5B;
L_mask4:
	MOVLW       91
	MOVWF       R0 
	GOTO        L_end_mask
;Display7Seg.c,30 :: 		case 3 : return 0x4F;
L_mask5:
	MOVLW       79
	MOVWF       R0 
	GOTO        L_end_mask
;Display7Seg.c,31 :: 		case 4 : return 0x66;
L_mask6:
	MOVLW       102
	MOVWF       R0 
	GOTO        L_end_mask
;Display7Seg.c,32 :: 		case 5 : return 0x6D;
L_mask7:
	MOVLW       109
	MOVWF       R0 
	GOTO        L_end_mask
;Display7Seg.c,33 :: 		case 6 : return 0x7D;
L_mask8:
	MOVLW       125
	MOVWF       R0 
	GOTO        L_end_mask
;Display7Seg.c,34 :: 		case 7 : return 0x07;
L_mask9:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_mask
;Display7Seg.c,35 :: 		case 8 : return 0x7F;
L_mask10:
	MOVLW       127
	MOVWF       R0 
	GOTO        L_end_mask
;Display7Seg.c,36 :: 		case 9 : return 0x6F;
L_mask11:
	MOVLW       111
	MOVWF       R0 
	GOTO        L_end_mask
;Display7Seg.c,37 :: 		}
L_mask0:
	MOVF        FARG_mask_num+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_mask2
	MOVF        FARG_mask_num+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_mask3
	MOVF        FARG_mask_num+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_mask4
	MOVF        FARG_mask_num+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_mask5
	MOVF        FARG_mask_num+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_mask6
	MOVF        FARG_mask_num+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_mask7
	MOVF        FARG_mask_num+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_mask8
	MOVF        FARG_mask_num+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_mask9
	MOVF        FARG_mask_num+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_mask10
	MOVF        FARG_mask_num+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_mask11
;Display7Seg.c,38 :: 		}
L_end_mask:
	RETURN      0
; end of _mask

_escreve4Displays:

;Display7Seg.c,40 :: 		void escreve4Displays(int num1, int num2, int num3, int num4) {
;Display7Seg.c,41 :: 		PORTD = mask(num1);
	MOVF        FARG_escreve4Displays_num1+0, 0 
	MOVWF       FARG_mask_num+0 
	CALL        _mask+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;Display7Seg.c,42 :: 		porta.f2 = 1;     // Ativa display 1.
	BSF         PORTA+0, 2 
;Display7Seg.c,43 :: 		Delay_ms(tempo);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_escreve4Displays12:
	DECFSZ      R13, 1, 1
	BRA         L_escreve4Displays12
	DECFSZ      R12, 1, 1
	BRA         L_escreve4Displays12
	NOP
	NOP
;Display7Seg.c,44 :: 		porta.f2 = 0;     // Desativa display 1.
	BCF         PORTA+0, 2 
;Display7Seg.c,47 :: 		PORTD = mask(num2);
	MOVF        FARG_escreve4Displays_num2+0, 0 
	MOVWF       FARG_mask_num+0 
	CALL        _mask+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;Display7Seg.c,48 :: 		porta.f3 = 1;     // Ativa display 2.
	BSF         PORTA+0, 3 
;Display7Seg.c,49 :: 		Delay_ms(tempo);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_escreve4Displays13:
	DECFSZ      R13, 1, 1
	BRA         L_escreve4Displays13
	DECFSZ      R12, 1, 1
	BRA         L_escreve4Displays13
	NOP
	NOP
;Display7Seg.c,50 :: 		porta.f3 = 0;     // Desativa display 2.
	BCF         PORTA+0, 3 
;Display7Seg.c,53 :: 		PORTD = mask(num3);
	MOVF        FARG_escreve4Displays_num3+0, 0 
	MOVWF       FARG_mask_num+0 
	CALL        _mask+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;Display7Seg.c,54 :: 		porta.f4 = 1;     // Ativa display 3.
	BSF         PORTA+0, 4 
;Display7Seg.c,55 :: 		Delay_ms(tempo);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_escreve4Displays14:
	DECFSZ      R13, 1, 1
	BRA         L_escreve4Displays14
	DECFSZ      R12, 1, 1
	BRA         L_escreve4Displays14
	NOP
	NOP
;Display7Seg.c,56 :: 		porta.f4 = 0;     // Desativa display 3.
	BCF         PORTA+0, 4 
;Display7Seg.c,59 :: 		PORTD = mask(num4);
	MOVF        FARG_escreve4Displays_num4+0, 0 
	MOVWF       FARG_mask_num+0 
	CALL        _mask+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;Display7Seg.c,60 :: 		porta.f5 = 1;     // Ativa display 4.
	BSF         PORTA+0, 5 
;Display7Seg.c,61 :: 		Delay_ms(tempo);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_escreve4Displays15:
	DECFSZ      R13, 1, 1
	BRA         L_escreve4Displays15
	DECFSZ      R12, 1, 1
	BRA         L_escreve4Displays15
	NOP
	NOP
;Display7Seg.c,62 :: 		porta.f5 = 0;     // desativa display 4.
	BCF         PORTA+0, 5 
;Display7Seg.c,63 :: 		}
L_end_escreve4Displays:
	RETURN      0
; end of _escreve4Displays

_main:

;Display7Seg.c,66 :: 		void main(void) {
;Display7Seg.c,70 :: 		ADCON0 = 0X00;
	CLRF        ADCON0+0 
;Display7Seg.c,71 :: 		ADCON1 = 0X06;  	// desabilita conversor A/D.
	MOVLW       6
	MOVWF       ADCON1+0 
;Display7Seg.c,72 :: 		INTCON = 0;    	// desabilita interrupcoes.
	CLRF        INTCON+0 
;Display7Seg.c,73 :: 		TRISA  = 0;    	// configura portA como saida.
	CLRF        TRISA+0 
;Display7Seg.c,74 :: 		PORTA  = 0;
	CLRF        PORTA+0 
;Display7Seg.c,75 :: 		TRISD  = 0;    	// configura portD como saida.
	CLRF        TRISD+0 
;Display7Seg.c,76 :: 		PORTD  = 0;
	CLRF        PORTD+0 
;Display7Seg.c,77 :: 		TRISB = 0xFF; //Configura PORTB como saida
	MOVLW       255
	MOVWF       TRISB+0 
;Display7Seg.c,78 :: 		TRISC = 0b11111101; //Configura PORTC 1 como saida e o resto entrada
	MOVLW       253
	MOVWF       TRISC+0 
;Display7Seg.c,80 :: 		segundos = 0;
	CLRF        main_segundos_L0+0 
	CLRF        main_segundos_L0+1 
;Display7Seg.c,81 :: 		minutos = 0;
	CLRF        main_minutos_L0+0 
	CLRF        main_minutos_L0+1 
;Display7Seg.c,82 :: 		Buzzer = 1;
	BSF         PORTC+0, 1 
;Display7Seg.c,84 :: 		while(BotInit == 1) {
L_main18:
	BTFSS       PORTB+0, 2 
	GOTO        L_main19
;Display7Seg.c,85 :: 		if(BotIncremento == 0) {
	BTFSC       PORTB+0, 0 
	GOTO        L_main20
;Display7Seg.c,86 :: 		escreve4Displays(minutos / 10, minutos % 10, segundos / 10, segundos % 10 );
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_minutos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_minutos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num1+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num1+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_minutos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_minutos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num2+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num2+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_segundos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_segundos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num3+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num3+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_segundos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_segundos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num4+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num4+1 
	CALL        _escreve4Displays+0, 0
;Display7Seg.c,87 :: 		segundos++;
	INFSNZ      main_segundos_L0+0, 1 
	INCF        main_segundos_L0+1, 1 
;Display7Seg.c,88 :: 		if(segundos > 59) {
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_segundos_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main39
	MOVF        main_segundos_L0+0, 0 
	SUBLW       59
L__main39:
	BTFSC       STATUS+0, 0 
	GOTO        L_main21
;Display7Seg.c,89 :: 		segundos = 0;
	CLRF        main_segundos_L0+0 
	CLRF        main_segundos_L0+1 
;Display7Seg.c,90 :: 		minutos++;
	INFSNZ      main_minutos_L0+0, 1 
	INCF        main_minutos_L0+1, 1 
;Display7Seg.c,91 :: 		}
L_main21:
;Display7Seg.c,92 :: 		}
L_main20:
;Display7Seg.c,93 :: 		if(BotDecremento == 0) {
	BTFSC       PORTB+0, 1 
	GOTO        L_main22
;Display7Seg.c,94 :: 		escreve4Displays(minutos / 10, minutos % 10, segundos / 10, segundos % 10 );
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_minutos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_minutos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num1+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num1+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_minutos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_minutos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num2+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num2+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_segundos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_segundos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num3+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num3+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_segundos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_segundos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num4+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num4+1 
	CALL        _escreve4Displays+0, 0
;Display7Seg.c,95 :: 		segundos--;
	MOVLW       1
	SUBWF       main_segundos_L0+0, 1 
	MOVLW       0
	SUBWFB      main_segundos_L0+1, 1 
;Display7Seg.c,96 :: 		if(segundos <=0) {
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_segundos_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main40
	MOVF        main_segundos_L0+0, 0 
	SUBLW       0
L__main40:
	BTFSS       STATUS+0, 0 
	GOTO        L_main23
;Display7Seg.c,97 :: 		if(minutos == 0) {
	MOVLW       0
	XORWF       main_minutos_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main41
	MOVLW       0
	XORWF       main_minutos_L0+0, 0 
L__main41:
	BTFSS       STATUS+0, 2 
	GOTO        L_main24
;Display7Seg.c,98 :: 		segundos = 0;
	CLRF        main_segundos_L0+0 
	CLRF        main_segundos_L0+1 
;Display7Seg.c,99 :: 		} else {
	GOTO        L_main25
L_main24:
;Display7Seg.c,100 :: 		segundos = 59;
	MOVLW       59
	MOVWF       main_segundos_L0+0 
	MOVLW       0
	MOVWF       main_segundos_L0+1 
;Display7Seg.c,101 :: 		minutos--;
	MOVLW       1
	SUBWF       main_minutos_L0+0, 1 
	MOVLW       0
	SUBWFB      main_minutos_L0+1, 1 
;Display7Seg.c,102 :: 		}
L_main25:
;Display7Seg.c,103 :: 		}
L_main23:
;Display7Seg.c,104 :: 		}
L_main22:
;Display7Seg.c,105 :: 		escreve4Displays(minutos / 10, minutos % 10, segundos / 10, segundos % 10 );
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_minutos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_minutos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num1+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num1+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_minutos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_minutos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num2+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num2+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_segundos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_segundos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num3+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num3+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_segundos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_segundos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num4+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num4+1 
	CALL        _escreve4Displays+0, 0
;Display7Seg.c,106 :: 		}
	GOTO        L_main18
L_main19:
;Display7Seg.c,107 :: 		while((minutos > 0) || (segundos > 0)) {
L_main26:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_minutos_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main42
	MOVF        main_minutos_L0+0, 0 
	SUBLW       0
L__main42:
	BTFSS       STATUS+0, 0 
	GOTO        L__main35
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_segundos_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main43
	MOVF        main_segundos_L0+0, 0 
	SUBLW       0
L__main43:
	BTFSS       STATUS+0, 0 
	GOTO        L__main35
	GOTO        L_main27
L__main35:
;Display7Seg.c,108 :: 		tempAux = 50;
	MOVLW       50
	MOVWF       main_tempAux_L0+0 
	MOVLW       0
	MOVWF       main_tempAux_L0+1 
;Display7Seg.c,109 :: 		while(tempAux > 0) {
L_main30:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_tempAux_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main44
	MOVF        main_tempAux_L0+0, 0 
	SUBLW       0
L__main44:
	BTFSC       STATUS+0, 0 
	GOTO        L_main31
;Display7Seg.c,110 :: 		escreve4Displays(minutos / 10, minutos % 10, segundos / 10, segundos % 10 );
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_minutos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_minutos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num1+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num1+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_minutos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_minutos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num2+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num2+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_segundos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_segundos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num3+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num3+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_segundos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_segundos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num4+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num4+1 
	CALL        _escreve4Displays+0, 0
;Display7Seg.c,111 :: 		tempAux--;
	MOVLW       1
	SUBWF       main_tempAux_L0+0, 1 
	MOVLW       0
	SUBWFB      main_tempAux_L0+1, 1 
;Display7Seg.c,112 :: 		}
	GOTO        L_main30
L_main31:
;Display7Seg.c,113 :: 		segundos--;
	MOVLW       1
	SUBWF       main_segundos_L0+0, 1 
	MOVLW       0
	SUBWFB      main_segundos_L0+1, 1 
;Display7Seg.c,114 :: 		if(segundos < 0) {
	MOVLW       128
	XORWF       main_segundos_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main45
	MOVLW       0
	SUBWF       main_segundos_L0+0, 0 
L__main45:
	BTFSC       STATUS+0, 0 
	GOTO        L_main32
;Display7Seg.c,115 :: 		segundos = 59;
	MOVLW       59
	MOVWF       main_segundos_L0+0 
	MOVLW       0
	MOVWF       main_segundos_L0+1 
;Display7Seg.c,116 :: 		minutos--;
	MOVLW       1
	SUBWF       main_minutos_L0+0, 1 
	MOVLW       0
	SUBWFB      main_minutos_L0+1, 1 
;Display7Seg.c,117 :: 		}
L_main32:
;Display7Seg.c,118 :: 		}
	GOTO        L_main26
L_main27:
;Display7Seg.c,119 :: 		while(1) {
L_main33:
;Display7Seg.c,120 :: 		Buzzer = 0;
	BCF         PORTC+0, 1 
;Display7Seg.c,121 :: 		escreve4Displays(minutos / 10, minutos % 10, segundos / 10, segundos % 10 );
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_minutos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_minutos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num1+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num1+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_minutos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_minutos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num2+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num2+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_segundos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_segundos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num3+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num3+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_segundos_L0+0, 0 
	MOVWF       R0 
	MOVF        main_segundos_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_escreve4Displays_num4+0 
	MOVF        R1, 0 
	MOVWF       FARG_escreve4Displays_num4+1 
	CALL        _escreve4Displays+0, 0
;Display7Seg.c,122 :: 		}
	GOTO        L_main33
;Display7Seg.c,125 :: 		}   // Fim do programa principal.
L_end_main:
	GOTO        $+0
; end of _main

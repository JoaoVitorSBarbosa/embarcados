
_main:

;HoraLCD.c,31 :: 		void main() {
;HoraLCD.c,32 :: 		int hora = 0;
	CLRF        main_hora_L0+0 
	CLRF        main_hora_L0+1 
	CLRF        main_minuto_L0+0 
	CLRF        main_minuto_L0+1 
	CLRF        main_segundo_L0+0 
	CLRF        main_segundo_L0+1 
;HoraLCD.c,45 :: 		ADCON0  = 0x00;        // Configura todos pinos das portas para digital e
	CLRF        ADCON0+0 
;HoraLCD.c,46 :: 		ADCON1  = 0x06;       // desabilita o conversor A/D
	MOVLW       6
	MOVWF       ADCON1+0 
;HoraLCD.c,48 :: 		trisb = 0xFF; //Define todas as portas to registrador B como entrada
	MOVLW       255
	MOVWF       TRISB+0 
;HoraLCD.c,50 :: 		Lcd_Init();                  	//Inicializa o Display
	CALL        _Lcd_Init+0, 0
;HoraLCD.c,51 :: 		delay_ms(100);
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
;HoraLCD.c,52 :: 		Lcd_Cmd(_LCD_CLEAR);         	//Limpa o Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;HoraLCD.c,53 :: 		delay_ms(100);
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
;HoraLCD.c,54 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);    	//Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;HoraLCD.c,55 :: 		delay_ms(100);
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
;HoraLCD.c,57 :: 		Lcd_Out(1,3,"LCD Pronto!!");	// Escreve no LCD na linha 1 coluna 4
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_HoraLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_HoraLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;HoraLCD.c,58 :: 		delay_ms(1000);
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
;HoraLCD.c,59 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;HoraLCD.c,60 :: 		delay_ms(100);
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
;HoraLCD.c,62 :: 		while(1) {     //LOOP
L_main5:
;HoraLCD.c,65 :: 		IntToStr(hora,horaString);
	MOVF        main_hora_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        main_hora_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_horaString_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_horaString_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;HoraLCD.c,66 :: 		IntToStr(minuto,minutoString);
	MOVF        main_minuto_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        main_minuto_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_minutoString_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_minutoString_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;HoraLCD.c,67 :: 		IntToStr(segundo,segundoString);
	MOVF        main_segundo_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        main_segundo_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_segundoString_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_segundoString_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;HoraLCD.c,69 :: 		horaPtr = Ltrim(horaString);
	MOVLW       main_horaString_L0+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(main_horaString_L0+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       main_horaPtr_L0+0 
	MOVF        R1, 0 
	MOVWF       main_horaPtr_L0+1 
;HoraLCD.c,70 :: 		minutoPtr = Ltrim(minutoString);
	MOVLW       main_minutoString_L0+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(main_minutoString_L0+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       main_minutoPtr_L0+0 
	MOVF        R1, 0 
	MOVWF       main_minutoPtr_L0+1 
;HoraLCD.c,71 :: 		segundoPtr = Ltrim(segundoString);
	MOVLW       main_segundoString_L0+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(main_segundoString_L0+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       main_segundoPtr_L0+0 
	MOVF        R1, 0 
	MOVWF       main_segundoPtr_L0+1 
;HoraLCD.c,73 :: 		strcpy(horaString,horaPtr);
	MOVLW       main_horaString_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(main_horaString_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVF        main_horaPtr_L0+0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        main_horaPtr_L0+1, 0 
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;HoraLCD.c,74 :: 		strcpy(minutoString,minutoPtr);
	MOVLW       main_minutoString_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(main_minutoString_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVF        main_minutoPtr_L0+0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        main_minutoPtr_L0+1, 0 
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;HoraLCD.c,75 :: 		strcpy(segundoString,segundoPtr);
	MOVLW       main_segundoString_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(main_segundoString_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVF        main_segundoPtr_L0+0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        main_segundoPtr_L0+1, 0 
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;HoraLCD.c,77 :: 		strcpy(horario,"");
	MOVLW       main_horario_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(main_horario_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr2_HoraLCD+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr2_HoraLCD+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;HoraLCD.c,79 :: 		if(hora < 10) {
	MOVLW       128
	XORWF       main_hora_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main18
	MOVLW       10
	SUBWF       main_hora_L0+0, 0 
L__main18:
	BTFSC       STATUS+0, 0 
	GOTO        L_main7
;HoraLCD.c,80 :: 		strcat(horario, "0");
	MOVLW       main_horario_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(main_horario_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr3_HoraLCD+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr3_HoraLCD+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;HoraLCD.c,81 :: 		}
L_main7:
;HoraLCD.c,82 :: 		strcat(horario, horaPtr);
	MOVLW       main_horario_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(main_horario_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVF        main_horaPtr_L0+0, 0 
	MOVWF       FARG_strcat_from+0 
	MOVF        main_horaPtr_L0+1, 0 
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;HoraLCD.c,83 :: 		strcat(horario, ":");
	MOVLW       main_horario_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(main_horario_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr4_HoraLCD+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr4_HoraLCD+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;HoraLCD.c,85 :: 		if(minuto < 10) {
	MOVLW       128
	XORWF       main_minuto_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main19
	MOVLW       10
	SUBWF       main_minuto_L0+0, 0 
L__main19:
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
;HoraLCD.c,86 :: 		strcat(horario, "0");
	MOVLW       main_horario_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(main_horario_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr5_HoraLCD+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr5_HoraLCD+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;HoraLCD.c,87 :: 		}
L_main8:
;HoraLCD.c,88 :: 		strcat(horario, minutoPtr);
	MOVLW       main_horario_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(main_horario_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVF        main_minutoPtr_L0+0, 0 
	MOVWF       FARG_strcat_from+0 
	MOVF        main_minutoPtr_L0+1, 0 
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;HoraLCD.c,89 :: 		strcat(horario, ":");
	MOVLW       main_horario_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(main_horario_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr6_HoraLCD+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr6_HoraLCD+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;HoraLCD.c,91 :: 		if(segundo < 10) {
	MOVLW       128
	XORWF       main_segundo_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main20
	MOVLW       10
	SUBWF       main_segundo_L0+0, 0 
L__main20:
	BTFSC       STATUS+0, 0 
	GOTO        L_main9
;HoraLCD.c,92 :: 		strcat(horario, "0");
	MOVLW       main_horario_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(main_horario_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr7_HoraLCD+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr7_HoraLCD+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;HoraLCD.c,93 :: 		}
L_main9:
;HoraLCD.c,94 :: 		strcat(horario, segundoPtr);
	MOVLW       main_horario_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(main_horario_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVF        main_segundoPtr_L0+0, 0 
	MOVWF       FARG_strcat_from+0 
	MOVF        main_segundoPtr_L0+1, 0 
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;HoraLCD.c,97 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;HoraLCD.c,98 :: 		Lcd_Out(1,4,horario);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_horario_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_horario_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;HoraLCD.c,100 :: 		segundo = segundo + 1;
	INFSNZ      main_segundo_L0+0, 1 
	INCF        main_segundo_L0+1, 1 
;HoraLCD.c,102 :: 		if(segundo > 59) {
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_segundo_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main21
	MOVF        main_segundo_L0+0, 0 
	SUBLW       59
L__main21:
	BTFSC       STATUS+0, 0 
	GOTO        L_main10
;HoraLCD.c,103 :: 		segundo = 0;
	CLRF        main_segundo_L0+0 
	CLRF        main_segundo_L0+1 
;HoraLCD.c,104 :: 		minuto = minuto + 1;
	INFSNZ      main_minuto_L0+0, 1 
	INCF        main_minuto_L0+1, 1 
;HoraLCD.c,105 :: 		}
L_main10:
;HoraLCD.c,107 :: 		if(minuto > 59) {
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_minuto_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main22
	MOVF        main_minuto_L0+0, 0 
	SUBLW       59
L__main22:
	BTFSC       STATUS+0, 0 
	GOTO        L_main11
;HoraLCD.c,108 :: 		minuto = 0;
	CLRF        main_minuto_L0+0 
	CLRF        main_minuto_L0+1 
;HoraLCD.c,109 :: 		hora = hora + 1;
	INFSNZ      main_hora_L0+0, 1 
	INCF        main_hora_L0+1, 1 
;HoraLCD.c,110 :: 		}
L_main11:
;HoraLCD.c,111 :: 		if(hora > 23) {
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_hora_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main23
	MOVF        main_hora_L0+0, 0 
	SUBLW       23
L__main23:
	BTFSC       STATUS+0, 0 
	GOTO        L_main12
;HoraLCD.c,112 :: 		hora = 0;
	CLRF        main_hora_L0+0 
	CLRF        main_hora_L0+1 
;HoraLCD.c,113 :: 		}
L_main12:
;HoraLCD.c,117 :: 		if(portb.rb0 == 1) {
	BTFSS       PORTB+0, 0 
	GOTO        L_main13
;HoraLCD.c,118 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
	NOP
	NOP
;HoraLCD.c,119 :: 		}
	GOTO        L_main15
L_main13:
;HoraLCD.c,121 :: 		delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main16:
	DECFSZ      R13, 1, 1
	BRA         L_main16
	DECFSZ      R12, 1, 1
	BRA         L_main16
	NOP
;HoraLCD.c,122 :: 		}
L_main15:
;HoraLCD.c,124 :: 		}
	GOTO        L_main5
;HoraLCD.c,127 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

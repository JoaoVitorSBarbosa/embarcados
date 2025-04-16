
_main:

;BuzzDice.c,1 :: 		void main () {
;BuzzDice.c,2 :: 		int result1 = 0;
	CLRF        main_result1_L0+0 
	CLRF        main_result1_L0+1 
	CLRF        main_result2_L0+0 
	CLRF        main_result2_L0+1 
;BuzzDice.c,5 :: 		trisc = 0b11111101; //Define todas as portas do PORT C como entrada menos a 1 que é saida
	MOVLW       253
	MOVWF       TRISC+0 
;BuzzDice.c,6 :: 		trisb = 0b00000001; //Define todas as portas do PORT B como saida menos a 0 que é entrada
	MOVLW       1
	MOVWF       TRISB+0 
;BuzzDice.c,7 :: 		trisd = 0b00000001; //Define todas as portas do PORT D como saida menos a 0 que é entrada
	MOVLW       1
	MOVWF       TRISD+0 
;BuzzDice.c,9 :: 		portd = 0b00000000;      //Desliga todos os leds do potd
	CLRF        PORTD+0 
;BuzzDice.c,10 :: 		portb = 0b00000000;      //Desliga todos os leds do potb
	CLRF        PORTB+0 
;BuzzDice.c,11 :: 		portc = 0b00000010;  //Buzzer desligado
	MOVLW       2
	MOVWF       PORTC+0 
;BuzzDice.c,13 :: 		while (1) {
L_main0:
;BuzzDice.c,15 :: 		while ( portb.rb0 == 0) {
L_main2:
	BTFSC       PORTB+0, 0 
	GOTO        L_main3
;BuzzDice.c,16 :: 		result1  = (rand() % 6) + 1;  //
	CALL        _rand+0, 0
	MOVLW       6
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	INFSNZ      R0, 1 
	INCF        R1, 1 
	MOVF        R0, 0 
	MOVWF       main_result1_L0+0 
	MOVF        R1, 0 
	MOVWF       main_result1_L0+1 
;BuzzDice.c,17 :: 		portb =  1 << result1;
	MOVF        R0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__main7:
	BZ          L__main8
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__main7
L__main8:
	MOVF        R0, 0 
	MOVWF       PORTB+0 
;BuzzDice.c,18 :: 		result2  = (rand() % 6) + 1;
	CALL        _rand+0, 0
	MOVLW       6
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	INFSNZ      R0, 1 
	INCF        R1, 1 
	MOVF        R0, 0 
	MOVWF       main_result2_L0+0 
	MOVF        R1, 0 
	MOVWF       main_result2_L0+1 
;BuzzDice.c,19 :: 		portd =  1 << result2;
	MOVF        R0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__main9:
	BZ          L__main10
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__main9
L__main10:
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;BuzzDice.c,20 :: 		}
	GOTO        L_main2
L_main3:
;BuzzDice.c,22 :: 		portc.rc1 = !((result1 == 6) && (result2 == 6));
	MOVLW       0
	XORWF       main_result1_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main11
	MOVLW       6
	XORWF       main_result1_L0+0, 0 
L__main11:
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
	MOVLW       0
	XORWF       main_result2_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main12
	MOVLW       6
	XORWF       main_result2_L0+0, 0 
L__main12:
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
	MOVLW       1
	MOVWF       R1 
	GOTO        L_main4
L_main5:
	CLRF        R1 
L_main4:
	MOVF        R1, 1 
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__main13
	BCF         PORTC+0, 1 
	GOTO        L__main14
L__main13:
	BSF         PORTC+0, 1 
L__main14:
;BuzzDice.c,24 :: 		}
	GOTO        L_main0
;BuzzDice.c,25 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

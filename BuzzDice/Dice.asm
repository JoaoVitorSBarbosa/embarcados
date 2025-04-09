
_main:

;Dice.c,1 :: 		void main () {
;Dice.c,2 :: 		int result1 = 0;
	CLRF        main_result1_L0+0 
	CLRF        main_result1_L0+1 
	CLRF        main_result2_L0+0 
	CLRF        main_result2_L0+1 
;Dice.c,7 :: 		trisc = 0xFD; //Define todas as portas do PORT C como saida
	MOVLW       253
	MOVWF       TRISC+0 
;Dice.c,8 :: 		trisb = 0b000000001; //Define todas as portas do PORT B como saida menos a 0 que é entrada
	MOVLW       1
	MOVWF       TRISB+0 
;Dice.c,9 :: 		trisd = 0x00; //Define todas as portas do PORT D como saida
	CLRF        TRISD+0 
;Dice.c,11 :: 		portd = 0x00;
	CLRF        PORTD+0 
;Dice.c,12 :: 		portb = 0x00;
	CLRF        PORTB+0 
;Dice.c,14 :: 		while (1) {
L_main0:
;Dice.c,16 :: 		while ( portb.rb0 == 0) {
L_main2:
	BTFSC       PORTB+0, 0 
	GOTO        L_main3
;Dice.c,17 :: 		result1  = (rand() % 6) + 1;
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
;Dice.c,18 :: 		portb =  1 << result1;
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
;Dice.c,19 :: 		result2  = (rand() % 6) + 1;
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
;Dice.c,20 :: 		portd =  1 << result2;
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
;Dice.c,21 :: 		}
	GOTO        L_main2
L_main3:
;Dice.c,23 :: 		portc.rc1 = ((result1 == 6) && (result2 == 6));
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
	MOVWF       R0 
	GOTO        L_main4
L_main5:
	CLRF        R0 
L_main4:
	BTFSC       R0, 0 
	GOTO        L__main13
	BCF         PORTC+0, 1 
	GOTO        L__main14
L__main13:
	BSF         PORTC+0, 1 
L__main14:
;Dice.c,24 :: 		}
	GOTO        L_main0
;Dice.c,25 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

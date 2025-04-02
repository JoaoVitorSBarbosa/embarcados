
_main:

;piscapisca.c,15 :: 		void main ()
;piscapisca.c,20 :: 		trisb = 1;
	MOVLW       1
	MOVWF       TRISB+0 
;piscapisca.c,24 :: 		trisd = 0;
	CLRF        TRISD+0 
;piscapisca.c,27 :: 		while (1)
L_main0:
;piscapisca.c,31 :: 		while (portb.rb0 == 0)
L_main2:
	BTFSC       PORTB+0, 0 
	GOTO        L_main3
;piscapisca.c,34 :: 		portd = 0;
	CLRF        PORTD+0 
;piscapisca.c,37 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;piscapisca.c,40 :: 		portd = 0b11001010;
	MOVLW       202
	MOVWF       PORTD+0 
;piscapisca.c,43 :: 		delay_ms(1000) ;
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
;piscapisca.c,44 :: 		}
	GOTO        L_main2
L_main3:
;piscapisca.c,45 :: 		}
	GOTO        L_main0
;piscapisca.c,46 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

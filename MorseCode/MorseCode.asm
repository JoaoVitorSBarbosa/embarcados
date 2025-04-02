
_morsePonto:

;MorseCode.c,16 :: 		void morsePonto() { //Ligam os leds durande 0.2s
;MorseCode.c,17 :: 		portd = 0b11111111;
	MOVLW       255
	MOVWF       PORTD+0 
;MorseCode.c,18 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_morsePonto0:
	DECFSZ      R13, 1, 1
	BRA         L_morsePonto0
	DECFSZ      R12, 1, 1
	BRA         L_morsePonto0
	DECFSZ      R11, 1, 1
	BRA         L_morsePonto0
;MorseCode.c,19 :: 		portd = 0b00000000;
	CLRF        PORTD+0 
;MorseCode.c,20 :: 		}
L_end_morsePonto:
	RETURN      0
; end of _morsePonto

_morseTraco:

;MorseCode.c,21 :: 		void morseTraco() { //Ligam os leds durande 0.6s
;MorseCode.c,22 :: 		portd = 0b11111111;
	MOVLW       255
	MOVWF       PORTD+0 
;MorseCode.c,23 :: 		delay_ms(600);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_morseTraco1:
	DECFSZ      R13, 1, 1
	BRA         L_morseTraco1
	DECFSZ      R12, 1, 1
	BRA         L_morseTraco1
	DECFSZ      R11, 1, 1
	BRA         L_morseTraco1
	NOP
;MorseCode.c,24 :: 		portd = 0b00000000;
	CLRF        PORTD+0 
;MorseCode.c,25 :: 		}
L_end_morseTraco:
	RETURN      0
; end of _morseTraco

_morseJ:

;MorseCode.c,26 :: 		void morseJ () {  // Codifica a letra "J" em codigo morse
;MorseCode.c,27 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,28 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseJ2:
	DECFSZ      R13, 1, 1
	BRA         L_morseJ2
	DECFSZ      R12, 1, 1
	BRA         L_morseJ2
	DECFSZ      R11, 1, 1
	BRA         L_morseJ2
;MorseCode.c,29 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,30 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseJ3:
	DECFSZ      R13, 1, 1
	BRA         L_morseJ3
	DECFSZ      R12, 1, 1
	BRA         L_morseJ3
	DECFSZ      R11, 1, 1
	BRA         L_morseJ3
;MorseCode.c,31 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,32 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseJ4:
	DECFSZ      R13, 1, 1
	BRA         L_morseJ4
	DECFSZ      R12, 1, 1
	BRA         L_morseJ4
	DECFSZ      R11, 1, 1
	BRA         L_morseJ4
;MorseCode.c,33 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,34 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseJ5:
	DECFSZ      R13, 1, 1
	BRA         L_morseJ5
	DECFSZ      R12, 1, 1
	BRA         L_morseJ5
	DECFSZ      R11, 1, 1
	BRA         L_morseJ5
;MorseCode.c,35 :: 		}
L_end_morseJ:
	RETURN      0
; end of _morseJ

_morseV:

;MorseCode.c,36 :: 		void morseV () {  // Codifica a letra "V" em codigo morse
;MorseCode.c,37 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,38 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseV6:
	DECFSZ      R13, 1, 1
	BRA         L_morseV6
	DECFSZ      R12, 1, 1
	BRA         L_morseV6
	DECFSZ      R11, 1, 1
	BRA         L_morseV6
;MorseCode.c,39 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,40 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseV7:
	DECFSZ      R13, 1, 1
	BRA         L_morseV7
	DECFSZ      R12, 1, 1
	BRA         L_morseV7
	DECFSZ      R11, 1, 1
	BRA         L_morseV7
;MorseCode.c,41 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,42 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseV8:
	DECFSZ      R13, 1, 1
	BRA         L_morseV8
	DECFSZ      R12, 1, 1
	BRA         L_morseV8
	DECFSZ      R11, 1, 1
	BRA         L_morseV8
;MorseCode.c,43 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,44 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseV9:
	DECFSZ      R13, 1, 1
	BRA         L_morseV9
	DECFSZ      R12, 1, 1
	BRA         L_morseV9
	DECFSZ      R11, 1, 1
	BRA         L_morseV9
;MorseCode.c,45 :: 		}
L_end_morseV:
	RETURN      0
; end of _morseV

_morseS:

;MorseCode.c,46 :: 		void morseS () {  // Codifica a letra "S" em codigo morse
;MorseCode.c,47 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,48 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseS10:
	DECFSZ      R13, 1, 1
	BRA         L_morseS10
	DECFSZ      R12, 1, 1
	BRA         L_morseS10
	DECFSZ      R11, 1, 1
	BRA         L_morseS10
;MorseCode.c,49 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,50 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseS11:
	DECFSZ      R13, 1, 1
	BRA         L_morseS11
	DECFSZ      R12, 1, 1
	BRA         L_morseS11
	DECFSZ      R11, 1, 1
	BRA         L_morseS11
;MorseCode.c,51 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,52 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseS12:
	DECFSZ      R13, 1, 1
	BRA         L_morseS12
	DECFSZ      R12, 1, 1
	BRA         L_morseS12
	DECFSZ      R11, 1, 1
	BRA         L_morseS12
;MorseCode.c,53 :: 		}
L_end_morseS:
	RETURN      0
; end of _morseS

_morseB:

;MorseCode.c,54 :: 		void morseB () {  // Codifica a letra "B" em codigo morse
;MorseCode.c,55 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,56 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseB13:
	DECFSZ      R13, 1, 1
	BRA         L_morseB13
	DECFSZ      R12, 1, 1
	BRA         L_morseB13
	DECFSZ      R11, 1, 1
	BRA         L_morseB13
;MorseCode.c,57 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,58 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseB14:
	DECFSZ      R13, 1, 1
	BRA         L_morseB14
	DECFSZ      R12, 1, 1
	BRA         L_morseB14
	DECFSZ      R11, 1, 1
	BRA         L_morseB14
;MorseCode.c,59 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,60 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseB15:
	DECFSZ      R13, 1, 1
	BRA         L_morseB15
	DECFSZ      R12, 1, 1
	BRA         L_morseB15
	DECFSZ      R11, 1, 1
	BRA         L_morseB15
;MorseCode.c,61 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,62 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morseB16:
	DECFSZ      R13, 1, 1
	BRA         L_morseB16
	DECFSZ      R12, 1, 1
	BRA         L_morseB16
	DECFSZ      R11, 1, 1
	BRA         L_morseB16
;MorseCode.c,63 :: 		}
L_end_morseB:
	RETURN      0
; end of _morseB

_morse2:

;MorseCode.c,64 :: 		void morse2 () {  // Codifica o numero "2" em codigo morse
;MorseCode.c,65 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,66 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse217:
	DECFSZ      R13, 1, 1
	BRA         L_morse217
	DECFSZ      R12, 1, 1
	BRA         L_morse217
	DECFSZ      R11, 1, 1
	BRA         L_morse217
;MorseCode.c,67 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,68 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse218:
	DECFSZ      R13, 1, 1
	BRA         L_morse218
	DECFSZ      R12, 1, 1
	BRA         L_morse218
	DECFSZ      R11, 1, 1
	BRA         L_morse218
;MorseCode.c,69 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,70 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse219:
	DECFSZ      R13, 1, 1
	BRA         L_morse219
	DECFSZ      R12, 1, 1
	BRA         L_morse219
	DECFSZ      R11, 1, 1
	BRA         L_morse219
;MorseCode.c,71 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,72 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse220:
	DECFSZ      R13, 1, 1
	BRA         L_morse220
	DECFSZ      R12, 1, 1
	BRA         L_morse220
	DECFSZ      R11, 1, 1
	BRA         L_morse220
;MorseCode.c,73 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,74 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse221:
	DECFSZ      R13, 1, 1
	BRA         L_morse221
	DECFSZ      R12, 1, 1
	BRA         L_morse221
	DECFSZ      R11, 1, 1
	BRA         L_morse221
;MorseCode.c,75 :: 		}
L_end_morse2:
	RETURN      0
; end of _morse2

_morse0:

;MorseCode.c,76 :: 		void morse0 () {  // Codifica o numero "0" em codigo morse
;MorseCode.c,77 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,78 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse022:
	DECFSZ      R13, 1, 1
	BRA         L_morse022
	DECFSZ      R12, 1, 1
	BRA         L_morse022
	DECFSZ      R11, 1, 1
	BRA         L_morse022
;MorseCode.c,79 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,80 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse023:
	DECFSZ      R13, 1, 1
	BRA         L_morse023
	DECFSZ      R12, 1, 1
	BRA         L_morse023
	DECFSZ      R11, 1, 1
	BRA         L_morse023
;MorseCode.c,81 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,82 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse024:
	DECFSZ      R13, 1, 1
	BRA         L_morse024
	DECFSZ      R12, 1, 1
	BRA         L_morse024
	DECFSZ      R11, 1, 1
	BRA         L_morse024
;MorseCode.c,83 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,84 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse025:
	DECFSZ      R13, 1, 1
	BRA         L_morse025
	DECFSZ      R12, 1, 1
	BRA         L_morse025
	DECFSZ      R11, 1, 1
	BRA         L_morse025
;MorseCode.c,85 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,86 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse026:
	DECFSZ      R13, 1, 1
	BRA         L_morse026
	DECFSZ      R12, 1, 1
	BRA         L_morse026
	DECFSZ      R11, 1, 1
	BRA         L_morse026
;MorseCode.c,87 :: 		}
L_end_morse0:
	RETURN      0
; end of _morse0

_morse1:

;MorseCode.c,88 :: 		void morse1 () {  // Codifica o numero "1" em codigo morse
;MorseCode.c,89 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,90 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse127:
	DECFSZ      R13, 1, 1
	BRA         L_morse127
	DECFSZ      R12, 1, 1
	BRA         L_morse127
	DECFSZ      R11, 1, 1
	BRA         L_morse127
;MorseCode.c,91 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,92 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse128:
	DECFSZ      R13, 1, 1
	BRA         L_morse128
	DECFSZ      R12, 1, 1
	BRA         L_morse128
	DECFSZ      R11, 1, 1
	BRA         L_morse128
;MorseCode.c,93 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,94 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse129:
	DECFSZ      R13, 1, 1
	BRA         L_morse129
	DECFSZ      R12, 1, 1
	BRA         L_morse129
	DECFSZ      R11, 1, 1
	BRA         L_morse129
;MorseCode.c,95 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,96 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse130:
	DECFSZ      R13, 1, 1
	BRA         L_morse130
	DECFSZ      R12, 1, 1
	BRA         L_morse130
	DECFSZ      R11, 1, 1
	BRA         L_morse130
;MorseCode.c,97 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,98 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse131:
	DECFSZ      R13, 1, 1
	BRA         L_morse131
	DECFSZ      R12, 1, 1
	BRA         L_morse131
	DECFSZ      R11, 1, 1
	BRA         L_morse131
;MorseCode.c,99 :: 		}
L_end_morse1:
	RETURN      0
; end of _morse1

_morse3:

;MorseCode.c,100 :: 		void morse3 () {  // Codifica o numero "3" em codigo morse
;MorseCode.c,101 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,102 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse332:
	DECFSZ      R13, 1, 1
	BRA         L_morse332
	DECFSZ      R12, 1, 1
	BRA         L_morse332
	DECFSZ      R11, 1, 1
	BRA         L_morse332
;MorseCode.c,103 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,104 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse333:
	DECFSZ      R13, 1, 1
	BRA         L_morse333
	DECFSZ      R12, 1, 1
	BRA         L_morse333
	DECFSZ      R11, 1, 1
	BRA         L_morse333
;MorseCode.c,105 :: 		morsePonto();
	CALL        _morsePonto+0, 0
;MorseCode.c,106 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse334:
	DECFSZ      R13, 1, 1
	BRA         L_morse334
	DECFSZ      R12, 1, 1
	BRA         L_morse334
	DECFSZ      R11, 1, 1
	BRA         L_morse334
;MorseCode.c,107 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,108 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse335:
	DECFSZ      R13, 1, 1
	BRA         L_morse335
	DECFSZ      R12, 1, 1
	BRA         L_morse335
	DECFSZ      R11, 1, 1
	BRA         L_morse335
;MorseCode.c,109 :: 		morseTraco();
	CALL        _morseTraco+0, 0
;MorseCode.c,110 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_morse336:
	DECFSZ      R13, 1, 1
	BRA         L_morse336
	DECFSZ      R12, 1, 1
	BRA         L_morse336
	DECFSZ      R11, 1, 1
	BRA         L_morse336
;MorseCode.c,111 :: 		}
L_end_morse3:
	RETURN      0
; end of _morse3

_emiteMatricula:

;MorseCode.c,112 :: 		void emiteMatricula() {   // Codifica 202110331 em morse
;MorseCode.c,113 :: 		morse2();
	CALL        _morse2+0, 0
;MorseCode.c,114 :: 		morse0();
	CALL        _morse0+0, 0
;MorseCode.c,115 :: 		morse2();
	CALL        _morse2+0, 0
;MorseCode.c,116 :: 		morse1();
	CALL        _morse1+0, 0
;MorseCode.c,117 :: 		morse1();
	CALL        _morse1+0, 0
;MorseCode.c,118 :: 		morse0();
	CALL        _morse0+0, 0
;MorseCode.c,119 :: 		morse3();
	CALL        _morse3+0, 0
;MorseCode.c,120 :: 		morse3();
	CALL        _morse3+0, 0
;MorseCode.c,121 :: 		morse1();
	CALL        _morse1+0, 0
;MorseCode.c,122 :: 		}
L_end_emiteMatricula:
	RETURN      0
; end of _emiteMatricula

_emiteIniciais:

;MorseCode.c,123 :: 		void emiteIniciais() {   // Codifica JVSB em morse
;MorseCode.c,124 :: 		morseJ();
	CALL        _morseJ+0, 0
;MorseCode.c,125 :: 		morseV();
	CALL        _morseV+0, 0
;MorseCode.c,126 :: 		morseS();
	CALL        _morseS+0, 0
;MorseCode.c,127 :: 		morseB();
	CALL        _morseB+0, 0
;MorseCode.c,128 :: 		}
L_end_emiteIniciais:
	RETURN      0
; end of _emiteIniciais

_main:

;MorseCode.c,130 :: 		void main() {
;MorseCode.c,132 :: 		trisb = 1; //Seta PORTB para entrada;
	MOVLW       1
	MOVWF       TRISB+0 
;MorseCode.c,133 :: 		trisd = 0; //Seta PORTD para saida;
	CLRF        TRISD+0 
;MorseCode.c,135 :: 		while(1) {               //Loop infinito
L_main37:
;MorseCode.c,136 :: 		if(portb.rb0 == 0) {
	BTFSC       PORTB+0, 0 
	GOTO        L_main39
;MorseCode.c,137 :: 		emiteIniciais(); //Caso o PUSH BOTTOM RB0 seja precionado emite iniciais
	CALL        _emiteIniciais+0, 0
;MorseCode.c,138 :: 		}
L_main39:
;MorseCode.c,139 :: 		if(portb.rb1 == 0) {
	BTFSC       PORTB+0, 1 
	GOTO        L_main40
;MorseCode.c,140 :: 		emiteMatricula(); //Caso o PUSH BOTTOM RB1 seja precionado emite matricula
	CALL        _emiteMatricula+0, 0
;MorseCode.c,141 :: 		}
L_main40:
;MorseCode.c,142 :: 		portd = 0b00000000;
	CLRF        PORTD+0 
;MorseCode.c,143 :: 		}
	GOTO        L_main37
;MorseCode.c,145 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

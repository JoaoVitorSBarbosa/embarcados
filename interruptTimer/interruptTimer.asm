
_interrupt:

;interruptTimer.c,18 :: 		void interrupt(void) {
;interruptTimer.c,19 :: 		contagem++;          // incrementa vari?vel de contagem
	INFSNZ      _contagem+0, 1 
	INCF        _contagem+1, 1 
;interruptTimer.c,22 :: 		TMR0H = 0x85;
	MOVLW       133
	MOVWF       TMR0H+0 
;interruptTimer.c,23 :: 		TMR0L = 0xEE;
	MOVLW       238
	MOVWF       TMR0L+0 
;interruptTimer.c,25 :: 		INTCON.TMR0IF = 0;  // limpa flag de interrupcao do Timer0
	BCF         INTCON+0, 2 
;interruptTimer.c,26 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;interruptTimer.c,28 :: 		void main() {
;interruptTimer.c,30 :: 		TRISB = 0;           // configura PORTB como saida
	CLRF        TRISB+0 
;interruptTimer.c,31 :: 		PORTB = 0xFF;        // Initializa PORTB
	MOVLW       255
	MOVWF       PORTB+0 
;interruptTimer.c,34 :: 		T0CON = 0b10000111;
	MOVLW       135
	MOVWF       T0CON+0 
;interruptTimer.c,50 :: 		TMR0H = 0x85;
	MOVLW       133
	MOVWF       TMR0H+0 
;interruptTimer.c,51 :: 		TMR0L = 0xEE;
	MOVLW       238
	MOVWF       TMR0L+0 
;interruptTimer.c,53 :: 		INTCON = 0b11100000;       // Configura a interrupcao pelo TMR0
	MOVLW       224
	MOVWF       INTCON+0 
;interruptTimer.c,63 :: 		contagem = 0;              // Initializa contagem
	CLRF        _contagem+0 
	CLRF        _contagem+1 
;interruptTimer.c,65 :: 		do {
L_main0:
;interruptTimer.c,66 :: 		if (contagem == 5) {
	MOVLW       0
	XORWF       _contagem+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main7
	MOVLW       5
	XORWF       _contagem+0, 0 
L__main7:
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;interruptTimer.c,67 :: 		PORTB = ~PORTB;  // inverte estado dos LEDs
	COMF        PORTB+0, 1 
;interruptTimer.c,68 :: 		contagem = 0;    // Reinicia contagem
	CLRF        _contagem+0 
	CLRF        _contagem+1 
;interruptTimer.c,69 :: 		}
L_main3:
;interruptTimer.c,70 :: 		} while(1);          // Fim do loop
	GOTO        L_main0
;interruptTimer.c,71 :: 		}                      // Fim do programa
L_end_main:
	GOTO        $+0
; end of _main

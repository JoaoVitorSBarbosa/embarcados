
_interrupt:

;interrupt.c,15 :: 		void interrupt(){  //vetor de interrupcao
;interrupt.c,17 :: 		contador++;
	INFSNZ      _contador+0, 1 
	INCF        _contador+1, 1 
;interrupt.c,18 :: 		portd = contador;
	MOVF        _contador+0, 0 
	MOVWF       PORTD+0 
;interrupt.c,19 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_interrupt0:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt0
	DECFSZ      R12, 1, 1
	BRA         L_interrupt0
	DECFSZ      R11, 1, 1
	BRA         L_interrupt0
	NOP
	NOP
;interrupt.c,20 :: 		intcon.int0if = 0;  // apaga flag sinalizador de interrupcao externa INT0
	BCF         INTCON+0, 1 
;interrupt.c,22 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt

_main:

;interrupt.c,26 :: 		void main() {  //funcao principal do programa
;interrupt.c,28 :: 		trisb.rb0 = 1;    // configura pino RB0 como entrada - push-botton
	BSF         TRISB+0, 0 
;interrupt.c,29 :: 		trisd = 0;        // configura portd como saida - LEDs
	CLRF        TRISD+0 
;interrupt.c,30 :: 		portd = 0;        // resseta todos os pinos do portd - apaga LEDs
	CLRF        PORTD+0 
;interrupt.c,32 :: 		intcon2.rbpu = 0; // programa resistor de pull up interno do pic
	BCF         INTCON2+0, 7 
;interrupt.c,34 :: 		intcon2.intedg0 = 0;  //aciona interrupcao por borda de descida
	BCF         INTCON2+0, 6 
;interrupt.c,37 :: 		intcon = 0b11010000;
	MOVLW       208
	MOVWF       INTCON+0 
;interrupt.c,47 :: 		while(1);             // loop infinito aguardando a interrupcao
L_main1:
	GOTO        L_main1
;interrupt.c,49 :: 		}  // fim
L_end_main:
	GOTO        $+0
; end of _main

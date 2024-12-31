;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module delay
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __delay_us
	.globl __delay_ms
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	../delay.c: 3: void _delay_us(uint16_t microseconds) {
;	-----------------------------------------
;	 function _delay_us
;	-----------------------------------------
__delay_us:
;	../delay.c: 4: TIM4->PSCR = TIM4_PRESCALER_1; // Set prescaler
	mov	0x5345+0, #0x00
;	../delay.c: 8: TIM4->ARR = ((16000000L)/1000000) - 1;
	mov	0x5346+0, #0x0f
;	../delay.c: 11: TIM4->CR1 = TIM4_CR1_CEN; // Enable counter
	mov	0x5340+0, #0x01
00106$:
;	../delay.c: 13: for (; microseconds > 1; --microseconds) {
	ldw	y, x
	cpw	y, #0x0001
	jrugt	00132$
	ret
00132$:
;	../delay.c: 14: while ((TIM4->SR1 & TIM4_SR1_UIF) == 0);
00101$:
	btjf	0x5342, #0, 00101$
;	../delay.c: 17: TIM4->SR1 &= ~TIM4_SR1_UIF;
	bres	0x5342, #0
;	../delay.c: 13: for (; microseconds > 1; --microseconds) {
	decw	x
	jra	00106$
;	../delay.c: 19: }
	ret
;	../delay.c: 21: void _delay_ms(uint16_t milliseconds) {
;	-----------------------------------------
;	 function _delay_ms
;	-----------------------------------------
__delay_ms:
;	../delay.c: 22: while (milliseconds) {
00101$:
	tnzw	x
	jrne	00121$
	ret
00121$:
;	../delay.c: 23: _delay_us(1000);
	pushw	x
	ldw	x, #0x03e8
	call	__delay_us
	popw	x
;	../delay.c: 24: milliseconds--;
	decw	x
	jra	00101$
;	../delay.c: 26: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

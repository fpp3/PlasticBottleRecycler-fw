;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim2_GetCapture1
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM2_GetCapture1
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetCapture1.c: 47: uint16_t TIM2_GetCapture1(void)
;	-----------------------------------------
;	 function TIM2_GetCapture1
;	-----------------------------------------
_TIM2_GetCapture1:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetCapture1.c: 53: tmpccr1h = TIM2->CCR1H;
	ld	a, 0x530f
	ld	xh, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetCapture1.c: 54: tmpccr1l = TIM2->CCR1L;
	ld	a, 0x5310
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetCapture1.c: 56: tmpccr1 = (uint16_t)(tmpccr1l);
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetCapture1.c: 57: tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
	clr	(0x02, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetCapture1.c: 59: return (uint16_t)tmpccr1;
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetCapture1.c: 60: }
	addw	sp, #2
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_GetCapture2
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM3_GetCapture2
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetCapture2.c: 47: uint16_t TIM3_GetCapture2(void)
;	-----------------------------------------
;	 function TIM3_GetCapture2
;	-----------------------------------------
_TIM3_GetCapture2:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetCapture2.c: 53: tmpccr2h = TIM3->CCR2H;
	ld	a, 0x532f
	ld	xh, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetCapture2.c: 54: tmpccr2l = TIM3->CCR2L;
	ld	a, 0x5330
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetCapture2.c: 56: tmpccr2 = (uint16_t)(tmpccr2l);
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetCapture2.c: 57: tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
	clr	(0x02, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetCapture2.c: 59: return (uint16_t)tmpccr2;
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetCapture2.c: 60: }
	addw	sp, #2
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

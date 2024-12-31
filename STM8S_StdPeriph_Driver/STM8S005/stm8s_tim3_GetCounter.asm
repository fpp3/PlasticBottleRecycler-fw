;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_GetCounter
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM3_GetCounter
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetCounter.c: 47: uint16_t TIM3_GetCounter(void)
;	-----------------------------------------
;	 function TIM3_GetCounter
;	-----------------------------------------
_TIM3_GetCounter:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetCounter.c: 51: tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
	ld	a, 0x5328
	ld	xh, a
	clr	(0x02, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetCounter.c: 53: return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
	ld	a, 0x5329
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetCounter.c: 54: }
	addw	sp, #2
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

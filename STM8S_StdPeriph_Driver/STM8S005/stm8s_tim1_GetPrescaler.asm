;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_GetPrescaler
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_GetPrescaler
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetPrescaler.c: 47: uint16_t TIM1_GetPrescaler(void)
;	-----------------------------------------
;	 function TIM1_GetPrescaler
;	-----------------------------------------
_TIM1_GetPrescaler:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetPrescaler.c: 51: temp = ((uint16_t)TIM1->PSCRH << 8);
	ld	a, 0x5260
	ld	xh, a
	clr	(0x02, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetPrescaler.c: 54: return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
	ld	a, 0x5261
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetPrescaler.c: 55: }
	addw	sp, #2
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

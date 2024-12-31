;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_SetCompare3
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_SetCompare3
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SetCompare3.c: 48: void TIM1_SetCompare3(uint16_t Compare3)
;	-----------------------------------------
;	 function TIM1_SetCompare3
;	-----------------------------------------
_TIM1_SetCompare3:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SetCompare3.c: 51: TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
	ld	a, xh
	ld	0x5269, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SetCompare3.c: 52: TIM1->CCR3L = (uint8_t)(Compare3);
	ld	a, xl
	ld	0x526a, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SetCompare3.c: 53: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

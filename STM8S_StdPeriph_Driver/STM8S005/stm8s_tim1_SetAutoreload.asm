;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_SetAutoreload
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_SetAutoreload
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SetAutoreload.c: 48: void TIM1_SetAutoreload(uint16_t Autoreload)
;	-----------------------------------------
;	 function TIM1_SetAutoreload
;	-----------------------------------------
_TIM1_SetAutoreload:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SetAutoreload.c: 51: TIM1->ARRH = (uint8_t)(Autoreload >> 8);
	ld	a, xh
	ld	0x5262, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SetAutoreload.c: 52: TIM1->ARRL = (uint8_t)(Autoreload);
	ld	a, xl
	ld	0x5263, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SetAutoreload.c: 53: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

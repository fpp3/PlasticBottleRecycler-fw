;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim2_TimeBaseInit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM2_TimeBaseInit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_TimeBaseInit.c: 48: void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
;	-----------------------------------------
;	 function TIM2_TimeBaseInit
;	-----------------------------------------
_TIM2_TimeBaseInit:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_TimeBaseInit.c: 52: TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
	ld	0x530c, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_TimeBaseInit.c: 54: TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
	ld	a, xh
	ld	0x530d, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_TimeBaseInit.c: 55: TIM2->ARRL = (uint8_t)(TIM2_Period);
	ld	a, xl
	ld	0x530e, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_TimeBaseInit.c: 56: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

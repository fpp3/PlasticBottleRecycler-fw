;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_TimeBaseInit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM3_TimeBaseInit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_TimeBaseInit.c: 48: void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
;	-----------------------------------------
;	 function TIM3_TimeBaseInit
;	-----------------------------------------
_TIM3_TimeBaseInit:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_TimeBaseInit.c: 52: TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
	ld	0x532a, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_TimeBaseInit.c: 54: TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
	ld	a, xh
	ld	0x532b, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_TimeBaseInit.c: 55: TIM3->ARRL = (uint8_t)(TIM3_Period);
	ld	a, xl
	ld	0x532c, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_TimeBaseInit.c: 56: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_SetCounter
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM3_SetCounter
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_SetCounter.c: 48: void TIM3_SetCounter(uint16_t Counter)
;	-----------------------------------------
;	 function TIM3_SetCounter
;	-----------------------------------------
_TIM3_SetCounter:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_SetCounter.c: 51: TIM3->CNTRH = (uint8_t)(Counter >> 8);
	ld	a, xh
	ld	0x5328, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_SetCounter.c: 52: TIM3->CNTRL = (uint8_t)(Counter);
	ld	a, xl
	ld	0x5329, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_SetCounter.c: 53: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

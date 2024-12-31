;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_InternalClockConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_InternalClockConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_InternalClockConfig.c: 47: void TIM1_InternalClockConfig(void)
;	-----------------------------------------
;	 function TIM1_InternalClockConfig
;	-----------------------------------------
_TIM1_InternalClockConfig:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_InternalClockConfig.c: 50: TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
	ld	a, 0x5252
	and	a, #0xf8
	ld	0x5252, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_InternalClockConfig.c: 51: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

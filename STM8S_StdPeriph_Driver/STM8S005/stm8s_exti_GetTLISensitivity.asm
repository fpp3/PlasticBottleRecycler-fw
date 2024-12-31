;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_exti_GetTLISensitivity
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _EXTI_GetTLISensitivity
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
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetTLISensitivity.c: 46: EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
;	-----------------------------------------
;	 function EXTI_GetTLISensitivity
;	-----------------------------------------
_EXTI_GetTLISensitivity:
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetTLISensitivity.c: 51: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
	ld	a, 0x50a1
	and	a, #0x04
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetTLISensitivity.c: 53: return((EXTI_TLISensitivity_TypeDef)value);
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetTLISensitivity.c: 54: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

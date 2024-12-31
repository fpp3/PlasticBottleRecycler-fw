;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_exti_SetTLISensitivity
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _EXTI_SetTLISensitivity
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
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_SetTLISensitivity.c: 48: void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
;	-----------------------------------------
;	 function EXTI_SetTLISensitivity
;	-----------------------------------------
_EXTI_SetTLISensitivity:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_SetTLISensitivity.c: 51: assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
	ld	(0x01, sp), a
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x04
	jreq	00104$
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_SetTLISensitivity.c: 54: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
	ld	a, 0x50a1
	and	a, #0xfb
	ld	0x50a1, a
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_SetTLISensitivity.c: 55: EXTI->CR2 |= (uint8_t)(SensitivityValue);
	ld	a, 0x50a1
	or	a, (0x01, sp)
	ld	0x50a1, a
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_SetTLISensitivity.c: 56: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_exti_SetTLISensitivity.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

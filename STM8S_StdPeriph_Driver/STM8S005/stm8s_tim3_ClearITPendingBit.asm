;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_ClearITPendingBit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM3_ClearITPendingBit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ClearITPendingBit.c: 51: void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
;	-----------------------------------------
;	 function TIM3_ClearITPendingBit
;	-----------------------------------------
_TIM3_ClearITPendingBit:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ClearITPendingBit.c: 54: assert_param(IS_TIM3_IT_OK(TIM3_IT));
	tnz	a
	jreq	00103$
	cp	a, #0x07
	jrule	00104$
00103$:
	push	a
	push	#0x36
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ClearITPendingBit.c: 57: TIM3->SR1 = (uint8_t)(~TIM3_IT);
	cpl	a
	ld	0x5322, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ClearITPendingBit.c: 58: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim3_ClearITPendingBit.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

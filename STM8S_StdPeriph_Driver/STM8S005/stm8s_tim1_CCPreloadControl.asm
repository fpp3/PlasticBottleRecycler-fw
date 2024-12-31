;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_CCPreloadControl
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_CCPreloadControl
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCPreloadControl.c: 48: void TIM1_CCPreloadControl(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_CCPreloadControl
;	-----------------------------------------
_TIM1_CCPreloadControl:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCPreloadControl.c: 51: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	ld	(0x01, sp), a
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCPreloadControl.c: 56: TIM1->CR2 |= TIM1_CR2_CCPC;
	ld	a, 0x5251
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCPreloadControl.c: 54: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCPreloadControl.c: 56: TIM1->CR2 |= TIM1_CR2_CCPC;
	or	a, #0x01
	ld	0x5251, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCPreloadControl.c: 60: TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
	and	a, #0xfe
	ld	0x5251, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCPreloadControl.c: 62: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCPreloadControl.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

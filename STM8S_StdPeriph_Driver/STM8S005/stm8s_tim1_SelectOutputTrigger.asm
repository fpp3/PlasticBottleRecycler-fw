;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_SelectOutputTrigger
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_SelectOutputTrigger
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOutputTrigger.c: 55: void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
;	-----------------------------------------
;	 function TIM1_SelectOutputTrigger
;	-----------------------------------------
_TIM1_SelectOutputTrigger:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOutputTrigger.c: 58: assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
	tnz	a
	jreq	00104$
	cp	a, #0x10
	jreq	00104$
	cp	a, #0x20
	jreq	00104$
	cp	a, #0x30
	jreq	00104$
	cp	a, #0x40
	jreq	00104$
	cp	a, #0x50
	jreq	00104$
	cp	a, #0x60
	jreq	00104$
	push	a
	push	#0x3a
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOutputTrigger.c: 61: TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
	ldw	x, #0x5251
	push	a
	ld	a, (x)
	and	a, #0x8f
	ld	(0x02, sp), a
	pop	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOutputTrigger.c: 62: (uint8_t) TIM1_TRGOSource);
	or	a, (0x01, sp)
	ld	0x5251, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOutputTrigger.c: 63: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOutputTrigger"
	.ascii ".c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

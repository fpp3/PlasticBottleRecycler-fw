;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_SelectOCxM
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM3_SelectOCxM
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_SelectOCxM.c: 61: void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
;	-----------------------------------------
;	 function TIM3_SelectOCxM
;	-----------------------------------------
_TIM3_SelectOCxM:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_SelectOCxM.c: 64: assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
	ld	(0x01, sp), a
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	push	#0x40
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_SelectOCxM.c: 65: assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
	tnz	(0x04, sp)
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x10
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x20
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x30
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x60
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x70
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x50
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x40
	jreq	00112$
	push	#0x41
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00112$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_SelectOCxM.c: 70: TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
	ld	a, 0x5327
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_SelectOCxM.c: 67: if (TIM3_Channel == TIM3_CHANNEL_1)
	tnz	(0x01, sp)
	jrne	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_SelectOCxM.c: 70: TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
	and	a, #0xfe
	ld	0x5327, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_SelectOCxM.c: 73: TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
	ld	a, 0x5325
	and	a, #0x8f
	or	a, (0x04, sp)
	ld	0x5325, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_SelectOCxM.c: 78: TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
	and	a, #0xef
	ld	0x5327, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_SelectOCxM.c: 81: TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
	ld	a, 0x5326
	and	a, #0x8f
	or	a, (0x04, sp)
	ld	0x5326, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_SelectOCxM.c: 83: }
	pop	a
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim3_SelectOCxM.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

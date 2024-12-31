;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_SelectOCxM
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_SelectOCxM
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 63: void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
;	-----------------------------------------
;	 function TIM1_SelectOCxM
;	-----------------------------------------
_TIM1_SelectOCxM:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 66: assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
	ld	(0x03, sp), a
	dec	a
	jrne	00252$
	ld	a, #0x01
	ld	(0x01, sp), a
	.byte 0xc5
00252$:
	clr	(0x01, sp)
00253$:
	ld	a, (0x03, sp)
	sub	a, #0x02
	jrne	00255$
	inc	a
	ld	(0x02, sp), a
	.byte 0xc5
00255$:
	clr	(0x02, sp)
00256$:
	tnz	(0x03, sp)
	jreq	00113$
	tnz	(0x01, sp)
	jrne	00113$
	tnz	(0x02, sp)
	jrne	00113$
	ld	a, (0x03, sp)
	cp	a, #0x03
	jreq	00113$
	push	#0x42
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 67: assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
	tnz	(0x06, sp)
	jreq	00124$
	ld	a, (0x06, sp)
	cp	a, #0x10
	jreq	00124$
	ld	a, (0x06, sp)
	cp	a, #0x20
	jreq	00124$
	ld	a, (0x06, sp)
	cp	a, #0x30
	jreq	00124$
	ld	a, (0x06, sp)
	cp	a, #0x60
	jreq	00124$
	ld	a, (0x06, sp)
	cp	a, #0x70
	jreq	00124$
	ld	a, (0x06, sp)
	cp	a, #0x50
	jreq	00124$
	ld	a, (0x06, sp)
	cp	a, #0x40
	jreq	00124$
	push	#0x43
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00124$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 69: if (TIM1_Channel == TIM1_CHANNEL_1)
	tnz	(0x03, sp)
	jrne	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 72: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
	bres	0x525c, #0
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 75: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
	ld	a, 0x5258
	and	a, #0x8f
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 76: | (uint8_t)TIM1_OCMode);
	or	a, (0x06, sp)
	ld	0x5258, a
	jra	00110$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 78: else if (TIM1_Channel == TIM1_CHANNEL_2)
	ld	a, (0x01, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 81: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
	bres	0x525c, #4
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 84: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
	ld	a, 0x5259
	and	a, #0x8f
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 85: | (uint8_t)TIM1_OCMode);
	or	a, (0x06, sp)
	ld	0x5259, a
	jra	00110$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 90: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
	ld	a, 0x525d
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 87: else if (TIM1_Channel == TIM1_CHANNEL_3)
	ld	a, (0x02, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 90: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
	ld	a, xl
	and	a, #0xfe
	ld	0x525d, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 93: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
	ld	a, 0x525a
	and	a, #0x8f
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 94: | (uint8_t)TIM1_OCMode);
	or	a, (0x06, sp)
	ld	0x525a, a
	jra	00110$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 99: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
	ld	a, xl
	and	a, #0xef
	ld	0x525d, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 102: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
	ld	a, 0x525b
	and	a, #0x8f
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 103: | (uint8_t)TIM1_OCMode);
	or	a, (0x06, sp)
	ld	0x525b, a
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c: 105: }
	addw	sp, #3
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectOCxM.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

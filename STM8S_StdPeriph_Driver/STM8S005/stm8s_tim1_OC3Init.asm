;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_OC3Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_OC3Init
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 61: void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
;	-----------------------------------------
;	 function TIM1_OC3Init
;	-----------------------------------------
_TIM1_OC3Init:
	sub	sp, #4
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 71: assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
	ld	(0x04, sp), a
	jreq	00104$
	ld	a, (0x04, sp)
	cp	a, #0x10
	jreq	00104$
	ld	a, (0x04, sp)
	cp	a, #0x20
	jreq	00104$
	ld	a, (0x04, sp)
	cp	a, #0x30
	jreq	00104$
	ld	a, (0x04, sp)
	cp	a, #0x60
	jreq	00104$
	ld	a, (0x04, sp)
	cp	a, #0x70
	jreq	00104$
	push	#0x47
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 72: assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
	tnz	(0x07, sp)
	jreq	00121$
	ld	a, (0x07, sp)
	cp	a, #0x11
	jreq	00121$
	push	#0x48
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00121$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 73: assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
	tnz	(0x08, sp)
	jreq	00126$
	ld	a, (0x08, sp)
	cp	a, #0x44
	jreq	00126$
	push	#0x49
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00126$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 74: assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
	tnz	(0x0b, sp)
	jreq	00131$
	ld	a, (0x0b, sp)
	cp	a, #0x22
	jreq	00131$
	push	#0x4a
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00131$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 75: assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
	tnz	(0x0c, sp)
	jreq	00136$
	ld	a, (0x0c, sp)
	cp	a, #0x88
	jreq	00136$
	push	#0x4b
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00136$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 76: assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
	ld	a, (0x0d, sp)
	cp	a, #0x55
	jreq	00141$
	tnz	(0x0d, sp)
	jreq	00141$
	push	#0x4c
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00141$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 77: assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
	ld	a, (0x0e, sp)
	cp	a, #0x2a
	jreq	00146$
	tnz	(0x0e, sp)
	jreq	00146$
	push	#0x4d
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00146$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 81: TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
	ld	a, 0x525d
	and	a, #0xf0
	ld	0x525d, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 85: TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
	ld	a, 0x525d
	ld	(0x01, sp), a
	ld	a, (0x07, sp)
	and	a, #0x01
	ld	(0x03, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 86: (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
	ld	a, (0x08, sp)
	and	a, #0x04
	or	a, (0x03, sp)
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 87: (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
	ld	a, (0x0b, sp)
	and	a, #0x02
	ld	(0x03, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 88: (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
	ld	a, (0x0c, sp)
	and	a, #0x08
	or	a, (0x03, sp)
	or	a, (0x02, sp)
	or	a, (0x01, sp)
	ld	0x525d, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 91: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
	ld	a, 0x525a
	and	a, #0x8f
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 92: (uint8_t)TIM1_OCMode);
	or	a, (0x04, sp)
	ld	0x525a, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 95: TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
	ld	a, 0x526f
	and	a, #0xcf
	ld	0x526f, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 97: TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
	ld	a, 0x526f
	ld	(0x02, sp), a
	ld	a, (0x0d, sp)
	and	a, #0x10
	ld	(0x03, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 98: (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
	ld	a, (0x0e, sp)
	and	a, #0x20
	or	a, (0x03, sp)
	or	a, (0x02, sp)
	ld	0x526f, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 101: TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
	ld	a, (0x09, sp)
	ld	0x5269, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 102: TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
	ld	a, (0x0a, sp)
	ld	0x526a, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c: 103: }
	ldw	x, (5, sp)
	addw	sp, #14
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3Init.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

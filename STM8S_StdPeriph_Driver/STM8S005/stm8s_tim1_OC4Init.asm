;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_OC4Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_OC4Init
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 55: void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
;	-----------------------------------------
;	 function TIM1_OC4Init
;	-----------------------------------------
_TIM1_OC4Init:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 62: assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
	ld	(0x03, sp), a
	jreq	00107$
	ld	a, (0x03, sp)
	cp	a, #0x10
	jreq	00107$
	ld	a, (0x03, sp)
	cp	a, #0x20
	jreq	00107$
	ld	a, (0x03, sp)
	cp	a, #0x30
	jreq	00107$
	ld	a, (0x03, sp)
	cp	a, #0x60
	jreq	00107$
	ld	a, (0x03, sp)
	cp	a, #0x70
	jreq	00107$
	push	#0x3e
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 63: assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
	tnz	(0x06, sp)
	jreq	00124$
	ld	a, (0x06, sp)
	cp	a, #0x11
	jreq	00124$
	push	#0x3f
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00124$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 64: assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
	tnz	(0x09, sp)
	jreq	00129$
	ld	a, (0x09, sp)
	cp	a, #0x22
	jreq	00129$
	push	#0x40
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00129$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 65: assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
	ld	a, (0x0a, sp)
	cp	a, #0x55
	jreq	00134$
	tnz	(0x0a, sp)
	jreq	00134$
	push	#0x41
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00134$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 68: TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
	ld	a, 0x525d
	and	a, #0xcf
	ld	0x525d, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 70: TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
	ld	a, 0x525d
	ld	(0x01, sp), a
	ld	a, (0x06, sp)
	and	a, #0x10
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 71: (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
	ld	a, (0x09, sp)
	and	a, #0x20
	or	a, (0x02, sp)
	or	a, (0x01, sp)
	ld	0x525d, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 74: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
	ld	a, 0x525b
	and	a, #0x8f
	or	a, (0x03, sp)
	ld	0x525b, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 80: TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
	ld	a, 0x526f
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 78: if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
	tnz	(0x0a, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 80: TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
	or	a, #0xdf
	ld	0x526f, a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 84: TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
	and	a, #0xbf
	ld	0x526f, a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 88: TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
	ld	a, (0x07, sp)
	ld	0x526b, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 89: TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
	ld	a, (0x08, sp)
	ld	0x526c, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c: 90: }
	ldw	x, (4, sp)
	addw	sp, #10
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4Init.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

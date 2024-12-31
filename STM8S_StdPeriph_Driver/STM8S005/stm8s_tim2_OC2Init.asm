;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim2_OC2Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM2_OC2Init
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC2Init.c: 50: void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
;	-----------------------------------------
;	 function TIM2_OC2Init
;	-----------------------------------------
_TIM2_OC2Init:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC2Init.c: 56: assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
	ld	(0x03, sp), a
	jreq	00104$
	ld	a, (0x03, sp)
	cp	a, #0x10
	jreq	00104$
	ld	a, (0x03, sp)
	cp	a, #0x20
	jreq	00104$
	ld	a, (0x03, sp)
	cp	a, #0x30
	jreq	00104$
	ld	a, (0x03, sp)
	cp	a, #0x60
	jreq	00104$
	ld	a, (0x03, sp)
	cp	a, #0x70
	jreq	00104$
	push	#0x38
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC2Init.c: 57: assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
	tnz	(0x06, sp)
	jreq	00121$
	ld	a, (0x06, sp)
	cp	a, #0x11
	jreq	00121$
	push	#0x39
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00121$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC2Init.c: 58: assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
	tnz	(0x09, sp)
	jreq	00126$
	ld	a, (0x09, sp)
	cp	a, #0x22
	jreq	00126$
	push	#0x3a
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00126$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC2Init.c: 62: TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
	ld	a, 0x5308
	and	a, #0xcf
	ld	0x5308, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC2Init.c: 64: TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
	ld	a, 0x5308
	ld	(0x01, sp), a
	ld	a, (0x06, sp)
	and	a, #0x10
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC2Init.c: 65: (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
	ld	a, (0x09, sp)
	and	a, #0x20
	or	a, (0x02, sp)
	or	a, (0x01, sp)
	ld	0x5308, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC2Init.c: 69: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
	ld	a, 0x5306
	and	a, #0x8f
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC2Init.c: 70: (uint8_t)TIM2_OCMode);
	or	a, (0x03, sp)
	ld	0x5306, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC2Init.c: 74: TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
	ld	a, (0x07, sp)
	ld	0x5311, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC2Init.c: 75: TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
	ld	a, (0x08, sp)
	ld	0x5312, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC2Init.c: 76: }
	ldw	x, (4, sp)
	addw	sp, #9
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC2Init.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

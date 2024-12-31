;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_OC2Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM3_OC2Init
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC2Init.c: 50: void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
;	-----------------------------------------
;	 function TIM3_OC2Init
;	-----------------------------------------
_TIM3_OC2Init:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC2Init.c: 56: assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC2Init.c: 57: assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC2Init.c: 58: assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC2Init.c: 62: TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
	ld	a, 0x5327
	and	a, #0xcf
	ld	0x5327, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC2Init.c: 64: TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
	ld	a, 0x5327
	ld	(0x01, sp), a
	ld	a, (0x06, sp)
	and	a, #0x10
	ld	(0x02, sp), a
	ld	a, (0x09, sp)
	and	a, #0x20
	or	a, (0x02, sp)
	or	a, (0x01, sp)
	ld	0x5327, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC2Init.c: 68: TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
	ld	a, 0x5326
	and	a, #0x8f
	or	a, (0x03, sp)
	ld	0x5326, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC2Init.c: 72: TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
	ld	a, (0x07, sp)
	ld	0x532f, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC2Init.c: 73: TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
	ld	a, (0x08, sp)
	ld	0x5330, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC2Init.c: 74: }
	ldw	x, (4, sp)
	addw	sp, #9
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC2Init.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

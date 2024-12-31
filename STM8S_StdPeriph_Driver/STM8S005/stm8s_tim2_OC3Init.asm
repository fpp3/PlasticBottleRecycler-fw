;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim2_OC3Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM2_OC3Init
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC3Init.c: 50: void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
;	-----------------------------------------
;	 function TIM2_OC3Init
;	-----------------------------------------
_TIM2_OC3Init:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC3Init.c: 56: assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC3Init.c: 57: assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC3Init.c: 58: assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC3Init.c: 60: TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
	ld	a, 0x5309
	and	a, #0xfc
	ld	0x5309, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC3Init.c: 62: TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
	ld	a, 0x5309
	ld	(0x01, sp), a
	ld	a, (0x06, sp)
	and	a, #0x01
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC3Init.c: 63: (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
	ld	a, (0x09, sp)
	and	a, #0x02
	or	a, (0x02, sp)
	or	a, (0x01, sp)
	ld	0x5309, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC3Init.c: 66: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
	ld	a, 0x5307
	and	a, #0x8f
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC3Init.c: 67: (uint8_t)TIM2_OCMode);
	or	a, (0x03, sp)
	ld	0x5307, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC3Init.c: 70: TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
	ld	a, (0x07, sp)
	ld	0x5313, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC3Init.c: 71: TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
	ld	a, (0x08, sp)
	ld	0x5314, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC3Init.c: 72: }
	ldw	x, (4, sp)
	addw	sp, #9
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim2_OC3Init.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

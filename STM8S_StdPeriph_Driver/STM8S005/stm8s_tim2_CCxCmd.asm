;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim2_CCxCmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM2_CCxCmd
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 53: void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM2_CCxCmd
;	-----------------------------------------
_TIM2_CCxCmd:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 56: assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
	cp	a, #0x01
	jrne	00202$
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	.byte 0xc5
00202$:
	clr	(0x01, sp)
00203$:
	tnz	a
	jreq	00119$
	tnz	(0x01, sp)
	jrne	00119$
	cp	a, #0x02
	jreq	00119$
	push	a
	push	#0x38
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00119$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 57: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x04, sp)
	jreq	00127$
	tnz	(0x04, sp)
	jrne	00127$
	push	a
	push	#0x39
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00127$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 59: if (TIM2_Channel == TIM2_CHANNEL_1)
	tnz	a
	jrne	00114$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 64: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
	ld	a, 0x5308
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 62: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 64: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
	or	a, #0x01
	ld	0x5308, a
	jra	00116$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 68: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
	and	a, #0xfe
	ld	0x5308, a
	jra	00116$
00114$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 72: else if (TIM2_Channel == TIM2_CHANNEL_2)
	ld	a, (0x01, sp)
	jreq	00111$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 64: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
	ld	a, 0x5308
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 75: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 77: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
	or	a, #0x10
	ld	0x5308, a
	jra	00116$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 81: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
	and	a, #0xef
	ld	0x5308, a
	jra	00116$
00111$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 89: TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
	ld	a, 0x5309
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 87: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 89: TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
	or	a, #0x01
	ld	0x5309, a
	jra	00116$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 93: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
	and	a, #0xfe
	ld	0x5309, a
00116$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c: 96: }
	pop	a
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim2_CCxCmd.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

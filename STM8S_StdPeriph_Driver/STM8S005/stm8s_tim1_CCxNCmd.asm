;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_CCxNCmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_CCxNCmd
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 53: void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_CCxNCmd
;	-----------------------------------------
_TIM1_CCxNCmd:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 56: assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 57: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 59: if (TIM1_Channel == TIM1_CHANNEL_1)
	tnz	a
	jrne	00114$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 64: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
	ld	a, 0x525c
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 62: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 64: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
	or	a, #0x04
	ld	0x525c, a
	jra	00116$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 68: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
	and	a, #0xfb
	ld	0x525c, a
	jra	00116$
00114$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 71: else if (TIM1_Channel == TIM1_CHANNEL_2)
	ld	a, (0x01, sp)
	jreq	00111$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 64: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
	ld	a, 0x525c
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 74: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 76: TIM1->CCER1 |= TIM1_CCER1_CC2NE;
	or	a, #0x40
	ld	0x525c, a
	jra	00116$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 80: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
	and	a, #0xbf
	ld	0x525c, a
	jra	00116$
00111$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 88: TIM1->CCER2 |= TIM1_CCER2_CC3NE;
	ld	a, 0x525d
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 86: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 88: TIM1->CCER2 |= TIM1_CCER2_CC3NE;
	or	a, #0x04
	ld	0x525d, a
	jra	00116$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 92: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
	and	a, #0xfb
	ld	0x525d, a
00116$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c: 95: }
	pop	a
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxNCmd.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

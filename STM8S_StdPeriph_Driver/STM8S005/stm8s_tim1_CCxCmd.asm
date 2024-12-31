;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_CCxCmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_CCxCmd
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 54: void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_CCxCmd
;	-----------------------------------------
_TIM1_CCxCmd:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 57: assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
	cp	a, #0x01
	jrne	00232$
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	.byte 0xc5
00232$:
	clr	(0x01, sp)
00233$:
	cp	a, #0x02
	jrne	00235$
	push	a
	ld	a, #0x01
	ld	(0x03, sp), a
	pop	a
	.byte 0xc5
00235$:
	clr	(0x02, sp)
00236$:
	tnz	a
	jreq	00125$
	tnz	(0x01, sp)
	jrne	00125$
	tnz	(0x02, sp)
	jrne	00125$
	cp	a, #0x03
	jreq	00125$
	push	a
	push	#0x39
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00125$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 58: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x05, sp)
	jreq	00136$
	tnz	(0x05, sp)
	jrne	00136$
	push	a
	push	#0x3a
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00136$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 60: if (TIM1_Channel == TIM1_CHANNEL_1)
	tnz	a
	jrne	00120$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 65: TIM1->CCER1 |= TIM1_CCER1_CC1E;
	ld	a, 0x525c
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 63: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 65: TIM1->CCER1 |= TIM1_CCER1_CC1E;
	or	a, #0x01
	ld	0x525c, a
	jra	00122$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 69: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
	and	a, #0xfe
	ld	0x525c, a
	jra	00122$
00120$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 73: else if (TIM1_Channel == TIM1_CHANNEL_2)
	ld	a, (0x01, sp)
	jreq	00117$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 65: TIM1->CCER1 |= TIM1_CCER1_CC1E;
	ld	a, 0x525c
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 76: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 78: TIM1->CCER1 |= TIM1_CCER1_CC2E;
	or	a, #0x10
	ld	0x525c, a
	jra	00122$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 82: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
	and	a, #0xef
	ld	0x525c, a
	jra	00122$
00117$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 90: TIM1->CCER2 |= TIM1_CCER2_CC3E;
	ld	a, 0x525d
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 85: else if (TIM1_Channel == TIM1_CHANNEL_3)
	exg	a, xl
	ld	a, (0x02, sp)
	exg	a, xl
	exg	a, xl
	tnz	a
	exg	a, xl
	jreq	00114$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 88: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 90: TIM1->CCER2 |= TIM1_CCER2_CC3E;
	or	a, #0x01
	ld	0x525d, a
	jra	00122$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 94: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
	and	a, #0xfe
	ld	0x525d, a
	jra	00122$
00114$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 100: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00111$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 102: TIM1->CCER2 |= TIM1_CCER2_CC4E;
	or	a, #0x10
	ld	0x525d, a
	jra	00122$
00111$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 106: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
	and	a, #0xef
	ld	0x525d, a
00122$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c: 109: }
	popw	x
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_CCxCmd.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

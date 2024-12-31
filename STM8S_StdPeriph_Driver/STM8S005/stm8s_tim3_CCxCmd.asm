;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_CCxCmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM3_CCxCmd
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_CCxCmd.c: 52: void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM3_CCxCmd
;	-----------------------------------------
_TIM3_CCxCmd:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_CCxCmd.c: 55: assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
	ld	(0x01, sp), a
	jreq	00113$
	tnz	(0x01, sp)
	jrne	00113$
	push	#0x37
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_CCxCmd.c: 56: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x04, sp)
	jreq	00118$
	tnz	(0x04, sp)
	jrne	00118$
	push	#0x38
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00118$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_CCxCmd.c: 63: TIM3->CCER1 |= TIM3_CCER1_CC1E;
	ld	a, 0x5327
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_CCxCmd.c: 58: if (TIM3_Channel == TIM3_CHANNEL_1)
	tnz	(0x01, sp)
	jrne	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_CCxCmd.c: 61: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_CCxCmd.c: 63: TIM3->CCER1 |= TIM3_CCER1_CC1E;
	or	a, #0x01
	ld	0x5327, a
	jra	00110$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_CCxCmd.c: 67: TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
	and	a, #0xfe
	ld	0x5327, a
	jra	00110$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_CCxCmd.c: 74: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_CCxCmd.c: 76: TIM3->CCER1 |= TIM3_CCER1_CC2E;
	or	a, #0x10
	ld	0x5327, a
	jra	00110$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_CCxCmd.c: 80: TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
	and	a, #0xef
	ld	0x5327, a
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_CCxCmd.c: 83: }
	pop	a
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim3_CCxCmd.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_EncoderInterfaceConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_EncoderInterfaceConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 62: void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
;	-----------------------------------------
;	 function TIM1_EncoderInterfaceConfig
;	-----------------------------------------
_TIM1_EncoderInterfaceConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 67: assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
	ld	(0x01, sp), a
	dec	a
	jreq	00110$
	ld	a, (0x01, sp)
	cp	a, #0x02
	jreq	00110$
	ld	a, (0x01, sp)
	cp	a, #0x03
	jreq	00110$
	push	#0x43
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 68: assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
	tnz	(0x04, sp)
	jreq	00118$
	tnz	(0x04, sp)
	jrne	00118$
	push	#0x44
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00118$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 69: assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
	tnz	(0x05, sp)
	jreq	00123$
	tnz	(0x05, sp)
	jrne	00123$
	push	#0x45
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00123$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 74: TIM1->CCER1 |= TIM1_CCER1_CC1P;
	ld	a, 0x525c
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 72: if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
	tnz	(0x04, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 74: TIM1->CCER1 |= TIM1_CCER1_CC1P;
	or	a, #0x02
	ld	0x525c, a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 78: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
	and	a, #0xfd
	ld	0x525c, a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 74: TIM1->CCER1 |= TIM1_CCER1_CC1P;
	ld	a, 0x525c
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 81: if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
	tnz	(0x05, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 83: TIM1->CCER1 |= TIM1_CCER1_CC2P;
	or	a, #0x20
	ld	0x525c, a
	jra	00106$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 87: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
	and	a, #0xdf
	ld	0x525c, a
00106$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 90: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
	ld	a, 0x5252
	and	a, #0xf0
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 91: | (uint8_t) TIM1_EncoderMode);
	or	a, (0x01, sp)
	ld	0x5252, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 94: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
	ld	a, 0x5258
	and	a, #0xfc
	or	a, #0x01
	ld	0x5258, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 96: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
	ld	a, 0x5259
	and	a, #0xfc
	or	a, #0x01
	ld	0x5259, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceConfig.c: 98: }
	ldw	x, (2, sp)
	addw	sp, #5
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_EncoderInterfaceCon"
	.ascii "fig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

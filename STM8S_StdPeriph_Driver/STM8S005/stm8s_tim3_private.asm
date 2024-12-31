;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_private
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM3_TI1_Config
	.globl _TIM3_TI2_Config
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 58: void TIM3_TI1_Config(uint8_t TIM3_ICPolarity,
;	-----------------------------------------
;	 function TIM3_TI1_Config
;	-----------------------------------------
_TIM3_TI1_Config:
	pushw	x
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 63: TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
	bres	0x5327, #0
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 66: TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
	ld	a, 0x5325
	and	a, #0x0c
	ld	(0x01, sp), a
	ld	a, (0x06, sp)
	swap	a
	and	a, #0xf0
	or	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x5325, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 63: TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
	ld	a, 0x5327
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 69: if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
	tnz	(0x02, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 71: TIM3->CCER1 |= TIM3_CCER1_CC1P;
	or	a, #0x02
	ld	0x5327, a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 75: TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
	and	a, #0xfd
	ld	0x5327, a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 78: TIM3->CCER1 |= TIM3_CCER1_CC1E;
	ld	a, 0x5327
	or	a, #0x01
	ld	0x5327, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 79: }
	ldw	x, (3, sp)
	addw	sp, #6
	jp	(x)
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 97: void TIM3_TI2_Config(uint8_t TIM3_ICPolarity,
;	-----------------------------------------
;	 function TIM3_TI2_Config
;	-----------------------------------------
_TIM3_TI2_Config:
	pushw	x
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 102: TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
	bres	0x5327, #4
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 105: TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
	ld	a, 0x5326
	and	a, #0x0c
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 107: ((uint8_t)( TIM3_ICFilter << 4))));
	ld	a, (0x06, sp)
	swap	a
	and	a, #0xf0
	or	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x5326, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 102: TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
	ld	a, 0x5327
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 110: if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
	tnz	(0x02, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 112: TIM3->CCER1 |= TIM3_CCER1_CC2P;
	or	a, #0x20
	ld	0x5327, a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 116: TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
	and	a, #0xdf
	ld	0x5327, a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 120: TIM3->CCER1 |= TIM3_CCER1_CC2E;
	ld	a, 0x5327
	or	a, #0x10
	ld	0x5327, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_private.c: 121: }
	ldw	x, (3, sp)
	addw	sp, #6
	jp	(x)
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

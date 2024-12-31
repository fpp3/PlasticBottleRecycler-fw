;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim2_private
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM2_TI1_Config
	.globl _TIM2_TI2_Config
	.globl _TIM2_TI3_Config
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 58: void TIM2_TI1_Config(uint8_t TIM2_ICPolarity,
;	-----------------------------------------
;	 function TIM2_TI1_Config
;	-----------------------------------------
_TIM2_TI1_Config:
	pushw	x
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 63: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
	bres	0x5308, #0
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 66: TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
	ld	a, 0x5305
	and	a, #0x0c
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 67: | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
	ld	a, (0x06, sp)
	swap	a
	and	a, #0xf0
	or	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x5305, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 63: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
	ld	a, 0x5308
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 70: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
	tnz	(0x02, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 72: TIM2->CCER1 |= TIM2_CCER1_CC1P;
	or	a, #0x02
	ld	0x5308, a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 76: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
	and	a, #0xfd
	ld	0x5308, a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 79: TIM2->CCER1 |= TIM2_CCER1_CC1E;
	ld	a, 0x5308
	or	a, #0x01
	ld	0x5308, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 80: }
	ldw	x, (3, sp)
	addw	sp, #6
	jp	(x)
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 98: void TIM2_TI2_Config(uint8_t TIM2_ICPolarity,
;	-----------------------------------------
;	 function TIM2_TI2_Config
;	-----------------------------------------
_TIM2_TI2_Config:
	pushw	x
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 103: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
	bres	0x5308, #4
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 106: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
	ld	a, 0x5306
	and	a, #0x0c
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 107: | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
	ld	a, (0x06, sp)
	swap	a
	and	a, #0xf0
	or	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x5306, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 103: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
	ld	a, 0x5308
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 111: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
	tnz	(0x02, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 113: TIM2->CCER1 |= TIM2_CCER1_CC2P;
	or	a, #0x20
	ld	0x5308, a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 117: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
	and	a, #0xdf
	ld	0x5308, a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 121: TIM2->CCER1 |= TIM2_CCER1_CC2E;
	ld	a, 0x5308
	or	a, #0x10
	ld	0x5308, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 122: }
	ldw	x, (3, sp)
	addw	sp, #6
	jp	(x)
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 138: void TIM2_TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
;	-----------------------------------------
;	 function TIM2_TI3_Config
;	-----------------------------------------
_TIM2_TI3_Config:
	pushw	x
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 142: TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
	bres	0x5309, #0
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 145: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
	ld	a, 0x5307
	and	a, #0x0c
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 146: | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
	ld	a, (0x06, sp)
	swap	a
	and	a, #0xf0
	or	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x5307, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 142: TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
	ld	a, 0x5309
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 150: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
	tnz	(0x02, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 152: TIM2->CCER2 |= TIM2_CCER2_CC3P;
	or	a, #0x02
	ld	0x5309, a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 156: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
	and	a, #0xfd
	ld	0x5309, a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 159: TIM2->CCER2 |= TIM2_CCER2_CC3E;
	ld	a, 0x5309
	or	a, #0x01
	ld	0x5309, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_private.c: 160: }
	ldw	x, (3, sp)
	addw	sp, #6
	jp	(x)
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

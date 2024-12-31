;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim2_SelectOCxM
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM2_SelectOCxM
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 62: void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
;	-----------------------------------------
;	 function TIM2_SelectOCxM
;	-----------------------------------------
_TIM2_SelectOCxM:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 65: assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
	ld	(0x02, sp), a
	dec	a
	jrne	00232$
	ld	a, #0x01
	ld	(0x01, sp), a
	.byte 0xc5
00232$:
	clr	(0x01, sp)
00233$:
	tnz	(0x02, sp)
	jreq	00110$
	tnz	(0x01, sp)
	jrne	00110$
	ld	a, (0x02, sp)
	cp	a, #0x02
	jreq	00110$
	push	#0x41
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 66: assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
	tnz	(0x05, sp)
	jreq	00118$
	ld	a, (0x05, sp)
	cp	a, #0x10
	jreq	00118$
	ld	a, (0x05, sp)
	cp	a, #0x20
	jreq	00118$
	ld	a, (0x05, sp)
	cp	a, #0x30
	jreq	00118$
	ld	a, (0x05, sp)
	cp	a, #0x60
	jreq	00118$
	ld	a, (0x05, sp)
	cp	a, #0x70
	jreq	00118$
	ld	a, (0x05, sp)
	cp	a, #0x50
	jreq	00118$
	ld	a, (0x05, sp)
	cp	a, #0x40
	jreq	00118$
	push	#0x42
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00118$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 68: if (TIM2_Channel == TIM2_CHANNEL_1)
	tnz	(0x02, sp)
	jrne	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 71: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
	bres	0x5308, #0
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 74: TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
	ld	a, 0x5305
	and	a, #0x8f
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 75: | (uint8_t)TIM2_OCMode);
	or	a, (0x05, sp)
	ld	0x5305, a
	jra	00107$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 77: else if (TIM2_Channel == TIM2_CHANNEL_2)
	ld	a, (0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 80: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
	bres	0x5308, #4
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 83: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
	ld	a, 0x5306
	and	a, #0x8f
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 84: | (uint8_t)TIM2_OCMode);
	or	a, (0x05, sp)
	ld	0x5306, a
	jra	00107$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 89: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
	bres	0x5309, #0
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 92: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
	ld	a, 0x5307
	and	a, #0x8f
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 93: | (uint8_t)TIM2_OCMode);
	or	a, (0x05, sp)
	ld	0x5307, a
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c: 95: }
	popw	x
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOCxM.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

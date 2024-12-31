;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim2_SelectOnePulseMode
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM2_SelectOnePulseMode
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOnePulseMode.c: 50: void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
;	-----------------------------------------
;	 function TIM2_SelectOnePulseMode
;	-----------------------------------------
_TIM2_SelectOnePulseMode:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOnePulseMode.c: 53: assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
	ld	(0x01, sp), a
	jrne	00107$
	tnz	(0x01, sp)
	jreq	00107$
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOnePulseMode.c: 58: TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
	ld	a, 0x5300
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOnePulseMode.c: 56: if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOnePulseMode.c: 58: TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
	or	a, #0x08
	ld	0x5300, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOnePulseMode.c: 62: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
	and	a, #0xf7
	ld	0x5300, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOnePulseMode.c: 64: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim2_SelectOnePulseMode."
	.ascii "c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_SetIC3Prescaler
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_SetIC3Prescaler
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SetIC3Prescaler.c: 52: void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
;	-----------------------------------------
;	 function TIM1_SetIC3Prescaler
;	-----------------------------------------
_TIM1_SetIC3Prescaler:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SetIC3Prescaler.c: 56: assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
	ld	(0x01, sp), a
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x04
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x08
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x0c
	jreq	00104$
	push	#0x38
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SetIC3Prescaler.c: 59: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
	ld	a, 0x525a
	and	a, #0xf3
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SetIC3Prescaler.c: 60: (uint8_t)TIM1_IC3Prescaler);
	or	a, (0x01, sp)
	ld	0x525a, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SetIC3Prescaler.c: 61: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_SetIC3Prescaler.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

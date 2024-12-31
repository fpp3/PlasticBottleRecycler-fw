;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_OC4PolarityConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_OC4PolarityConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4PolarityConfig.c: 50: void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
;	-----------------------------------------
;	 function TIM1_OC4PolarityConfig
;	-----------------------------------------
_TIM1_OC4PolarityConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4PolarityConfig.c: 53: assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
	ld	(0x01, sp), a
	jreq	00107$
	ld	a, (0x01, sp)
	cp	a, #0x22
	jreq	00107$
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4PolarityConfig.c: 58: TIM1->CCER2 |= TIM1_CCER2_CC4P;
	ld	a, 0x525d
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4PolarityConfig.c: 56: if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4PolarityConfig.c: 58: TIM1->CCER2 |= TIM1_CCER2_CC4P;
	or	a, #0x20
	ld	0x525d, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4PolarityConfig.c: 62: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
	and	a, #0xdf
	ld	0x525d, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4PolarityConfig.c: 64: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC4PolarityConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

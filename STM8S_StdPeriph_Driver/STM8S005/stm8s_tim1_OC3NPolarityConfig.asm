;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_OC3NPolarityConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_OC3NPolarityConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3NPolarityConfig.c: 50: void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
;	-----------------------------------------
;	 function TIM1_OC3NPolarityConfig
;	-----------------------------------------
_TIM1_OC3NPolarityConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3NPolarityConfig.c: 53: assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
	ld	(0x01, sp), a
	jreq	00107$
	ld	a, (0x01, sp)
	cp	a, #0x88
	jreq	00107$
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3NPolarityConfig.c: 58: TIM1->CCER2 |= TIM1_CCER2_CC3NP;
	ld	a, 0x525d
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3NPolarityConfig.c: 56: if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3NPolarityConfig.c: 58: TIM1->CCER2 |= TIM1_CCER2_CC3NP;
	or	a, #0x08
	ld	0x525d, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3NPolarityConfig.c: 62: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
	and	a, #0xf7
	ld	0x525d, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3NPolarityConfig.c: 64: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_OC3NPolarityConfig."
	.ascii "c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

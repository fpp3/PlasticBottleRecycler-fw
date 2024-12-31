;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_OC1PolarityConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM3_OC1PolarityConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC1PolarityConfig.c: 50: void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
;	-----------------------------------------
;	 function TIM3_OC1PolarityConfig
;	-----------------------------------------
_TIM3_OC1PolarityConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC1PolarityConfig.c: 53: assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC1PolarityConfig.c: 58: TIM3->CCER1 |= TIM3_CCER1_CC1P;
	ld	a, 0x5327
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC1PolarityConfig.c: 56: if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC1PolarityConfig.c: 58: TIM3->CCER1 |= TIM3_CCER1_CC1P;
	or	a, #0x02
	ld	0x5327, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC1PolarityConfig.c: 62: TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
	and	a, #0xfd
	ld	0x5327, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC1PolarityConfig.c: 64: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim3_OC1PolarityConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

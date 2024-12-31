;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_PWMIConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_TI2_Config
	.globl _TIM1_TI1_Config
	.globl _TIM1_SetIC2Prescaler
	.globl _TIM1_SetIC1Prescaler
	.globl _assert_failed
	.globl _TIM1_PWMIConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 56: void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
;	-----------------------------------------
;	 function TIM1_PWMIConfig
;	-----------------------------------------
_TIM1_PWMIConfig:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 66: assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
	ld	(0x03, sp), a
	jreq	00113$
	ld	a, (0x03, sp)
	dec	a
	jreq	00113$
	push	#0x42
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 67: assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
	tnz	(0x06, sp)
	jreq	00118$
	tnz	(0x06, sp)
	jrne	00118$
	push	#0x43
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00118$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 68: assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
	ld	a, (0x07, sp)
	dec	a
	jrne	00246$
	ld	a, #0x01
	ld	(0x02, sp), a
	.byte 0xc5
00246$:
	clr	(0x02, sp)
00247$:
	tnz	(0x02, sp)
	jrne	00123$
	ld	a, (0x07, sp)
	cp	a, #0x02
	jreq	00123$
	ld	a, (0x07, sp)
	cp	a, #0x03
	jreq	00123$
	push	#0x44
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00123$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 69: assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
	tnz	(0x08, sp)
	jreq	00131$
	ld	a, (0x08, sp)
	cp	a, #0x04
	jreq	00131$
	ld	a, (0x08, sp)
	cp	a, #0x08
	jreq	00131$
	ld	a, (0x08, sp)
	cp	a, #0x0c
	jreq	00131$
	push	#0x45
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00131$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 72: if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
	tnz	(0x06, sp)
	jrne	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 74: icpolarity = TIM1_ICPOLARITY_FALLING;
	ld	a, #0x01
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 78: icpolarity = TIM1_ICPOLARITY_RISING;
	.byte 0xc5
00102$:
	clr	(0x01, sp)
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 82: if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
	ld	a, (0x02, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 84: icselection = TIM1_ICSELECTION_INDIRECTTI;
	ld	a, #0x02
	ld	(0x02, sp), a
	jra	00106$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 88: icselection = TIM1_ICSELECTION_DIRECTTI;
	ld	a, #0x01
	ld	(0x02, sp), a
00106$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 94: TIM1_TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
	ld	a, (0x06, sp)
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 91: if (TIM1_Channel == TIM1_CHANNEL_1)
	tnz	(0x03, sp)
	jrne	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 94: TIM1_TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	ld	a, xl
	call	_TIM1_TI1_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 98: TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
	ld	a, (0x08, sp)
	call	_TIM1_SetIC1Prescaler
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 101: TIM1_TI2_Config(icpolarity, icselection, TIM1_ICFilter);
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x03, sp)
	push	a
	ld	a, (0x03, sp)
	call	_TIM1_TI2_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 104: TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
	ld	a, (0x08, sp)
	call	_TIM1_SetIC2Prescaler
	jra	00110$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 109: TIM1_TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	ld	a, xl
	call	_TIM1_TI2_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 113: TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
	ld	a, (0x08, sp)
	call	_TIM1_SetIC2Prescaler
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 116: TIM1_TI1_Config(icpolarity, icselection, TIM1_ICFilter);
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x03, sp)
	push	a
	ld	a, (0x03, sp)
	call	_TIM1_TI1_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 119: TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
	ld	a, (0x08, sp)
	call	_TIM1_SetIC1Prescaler
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c: 121: }
	ldw	x, (4, sp)
	addw	sp, #9
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_PWMIConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

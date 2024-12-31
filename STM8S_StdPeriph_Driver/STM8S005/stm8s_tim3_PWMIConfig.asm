;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_PWMIConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM3_TI2_Config
	.globl _TIM3_TI1_Config
	.globl _TIM3_SetIC2Prescaler
	.globl _TIM3_SetIC1Prescaler
	.globl _assert_failed
	.globl _TIM3_PWMIConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 51: void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
;	-----------------------------------------
;	 function TIM3_PWMIConfig
;	-----------------------------------------
_TIM3_PWMIConfig:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 61: assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
	ld	(0x03, sp), a
	jreq	00113$
	tnz	(0x03, sp)
	jrne	00113$
	push	#0x3d
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 62: assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
	ld	a, (0x06, sp)
	sub	a, #0x44
	jrne	00242$
	inc	a
	ld	(0x01, sp), a
	.byte 0xc5
00242$:
	clr	(0x01, sp)
00243$:
	tnz	(0x06, sp)
	jreq	00118$
	tnz	(0x01, sp)
	jrne	00118$
	push	#0x3e
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00118$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 63: assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
	ld	a, (0x07, sp)
	dec	a
	jrne	00247$
	ld	a, #0x01
	ld	(0x02, sp), a
	.byte 0xc5
00247$:
	clr	(0x02, sp)
00248$:
	tnz	(0x02, sp)
	jrne	00123$
	ld	a, (0x07, sp)
	cp	a, #0x02
	jreq	00123$
	ld	a, (0x07, sp)
	cp	a, #0x03
	jreq	00123$
	push	#0x3f
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00123$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 64: assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
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
	push	#0x40
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00131$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 67: if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
	tnz	(0x01, sp)
	jrne	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 69: icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
	ld	a, #0x44
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 73: icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
	.byte 0xc5
00102$:
	clr	(0x01, sp)
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 77: if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
	ld	a, (0x02, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 79: icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
	ld	a, #0x02
	ld	(0x02, sp), a
	jra	00106$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 83: icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
	ld	a, #0x01
	ld	(0x02, sp), a
00106$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 86: if (TIM3_Channel != TIM3_CHANNEL_2)
	tnz	(0x03, sp)
	jrne	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 89: TIM3_TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x08, sp)
	call	_TIM3_TI1_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 93: TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
	ld	a, (0x08, sp)
	call	_TIM3_SetIC1Prescaler
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 96: TIM3_TI2_Config(icpolarity, icselection, TIM3_ICFilter);
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x03, sp)
	push	a
	ld	a, (0x03, sp)
	call	_TIM3_TI2_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 99: TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
	ld	a, (0x08, sp)
	call	_TIM3_SetIC2Prescaler
	jra	00110$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 104: TIM3_TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x08, sp)
	call	_TIM3_TI2_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 108: TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
	ld	a, (0x08, sp)
	call	_TIM3_SetIC2Prescaler
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 111: TIM3_TI1_Config(icpolarity, icselection, TIM3_ICFilter);
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x03, sp)
	push	a
	ld	a, (0x03, sp)
	call	_TIM3_TI1_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 114: TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
	ld	a, (0x08, sp)
	call	_TIM3_SetIC1Prescaler
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c: 116: }
	ldw	x, (4, sp)
	addw	sp, #9
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim3_PWMIConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim2_ICInit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM2_TI3_Config
	.globl _TIM2_TI2_Config
	.globl _TIM2_TI1_Config
	.globl _TIM2_SetIC3Prescaler
	.globl _TIM2_SetIC2Prescaler
	.globl _TIM2_SetIC1Prescaler
	.globl _assert_failed
	.globl _TIM2_ICInit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 51: void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
;	-----------------------------------------
;	 function TIM2_ICInit
;	-----------------------------------------
_TIM2_ICInit:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 58: assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
	ld	(0x02, sp), a
	dec	a
	jrne	00249$
	ld	a, #0x01
	ld	(0x01, sp), a
	.byte 0xc5
00249$:
	clr	(0x01, sp)
00250$:
	tnz	(0x02, sp)
	jreq	00110$
	tnz	(0x01, sp)
	jrne	00110$
	ld	a, (0x02, sp)
	cp	a, #0x02
	jreq	00110$
	push	#0x3a
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 59: assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
	tnz	(0x05, sp)
	jreq	00118$
	ld	a, (0x05, sp)
	cp	a, #0x44
	jreq	00118$
	push	#0x3b
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00118$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 60: assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
	ld	a, (0x06, sp)
	dec	a
	jreq	00123$
	ld	a, (0x06, sp)
	cp	a, #0x02
	jreq	00123$
	ld	a, (0x06, sp)
	cp	a, #0x03
	jreq	00123$
	push	#0x3c
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00123$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 61: assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
	tnz	(0x07, sp)
	jreq	00131$
	ld	a, (0x07, sp)
	cp	a, #0x04
	jreq	00131$
	ld	a, (0x07, sp)
	cp	a, #0x08
	jreq	00131$
	ld	a, (0x07, sp)
	cp	a, #0x0c
	jreq	00131$
	push	#0x3d
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00131$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 62: assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
	ld	a, (0x08, sp)
	cp	a, #0x0f
	jrule	00142$
	push	#0x3e
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00142$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 64: if (TIM2_Channel == TIM2_CHANNEL_1)
	tnz	(0x02, sp)
	jrne	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 67: TIM2_TI1_Config((uint8_t)TIM2_ICPolarity,
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x07, sp)
	call	_TIM2_TI1_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 72: TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
	ld	a, (0x07, sp)
	call	_TIM2_SetIC1Prescaler
	jra	00107$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 74: else if (TIM2_Channel == TIM2_CHANNEL_2)
	ld	a, (0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 77: TIM2_TI2_Config((uint8_t)TIM2_ICPolarity,
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x07, sp)
	call	_TIM2_TI2_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 82: TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
	ld	a, (0x07, sp)
	call	_TIM2_SetIC2Prescaler
	jra	00107$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 87: TIM2_TI3_Config((uint8_t)TIM2_ICPolarity,
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x07, sp)
	call	_TIM2_TI3_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 92: TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
	ld	a, (0x07, sp)
	call	_TIM2_SetIC3Prescaler
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c: 94: }
	ldw	x, (3, sp)
	addw	sp, #8
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim2_ICInit.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

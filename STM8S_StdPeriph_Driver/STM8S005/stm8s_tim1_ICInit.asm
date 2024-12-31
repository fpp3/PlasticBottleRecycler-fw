;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_ICInit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_TI4_Config
	.globl _TIM1_TI3_Config
	.globl _TIM1_TI2_Config
	.globl _TIM1_TI1_Config
	.globl _TIM1_SetIC4Prescaler
	.globl _TIM1_SetIC3Prescaler
	.globl _TIM1_SetIC2Prescaler
	.globl _TIM1_SetIC1Prescaler
	.globl _assert_failed
	.globl _TIM1_ICInit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 54: void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
;	-----------------------------------------
;	 function TIM1_ICInit
;	-----------------------------------------
_TIM1_ICInit:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 61: assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
	ld	(0x03, sp), a
	dec	a
	jrne	00269$
	ld	a, #0x01
	ld	(0x01, sp), a
	.byte 0xc5
00269$:
	clr	(0x01, sp)
00270$:
	ld	a, (0x03, sp)
	sub	a, #0x02
	jrne	00272$
	inc	a
	ld	(0x02, sp), a
	.byte 0xc5
00272$:
	clr	(0x02, sp)
00273$:
	tnz	(0x03, sp)
	jreq	00113$
	tnz	(0x01, sp)
	jrne	00113$
	tnz	(0x02, sp)
	jrne	00113$
	ld	a, (0x03, sp)
	cp	a, #0x03
	jreq	00113$
	push	#0x3d
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 62: assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
	tnz	(0x06, sp)
	jreq	00124$
	tnz	(0x06, sp)
	jrne	00124$
	push	#0x3e
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00124$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 63: assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
	ld	a, (0x07, sp)
	dec	a
	jreq	00129$
	ld	a, (0x07, sp)
	cp	a, #0x02
	jreq	00129$
	ld	a, (0x07, sp)
	cp	a, #0x03
	jreq	00129$
	push	#0x3f
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00129$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 64: assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
	tnz	(0x08, sp)
	jreq	00137$
	ld	a, (0x08, sp)
	cp	a, #0x04
	jreq	00137$
	ld	a, (0x08, sp)
	cp	a, #0x08
	jreq	00137$
	ld	a, (0x08, sp)
	cp	a, #0x0c
	jreq	00137$
	push	#0x40
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00137$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 65: assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
	ld	a, (0x09, sp)
	cp	a, #0x0f
	jrule	00148$
	push	#0x41
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00148$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 70: TIM1_TI1_Config((uint8_t)TIM1_ICPolarity,
	ld	a, (0x06, sp)
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 67: if (TIM1_Channel == TIM1_CHANNEL_1)
	tnz	(0x03, sp)
	jrne	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 70: TIM1_TI1_Config((uint8_t)TIM1_ICPolarity,
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	ld	a, xl
	call	_TIM1_TI1_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 74: TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
	ld	a, (0x08, sp)
	call	_TIM1_SetIC1Prescaler
	jra	00110$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 76: else if (TIM1_Channel == TIM1_CHANNEL_2)
	ld	a, (0x01, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 79: TIM1_TI2_Config((uint8_t)TIM1_ICPolarity,
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	ld	a, xl
	call	_TIM1_TI2_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 83: TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
	ld	a, (0x08, sp)
	call	_TIM1_SetIC2Prescaler
	jra	00110$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 85: else if (TIM1_Channel == TIM1_CHANNEL_3)
	ld	a, (0x02, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 88: TIM1_TI3_Config((uint8_t)TIM1_ICPolarity,
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	ld	a, xl
	call	_TIM1_TI3_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 92: TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
	ld	a, (0x08, sp)
	call	_TIM1_SetIC3Prescaler
	jra	00110$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 97: TIM1_TI4_Config((uint8_t)TIM1_ICPolarity,
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	ld	a, xl
	call	_TIM1_TI4_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 101: TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
	ld	a, (0x08, sp)
	call	_TIM1_SetIC4Prescaler
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c: 103: }
	ldw	x, (4, sp)
	addw	sp, #9
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_ICInit.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

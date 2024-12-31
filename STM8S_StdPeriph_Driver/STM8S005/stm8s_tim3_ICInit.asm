;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_ICInit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM3_TI2_Config
	.globl _TIM3_TI1_Config
	.globl _TIM3_SetIC2Prescaler
	.globl _TIM3_SetIC1Prescaler
	.globl _assert_failed
	.globl _TIM3_ICInit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ICInit.c: 51: void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
;	-----------------------------------------
;	 function TIM3_ICInit
;	-----------------------------------------
_TIM3_ICInit:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ICInit.c: 58: assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
	ld	(0x01, sp), a
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	push	#0x3a
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ICInit.c: 59: assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
	tnz	(0x04, sp)
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x44
	jreq	00112$
	push	#0x3b
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00112$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ICInit.c: 60: assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
	ld	a, (0x05, sp)
	dec	a
	jreq	00117$
	ld	a, (0x05, sp)
	cp	a, #0x02
	jreq	00117$
	ld	a, (0x05, sp)
	cp	a, #0x03
	jreq	00117$
	push	#0x3c
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00117$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ICInit.c: 61: assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
	tnz	(0x06, sp)
	jreq	00125$
	ld	a, (0x06, sp)
	cp	a, #0x04
	jreq	00125$
	ld	a, (0x06, sp)
	cp	a, #0x08
	jreq	00125$
	ld	a, (0x06, sp)
	cp	a, #0x0c
	jreq	00125$
	push	#0x3d
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00125$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ICInit.c: 62: assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
	ld	a, (0x07, sp)
	cp	a, #0x0f
	jrule	00136$
	push	#0x3e
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00136$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ICInit.c: 64: if (TIM3_Channel != TIM3_CHANNEL_2)
	tnz	(0x01, sp)
	jrne	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ICInit.c: 67: TIM3_TI1_Config((uint8_t)TIM3_ICPolarity,
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x06, sp)
	call	_TIM3_TI1_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ICInit.c: 72: TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
	ld	a, (0x06, sp)
	call	_TIM3_SetIC1Prescaler
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ICInit.c: 77: TIM3_TI2_Config((uint8_t)TIM3_ICPolarity,
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x06, sp)
	call	_TIM3_TI2_Config
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ICInit.c: 82: TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
	ld	a, (0x06, sp)
	call	_TIM3_SetIC2Prescaler
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ICInit.c: 84: }
	ldw	x, (2, sp)
	addw	sp, #7
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim3_ICInit.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

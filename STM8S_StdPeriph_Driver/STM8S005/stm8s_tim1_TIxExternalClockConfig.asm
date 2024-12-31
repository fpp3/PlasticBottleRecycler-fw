;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_TIxExternalClockConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_TI2_Config
	.globl _TIM1_TI1_Config
	.globl _TIM1_SelectInputTrigger
	.globl _assert_failed
	.globl _TIM1_TIxExternalClockConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TIxExternalClockConfig.c: 57: void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
;	-----------------------------------------
;	 function TIM1_TIxExternalClockConfig
;	-----------------------------------------
_TIM1_TIxExternalClockConfig:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TIxExternalClockConfig.c: 62: assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
	ld	(0x02, sp), a
	sub	a, #0x60
	jrne	00171$
	inc	a
	ld	(0x01, sp), a
	.byte 0xc5
00171$:
	clr	(0x01, sp)
00172$:
	ld	a, (0x02, sp)
	cp	a, #0x40
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	ld	a, (0x02, sp)
	cp	a, #0x50
	jreq	00107$
	push	#0x3e
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TIxExternalClockConfig.c: 63: assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
	tnz	(0x05, sp)
	jreq	00115$
	tnz	(0x05, sp)
	jrne	00115$
	push	#0x3f
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00115$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TIxExternalClockConfig.c: 64: assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
	ld	a, (0x06, sp)
	cp	a, #0x0f
	jrule	00120$
	push	#0x40
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00120$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TIxExternalClockConfig.c: 69: TIM1_TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
	ld	a, (0x05, sp)
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TIxExternalClockConfig.c: 67: if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
	ld	a, (0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TIxExternalClockConfig.c: 69: TIM1_TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
	ld	a, (0x06, sp)
	push	a
	push	#0x01
	ld	a, xl
	call	_TIM1_TI2_Config
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TIxExternalClockConfig.c: 73: TIM1_TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
	ld	a, (0x06, sp)
	push	a
	push	#0x01
	ld	a, xl
	call	_TIM1_TI1_Config
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TIxExternalClockConfig.c: 77: TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
	ld	a, (0x02, sp)
	call	_TIM1_SelectInputTrigger
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TIxExternalClockConfig.c: 80: TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
	ld	a, 0x5252
	or	a, #0x07
	ld	0x5252, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TIxExternalClockConfig.c: 81: }
	ldw	x, (3, sp)
	addw	sp, #6
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_TIxExternalClockCon"
	.ascii "fig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

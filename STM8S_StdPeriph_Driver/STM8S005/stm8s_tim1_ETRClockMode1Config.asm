;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_ETRClockMode1Config
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_ETRConfig
	.globl _assert_failed
	.globl _TIM1_ETRClockMode1Config
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ETRClockMode1Config.c: 58: void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
;	-----------------------------------------
;	 function TIM1_ETRClockMode1Config
;	-----------------------------------------
_TIM1_ETRClockMode1Config:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ETRClockMode1Config.c: 63: assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
	ld	(0x01, sp), a
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x10
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x20
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x30
	jreq	00104$
	push	#0x3f
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ETRClockMode1Config.c: 64: assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
	ld	a, (0x04, sp)
	cp	a, #0x80
	jreq	00115$
	tnz	(0x04, sp)
	jreq	00115$
	push	#0x40
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00115$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ETRClockMode1Config.c: 67: TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x03, sp)
	call	_TIM1_ETRConfig
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ETRClockMode1Config.c: 70: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
	ld	a, 0x5252
	and	a, #0x88
	or	a, #0x77
	ld	0x5252, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ETRClockMode1Config.c: 72: }
	ldw	x, (2, sp)
	addw	sp, #5
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_ETRClockMode1Config"
	.ascii ".c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

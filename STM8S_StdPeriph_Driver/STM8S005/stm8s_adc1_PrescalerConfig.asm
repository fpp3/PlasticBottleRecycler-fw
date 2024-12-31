;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_PrescalerConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _ADC1_PrescalerConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_PrescalerConfig.c: 47: void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
;	-----------------------------------------
;	 function ADC1_PrescalerConfig
;	-----------------------------------------
_ADC1_PrescalerConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_PrescalerConfig.c: 50: assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
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
	ld	a, (0x01, sp)
	cp	a, #0x40
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x50
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x60
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x70
	jreq	00104$
	push	#0x32
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_PrescalerConfig.c: 53: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
	ld	a, 0x5401
	and	a, #0x8f
	ld	0x5401, a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_PrescalerConfig.c: 55: ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
	ld	a, 0x5401
	or	a, (0x01, sp)
	ld	0x5401, a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_PrescalerConfig.c: 56: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_adc1_PrescalerConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

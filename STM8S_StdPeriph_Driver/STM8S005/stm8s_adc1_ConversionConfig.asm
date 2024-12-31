;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_ConversionConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _ADC1_ConversionConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ConversionConfig.c: 51: void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
;	-----------------------------------------
;	 function ADC1_ConversionConfig
;	-----------------------------------------
_ADC1_ConversionConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ConversionConfig.c: 54: assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
	ld	(0x01, sp), a
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	push	#0x36
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ConversionConfig.c: 55: assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
	tnz	(0x04, sp)
	jreq	00112$
	ld	a, (0x04, sp)
	dec	a
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x02
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x03
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x04
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x05
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x06
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x07
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x08
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x0c
	jreq	00112$
	ld	a, (0x04, sp)
	cp	a, #0x09
	jreq	00112$
	push	#0x37
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00112$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ConversionConfig.c: 56: assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
	tnz	(0x05, sp)
	jreq	00144$
	ld	a, (0x05, sp)
	cp	a, #0x08
	jreq	00144$
	push	#0x38
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00144$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ConversionConfig.c: 59: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
	bres	0x5402, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ConversionConfig.c: 61: ADC1->CR2 |= (uint8_t)(ADC1_Align);
	ld	a, 0x5402
	or	a, (0x05, sp)
	ld	0x5402, a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ConversionConfig.c: 66: ADC1->CR1 |= ADC1_CR1_CONT;
	ld	a, 0x5401
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ConversionConfig.c: 63: if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ConversionConfig.c: 66: ADC1->CR1 |= ADC1_CR1_CONT;
	or	a, #0x02
	ld	0x5401, a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ConversionConfig.c: 71: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
	and	a, #0xfd
	ld	0x5401, a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ConversionConfig.c: 75: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
	ld	a, 0x5400
	and	a, #0xf0
	ld	0x5400, a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ConversionConfig.c: 77: ADC1->CSR |= (uint8_t)(ADC1_Channel);
	ld	a, 0x5400
	or	a, (0x04, sp)
	ld	0x5400, a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ConversionConfig.c: 78: }
	ldw	x, (2, sp)
	addw	sp, #5
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_adc1_ConversionConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ADC1_ExternalTriggerConfig
	.globl _ADC1_ConversionConfig
	.globl _ADC1_SchmittTriggerConfig
	.globl _ADC1_PrescalerConfig
	.globl _assert_failed
	.globl _ADC1_Init
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 61: void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
;	-----------------------------------------
;	 function ADC1_Init
;	-----------------------------------------
_ADC1_Init:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 64: assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
	ld	(0x01, sp), a
	jreq	00104$
	tnz	(0x01, sp)
	jrne	00104$
	push	#0x40
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 65: assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
	tnz	(0x04, sp)
	jreq	00109$
	ld	a, (0x04, sp)
	dec	a
	jreq	00109$
	ld	a, (0x04, sp)
	cp	a, #0x02
	jreq	00109$
	ld	a, (0x04, sp)
	cp	a, #0x03
	jreq	00109$
	ld	a, (0x04, sp)
	cp	a, #0x04
	jreq	00109$
	ld	a, (0x04, sp)
	cp	a, #0x05
	jreq	00109$
	ld	a, (0x04, sp)
	cp	a, #0x06
	jreq	00109$
	ld	a, (0x04, sp)
	cp	a, #0x07
	jreq	00109$
	ld	a, (0x04, sp)
	cp	a, #0x08
	jreq	00109$
	ld	a, (0x04, sp)
	cp	a, #0x0c
	jreq	00109$
	ld	a, (0x04, sp)
	cp	a, #0x09
	jreq	00109$
	push	#0x41
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00109$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 66: assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
	tnz	(0x05, sp)
	jreq	00141$
	ld	a, (0x05, sp)
	cp	a, #0x10
	jreq	00141$
	ld	a, (0x05, sp)
	cp	a, #0x20
	jreq	00141$
	ld	a, (0x05, sp)
	cp	a, #0x30
	jreq	00141$
	ld	a, (0x05, sp)
	cp	a, #0x40
	jreq	00141$
	ld	a, (0x05, sp)
	cp	a, #0x50
	jreq	00141$
	ld	a, (0x05, sp)
	cp	a, #0x60
	jreq	00141$
	ld	a, (0x05, sp)
	cp	a, #0x70
	jreq	00141$
	push	#0x42
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00141$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 67: assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
	tnz	(0x06, sp)
	jreq	00164$
	ld	a, (0x06, sp)
	cp	a, #0x10
	jreq	00164$
	push	#0x43
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00164$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 68: assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
	tnz	(0x07, sp)
	jreq	00169$
	tnz	(0x07, sp)
	jrne	00169$
	push	#0x44
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00169$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 69: assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
	tnz	(0x08, sp)
	jreq	00174$
	ld	a, (0x08, sp)
	cp	a, #0x08
	jreq	00174$
	push	#0x45
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00174$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 70: assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
	tnz	(0x09, sp)
	jreq	00179$
	ld	a, (0x09, sp)
	dec	a
	jreq	00179$
	ld	a, (0x09, sp)
	cp	a, #0x02
	jreq	00179$
	ld	a, (0x09, sp)
	cp	a, #0x03
	jreq	00179$
	ld	a, (0x09, sp)
	cp	a, #0x04
	jreq	00179$
	ld	a, (0x09, sp)
	cp	a, #0x05
	jreq	00179$
	ld	a, (0x09, sp)
	cp	a, #0x06
	jreq	00179$
	ld	a, (0x09, sp)
	cp	a, #0x07
	jreq	00179$
	ld	a, (0x09, sp)
	cp	a, #0x08
	jreq	00179$
	ld	a, (0x09, sp)
	cp	a, #0x0c
	jreq	00179$
	ld	a, (0x09, sp)
	inc	a
	jreq	00179$
	ld	a, (0x09, sp)
	cp	a, #0x09
	jreq	00179$
	push	#0x46
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00179$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 71: assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
	tnz	(0x0a, sp)
	jreq	00214$
	tnz	(0x0a, sp)
	jrne	00214$
	push	#0x47
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00214$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 76: ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x03, sp)
	call	_ADC1_ConversionConfig
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 78: ADC1_PrescalerConfig(ADC1_PrescalerSelection);
	ld	a, (0x05, sp)
	call	_ADC1_PrescalerConfig
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 83: ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x07, sp)
	call	_ADC1_ExternalTriggerConfig
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 88: ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
	ld	a, (0x0a, sp)
	push	a
	ld	a, (0x0a, sp)
	call	_ADC1_SchmittTriggerConfig
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 91: ADC1->CR1 |= ADC1_CR1_ADON;
	ld	a, 0x5401
	or	a, #0x01
	ld	0x5401, a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c: 92: }
	ldw	x, (2, sp)
	addw	sp, #10
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_adc1_Init.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

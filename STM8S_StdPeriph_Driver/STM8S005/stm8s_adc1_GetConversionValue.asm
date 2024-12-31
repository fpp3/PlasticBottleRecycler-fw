;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_GetConversionValue
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ADC1_GetConversionValue
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetConversionValue.c: 48: uint16_t ADC1_GetConversionValue(void)
;	-----------------------------------------
;	 function ADC1_GetConversionValue
;	-----------------------------------------
_ADC1_GetConversionValue:
	sub	sp, #4
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetConversionValue.c: 53: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
	btjf	0x5402, #3, 00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetConversionValue.c: 56: templ = ADC1->DRL;
	ld	a, 0x5405
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetConversionValue.c: 58: temph = ADC1->DRH;
	ld	a, 0x5404
	ld	xh, a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetConversionValue.c: 60: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
	clr	a
	pushw	x
	or	a, (2, sp)
	popw	x
	ld	xl, a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetConversionValue.c: 65: temph = ADC1->DRH;
	ld	a, 0x5404
	clrw	y
	ld	yl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetConversionValue.c: 67: templ = ADC1->DRL;
	ld	a, 0x5405
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetConversionValue.c: 69: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x01, sp), x
	ld	a, yl
	clr	(0x04, sp)
	or	a, (0x01, sp)
	ld	xh, a
	ld	a, (0x02, sp)
	ld	xl, a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetConversionValue.c: 72: return ((uint16_t)temph);
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetConversionValue.c: 73: }
	addw	sp, #4
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

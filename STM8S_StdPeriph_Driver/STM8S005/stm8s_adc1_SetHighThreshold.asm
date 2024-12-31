;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_SetHighThreshold
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ADC1_SetHighThreshold
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SetHighThreshold.c: 47: void ADC1_SetHighThreshold(uint16_t Threshold)
;	-----------------------------------------
;	 function ADC1_SetHighThreshold
;	-----------------------------------------
_ADC1_SetHighThreshold:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SetHighThreshold.c: 49: ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
	ldw	y, x
	srlw	x
	srlw	x
	ld	a, xl
	ld	0x5408, a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SetHighThreshold.c: 50: ADC1->HTRL = (uint8_t)Threshold;
	ld	a, yl
	ld	0x5409, a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SetHighThreshold.c: 51: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

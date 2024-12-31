;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_GetBufferValue
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _ADC1_GetBufferValue
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 48: uint16_t ADC1_GetBufferValue(uint8_t Buffer)
;	-----------------------------------------
;	 function ADC1_GetBufferValue
;	-----------------------------------------
_ADC1_GetBufferValue:
	sub	sp, #6
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 54: assert_param(IS_ADC1_BUFFER_OK(Buffer));
	cp	a, #0x09
	jrule	00107$
	push	a
	push	#0x36
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 56: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
	ldw	x, #0x5402
	push	a
	ld	a, (x)
	ld	(0x04, sp), a
	pop	a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 59: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
	sll	a
	clrw	x
	ld	xl, a
	ldw	y, x
	addw	y, #0x53e1
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 61: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
	addw	x, #0x53e0
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 59: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 61: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 59: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
	ld	a, (y)
	ld	(0x06, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 61: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
	ld	a, (x)
	ld	(0x05, sp), a
	clr	(0x04, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 56: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
	ld	a, (0x03, sp)
	bcp	a, #0x08
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 59: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 61: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
	ldw	y, (0x04, sp)
	ldw	(0x01, sp), y
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 63: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
	ld	a, (0x02, sp)
	ld	(0x03, sp), a
	clr	(0x04, sp)
	clr	(0x05, sp)
	ld	a, (0x06, sp)
	ld	(0x02, sp), a
	ld	a, (0x03, sp)
	ld	(0x01, sp), a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 68: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
	ldw	y, (0x04, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 70: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
	ld	a, (0x06, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 72: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x03, sp), x
	ld	a, yl
	clr	(0x06, sp)
	or	a, (0x03, sp)
	ld	(0x01, sp), a
	ld	a, (0x04, sp)
	ld	(0x02, sp), a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 75: return ((uint16_t)temph);
	ldw	x, (0x01, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c: 76: }
	addw	sp, #6
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetBufferValue.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

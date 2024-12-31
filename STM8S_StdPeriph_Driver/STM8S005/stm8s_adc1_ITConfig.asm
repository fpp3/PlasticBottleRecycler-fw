;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_ITConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _ADC1_ITConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ITConfig.c: 50: void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_ITConfig
;	-----------------------------------------
_ADC1_ITConfig:
	sub	sp, #4
	ldw	(0x03, sp), x
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ITConfig.c: 53: assert_param(IS_ADC1_IT_OK(ADC1_IT));
	ldw	x, (0x03, sp)
	cpw	x, #0x0020
	jreq	00107$
	cpw	x, #0x0010
	jreq	00107$
	pushw	x
	push	#0x35
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ITConfig.c: 54: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x02, sp)
	jreq	00112$
	tnz	(0x02, sp)
	jrne	00112$
	pushw	x
	push	#0x36
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00112$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ITConfig.c: 59: ADC1->CSR |= (uint8_t)ADC1_IT;
	ld	a, 0x5400
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ITConfig.c: 56: if (NewState != DISABLE)
	tnz	(0x02, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ITConfig.c: 59: ADC1->CSR |= (uint8_t)ADC1_IT;
	ld	a, (0x04, sp)
	or	a, (0x01, sp)
	ld	0x5400, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ITConfig.c: 64: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
	cplw	x
	ld	a, xl
	and	a, (0x01, sp)
	ld	0x5400, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ITConfig.c: 66: }
	addw	sp, #4
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_adc1_ITConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

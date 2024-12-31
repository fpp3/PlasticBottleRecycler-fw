;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_ExternalTriggerConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _ADC1_ExternalTriggerConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ExternalTriggerConfig.c: 51: void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_ExternalTriggerConfig
;	-----------------------------------------
_ADC1_ExternalTriggerConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ExternalTriggerConfig.c: 54: assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
	ld	(0x01, sp), a
	jreq	00107$
	ld	a, (0x01, sp)
	cp	a, #0x10
	jreq	00107$
	push	#0x36
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ExternalTriggerConfig.c: 55: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x04, sp)
	jreq	00112$
	tnz	(0x04, sp)
	jrne	00112$
	push	#0x37
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00112$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ExternalTriggerConfig.c: 58: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
	ld	a, 0x5402
	and	a, #0xcf
	ld	0x5402, a
	ld	a, 0x5402
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ExternalTriggerConfig.c: 60: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ExternalTriggerConfig.c: 63: ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
	or	a, #0x40
	ld	0x5402, a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ExternalTriggerConfig.c: 68: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
	and	a, #0xbf
	ld	0x5402, a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ExternalTriggerConfig.c: 72: ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
	ld	a, 0x5402
	or	a, (0x01, sp)
	ld	0x5402, a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ExternalTriggerConfig.c: 73: }
	pop	a
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_adc1_ExternalTriggerConf"
	.ascii "ig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

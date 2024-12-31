;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_SchmittTriggerConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _ADC1_SchmittTriggerConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 49: void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_SchmittTriggerConfig
;	-----------------------------------------
_ADC1_SchmittTriggerConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 52: assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
	ld	xl, a
	inc	a
	jrne	00292$
	ld	a, #0x01
	ld	xh, a
	jra	00293$
00292$:
	clr	a
	ld	xh, a
00293$:
	ld	a, xl
	tnz	a
	jreq	00119$
	ld	a, xl
	dec	a
	jreq	00119$
	ld	a, xl
	cp	a, #0x02
	jreq	00119$
	ld	a, xl
	cp	a, #0x03
	jreq	00119$
	ld	a, xl
	cp	a, #0x04
	jreq	00119$
	ld	a, xl
	cp	a, #0x05
	jreq	00119$
	ld	a, xl
	cp	a, #0x06
	jreq	00119$
	ld	a, xl
	cp	a, #0x07
	jreq	00119$
	ld	a, xl
	cp	a, #0x08
	jreq	00119$
	ld	a, xl
	cp	a, #0x0c
	jreq	00119$
	ld	a, xh
	tnz	a
	jrne	00119$
	ld	a, xl
	cp	a, #0x09
	jreq	00119$
	pushw	x
	push	#0x34
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00119$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 53: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x04, sp)
	jreq	00154$
	tnz	(0x04, sp)
	jrne	00154$
	pushw	x
	push	#0x35
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00154$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 55: if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
	ld	a, xh
	tnz	a
	jreq	00114$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 59: ADC1->TDRL &= (uint8_t)0x0;
	ld	a, 0x5407
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 57: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 59: ADC1->TDRL &= (uint8_t)0x0;
	mov	0x5407+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 60: ADC1->TDRH &= (uint8_t)0x0;
	ld	a, 0x5406
	mov	0x5406+0, #0x00
	jra	00116$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 64: ADC1->TDRL |= (uint8_t)0xFF;
	mov	0x5407+0, #0xff
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 65: ADC1->TDRH |= (uint8_t)0xFF;
	ld	a, 0x5406
	mov	0x5406+0, #0xff
	jra	00116$
00114$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 68: else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
	ld	a, xl
	cp	a, #0x08
	jrnc	00111$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 59: ADC1->TDRL &= (uint8_t)0x0;
	ld	a, 0x5407
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 72: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00332$
00331$:
	sll	(1, sp)
	dec	a
	jrne	00331$
00332$:
	pop	a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 70: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 72: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
	cpl	a
	and	a, (0x01, sp)
	ld	0x5407, a
	jra	00116$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 76: ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
	or	a, (0x01, sp)
	ld	0x5407, a
	jra	00116$
00111$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 60: ADC1->TDRH &= (uint8_t)0x0;
	ld	a, 0x5406
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 83: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
	subw	x, #8
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00335$
00334$:
	sll	(1, sp)
	dec	a
	jrne	00334$
00335$:
	pop	a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 81: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 83: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
	cpl	a
	and	a, (0x01, sp)
	ld	0x5406, a
	jra	00116$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 87: ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
	or	a, (0x01, sp)
	ld	0x5406, a
00116$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfig.c: 90: }
	pop	a
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_adc1_SchmittTriggerConfi"
	.ascii "g.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

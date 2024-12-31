;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_AWDChannelConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _ADC1_AWDChannelConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_AWDChannelConfig.c: 49: void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_AWDChannelConfig
;	-----------------------------------------
_ADC1_AWDChannelConfig:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_AWDChannelConfig.c: 52: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x05, sp)
	jreq	00113$
	tnz	(0x05, sp)
	jrne	00113$
	push	a
	push	#0x34
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_AWDChannelConfig.c: 53: assert_param(IS_ADC1_CHANNEL_OK(Channel));
	tnz	a
	jreq	00118$
	cp	a, #0x01
	jreq	00118$
	cp	a, #0x02
	jreq	00118$
	cp	a, #0x03
	jreq	00118$
	cp	a, #0x04
	jreq	00118$
	cp	a, #0x05
	jreq	00118$
	cp	a, #0x06
	jreq	00118$
	cp	a, #0x07
	jreq	00118$
	cp	a, #0x08
	jreq	00118$
	cp	a, #0x0c
	jreq	00118$
	cp	a, #0x09
	jreq	00118$
	push	a
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00118$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_AWDChannelConfig.c: 55: if (Channel < (uint8_t)8)
	cp	a, #0x08
	jrnc	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_AWDChannelConfig.c: 59: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
	ldw	x, #0x540f
	push	a
	ld	a, (x)
	ld	(0x02, sp), a
	ld	a, #0x01
	ld	(0x03, sp), a
	pop	a
	tnz	a
	jreq	00296$
00295$:
	sll	(0x02, sp)
	dec	a
	jrne	00295$
00296$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_AWDChannelConfig.c: 57: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_AWDChannelConfig.c: 59: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
	ld	a, (0x01, sp)
	or	a, (0x02, sp)
	ld	0x540f, a
	jra	00110$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_AWDChannelConfig.c: 63: ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
	ld	a, (0x02, sp)
	cpl	a
	and	a, (0x01, sp)
	ld	0x540f, a
	jra	00110$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_AWDChannelConfig.c: 70: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
	ldw	x, #0x540e
	push	a
	ld	a, (x)
	ld	(0x03, sp), a
	pop	a
	sub	a, #0x08
	ld	xl, a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00299$
00298$:
	sll	(1, sp)
	dec	a
	jrne	00298$
00299$:
	pop	a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_AWDChannelConfig.c: 68: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_AWDChannelConfig.c: 70: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
	or	a, (0x02, sp)
	ld	0x540e, a
	jra	00110$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_AWDChannelConfig.c: 74: ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
	cpl	a
	and	a, (0x02, sp)
	ld	0x540e, a
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_AWDChannelConfig.c: 77: }
	popw	x
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_adc1_AWDChannelConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

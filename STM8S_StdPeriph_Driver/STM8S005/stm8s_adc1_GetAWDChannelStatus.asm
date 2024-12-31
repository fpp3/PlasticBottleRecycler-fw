;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_GetAWDChannelStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _ADC1_GetAWDChannelStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetAWDChannelStatus.c: 47: FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
;	-----------------------------------------
;	 function ADC1_GetAWDChannelStatus
;	-----------------------------------------
_ADC1_GetAWDChannelStatus:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetAWDChannelStatus.c: 52: assert_param(IS_ADC1_CHANNEL_OK(Channel));
	tnz	a
	jreq	00107$
	cp	a, #0x01
	jreq	00107$
	cp	a, #0x02
	jreq	00107$
	cp	a, #0x03
	jreq	00107$
	cp	a, #0x04
	jreq	00107$
	cp	a, #0x05
	jreq	00107$
	cp	a, #0x06
	jreq	00107$
	cp	a, #0x07
	jreq	00107$
	cp	a, #0x08
	jreq	00107$
	cp	a, #0x0c
	jreq	00107$
	cp	a, #0x09
	jreq	00107$
	push	a
	push	#0x34
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetAWDChannelStatus.c: 54: if (Channel < (uint8_t)8)
	cp	a, #0x08
	jrnc	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetAWDChannelStatus.c: 56: status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
	ldw	x, #0x540d
	push	a
	ld	a, (x)
	ld	xl, a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	tnz	a
	jreq	00255$
00254$:
	sll	(0x01, sp)
	dec	a
	jrne	00254$
00255$:
	ld	a, xl
	and	a, (0x01, sp)
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetAWDChannelStatus.c: 60: status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
	ldw	x, #0x540c
	push	a
	ld	a, (x)
	ld	(0x02, sp), a
	pop	a
	sub	a, #0x08
	ld	xl, a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00257$
00256$:
	sll	(1, sp)
	dec	a
	jrne	00256$
00257$:
	pop	a
	and	a, (0x01, sp)
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetAWDChannelStatus.c: 63: return ((FlagStatus)status);
	neg	a
	clr	a
	rlc	a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetAWDChannelStatus.c: 64: }
	addw	sp, #1
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetAWDChannelStatus"
	.ascii ".c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

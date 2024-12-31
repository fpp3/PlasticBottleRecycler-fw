;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_GetFlagStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _ADC1_GetFlagStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetFlagStatus.c: 47: FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
;	-----------------------------------------
;	 function ADC1_GetFlagStatus
;	-----------------------------------------
_ADC1_GetFlagStatus:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetFlagStatus.c: 53: assert_param(IS_ADC1_FLAG_OK(Flag));
	ld	(0x02, sp), a
	cp	a, #0x80
	jreq	00113$
	ld	a, (0x02, sp)
	cp	a, #0x41
	jreq	00113$
	ld	a, (0x02, sp)
	cp	a, #0x40
	jreq	00113$
	ld	a, (0x02, sp)
	cp	a, #0x10
	jreq	00113$
	ld	a, (0x02, sp)
	cp	a, #0x11
	jreq	00113$
	ld	a, (0x02, sp)
	cp	a, #0x12
	jreq	00113$
	ld	a, (0x02, sp)
	cp	a, #0x13
	jreq	00113$
	ld	a, (0x02, sp)
	cp	a, #0x14
	jreq	00113$
	ld	a, (0x02, sp)
	cp	a, #0x15
	jreq	00113$
	ld	a, (0x02, sp)
	cp	a, #0x16
	jreq	00113$
	ld	a, (0x02, sp)
	cp	a, #0x17
	jreq	00113$
	ld	a, (0x02, sp)
	cp	a, #0x18
	jreq	00113$
	ld	a, (0x02, sp)
	cp	a, #0x19
	jreq	00113$
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetFlagStatus.c: 55: if ((Flag & 0x0F) == 0x01)
	ld	a, (0x02, sp)
	ld	xl, a
	and	a, #0x0f
	dec	a
	jrne	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetFlagStatus.c: 58: flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
	ld	a, 0x5403
	and	a, #0x40
	jra	00109$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetFlagStatus.c: 60: else if ((Flag & 0xF0) == 0x10)
	ld	a, xl
	and	a, #0xf0
	cp	a, #0x10
	jrne	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetFlagStatus.c: 63: temp = (uint8_t)(Flag & (uint8_t)0x0F);
	ld	a, (0x02, sp)
	and	a, #0x0f
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetFlagStatus.c: 64: if (temp < 8)
	ld	xl, a
	cp	a, #0x08
	jrnc	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetFlagStatus.c: 66: flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
	ld	a, 0x540d
	ld	(0x01, sp), a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00309$
00308$:
	sll	(1, sp)
	dec	a
	jrne	00308$
00309$:
	pop	a
	and	a, (0x01, sp)
	jra	00109$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetFlagStatus.c: 70: flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
	ld	a, 0x540c
	ld	(0x01, sp), a
	subw	x, #8
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00311$
00310$:
	sll	(1, sp)
	dec	a
	jrne	00310$
00311$:
	pop	a
	and	a, (0x01, sp)
	jra	00109$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetFlagStatus.c: 75: flagstatus = (uint8_t)(ADC1->CSR & Flag);
	ld	a, 0x5400
	and	a, (0x02, sp)
00109$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetFlagStatus.c: 77: return ((FlagStatus)flagstatus);
	neg	a
	clr	a
	rlc	a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetFlagStatus.c: 79: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_adc1_GetFlagStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

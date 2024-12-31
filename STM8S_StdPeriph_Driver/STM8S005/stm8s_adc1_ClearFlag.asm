;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_ClearFlag
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _ADC1_ClearFlag
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearFlag.c: 47: void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
;	-----------------------------------------
;	 function ADC1_ClearFlag
;	-----------------------------------------
_ADC1_ClearFlag:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearFlag.c: 52: assert_param(IS_ADC1_FLAG_OK(Flag));
	cp	a, #0x80
	jreq	00113$
	cp	a, #0x41
	jreq	00113$
	cp	a, #0x40
	jreq	00113$
	cp	a, #0x10
	jreq	00113$
	cp	a, #0x11
	jreq	00113$
	cp	a, #0x12
	jreq	00113$
	cp	a, #0x13
	jreq	00113$
	cp	a, #0x14
	jreq	00113$
	cp	a, #0x15
	jreq	00113$
	cp	a, #0x16
	jreq	00113$
	cp	a, #0x17
	jreq	00113$
	cp	a, #0x18
	jreq	00113$
	cp	a, #0x19
	jreq	00113$
	push	a
	push	#0x34
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearFlag.c: 54: if ((Flag & 0x0F) == 0x01)
	ld	(0x01, sp), a
	push	a
	ld	a, (0x02, sp)
	and	a, #0x0f
	dec	a
	pop	a
	jrne	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearFlag.c: 57: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
	bres	0x5403, #6
	jra	00110$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearFlag.c: 59: else if ((Flag & 0xF0) == 0x10)
	push	a
	ld	a, (0x02, sp)
	and	a, #0xf0
	cp	a, #0x10
	pop	a
	jrne	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearFlag.c: 62: temp = (uint8_t)(Flag & (uint8_t)0x0F);
	and	a, #0x0f
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearFlag.c: 63: if (temp < 8)
	ld	xl, a
	cp	a, #0x08
	jrnc	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearFlag.c: 65: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
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
	cpl	a
	and	a, (0x01, sp)
	ld	0x540d, a
	jra	00110$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearFlag.c: 69: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
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
	cpl	a
	and	a, (0x01, sp)
	ld	0x540c, a
	jra	00110$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearFlag.c: 74: ADC1->CSR &= (uint8_t) (~Flag);
	ldw	x, #0x5400
	push	a
	ld	a, (x)
	ld	(0x02, sp), a
	pop	a
	cpl	a
	and	a, (0x01, sp)
	ld	0x5400, a
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearFlag.c: 76: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearFlag.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

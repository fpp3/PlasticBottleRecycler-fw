;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_ClearITPendingBit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _ADC1_ClearITPendingBit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearITPendingBit.c: 59: void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
;	-----------------------------------------
;	 function ADC1_ClearITPendingBit
;	-----------------------------------------
_ADC1_ClearITPendingBit:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearITPendingBit.c: 64: assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
	ldw	(0x02, sp), x
	cpw	x, #0x0080
	jreq	00110$
	cpw	x, #0x0140
	jreq	00110$
	cpw	x, #0x0110
	jreq	00110$
	cpw	x, #0x0111
	jreq	00110$
	cpw	x, #0x0112
	jreq	00110$
	cpw	x, #0x0113
	jreq	00110$
	cpw	x, #0x0114
	jreq	00110$
	cpw	x, #0x0115
	jreq	00110$
	cpw	x, #0x0116
	jreq	00110$
	cpw	x, #0x0117
	jreq	00110$
	cpw	x, #0x0118
	jreq	00110$
	cpw	x, #0x011c
	jreq	00110$
	cpw	x, #0x0119
	jreq	00110$
	pushw	x
	push	#0x40
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearITPendingBit.c: 66: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
	clrw	y
	ld	a, (0x03, sp)
	and	a, #0xf0
	ld	yl, a
	cpw	y, #0x0010
	jrne	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearITPendingBit.c: 69: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
	ld	a, (0x03, sp)
	and	a, #0x0f
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearITPendingBit.c: 70: if (temp < 8)
	ld	xl, a
	cp	a, #0x08
	jrnc	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearITPendingBit.c: 72: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
	ld	a, 0x540d
	ld	(0x01, sp), a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00296$
00295$:
	sll	(1, sp)
	dec	a
	jrne	00295$
00296$:
	pop	a
	cpl	a
	and	a, (0x01, sp)
	ld	0x540d, a
	jra	00107$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearITPendingBit.c: 76: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
	ld	a, 0x540c
	ld	(0x01, sp), a
	subw	x, #8
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00298$
00297$:
	sll	(1, sp)
	dec	a
	jrne	00297$
00298$:
	pop	a
	cpl	a
	and	a, (0x01, sp)
	ld	0x540c, a
	jra	00107$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearITPendingBit.c: 81: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
	ld	a, 0x5400
	push	a
	cplw	x
	pop	a
	pushw	x
	and	a, (2, sp)
	popw	x
	ld	0x5400, a
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearITPendingBit.c: 83: }
	addw	sp, #3
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_adc1_ClearITPendingBit.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

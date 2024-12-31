;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_awu_Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _AWU_Init
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
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_Init.c: 50: void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
;	-----------------------------------------
;	 function AWU_Init
;	-----------------------------------------
_AWU_Init:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_Init.c: 53: assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
	ld	xl, a
	tnz	a
	jreq	00104$
	ld	a, xl
	dec	a
	jreq	00104$
	ld	a, xl
	cp	a, #0x02
	jreq	00104$
	ld	a, xl
	cp	a, #0x03
	jreq	00104$
	ld	a, xl
	cp	a, #0x04
	jreq	00104$
	ld	a, xl
	cp	a, #0x05
	jreq	00104$
	ld	a, xl
	cp	a, #0x06
	jreq	00104$
	ld	a, xl
	cp	a, #0x07
	jreq	00104$
	ld	a, xl
	cp	a, #0x08
	jreq	00104$
	ld	a, xl
	cp	a, #0x09
	jreq	00104$
	ld	a, xl
	cp	a, #0x0a
	jreq	00104$
	ld	a, xl
	cp	a, #0x0b
	jreq	00104$
	ld	a, xl
	cp	a, #0x0c
	jreq	00104$
	ld	a, xl
	cp	a, #0x0d
	jreq	00104$
	ld	a, xl
	cp	a, #0x0e
	jreq	00104$
	ld	a, xl
	cp	a, #0x0f
	jreq	00104$
	ld	a, xl
	cp	a, #0x10
	jreq	00104$
	pushw	x
	push	#0x35
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	addw	sp, #1
	exg	a, xl
	pop	a
	exg	a, xl
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_Init.c: 56: AWU->CSR |= AWU_CSR_AWUEN;
	bset	0x50f0, #4
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_Init.c: 59: AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
	ld	a, 0x50f2
	and	a, #0xf0
	ld	0x50f2, a
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_Init.c: 60: AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
	ld	a, 0x50f2
	ld	(0x01, sp), a
	clrw	y
	exg	a, yl
	ld	a, xl
	exg	a, yl
	ld	a, (_TBR_Array+0, y)
	or	a, (0x01, sp)
	ld	0x50f2, a
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_Init.c: 63: AWU->APR &= (uint8_t)(~AWU_APR_APR);
	ld	a, 0x50f1
	and	a, #0xc0
	ld	0x50f1, a
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_Init.c: 64: AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
	ld	a, 0x50f1
	ld	(0x01, sp), a
	clr	a
	ld	xh, a
	ld	a, (_APR_Array+0, x)
	or	a, (0x01, sp)
	ld	0x50f1, a
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_Init.c: 65: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_awu_Init.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

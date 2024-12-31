;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _CLK_GetClockFreq
	.globl _UART2_Init
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 55: void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
;	-----------------------------------------
;	 function UART2_Init
;	-----------------------------------------
_UART2_Init:
	sub	sp, #16
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 61: assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
	ldw	x, #0x8968
	cpw	x, (0x15, sp)
	ld	a, #0x09
	sbc	a, (0x14, sp)
	clr	a
	sbc	a, (0x13, sp)
	jrnc	00113$
	push	#0x3d
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 62: assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
	tnz	(0x17, sp)
	jreq	00115$
	ld	a, (0x17, sp)
	cp	a, #0x10
	jreq	00115$
	push	#0x3e
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00115$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 63: assert_param(IS_UART2_STOPBITS_OK(StopBits));
	tnz	(0x18, sp)
	jreq	00120$
	ld	a, (0x18, sp)
	cp	a, #0x10
	jreq	00120$
	ld	a, (0x18, sp)
	cp	a, #0x20
	jreq	00120$
	ld	a, (0x18, sp)
	cp	a, #0x30
	jreq	00120$
	push	#0x3f
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00120$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 64: assert_param(IS_UART2_PARITY_OK(Parity));
	tnz	(0x19, sp)
	jreq	00131$
	ld	a, (0x19, sp)
	cp	a, #0x04
	jreq	00131$
	ld	a, (0x19, sp)
	cp	a, #0x06
	jreq	00131$
	push	#0x40
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00131$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 65: assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
	ld	a, (0x1b, sp)
	cp	a, #0x08
	jreq	00139$
	ld	a, (0x1b, sp)
	cp	a, #0x40
	jreq	00139$
	ld	a, (0x1b, sp)
	cp	a, #0x04
	jreq	00139$
	ld	a, (0x1b, sp)
	cp	a, #0x80
	jreq	00139$
	ld	a, (0x1b, sp)
	sub	a, #0x0c
	jrne	00388$
	inc	a
	.byte 0x21
00388$:
	clr	a
00389$:
	tnz	a
	jrne	00139$
	tnz	a
	jrne	00139$
	ld	a, (0x1b, sp)
	cp	a, #0x44
	jreq	00139$
	ld	a, (0x1b, sp)
	cp	a, #0xc0
	jreq	00139$
	ld	a, (0x1b, sp)
	cp	a, #0x88
	jreq	00139$
	push	#0x41
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00139$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 66: assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
	ld	a, (0x1a, sp)
	and	a, #0x88
	cp	a, #0x88
	jreq	00167$
	ld	a, (0x1a, sp)
	and	a, #0x44
	cp	a, #0x44
	jreq	00167$
	ld	a, (0x1a, sp)
	and	a, #0x22
	cp	a, #0x22
	jreq	00167$
	ld	a, (0x1a, sp)
	cpl	a
	bcp	a, #0x11
	jrne	00165$
00167$:
	push	#0x42
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00165$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 69: UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
	bres	0x5244, #4
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 71: UART2->CR1 |= (uint8_t)WordLength; 
	ld	a, 0x5244
	or	a, (0x17, sp)
	ld	0x5244, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 74: UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
	ld	a, 0x5246
	and	a, #0xcf
	ld	0x5246, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 76: UART2->CR3 |= (uint8_t)StopBits; 
	ld	a, 0x5246
	or	a, (0x18, sp)
	ld	0x5246, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 79: UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
	ld	a, 0x5244
	and	a, #0xf9
	ld	0x5244, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 81: UART2->CR1 |= (uint8_t)Parity;
	ld	a, 0x5244
	or	a, (0x19, sp)
	ld	0x5244, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 84: UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
	ld	a, 0x5242
	mov	0x5242+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 86: UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
	ld	a, 0x5243
	and	a, #0x0f
	ld	0x5243, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 88: UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
	ld	a, 0x5243
	and	a, #0xf0
	ld	0x5243, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 91: BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
	call	_CLK_GetClockFreq
	ldw	(0x0f, sp), x
	ldw	x, (0x13, sp)
	ldw	(0x09, sp), x
	ldw	x, (0x15, sp)
	ld	a, #0x04
00413$:
	sllw	x
	rlc	(0x0a, sp)
	rlc	(0x09, sp)
	dec	a
	jrne	00413$
	ldw	(0x0b, sp), x
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x13, sp)
	pushw	x
	pushw	y
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 92: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
	call	__divulong
	addw	sp, #8
	ldw	(0x03, sp), x
	pushw	y
	call	_CLK_GetClockFreq
	ldw	(0x0f, sp), y
	popw	y
	pushw	y
	pushw	x
	ldw	x, (0x11, sp)
	pushw	x
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x11, sp), x
	ldw	(0x0f, sp), y
	popw	y
	pushw	y
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x15, sp)
	pushw	x
	ldw	x, (0x15, sp)
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 96: BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
	call	__divulong
	addw	sp, #8
	ldw	(0x09, sp), x
	ldw	(0x07, sp), y
	popw	y
	pushw	y
	ldw	x, (0x05, sp)
	pushw	x
	pushw	y
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x0d, sp), x
	ldw	(0x0b, sp), y
	popw	y
	ldw	x, (0x07, sp)
	subw	x, (0x0b, sp)
	ldw	(0x0f, sp), x
	ld	a, (0x06, sp)
	sbc	a, (0x0a, sp)
	ld	xl, a
	ld	a, (0x05, sp)
	sbc	a, (0x09, sp)
	ld	xh, a
	ldw	(0x0d, sp), x
	ldw	x, (0x0f, sp)
	ld	a, #0x04
00415$:
	sllw	x
	rlc	(0x0e, sp)
	rlc	(0x0d, sp)
	dec	a
	jrne	00415$
	pushw	y
	push	#0x64
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	ldw	x, (0x15, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x0f, sp), y
	ld	a, xl
	popw	y
	and	a, #0x0f
	ld	(0x0e, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 98: BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
	ldw	x, (0x03, sp)
	ld	a, #0x10
	div	x, a
	rlwa	x
	ld	(0x0f, sp), a
	rrwa	x
	ld	a, xl
	and	a, #0xf0
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 100: UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
	or	a, (0x0e, sp)
	ld	0x5243, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 102: UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
	ld	a, (0x04, sp)
	ld	0x5242, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 105: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
	ld	a, 0x5245
	and	a, #0xf3
	ld	0x5245, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 107: UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
	ld	a, 0x5246
	and	a, #0xf8
	ld	0x5246, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 109: UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
	ld	a, 0x5246
	ld	(0x10, sp), a
	ld	a, (0x1a, sp)
	and	a, #0x07
	or	a, (0x10, sp)
	ld	0x5246, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 105: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
	ld	a, 0x5245
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 112: if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
	push	a
	ld	a, (0x1c, sp)
	bcp	a, #0x04
	pop	a
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 115: UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
	or	a, #0x08
	ld	0x5245, a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 120: UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
	and	a, #0xf7
	ld	0x5245, a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 105: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
	ld	a, 0x5245
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 122: if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
	push	a
	ld	a, (0x1c, sp)
	bcp	a, #0x08
	pop	a
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 125: UART2->CR2 |= (uint8_t)UART2_CR2_REN;
	or	a, #0x04
	ld	0x5245, a
	jra	00106$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 130: UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
	and	a, #0xfb
	ld	0x5245, a
00106$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 74: UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
	ld	a, 0x5246
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 134: if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
	tnz	(0x1a, sp)
	jrpl	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 137: UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
	and	a, #0xf7
	ld	0x5246, a
	jra	00110$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 141: UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
	push	a
	ld	a, (0x1b, sp)
	and	a, #0x08
	ld	(0x11, sp), a
	pop	a
	or	a, (0x10, sp)
	ld	0x5246, a
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c: 143: }
	ldw	x, (17, sp)
	addw	sp, #27
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_uart2_Init.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_ITConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _UART2_ITConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 56: void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function UART2_ITConfig
;	-----------------------------------------
_UART2_ITConfig:
	sub	sp, #7
	ldw	(0x06, sp), x
	ld	(0x05, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 61: assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
	ldw	x, (0x06, sp)
	cpw	x, #0x0100
	jreq	00125$
	cpw	x, #0x0277
	jreq	00125$
	cpw	x, #0x0266
	jreq	00125$
	cpw	x, #0x0205
	jreq	00125$
	cpw	x, #0x0244
	jreq	00125$
	cpw	x, #0x0412
	jreq	00125$
	cpw	x, #0x0346
	jreq	00125$
	pushw	x
	push	#0x3d
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00125$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 62: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x05, sp)
	jreq	00145$
	tnz	(0x05, sp)
	jrne	00145$
	pushw	x
	push	#0x3e
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00145$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 65: uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 68: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
	ld	a, (0x07, sp)
	and	a, #0x0f
	push	a
	ld	a, #0x01
	ld	(0x05, sp), a
	pop	a
	tnz	a
	jreq	00285$
00284$:
	sll	(0x04, sp)
	dec	a
	jrne	00284$
00285$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 73: if (uartreg == 0x01)
	ld	a, xh
	dec	a
	jrne	00287$
	ld	a, #0x01
	ld	(0x01, sp), a
	.byte 0xc5
00287$:
	clr	(0x01, sp)
00288$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 77: else if (uartreg == 0x02)
	ld	a, xh
	sub	a, #0x02
	jrne	00290$
	inc	a
	ld	(0x02, sp), a
	.byte 0xc5
00290$:
	clr	(0x02, sp)
00291$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 81: else if (uartreg == 0x03)
	ld	a, xh
	sub	a, #0x03
	jrne	00293$
	inc	a
	ld	(0x03, sp), a
	.byte 0xc5
00293$:
	clr	(0x03, sp)
00294$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 70: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00120$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 73: if (uartreg == 0x01)
	tnz	(0x01, sp)
	jreq	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 75: UART2->CR1 |= itpos;
	ld	a, 0x5244
	or	a, (0x04, sp)
	ld	0x5244, a
	jra	00122$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 77: else if (uartreg == 0x02)
	tnz	(0x02, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 79: UART2->CR2 |= itpos;
	ld	a, 0x5245
	or	a, (0x04, sp)
	ld	0x5245, a
	jra	00122$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 81: else if (uartreg == 0x03)
	tnz	(0x03, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 83: UART2->CR4 |= itpos;
	ld	a, 0x5247
	or	a, (0x04, sp)
	ld	0x5247, a
	jra	00122$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 87: UART2->CR6 |= itpos;
	ld	a, 0x5249
	or	a, (0x04, sp)
	ld	0x5249, a
	jra	00122$
00120$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 95: UART2->CR1 &= (uint8_t)(~itpos);
	cpl	(0x04, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 93: if (uartreg == 0x01)
	tnz	(0x01, sp)
	jreq	00117$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 95: UART2->CR1 &= (uint8_t)(~itpos);
	ld	a, 0x5244
	ld	(0x03, sp), a
	and	a, (0x04, sp)
	ld	0x5244, a
	jra	00122$
00117$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 97: else if (uartreg == 0x02)
	tnz	(0x02, sp)
	jreq	00114$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 99: UART2->CR2 &= (uint8_t)(~itpos);
	ld	a, 0x5245
	and	a, (0x04, sp)
	ld	0x5245, a
	jra	00122$
00114$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 101: else if (uartreg == 0x03)
	tnz	(0x03, sp)
	jreq	00111$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 103: UART2->CR4 &= (uint8_t)(~itpos);
	ld	a, 0x5247
	and	a, (0x04, sp)
	ld	0x5247, a
	jra	00122$
00111$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 107: UART2->CR6 &= (uint8_t)(~itpos);
	ld	a, 0x5249
	and	a, (0x04, sp)
	ld	0x5249, a
00122$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c: 110: }
	addw	sp, #7
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_uart2_ITConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

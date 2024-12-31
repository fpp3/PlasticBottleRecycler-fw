;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_ClearITPendingBit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _UART2_ClearITPendingBit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearITPendingBit.c: 67: void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
;	-----------------------------------------
;	 function UART2_ClearITPendingBit
;	-----------------------------------------
_UART2_ClearITPendingBit:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearITPendingBit.c: 69: assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
	cpw	x, #0x0255
	jrne	00153$
	ld	a, #0x01
	.byte 0x21
00153$:
	clr	a
00154$:
	cpw	x, #0x0346
	jrne	00156$
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	.byte 0xc5
00156$:
	clr	(0x01, sp)
00157$:
	tnz	a
	jrne	00110$
	cpw	x, #0x0412
	jreq	00110$
	tnz	(0x01, sp)
	jrne	00110$
	push	a
	push	#0x45
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearITPendingBit.c: 72: if (UART2_IT == UART2_IT_RXNE)
	tnz	a
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearITPendingBit.c: 74: UART2->SR = (uint8_t)~(UART2_SR_RXNE);
	mov	0x5240+0, #0xdf
	jra	00107$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearITPendingBit.c: 77: else if (UART2_IT == UART2_IT_LBDF)
	ld	a, (0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearITPendingBit.c: 79: UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
	bres	0x5247, #4
	jra	00107$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearITPendingBit.c: 84: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
	bres	0x5249, #1
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearITPendingBit.c: 86: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearITPendingBit."
	.ascii "c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

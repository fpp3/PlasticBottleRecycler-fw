;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_ClearFlag
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _UART2_ClearFlag
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearFlag.c: 69: void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
;	-----------------------------------------
;	 function UART2_ClearFlag
;	-----------------------------------------
_UART2_ClearFlag:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearFlag.c: 71: assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
	cpw	x, #0x0020
	jrne	00173$
	ld	a, #0x01
	ld	(0x01, sp), a
	.byte 0xc5
00173$:
	clr	(0x01, sp)
00174$:
	cpw	x, #0x0302
	jrne	00176$
	ld	a, #0x01
	ld	(0x02, sp), a
	.byte 0xc5
00176$:
	clr	(0x02, sp)
00177$:
	cpw	x, #0x0210
	jrne	00179$
	ld	a, #0x01
	ld	(0x03, sp), a
	.byte 0xc5
00179$:
	clr	(0x03, sp)
00180$:
	tnz	(0x01, sp)
	jrne	00113$
	tnz	(0x02, sp)
	jrne	00113$
	cpw	x, #0x0301
	jreq	00113$
	tnz	(0x03, sp)
	jrne	00113$
	push	#0x47
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearFlag.c: 74: if (UART2_FLAG == UART2_FLAG_RXNE)
	ld	a, (0x01, sp)
	jreq	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearFlag.c: 76: UART2->SR = (uint8_t)~(UART2_SR_RXNE);
	mov	0x5240+0, #0xdf
	jra	00110$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearFlag.c: 79: else if (UART2_FLAG == UART2_FLAG_LBDF)
	ld	a, (0x03, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearFlag.c: 81: UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
	bres	0x5247, #4
	jra	00110$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearFlag.c: 86: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
	ld	a, 0x5249
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearFlag.c: 84: else if (UART2_FLAG == UART2_FLAG_LHDF)
	ld	a, (0x02, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearFlag.c: 86: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
	ld	a, xl
	and	a, #0xfd
	ld	0x5249, a
	jra	00110$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearFlag.c: 91: UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
	ld	a, xl
	and	a, #0xfe
	ld	0x5249, a
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearFlag.c: 93: }
	addw	sp, #3
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_uart2_ClearFlag.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

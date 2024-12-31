;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_IrDAConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _UART2_IrDAConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_IrDAConfig.c: 47: void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
;	-----------------------------------------
;	 function UART2_IrDAConfig
;	-----------------------------------------
_UART2_IrDAConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_IrDAConfig.c: 49: assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
	ld	(0x01, sp), a
	jrne	00107$
	tnz	(0x01, sp)
	jreq	00107$
	push	#0x31
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_IrDAConfig.c: 53: UART2->CR5 |= UART2_CR5_IRLP;
	ld	a, 0x5248
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_IrDAConfig.c: 51: if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_IrDAConfig.c: 53: UART2->CR5 |= UART2_CR5_IRLP;
	or	a, #0x04
	ld	0x5248, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_IrDAConfig.c: 57: UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
	and	a, #0xfb
	ld	0x5248, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_IrDAConfig.c: 59: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_uart2_IrDAConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

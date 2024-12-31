;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_SetAddress
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _UART2_SetAddress
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SetAddress.c: 46: void UART2_SetAddress(uint8_t UART2_Address)
;	-----------------------------------------
;	 function UART2_SetAddress
;	-----------------------------------------
_UART2_SetAddress:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SetAddress.c: 49: assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
	ld	(0x01, sp), a
	cp	a, #0x10
	jrc	00104$
	push	#0x31
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SetAddress.c: 52: UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
	ld	a, 0x5247
	and	a, #0xf0
	ld	0x5247, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SetAddress.c: 54: UART2->CR4 |= UART2_Address;
	ld	a, 0x5247
	or	a, (0x01, sp)
	ld	0x5247, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SetAddress.c: 55: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_uart2_SetAddress.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

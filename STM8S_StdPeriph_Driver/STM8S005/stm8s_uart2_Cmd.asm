;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_Cmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART2_Cmd
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Cmd.c: 47: void UART2_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART2_Cmd
;	-----------------------------------------
_UART2_Cmd:
	push	a
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Cmd.c: 52: UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
	ld	a, 0x5244
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Cmd.c: 49: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Cmd.c: 52: UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
	and	a, #0xdf
	ld	0x5244, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Cmd.c: 57: UART2->CR1 |= UART2_CR1_UARTD; 
	or	a, #0x20
	ld	0x5244, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_Cmd.c: 59: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

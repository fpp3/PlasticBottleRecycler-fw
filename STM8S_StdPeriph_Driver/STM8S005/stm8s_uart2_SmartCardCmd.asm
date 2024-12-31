;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_SmartCardCmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _UART2_SmartCardCmd
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SmartCardCmd.c: 47: void UART2_SmartCardCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART2_SmartCardCmd
;	-----------------------------------------
_UART2_SmartCardCmd:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SmartCardCmd.c: 50: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	ld	(0x01, sp), a
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	push	#0x32
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SmartCardCmd.c: 55: UART2->CR5 |= UART2_CR5_SCEN;
	ld	a, 0x5248
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SmartCardCmd.c: 52: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SmartCardCmd.c: 55: UART2->CR5 |= UART2_CR5_SCEN;
	or	a, #0x20
	ld	0x5248, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SmartCardCmd.c: 60: UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
	and	a, #0xdf
	ld	0x5248, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SmartCardCmd.c: 62: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_uart2_SmartCardCmd.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

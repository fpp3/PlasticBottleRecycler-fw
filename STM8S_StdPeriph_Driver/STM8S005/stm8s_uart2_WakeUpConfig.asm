;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_WakeUpConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _UART2_WakeUpConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_WakeUpConfig.c: 47: void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
;	-----------------------------------------
;	 function UART2_WakeUpConfig
;	-----------------------------------------
_UART2_WakeUpConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_WakeUpConfig.c: 49: assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
	ld	(0x01, sp), a
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x08
	jreq	00104$
	push	#0x31
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_WakeUpConfig.c: 51: UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
	bres	0x5244, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_WakeUpConfig.c: 52: UART2->CR1 |= (uint8_t)UART2_WakeUp;
	ld	a, 0x5244
	or	a, (0x01, sp)
	ld	0x5244, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_WakeUpConfig.c: 53: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_uart2_WakeUpConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

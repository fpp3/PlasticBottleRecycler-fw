;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_LINBreakDetectionConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _UART2_LINBreakDetectionConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINBreakDetectionConfig.c: 48: void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
;	-----------------------------------------
;	 function UART2_LINBreakDetectionConfig
;	-----------------------------------------
_UART2_LINBreakDetectionConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINBreakDetectionConfig.c: 51: assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
	ld	(0x01, sp), a
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINBreakDetectionConfig.c: 55: UART2->CR4 |= UART2_CR4_LBDL;
	ld	a, 0x5247
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINBreakDetectionConfig.c: 53: if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINBreakDetectionConfig.c: 55: UART2->CR4 |= UART2_CR4_LBDL;
	or	a, #0x20
	ld	0x5247, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINBreakDetectionConfig.c: 59: UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
	and	a, #0xdf
	ld	0x5247, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINBreakDetectionConfig.c: 61: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINBreakDetectionC"
	.ascii "onfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

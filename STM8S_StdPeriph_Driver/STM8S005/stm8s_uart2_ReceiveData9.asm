;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_ReceiveData9
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART2_ReceiveData9
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ReceiveData9.c: 46: uint16_t UART2_ReceiveData9(void)
;	-----------------------------------------
;	 function UART2_ReceiveData9
;	-----------------------------------------
_UART2_ReceiveData9:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ReceiveData9.c: 50: temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
	ld	a, 0x5244
	and	a, #0x80
	ld	xl, a
	clr	a
	ld	xh, a
	sllw	x
	exgw	x, y
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ReceiveData9.c: 52: return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
	ld	a, 0x5241
	ld	xl, a
	ld	a, yh
	and	a, #0x01
	ld	xh, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ReceiveData9.c: 53: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

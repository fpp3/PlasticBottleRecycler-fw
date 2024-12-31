;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_ReceiveData8
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART2_ReceiveData8
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ReceiveData8.c: 46: uint8_t UART2_ReceiveData8(void)
;	-----------------------------------------
;	 function UART2_ReceiveData8
;	-----------------------------------------
_UART2_ReceiveData8:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ReceiveData8.c: 48: return ((uint8_t)UART2->DR);
	ld	a, 0x5241
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_ReceiveData8.c: 49: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

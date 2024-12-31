;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_SetPrescaler
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART2_SetPrescaler
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SetPrescaler.c: 63: void UART2_SetPrescaler(uint8_t UART2_Prescaler)
;	-----------------------------------------
;	 function UART2_SetPrescaler
;	-----------------------------------------
_UART2_SetPrescaler:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SetPrescaler.c: 66: UART2->PSCR = UART2_Prescaler;
	ld	0x524b, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SetPrescaler.c: 67: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

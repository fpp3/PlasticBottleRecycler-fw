;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_SendData9
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART2_SendData9
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SendData9.c: 46: void UART2_SendData9(uint16_t Data)
;	-----------------------------------------
;	 function UART2_SendData9
;	-----------------------------------------
_UART2_SendData9:
	push	a
	exgw	x, y
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SendData9.c: 49: UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
	bres	0x5244, #6
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SendData9.c: 52: UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
	ld	a, 0x5244
	ld	(0x01, sp), a
	ldw	x, y
	srlw	x
	srlw	x
	ld	a, xl
	and	a, #0x40
	or	a, (0x01, sp)
	ld	0x5244, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SendData9.c: 55: UART2->DR   = (uint8_t)(Data);                    
	ld	a, yl
	ld	0x5241, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_SendData9.c: 56: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

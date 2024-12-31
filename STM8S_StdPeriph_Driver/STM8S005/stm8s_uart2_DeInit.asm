;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_DeInit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART2_DeInit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_DeInit.c: 47: void UART2_DeInit(void)
;	-----------------------------------------
;	 function UART2_DeInit
;	-----------------------------------------
_UART2_DeInit:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_DeInit.c: 51: (void) UART2->SR;
	ld	a, 0x5240
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_DeInit.c: 52: (void)UART2->DR;
	ld	a, 0x5241
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_DeInit.c: 54: UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
	mov	0x5243+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_DeInit.c: 55: UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
	mov	0x5242+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_DeInit.c: 57: UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
	mov	0x5244+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_DeInit.c: 58: UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
	mov	0x5245+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_DeInit.c: 59: UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
	mov	0x5246+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_DeInit.c: 60: UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
	mov	0x5247+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_DeInit.c: 61: UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
	mov	0x5248+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_DeInit.c: 62: UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
	mov	0x5249+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_DeInit.c: 63: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

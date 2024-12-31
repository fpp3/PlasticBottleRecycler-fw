;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_spi_ClearITPendingBit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _SPI_ClearITPendingBit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ClearITPendingBit.c: 55: void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
;	-----------------------------------------
;	 function SPI_ClearITPendingBit
;	-----------------------------------------
_SPI_ClearITPendingBit:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ClearITPendingBit.c: 58: assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
	cp	a, #0x45
	jreq	00104$
	cp	a, #0x34
	jreq	00104$
	push	a
	push	#0x3a
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ClearITPendingBit.c: 63: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
	and	a, #0xf0
	swap	a
	and	a, #0x0f
	ld	xl, a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00129$
00128$:
	sll	(1, sp)
	dec	a
	jrne	00128$
00129$:
	pop	a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ClearITPendingBit.c: 65: SPI->SR = (uint8_t)(~itpos);
	cpl	a
	ld	0x5203, a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ClearITPendingBit.c: 67: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_spi_ClearITPendingBit.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

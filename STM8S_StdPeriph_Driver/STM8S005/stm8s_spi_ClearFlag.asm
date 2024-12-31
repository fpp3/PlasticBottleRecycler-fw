;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_spi_ClearFlag
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _SPI_ClearFlag
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ClearFlag.c: 56: void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
;	-----------------------------------------
;	 function SPI_ClearFlag
;	-----------------------------------------
_SPI_ClearFlag:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ClearFlag.c: 58: assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
	cp	a, #0x10
	jreq	00104$
	cp	a, #0x08
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ClearFlag.c: 60: SPI->SR = (uint8_t)(~SPI_FLAG);
	cpl	a
	ld	0x5203, a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ClearFlag.c: 61: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_spi_ClearFlag.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

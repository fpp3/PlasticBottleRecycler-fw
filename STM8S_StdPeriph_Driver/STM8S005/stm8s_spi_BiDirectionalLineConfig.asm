;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_spi_BiDirectionalLineConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _SPI_BiDirectionalLineConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_BiDirectionalLineConfig.c: 46: void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
;	-----------------------------------------
;	 function SPI_BiDirectionalLineConfig
;	-----------------------------------------
_SPI_BiDirectionalLineConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_BiDirectionalLineConfig.c: 49: assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
	ld	(0x01, sp), a
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	push	#0x31
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_BiDirectionalLineConfig.c: 53: SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
	ld	a, 0x5201
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_BiDirectionalLineConfig.c: 51: if (SPI_Direction != SPI_DIRECTION_RX)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_BiDirectionalLineConfig.c: 53: SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
	or	a, #0x40
	ld	0x5201, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_BiDirectionalLineConfig.c: 57: SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
	and	a, #0xbf
	ld	0x5201, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_BiDirectionalLineConfig.c: 59: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_spi_BiDirectionalLineCon"
	.ascii "fig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

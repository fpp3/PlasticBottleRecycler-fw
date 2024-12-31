;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_spi_GetCRC
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _SPI_GetCRC
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetCRC.c: 46: uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
;	-----------------------------------------
;	 function SPI_GetCRC
;	-----------------------------------------
_SPI_GetCRC:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetCRC.c: 51: assert_param(IS_SPI_CRC_OK(SPI_CRC));
	tnz	a
	jrne	00107$
	tnz	a
	jreq	00107$
	push	a
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetCRC.c: 53: if (SPI_CRC != SPI_CRC_RX)
	tnz	a
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetCRC.c: 55: crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
	ld	a, 0x5207
	ret
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetCRC.c: 59: crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
	ld	a, 0x5206
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetCRC.c: 63: return crcreg;
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetCRC.c: 64: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_spi_GetCRC.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

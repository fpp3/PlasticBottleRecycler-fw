;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_spi_CalculateCRCCmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _SPI_CalculateCRCCmd
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_CalculateCRCCmd.c: 47: void SPI_CalculateCRCCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function SPI_CalculateCRCCmd
;	-----------------------------------------
_SPI_CalculateCRCCmd:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_CalculateCRCCmd.c: 50: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	ld	(0x01, sp), a
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	push	#0x32
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_CalculateCRCCmd.c: 54: SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
	ld	a, 0x5201
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_CalculateCRCCmd.c: 52: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_CalculateCRCCmd.c: 54: SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
	or	a, #0x20
	ld	0x5201, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_CalculateCRCCmd.c: 58: SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
	and	a, #0xdf
	ld	0x5201, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_CalculateCRCCmd.c: 60: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_spi_CalculateCRCCmd.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

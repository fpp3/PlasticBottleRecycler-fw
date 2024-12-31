;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_spi_NSSInternalSoftwareCmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _SPI_NSSInternalSoftwareCmd
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_NSSInternalSoftwareCmd.c: 47: void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function SPI_NSSInternalSoftwareCmd
;	-----------------------------------------
_SPI_NSSInternalSoftwareCmd:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_NSSInternalSoftwareCmd.c: 50: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_NSSInternalSoftwareCmd.c: 54: SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
	ld	a, 0x5201
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_NSSInternalSoftwareCmd.c: 52: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_NSSInternalSoftwareCmd.c: 54: SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
	or	a, #0x01
	ld	0x5201, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_NSSInternalSoftwareCmd.c: 58: SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
	and	a, #0xfe
	ld	0x5201, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_NSSInternalSoftwareCmd.c: 60: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_spi_NSSInternalSoftwareC"
	.ascii "md.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

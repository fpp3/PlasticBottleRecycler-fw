;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_spi_Cmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _SPI_Cmd
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Cmd.c: 47: void SPI_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function SPI_Cmd
;	-----------------------------------------
_SPI_Cmd:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Cmd.c: 50: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Cmd.c: 54: SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
	ld	a, 0x5200
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Cmd.c: 52: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Cmd.c: 54: SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
	or	a, #0x40
	ld	0x5200, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Cmd.c: 58: SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
	and	a, #0xbf
	ld	0x5200, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Cmd.c: 60: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_spi_Cmd.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

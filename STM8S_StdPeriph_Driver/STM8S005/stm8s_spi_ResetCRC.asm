;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_spi_ResetCRC
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SPI_CalculateCRCCmd
	.globl _SPI_Cmd
	.globl _SPI_ResetCRC
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ResetCRC.c: 46: void SPI_ResetCRC(void)
;	-----------------------------------------
;	 function SPI_ResetCRC
;	-----------------------------------------
_SPI_ResetCRC:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ResetCRC.c: 50: SPI_CalculateCRCCmd(ENABLE);
	ld	a, #0x01
	call	_SPI_CalculateCRCCmd
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ResetCRC.c: 53: SPI_Cmd(ENABLE);
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ResetCRC.c: 54: }
	jp	_SPI_Cmd
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

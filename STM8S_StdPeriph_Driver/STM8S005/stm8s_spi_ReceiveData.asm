;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_spi_ReceiveData
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SPI_ReceiveData
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ReceiveData.c: 46: uint8_t SPI_ReceiveData(void)
;	-----------------------------------------
;	 function SPI_ReceiveData
;	-----------------------------------------
_SPI_ReceiveData:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ReceiveData.c: 48: return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
	ld	a, 0x5204
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ReceiveData.c: 49: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

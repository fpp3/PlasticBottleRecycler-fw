;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_spi_DeInit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SPI_DeInit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_DeInit.c: 46: void SPI_DeInit(void)
;	-----------------------------------------
;	 function SPI_DeInit
;	-----------------------------------------
_SPI_DeInit:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_DeInit.c: 48: SPI->CR1    = SPI_CR1_RESET_VALUE;
	mov	0x5200+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_DeInit.c: 49: SPI->CR2    = SPI_CR2_RESET_VALUE;
	mov	0x5201+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_DeInit.c: 50: SPI->ICR    = SPI_ICR_RESET_VALUE;
	mov	0x5202+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_DeInit.c: 51: SPI->SR     = SPI_SR_RESET_VALUE;
	mov	0x5203+0, #0x02
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_DeInit.c: 52: SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
	mov	0x5205+0, #0x07
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_DeInit.c: 53: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

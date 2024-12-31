;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_spi_Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _SPI_Init
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 60: void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
;	-----------------------------------------
;	 function SPI_Init
;	-----------------------------------------
_SPI_Init:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 63: assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
	ld	(0x03, sp), a
	jreq	00107$
	ld	a, (0x03, sp)
	cp	a, #0x80
	jreq	00107$
	push	#0x3f
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 64: assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
	tnz	(0x06, sp)
	jreq	00112$
	ld	a, (0x06, sp)
	cp	a, #0x08
	jreq	00112$
	ld	a, (0x06, sp)
	cp	a, #0x10
	jreq	00112$
	ld	a, (0x06, sp)
	cp	a, #0x18
	jreq	00112$
	ld	a, (0x06, sp)
	cp	a, #0x20
	jreq	00112$
	ld	a, (0x06, sp)
	cp	a, #0x28
	jreq	00112$
	ld	a, (0x06, sp)
	cp	a, #0x30
	jreq	00112$
	ld	a, (0x06, sp)
	cp	a, #0x38
	jreq	00112$
	push	#0x40
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00112$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 65: assert_param(IS_SPI_MODE_OK(Mode));
	ld	a, (0x07, sp)
	cp	a, #0x04
	jrne	00362$
	ld	a, #0x01
	ld	(0x01, sp), a
	.byte 0xc5
00362$:
	clr	(0x01, sp)
00363$:
	tnz	(0x01, sp)
	jrne	00135$
	tnz	(0x07, sp)
	jreq	00135$
	push	#0x41
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00135$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 66: assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
	tnz	(0x08, sp)
	jreq	00140$
	ld	a, (0x08, sp)
	cp	a, #0x02
	jreq	00140$
	push	#0x42
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00140$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 67: assert_param(IS_SPI_PHASE_OK(ClockPhase));
	tnz	(0x09, sp)
	jreq	00145$
	tnz	(0x09, sp)
	jrne	00145$
	push	#0x43
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00145$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 68: assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
	tnz	(0x0a, sp)
	jreq	00150$
	ld	a, (0x0a, sp)
	cp	a, #0x04
	jreq	00150$
	ld	a, (0x0a, sp)
	cp	a, #0x80
	jreq	00150$
	ld	a, (0x0a, sp)
	cp	a, #0xc0
	jreq	00150$
	push	#0x44
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00150$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 69: assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
	ld	a, (0x0b, sp)
	cp	a, #0x02
	jreq	00161$
	tnz	(0x0b, sp)
	jreq	00161$
	push	#0x45
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00161$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 70: assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
	tnz	(0x0c, sp)
	jrne	00166$
	push	#0x46
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00166$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 73: SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
	ld	a, (0x03, sp)
	or	a, (0x06, sp)
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 74: (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
	ld	a, (0x09, sp)
	or	a, (0x08, sp)
	or	a, (0x02, sp)
	ld	0x5200, a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 77: SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
	ld	a, (0x0a, sp)
	or	a, (0x0b, sp)
	ld	0x5201, a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 81: SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
	ld	a, 0x5201
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 79: if (Mode == SPI_MODE_MASTER)
	ld	a, (0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 81: SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
	ld	a, xl
	or	a, #0x01
	ld	0x5201, a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 85: SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
	ld	a, xl
	and	a, #0xfe
	ld	0x5201, a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 89: SPI->CR1 |= (uint8_t)(Mode);
	ld	a, 0x5200
	or	a, (0x07, sp)
	ld	0x5200, a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 92: SPI->CRCPR = (uint8_t)CRCPolynomial;
	ldw	x, #0x5205
	ld	a, (0x0c, sp)
	ld	(x), a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c: 93: }
	ldw	x, (4, sp)
	addw	sp, #12
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_spi_Init.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

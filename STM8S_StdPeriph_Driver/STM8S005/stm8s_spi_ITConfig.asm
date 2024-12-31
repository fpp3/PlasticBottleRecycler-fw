;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_spi_ITConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _SPI_ITConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ITConfig.c: 48: void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function SPI_ITConfig
;	-----------------------------------------
_SPI_ITConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ITConfig.c: 52: assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
	cp	a, #0x17
	jreq	00107$
	cp	a, #0x06
	jreq	00107$
	cp	a, #0x05
	jreq	00107$
	cp	a, #0x34
	jreq	00107$
	push	a
	push	#0x34
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ITConfig.c: 53: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x04, sp)
	jreq	00118$
	tnz	(0x04, sp)
	jrne	00118$
	push	a
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00118$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ITConfig.c: 56: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
	and	a, #0x0f
	ld	xl, a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00186$
00185$:
	sll	(1, sp)
	dec	a
	jrne	00185$
00186$:
	pop	a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ITConfig.c: 60: SPI->ICR |= itpos; /* Enable interrupt*/
	ldw	x, #0x5202
	push	a
	ld	a, (x)
	ld	(0x02, sp), a
	pop	a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ITConfig.c: 58: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ITConfig.c: 60: SPI->ICR |= itpos; /* Enable interrupt*/
	or	a, (0x01, sp)
	ld	0x5202, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ITConfig.c: 64: SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
	cpl	a
	and	a, (0x01, sp)
	ld	0x5202, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_ITConfig.c: 66: }
	pop	a
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_spi_ITConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

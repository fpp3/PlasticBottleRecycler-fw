;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_spi_GetITStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _SPI_GetITStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetITStatus.c: 54: ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
;	-----------------------------------------
;	 function SPI_GetITStatus
;	-----------------------------------------
_SPI_GetITStatus:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetITStatus.c: 61: assert_param(IS_SPI_GET_IT_OK(SPI_IT));
	cp	a, #0x65
	jreq	00108$
	cp	a, #0x55
	jreq	00108$
	cp	a, #0x45
	jreq	00108$
	cp	a, #0x34
	jreq	00108$
	cp	a, #0x17
	jreq	00108$
	cp	a, #0x06
	jreq	00108$
	push	a
	push	#0x3d
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetITStatus.c: 63: itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
	push	a
	and	a, #0x0f
	ld	xl, a
	ld	a, #0x01
	ld	(0x02, sp), a
	ld	a, xl
	tnz	a
	jreq	00199$
00198$:
	sll	(0x02, sp)
	dec	a
	jrne	00198$
00199$:
	pop	a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetITStatus.c: 66: itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
	swap	a
	and	a, #0x0f
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetITStatus.c: 68: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
	push	a
	ld	a, #0x01
	ld	(0x03, sp), a
	pop	a
	tnz	a
	jreq	00201$
00200$:
	sll	(0x02, sp)
	dec	a
	jrne	00200$
00201$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetITStatus.c: 70: enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
	ld	a, 0x5203
	and	a, (0x02, sp)
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetITStatus.c: 72: if (((SPI->ICR & itpos) != RESET) && enablestatus)
	ld	a, 0x5202
	and	a, (0x01, sp)
	jreq	00102$
	ld	a, xl
	tnz	a
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetITStatus.c: 75: pendingbitstatus = SET;
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetITStatus.c: 80: pendingbitstatus = RESET;
	.byte 0x21
00102$:
	clr	a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetITStatus.c: 83: return  pendingbitstatus;
;	../STM8S_StdPeriph_Driver/src/stm8s_spi_GetITStatus.c: 84: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_spi_GetITStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

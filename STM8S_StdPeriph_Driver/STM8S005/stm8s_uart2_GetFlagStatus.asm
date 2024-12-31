;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_GetFlagStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _UART2_GetFlagStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 47: FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
;	-----------------------------------------
;	 function UART2_GetFlagStatus
;	-----------------------------------------
_UART2_GetFlagStatus:
	sub	sp, #4
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 52: assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
	ldw	y, x
	cpw	x, #0x0101
	jrne	00294$
	ld	a, #0x01
	ld	(0x01, sp), a
	.byte 0xc5
00294$:
	clr	(0x01, sp)
00295$:
	cpw	x, #0x0301
	jrne	00297$
	ld	a, #0x01
	ld	(0x02, sp), a
	.byte 0xc5
00297$:
	clr	(0x02, sp)
00298$:
	cpw	x, #0x0302
	jrne	00300$
	ld	a, #0x01
	ld	(0x03, sp), a
	.byte 0xc5
00300$:
	clr	(0x03, sp)
00301$:
	cpw	x, #0x0210
	jrne	00303$
	ld	a, #0x01
	.byte 0x21
00303$:
	clr	a
00304$:
	cpw	x, #0x0080
	jreq	00126$
	cpw	x, #0x0040
	jreq	00126$
	cpw	x, #0x0020
	jreq	00126$
	cpw	x, #0x0010
	jreq	00126$
	cpw	x, #0x0008
	jreq	00126$
	cpw	x, #0x0004
	jreq	00126$
	cpw	x, #0x0002
	jreq	00126$
	decw	x
	jreq	00126$
	tnz	(0x01, sp)
	jrne	00126$
	tnz	(0x02, sp)
	jrne	00126$
	tnz	(0x03, sp)
	jrne	00126$
	tnz	a
	jrne	00126$
	push	a
	pushw	y
	push	#0x34
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	y
	pop	a
00126$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 57: if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
	exg	a, yl
	ld	(0x04, sp), a
	exg	a, yl
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 55: if (UART2_FLAG == UART2_FLAG_LBDF)
	tnz	a
	jreq	00121$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 57: if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
	ld	a, 0x5247
	and	a, (0x04, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 60: status = SET;
	ld	a, #0x01
	jra	00122$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 65: status = RESET;
	clr	a
	jra	00122$
00121$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 68: else if (UART2_FLAG == UART2_FLAG_SBK)
	ld	a, (0x01, sp)
	jreq	00118$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 70: if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
	ld	a, 0x5245
	and	a, (0x04, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 73: status = SET;
	ld	a, #0x01
	jra	00122$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 78: status = RESET;
	clr	a
	jra	00122$
00118$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 81: else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
	ld	a, (0x03, sp)
	jrne	00113$
	ld	a, (0x02, sp)
	jreq	00114$
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 83: if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
	ld	a, 0x5249
	and	a, (0x04, sp)
	jreq	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 86: status = SET;
	ld	a, #0x01
	jra	00122$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 91: status = RESET;
	clr	a
	jra	00122$
00114$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 96: if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
	ld	a, 0x5240
	and	a, (0x04, sp)
	jreq	00111$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 99: status = SET;
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 104: status = RESET;
	.byte 0x21
00111$:
	clr	a
00122$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 109: return  status;
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c: 110: }
	addw	sp, #4
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetFlagStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

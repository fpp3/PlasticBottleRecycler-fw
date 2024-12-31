;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_GetITStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _UART2_GetITStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 54: ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
;	-----------------------------------------
;	 function UART2_GetITStatus
;	-----------------------------------------
_UART2_GetITStatus:
	sub	sp, #5
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 63: assert_param(IS_UART2_GET_IT_OK(UART2_IT));
	ldw	y, x
	cpw	x, #0x0346
	jrne	00285$
	ld	a, #0x01
	ld	(0x01, sp), a
	.byte 0xc5
00285$:
	clr	(0x01, sp)
00286$:
	cpw	x, #0x0412
	jrne	00288$
	ld	a, #0x01
	ld	(0x02, sp), a
	.byte 0xc5
00288$:
	clr	(0x02, sp)
00289$:
	cpw	x, #0x0100
	jrne	00291$
	ld	a, #0x01
	ld	(0x03, sp), a
	.byte 0xc5
00291$:
	clr	(0x03, sp)
00292$:
	cpw	x, #0x0277
	jreq	00129$
	cpw	x, #0x0266
	jreq	00129$
	cpw	x, #0x0255
	jreq	00129$
	cpw	x, #0x0244
	jreq	00129$
	cpw	x, #0x0235
	jreq	00129$
	tnz	(0x01, sp)
	jrne	00129$
	tnz	(0x02, sp)
	jrne	00129$
	tnz	(0x03, sp)
	jrne	00129$
	pushw	y
	push	#0x3f
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	y
00129$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 66: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
	ldw	x, y
	ld	a, xl
	and	a, #0x0f
	push	a
	ld	a, #0x01
	ld	(0x05, sp), a
	pop	a
	tnz	a
	jreq	00312$
00311$:
	sll	(0x04, sp)
	dec	a
	jrne	00311$
00312$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 68: itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
	ld	a, xl
	swap	a
	and	a, #0x0f
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 70: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
	push	a
	ld	a, #0x01
	ld	(0x06, sp), a
	pop	a
	tnz	a
	jreq	00314$
00313$:
	sll	(0x05, sp)
	dec	a
	jrne	00313$
00314$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 73: if (UART2_IT == UART2_IT_PE)
	ld	a, (0x03, sp)
	jreq	00124$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 76: enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
	ld	a, 0x5244
	and	a, (0x05, sp)
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 79: if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
	ld	a, 0x5240
	and	a, (0x04, sp)
	jreq	00102$
	ld	a, xl
	tnz	a
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 82: pendingbitstatus = SET;
	ld	a, #0x01
	jra	00125$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 87: pendingbitstatus = RESET;
	clr	a
	jra	00125$
00124$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 90: else if (UART2_IT == UART2_IT_LBDF)
	ld	a, (0x01, sp)
	jreq	00121$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 93: enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
	ld	a, 0x5247
	and	a, (0x05, sp)
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 95: if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
	ld	a, 0x5247
	and	a, (0x04, sp)
	jreq	00106$
	ld	a, xl
	tnz	a
	jreq	00106$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 98: pendingbitstatus = SET;
	ld	a, #0x01
	jra	00125$
00106$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 103: pendingbitstatus = RESET;
	clr	a
	jra	00125$
00121$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 106: else if (UART2_IT == UART2_IT_LHDF)
	ld	a, (0x02, sp)
	jreq	00118$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 109: enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
	ld	a, 0x5249
	and	a, (0x05, sp)
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 111: if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
	ld	a, 0x5249
	and	a, (0x04, sp)
	jreq	00110$
	ld	a, xl
	tnz	a
	jreq	00110$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 114: pendingbitstatus = SET;
	ld	a, #0x01
	jra	00125$
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 119: pendingbitstatus = RESET;
	clr	a
	jra	00125$
00118$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 125: enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
	ld	a, 0x5245
	and	a, (0x05, sp)
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 127: if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
	ld	a, 0x5240
	and	a, (0x04, sp)
	jreq	00114$
	ld	a, xl
	tnz	a
	jreq	00114$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 130: pendingbitstatus = SET;
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 135: pendingbitstatus = RESET;
	.byte 0x21
00114$:
	clr	a
00125$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 139: return  pendingbitstatus;
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c: 140: }
	addw	sp, #5
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_uart2_GetITStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

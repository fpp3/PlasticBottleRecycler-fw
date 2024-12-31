;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_uart2_LINConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _UART2_LINConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 51: void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
;	-----------------------------------------
;	 function UART2_LINConfig
;	-----------------------------------------
_UART2_LINConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 56: assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
	ld	(0x01, sp), a
	jreq	00113$
	tnz	(0x01, sp)
	jrne	00113$
	push	#0x38
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 57: assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
	tnz	(0x04, sp)
	jrne	00118$
	tnz	(0x04, sp)
	jreq	00118$
	push	#0x39
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00118$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 58: assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
	tnz	(0x05, sp)
	jreq	00123$
	tnz	(0x05, sp)
	jrne	00123$
	push	#0x3a
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00123$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 62: UART2->CR6 |=  UART2_CR6_LSLV;
	ld	a, 0x5249
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 60: if (UART2_Mode != UART2_LIN_MODE_MASTER)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 62: UART2->CR6 |=  UART2_CR6_LSLV;
	or	a, #0x20
	ld	0x5249, a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 66: UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
	and	a, #0xdf
	ld	0x5249, a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 62: UART2->CR6 |=  UART2_CR6_LSLV;
	ld	a, 0x5249
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 69: if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
	tnz	(0x04, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 71: UART2->CR6 |=  UART2_CR6_LASE ;
	or	a, #0x10
	ld	0x5249, a
	jra	00106$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 75: UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
	and	a, #0xef
	ld	0x5249, a
00106$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 62: UART2->CR6 |=  UART2_CR6_LSLV;
	ld	a, 0x5249
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 78: if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
	tnz	(0x05, sp)
	jreq	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 80: UART2->CR6 |=  UART2_CR6_LDUM;
	or	a, #0x80
	ld	0x5249, a
	jra	00110$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 84: UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
	and	a, #0x7f
	ld	0x5249, a
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c: 86: }
	ldw	x, (2, sp)
	addw	sp, #5
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_uart2_LINConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

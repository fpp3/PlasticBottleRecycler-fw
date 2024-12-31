;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_clk_ITConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _CLK_ITConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 50: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_ITConfig
;	-----------------------------------------
_CLK_ITConfig:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 53: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x03, sp)
	jreq	00115$
	tnz	(0x03, sp)
	jrne	00115$
	push	a
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00115$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 54: assert_param(IS_CLK_IT_OK(CLK_IT));
	cp	a, #0x0c
	jrne	00190$
	exg	a, xl
	ld	a, #0x01
	exg	a, xl
	jra	00191$
00190$:
	exg	a, xl
	clr	a
	exg	a, xl
00191$:
	sub	a, #0x1c
	jrne	00193$
	inc	a
	ld	xh, a
	jra	00194$
00193$:
	clr	a
	ld	xh, a
00194$:
	ld	a, xl
	tnz	a
	jrne	00120$
	ld	a, xh
	tnz	a
	jrne	00120$
	pushw	x
	push	#0x36
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00120$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 56: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00110$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 58: switch (CLK_IT)
	ld	a, xl
	tnz	a
	jrne	00102$
	ld	a, xh
	tnz	a
	jreq	00112$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 61: CLK->SWCR |= CLK_SWCR_SWIEN;
	ld	a, 0x50c5
	or	a, #0x04
	ld	0x50c5, a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 62: break;
	jra	00112$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 63: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 64: CLK->CSSR |= CLK_CSSR_CSSDIE;
	ld	a, 0x50c8
	or	a, #0x04
	ld	0x50c8, a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 65: break;
	jra	00112$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 68: }
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 72: switch (CLK_IT)
	ld	a, xl
	tnz	a
	jrne	00106$
	ld	a, xh
	tnz	a
	jreq	00112$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 75: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
	ld	a, 0x50c5
	and	a, #0xfb
	ld	0x50c5, a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 76: break;
	jra	00112$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 77: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
00106$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 78: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
	ld	a, 0x50c8
	and	a, #0xfb
	ld	0x50c8, a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 82: }
00112$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c: 84: }
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_clk_ITConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_clk_ClearITPendingBit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _CLK_ClearITPendingBit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ClearITPendingBit.c: 48: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
;	-----------------------------------------
;	 function CLK_ClearITPendingBit
;	-----------------------------------------
_CLK_ClearITPendingBit:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ClearITPendingBit.c: 51: assert_param(IS_CLK_IT_OK(CLK_IT));
	ld	xl, a
	sub	a, #0x0c
	jrne	00133$
	inc	a
	.byte 0x21
00133$:
	clr	a
00134$:
	tnz	a
	jrne	00107$
	push	a
	ld	a, xl
	cp	a, #0x1c
	pop	a
	jreq	00107$
	push	a
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ClearITPendingBit.c: 53: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
	tnz	a
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ClearITPendingBit.c: 56: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
	bres	0x50c8, #3
	ret
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ClearITPendingBit.c: 61: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
	bres	0x50c5, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_ClearITPendingBit.c: 64: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_clk_ClearITPendingBit.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

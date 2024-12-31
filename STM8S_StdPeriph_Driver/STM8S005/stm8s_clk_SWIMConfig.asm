;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_clk_SWIMConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _CLK_SWIMConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SWIMConfig.c: 48: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
;	-----------------------------------------
;	 function CLK_SWIMConfig
;	-----------------------------------------
_CLK_SWIMConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SWIMConfig.c: 51: assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
	ld	(0x01, sp), a
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SWIMConfig.c: 56: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
	ld	a, 0x50cd
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SWIMConfig.c: 53: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SWIMConfig.c: 56: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
	or	a, #0x01
	ld	0x50cd, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SWIMConfig.c: 61: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
	and	a, #0xfe
	ld	0x50cd, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SWIMConfig.c: 63: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_clk_SWIMConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

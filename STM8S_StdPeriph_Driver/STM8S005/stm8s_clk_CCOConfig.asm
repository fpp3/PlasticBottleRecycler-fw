;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_clk_CCOConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _CLK_CCOConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_CCOConfig.c: 51: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
;	-----------------------------------------
;	 function CLK_CCOConfig
;	-----------------------------------------
_CLK_CCOConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_CCOConfig.c: 54: assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
	tnz	a
	jreq	00104$
	cp	a, #0x04
	jreq	00104$
	cp	a, #0x02
	jreq	00104$
	cp	a, #0x08
	jreq	00104$
	cp	a, #0x0a
	jreq	00104$
	cp	a, #0x0c
	jreq	00104$
	cp	a, #0x0e
	jreq	00104$
	cp	a, #0x10
	jreq	00104$
	cp	a, #0x12
	jreq	00104$
	cp	a, #0x14
	jreq	00104$
	cp	a, #0x16
	jreq	00104$
	cp	a, #0x18
	jreq	00104$
	cp	a, #0x1a
	jreq	00104$
	push	a
	push	#0x36
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_CCOConfig.c: 57: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
	ldw	x, #0x50c9
	push	a
	ld	a, (x)
	and	a, #0xe1
	ld	(0x02, sp), a
	pop	a
	ldw	x, #0x50c9
	push	a
	ld	a, (0x02, sp)
	ld	(x), a
	pop	a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_CCOConfig.c: 60: CLK->CCOR |= (uint8_t)CLK_CCO;
	ldw	x, #0x50c9
	push	a
	ld	a, (x)
	ld	(0x02, sp), a
	pop	a
	or	a, (0x01, sp)
	ld	0x50c9, a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_CCOConfig.c: 63: CLK->CCOR |= CLK_CCOR_CCOEN;
	bset	0x50c9, #0
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_CCOConfig.c: 64: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_clk_CCOConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

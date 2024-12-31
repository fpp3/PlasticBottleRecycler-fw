;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_clk_SYSCLKConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _CLK_SYSCLKConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SYSCLKConfig.c: 47: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
;	-----------------------------------------
;	 function CLK_SYSCLKConfig
;	-----------------------------------------
_CLK_SYSCLKConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SYSCLKConfig.c: 50: assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
	ld	xh, a
	tnz	a
	jreq	00107$
	ld	a, xh
	cp	a, #0x08
	jreq	00107$
	ld	a, xh
	cp	a, #0x10
	jreq	00107$
	ld	a, xh
	cp	a, #0x18
	jreq	00107$
	ld	a, xh
	cp	a, #0x80
	jreq	00107$
	ld	a, xh
	cp	a, #0x81
	jreq	00107$
	ld	a, xh
	cp	a, #0x82
	jreq	00107$
	ld	a, xh
	cp	a, #0x83
	jreq	00107$
	ld	a, xh
	cp	a, #0x84
	jreq	00107$
	ld	a, xh
	cp	a, #0x85
	jreq	00107$
	ld	a, xh
	cp	a, #0x86
	jreq	00107$
	ld	a, xh
	cp	a, #0x87
	jreq	00107$
	pushw	x
	push	#0x32
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	rlwa	x
	pop	a
	rrwa	x
	pop	a
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SYSCLKConfig.c: 54: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SYSCLKConfig.c: 52: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
	tnzw	x
	jrmi	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SYSCLKConfig.c: 54: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	and	a, #0xe7
	ld	0x50c6, a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SYSCLKConfig.c: 55: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
	ld	(0x01, sp), a
	ld	a, xh
	and	a, #0x18
	or	a, (0x01, sp)
	ld	0x50c6, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SYSCLKConfig.c: 59: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
	and	a, #0xf8
	ld	0x50c6, a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SYSCLKConfig.c: 60: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
	ld	a, 0x50c6
	ld	(0x01, sp), a
	ld	a, xh
	and	a, #0x07
	or	a, (0x01, sp)
	ld	0x50c6, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SYSCLKConfig.c: 62: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_clk_SYSCLKConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

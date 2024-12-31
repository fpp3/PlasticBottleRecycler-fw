;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_clk_GetClockFreq
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CLK_GetClockFreq
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
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetClockFreq.c: 47: uint32_t CLK_GetClockFreq(void)
;	-----------------------------------------
;	 function CLK_GetClockFreq
;	-----------------------------------------
_CLK_GetClockFreq:
	sub	sp, #4
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetClockFreq.c: 54: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
	ld	a, 0x50c3
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetClockFreq.c: 56: if (clocksource == CLK_SOURCE_HSI)
	ld	(0x04, sp), a
	cp	a, #0xe1
	jrne	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetClockFreq.c: 58: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
	and	a, #0x18
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetClockFreq.c: 59: tmp = (uint8_t)(tmp >> 3);
	srl	a
	srl	a
	srl	a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetClockFreq.c: 60: presc = HSIDivFactor[tmp];
	clrw	x
	ld	xl, a
	ld	a, (_HSIDivFactor+0, x)
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetClockFreq.c: 61: clockfrequency = HSI_VALUE / presc;
	clrw	x
	clr	(0x01, sp)
	push	a
	pushw	x
	clr	a
	push	a
	push	#0x00
	push	#0x24
	push	#0xf4
	push	#0x00
	call	__divulong
	addw	sp, #8
	jra	00106$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetClockFreq.c: 63: else if ( clocksource == CLK_SOURCE_LSI)
	ld	a, (0x04, sp)
	cp	a, #0xd2
	jrne	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetClockFreq.c: 65: clockfrequency = LSI_VALUE;
	ldw	x, #0xf400
	ldw	y, #0x0001
	jra	00106$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetClockFreq.c: 69: clockfrequency = HSE_VALUE;
	ldw	x, #0x2400
	ldw	y, #0x00f4
00106$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetClockFreq.c: 72: return((uint32_t)clockfrequency);
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetClockFreq.c: 73: }
	addw	sp, #4
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

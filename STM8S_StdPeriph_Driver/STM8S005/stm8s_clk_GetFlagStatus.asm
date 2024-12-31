;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_clk_GetFlagStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _CLK_GetFlagStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 49: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
;	-----------------------------------------
;	 function CLK_GetFlagStatus
;	-----------------------------------------
_CLK_GetFlagStatus:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 56: assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
	ldw	y, x
	cpw	x, #0x0110
	jreq	00119$
	cpw	x, #0x0102
	jreq	00119$
	cpw	x, #0x0202
	jreq	00119$
	cpw	x, #0x0308
	jreq	00119$
	cpw	x, #0x0301
	jreq	00119$
	cpw	x, #0x0408
	jreq	00119$
	cpw	x, #0x0402
	jreq	00119$
	cpw	x, #0x0504
	jreq	00119$
	cpw	x, #0x0502
	jreq	00119$
	pushw	x
	pushw	y
	push	#0x38
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	y
	popw	x
00119$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 59: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
	clr	a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 62: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
	ld	xl, a
	cpw	x, #0x0100
	jrne	00111$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 64: tmpreg = CLK->ICKR;
	ld	a, 0x50c0
	jra	00112$
00111$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 66: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
	cpw	x, #0x0200
	jrne	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 68: tmpreg = CLK->ECKR;
	ld	a, 0x50c1
	jra	00112$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 70: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
	cpw	x, #0x0300
	jrne	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 72: tmpreg = CLK->SWCR;
	ld	a, 0x50c5
	jra	00112$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 74: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
	cpw	x, #0x0400
	jrne	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 76: tmpreg = CLK->CSSR;
	ld	a, 0x50c8
	jra	00112$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 80: tmpreg = CLK->CCOR;
	ld	a, 0x50c9
00112$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 83: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
	ldw	x, y
	pushw	x
	and	a, (2, sp)
	popw	x
	tnz	a
	jreq	00114$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 85: bitstatus = SET;
	ld	a, #0x01
	ret
00114$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 89: bitstatus = RESET;
	clr	a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 93: return((FlagStatus)bitstatus);
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c: 94: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_clk_GetFlagStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

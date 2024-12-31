;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_clk_SlowActiveHaltWakeUpCmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _CLK_SlowActiveHaltWakeUpCmd
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
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SlowActiveHaltWakeUpCmd.c: 50: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_SlowActiveHaltWakeUpCmd
;	-----------------------------------------
_CLK_SlowActiveHaltWakeUpCmd:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SlowActiveHaltWakeUpCmd.c: 53: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	ld	(0x01, sp), a
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SlowActiveHaltWakeUpCmd.c: 58: CLK->ICKR |= CLK_ICKR_SWUAH;
	ld	a, 0x50c0
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SlowActiveHaltWakeUpCmd.c: 55: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SlowActiveHaltWakeUpCmd.c: 58: CLK->ICKR |= CLK_ICKR_SWUAH;
	or	a, #0x20
	ld	0x50c0, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SlowActiveHaltWakeUpCmd.c: 63: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
	and	a, #0xdf
	ld	0x50c0, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_SlowActiveHaltWakeUpCmd.c: 65: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_clk_SlowActiveHaltWakeUp"
	.ascii "Cmd.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

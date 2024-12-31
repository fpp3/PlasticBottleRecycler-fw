;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_clk_LSICmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _CLK_LSICmd
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
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_LSICmd.c: 48: void CLK_LSICmd(FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_LSICmd
;	-----------------------------------------
_CLK_LSICmd:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_LSICmd.c: 51: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
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
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_LSICmd.c: 56: CLK->ICKR |= CLK_ICKR_LSIEN;
	ld	a, 0x50c0
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_LSICmd.c: 53: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_LSICmd.c: 56: CLK->ICKR |= CLK_ICKR_LSIEN;
	or	a, #0x08
	ld	0x50c0, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_LSICmd.c: 61: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
	and	a, #0xf7
	ld	0x50c0, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_LSICmd.c: 63: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_clk_LSICmd.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

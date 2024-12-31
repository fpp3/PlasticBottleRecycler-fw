;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_clk_GetITStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _CLK_GetITStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetITStatus.c: 48: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
;	-----------------------------------------
;	 function CLK_GetITStatus
;	-----------------------------------------
_CLK_GetITStatus:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetITStatus.c: 53: assert_param(IS_CLK_IT_OK(CLK_IT));
	ld	(0x01, sp), a
	sub	a, #0x1c
	jrne	00153$
	inc	a
	.byte 0x21
00153$:
	clr	a
00154$:
	push	a
	ld	a, (0x02, sp)
	cp	a, #0x0c
	pop	a
	jreq	00113$
	tnz	a
	jrne	00113$
	push	a
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetITStatus.c: 55: if (CLK_IT == CLK_IT_SWIF)
	tnz	a
	jreq	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetITStatus.c: 58: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
	ld	a, 0x50c5
	and	a, (0x01, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetITStatus.c: 60: bitstatus = SET;
	sub	a, #0x0c
	jrne	00102$
	inc	a
	jra	00109$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetITStatus.c: 64: bitstatus = RESET;
	clr	a
	jra	00109$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetITStatus.c: 70: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
	ld	a, 0x50c8
	and	a, (0x01, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetITStatus.c: 72: bitstatus = SET;
	sub	a, #0x0c
	jrne	00105$
	inc	a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetITStatus.c: 76: bitstatus = RESET;
	.byte 0x21
00105$:
	clr	a
00109$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetITStatus.c: 81: return bitstatus;
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_GetITStatus.c: 82: }
	addw	sp, #1
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_clk_GetITStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

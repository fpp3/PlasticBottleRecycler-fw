;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_rst_ClearFlag
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _RST_ClearFlag
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
;	../STM8S_StdPeriph_Driver/src/stm8s_rst_ClearFlag.c: 47: void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
;	-----------------------------------------
;	 function RST_ClearFlag
;	-----------------------------------------
_RST_ClearFlag:
;	../STM8S_StdPeriph_Driver/src/stm8s_rst_ClearFlag.c: 50: assert_param(IS_RST_FLAG_OK(RST_Flag));
	cp	a, #0x10
	jreq	00104$
	cp	a, #0x08
	jreq	00104$
	cp	a, #0x04
	jreq	00104$
	cp	a, #0x02
	jreq	00104$
	cp	a, #0x01
	jreq	00104$
	push	a
	push	#0x32
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_rst_ClearFlag.c: 52: RST->SR = (uint8_t)RST_Flag;
	ld	0x50b3, a
;	../STM8S_StdPeriph_Driver/src/stm8s_rst_ClearFlag.c: 53: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_rst_ClearFlag.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

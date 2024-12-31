;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_wwdg_SetCounter
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _WWDG_SetCounter
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
;	../STM8S_StdPeriph_Driver/src/stm8s_wwdg_SetCounter.c: 48: void WWDG_SetCounter(uint8_t Counter)
;	-----------------------------------------
;	 function WWDG_SetCounter
;	-----------------------------------------
_WWDG_SetCounter:
;	../STM8S_StdPeriph_Driver/src/stm8s_wwdg_SetCounter.c: 51: assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
	cp	a, #0x7f
	jrule	00104$
	push	a
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_wwdg_SetCounter.c: 55: WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
	and	a, #0x7f
	ld	0x50d1, a
;	../STM8S_StdPeriph_Driver/src/stm8s_wwdg_SetCounter.c: 56: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_wwdg_SetCounter.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

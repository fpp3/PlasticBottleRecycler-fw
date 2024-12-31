;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_wwdg_SetWindowValue
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _WWDG_SetWindowValue
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
;	../STM8S_StdPeriph_Driver/src/stm8s_wwdg_SetWindowValue.c: 49: void WWDG_SetWindowValue(uint8_t WindowValue)
;	-----------------------------------------
;	 function WWDG_SetWindowValue
;	-----------------------------------------
_WWDG_SetWindowValue:
;	../STM8S_StdPeriph_Driver/src/stm8s_wwdg_SetWindowValue.c: 52: assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
	cp	a, #0x7f
	jrule	00104$
	push	a
	push	#0x34
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_wwdg_SetWindowValue.c: 54: WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
	or	a, #0x40
	and	a, #0x7f
	ld	0x50d2, a
;	../STM8S_StdPeriph_Driver/src/stm8s_wwdg_SetWindowValue.c: 55: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_wwdg_SetWindowValue.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

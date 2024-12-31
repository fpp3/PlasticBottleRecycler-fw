;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_wwdg_Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _WWDG_Init
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
;	../STM8S_StdPeriph_Driver/src/stm8s_wwdg_Init.c: 50: void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
;	-----------------------------------------
;	 function WWDG_Init
;	-----------------------------------------
_WWDG_Init:
	push	a
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_wwdg_Init.c: 53: assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
	ld	a, (0x04, sp)
	cp	a, #0x7f
	jrule	00104$
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_wwdg_Init.c: 55: WWDG->WR = WWDG_WR_RESET_VALUE;
	mov	0x50d2+0, #0x7f
;	../STM8S_StdPeriph_Driver/src/stm8s_wwdg_Init.c: 56: WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
	ld	a, (0x01, sp)
	or	a, #0xc0
	ld	0x50d1, a
;	../STM8S_StdPeriph_Driver/src/stm8s_wwdg_Init.c: 57: WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
	ld	a, (0x04, sp)
	or	a, #0x40
	and	a, #0x7f
	ld	0x50d2, a
;	../STM8S_StdPeriph_Driver/src/stm8s_wwdg_Init.c: 58: }
	pop	a
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_wwdg_Init.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

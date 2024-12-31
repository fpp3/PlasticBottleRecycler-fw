;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_ClearFlag
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM3_ClearFlag
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ClearFlag.c: 53: void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
;	-----------------------------------------
;	 function TIM3_ClearFlag
;	-----------------------------------------
_TIM3_ClearFlag:
	sub	sp, #4
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ClearFlag.c: 56: assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
	ldw	(0x01, sp), x
	ld	a, xl
	and	a, #0xf8
	ld	(0x04, sp), a
	ld	a, xh
	and	a, #0xf9
	ld	(0x03, sp), a
	ldw	y, (0x03, sp)
	jrne	00103$
	ldw	y, (0x01, sp)
	jrne	00104$
00103$:
	ldw	y, #(___str_0+0)
	pushw	x
	push	#0x38
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, y
	call	_assert_failed
	popw	x
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ClearFlag.c: 59: TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
	ld	a, xl
	cpl	a
	ld	0x5322, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ClearFlag.c: 60: TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
	ld	a, (0x01, sp)
	cpl	a
	ld	0x5323, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ClearFlag.c: 61: }
	addw	sp, #4
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim3_ClearFlag.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

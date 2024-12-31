;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim4_ClearFlag
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM4_ClearFlag
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_ClearFlag.c: 48: void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
;	-----------------------------------------
;	 function TIM4_ClearFlag
;	-----------------------------------------
_TIM4_ClearFlag:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_ClearFlag.c: 51: assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
	tnz	a
	jrne	00104$
	push	a
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_ClearFlag.c: 54: TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
	cpl	a
	ld	0x5342, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_ClearFlag.c: 55: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim4_ClearFlag.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

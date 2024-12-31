;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_ClearFlag
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_ClearFlag
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ClearFlag.c: 60: void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
;	-----------------------------------------
;	 function TIM1_ClearFlag
;	-----------------------------------------
_TIM1_ClearFlag:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ClearFlag.c: 63: assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
	ldw	(0x01, sp), x
	ld	a, (0x01, sp)
	bcp	a, #0xe1
	jrne	00103$
	tnzw	x
	jrne	00104$
00103$:
	pushw	x
	push	#0x3f
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ClearFlag.c: 66: TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
	ld	a, xl
	cpl	a
	ld	0x5255, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ClearFlag.c: 67: TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
	ld	a, (0x01, sp)
	cpl	a
	and	a, #0x1e
	ld	0x5256, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ClearFlag.c: 69: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_ClearFlag.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

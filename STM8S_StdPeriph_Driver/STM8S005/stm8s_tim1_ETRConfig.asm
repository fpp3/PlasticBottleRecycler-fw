;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_ETRConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_ETRConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ETRConfig.c: 58: void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
;	-----------------------------------------
;	 function TIM1_ETRConfig
;	-----------------------------------------
_TIM1_ETRConfig:
	pushw	x
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ETRConfig.c: 63: assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
	ld	a, (0x06, sp)
	cp	a, #0x0f
	jrule	00104$
	push	#0x3f
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ETRConfig.c: 65: TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
	ld	a, 0x5253
	ld	(0x01, sp), a
	ld	a, (0x02, sp)
	or	a, (0x05, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ETRConfig.c: 66: (uint8_t)ExtTRGFilter );
	or	a, (0x06, sp)
	or	a, (0x01, sp)
	ld	0x5253, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ETRConfig.c: 67: }
	ldw	x, (3, sp)
	addw	sp, #6
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_ETRConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

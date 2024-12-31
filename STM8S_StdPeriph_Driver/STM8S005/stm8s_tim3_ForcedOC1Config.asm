;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_ForcedOC1Config
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM3_ForcedOC1Config
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ForcedOC1Config.c: 51: void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
;	-----------------------------------------
;	 function TIM3_ForcedOC1Config
;	-----------------------------------------
_TIM3_ForcedOC1Config:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ForcedOC1Config.c: 54: assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
	ld	(0x01, sp), a
	cp	a, #0x50
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x40
	jreq	00104$
	push	#0x36
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ForcedOC1Config.c: 57: TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
	ld	a, 0x5325
	and	a, #0x8f
	or	a, (0x01, sp)
	ld	0x5325, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_ForcedOC1Config.c: 58: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim3_ForcedOC1Config.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

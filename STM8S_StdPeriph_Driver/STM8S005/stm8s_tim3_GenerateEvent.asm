;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_GenerateEvent
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM3_GenerateEvent
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GenerateEvent.c: 51: void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
;	-----------------------------------------
;	 function TIM3_GenerateEvent
;	-----------------------------------------
_TIM3_GenerateEvent:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GenerateEvent.c: 54: assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
	tnz	a
	jrne	00104$
	push	a
	push	#0x36
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GenerateEvent.c: 57: TIM3->EGR = (uint8_t)TIM3_EventSource;
	ld	0x5324, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GenerateEvent.c: 58: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim3_GenerateEvent.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

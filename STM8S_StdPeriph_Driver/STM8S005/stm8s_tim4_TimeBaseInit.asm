;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim4_TimeBaseInit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM4_TimeBaseInit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_TimeBaseInit.c: 47: void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
;	-----------------------------------------
;	 function TIM4_TimeBaseInit
;	-----------------------------------------
_TIM4_TimeBaseInit:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_TimeBaseInit.c: 50: assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
	tnz	a
	jreq	00104$
	cp	a, #0x01
	jreq	00104$
	cp	a, #0x02
	jreq	00104$
	cp	a, #0x03
	jreq	00104$
	cp	a, #0x04
	jreq	00104$
	cp	a, #0x05
	jreq	00104$
	cp	a, #0x06
	jreq	00104$
	cp	a, #0x07
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_TimeBaseInit.c: 52: TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
	ld	0x5345, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_TimeBaseInit.c: 54: TIM4->ARR = (uint8_t)(TIM4_Period);
	ldw	x, #0x5346
	ld	a, (0x03, sp)
	ld	(x), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_TimeBaseInit.c: 55: }
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim4_TimeBaseInit.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

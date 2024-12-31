;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_TimeBaseInit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_TimeBaseInit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TimeBaseInit.c: 50: void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
;	-----------------------------------------
;	 function TIM1_TimeBaseInit
;	-----------------------------------------
_TIM1_TimeBaseInit:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TimeBaseInit.c: 56: assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
	ld	(0x01, sp), a
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x10
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x20
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x40
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x60
	jreq	00104$
	pushw	x
	push	#0x38
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TimeBaseInit.c: 59: TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
	ld	a, (0x04, sp)
	ld	0x5262, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TimeBaseInit.c: 60: TIM1->ARRL = (uint8_t)(TIM1_Period);
	ld	a, (0x05, sp)
	ld	0x5263, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TimeBaseInit.c: 63: TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
	ld	a, xh
	ld	0x5260, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TimeBaseInit.c: 64: TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
	ld	a, xl
	ld	0x5261, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TimeBaseInit.c: 67: TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
	ld	a, 0x5250
	and	a, #0x8f
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TimeBaseInit.c: 68: | (uint8_t)(TIM1_CounterMode));
	or	a, (0x01, sp)
	ld	0x5250, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TimeBaseInit.c: 71: TIM1->RCR = TIM1_RepetitionCounter;
	ldw	x, #0x5264
	ld	a, (0x06, sp)
	ld	(x), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_TimeBaseInit.c: 72: }
	ldw	x, (2, sp)
	addw	sp, #6
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_TimeBaseInit.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

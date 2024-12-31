;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_ITConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_ITConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ITConfig.c: 59: void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_ITConfig
;	-----------------------------------------
_TIM1_ITConfig:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ITConfig.c: 62: assert_param(IS_TIM1_IT_OK(TIM1_IT));
	ld	(0x02, sp), a
	jrne	00107$
	push	#0x3e
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ITConfig.c: 63: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x05, sp)
	jreq	00109$
	tnz	(0x05, sp)
	jrne	00109$
	push	#0x3f
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00109$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ITConfig.c: 68: TIM1->IER |= (uint8_t)TIM1_IT;
	ld	a, 0x5254
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ITConfig.c: 65: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ITConfig.c: 68: TIM1->IER |= (uint8_t)TIM1_IT;
	or	a, (0x02, sp)
	ld	0x5254, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ITConfig.c: 73: TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
	push	a
	ld	a, (0x03, sp)
	cpl	a
	ld	(0x02, sp), a
	pop	a
	and	a, (0x01, sp)
	ld	0x5254, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_ITConfig.c: 75: }
	popw	x
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_ITConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

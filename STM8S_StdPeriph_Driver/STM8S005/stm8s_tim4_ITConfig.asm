;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim4_ITConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM4_ITConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_ITConfig.c: 51: void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM4_ITConfig
;	-----------------------------------------
_TIM4_ITConfig:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_ITConfig.c: 54: assert_param(IS_TIM4_IT_OK(TIM4_IT));
	ld	(0x02, sp), a
	jrne	00107$
	push	#0x36
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_ITConfig.c: 55: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x05, sp)
	jreq	00109$
	tnz	(0x05, sp)
	jrne	00109$
	push	#0x37
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00109$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_ITConfig.c: 60: TIM4->IER |= (uint8_t)TIM4_IT;
	ld	a, 0x5341
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_ITConfig.c: 57: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_ITConfig.c: 60: TIM4->IER |= (uint8_t)TIM4_IT;
	ld	a, (0x02, sp)
	or	a, (0x01, sp)
	ld	0x5341, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_ITConfig.c: 65: TIM4->IER &= (uint8_t)(~TIM4_IT);
	ld	a, (0x02, sp)
	cpl	a
	and	a, (0x01, sp)
	ld	0x5341, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_ITConfig.c: 67: }
	popw	x
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim4_ITConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

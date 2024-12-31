;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim4_GetITStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM4_GetITStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_GetITStatus.c: 48: ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
;	-----------------------------------------
;	 function TIM4_GetITStatus
;	-----------------------------------------
_TIM4_GetITStatus:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_GetITStatus.c: 55: assert_param(IS_TIM4_IT_OK(TIM4_IT));
	ld	(0x03, sp), a
	jrne	00108$
	push	#0x37
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_GetITStatus.c: 57: itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
	ld	a, 0x5342
	push	a
	ld	a, (0x04, sp)
	ld	(0x02, sp), a
	pop	a
	and	a, (0x01, sp)
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_GetITStatus.c: 59: itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
	ld	a, 0x5341
	and	a, (0x01, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_GetITStatus.c: 61: if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
	tnz	(0x02, sp)
	jreq	00102$
	tnz	a
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_GetITStatus.c: 63: bitstatus = (ITStatus)SET;
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_GetITStatus.c: 67: bitstatus = (ITStatus)RESET;
	.byte 0x21
00102$:
	clr	a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_GetITStatus.c: 69: return ((ITStatus)bitstatus);
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_GetITStatus.c: 70: }
	addw	sp, #3
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim4_GetITStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

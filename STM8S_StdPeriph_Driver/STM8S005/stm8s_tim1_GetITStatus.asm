;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_GetITStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_GetITStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetITStatus.c: 56: ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
;	-----------------------------------------
;	 function TIM1_GetITStatus
;	-----------------------------------------
_TIM1_GetITStatus:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetITStatus.c: 62: assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
	cp	a, #0x01
	jreq	00108$
	cp	a, #0x02
	jreq	00108$
	cp	a, #0x04
	jreq	00108$
	cp	a, #0x08
	jreq	00108$
	cp	a, #0x10
	jreq	00108$
	cp	a, #0x20
	jreq	00108$
	cp	a, #0x40
	jreq	00108$
	cp	a, #0x80
	jreq	00108$
	push	a
	push	#0x3e
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetITStatus.c: 64: TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
	ldw	x, #0x5255
	push	a
	ld	a, (x)
	ld	(0x03, sp), a
	pop	a
	push	a
	and	a, (0x03, sp)
	ld	(0x02, sp), a
	pop	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetITStatus.c: 66: TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
	ldw	x, #0x5254
	push	a
	ld	a, (x)
	ld	(0x03, sp), a
	pop	a
	and	a, (0x02, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetITStatus.c: 68: if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
	tnz	(0x01, sp)
	jreq	00102$
	tnz	a
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetITStatus.c: 70: bitstatus = SET;
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetITStatus.c: 74: bitstatus = RESET;
	.byte 0x21
00102$:
	clr	a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetITStatus.c: 76: return (ITStatus)(bitstatus);
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetITStatus.c: 77: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetITStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

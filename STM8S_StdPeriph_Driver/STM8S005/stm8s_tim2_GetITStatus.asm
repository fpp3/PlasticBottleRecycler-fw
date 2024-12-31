;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim2_GetITStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM2_GetITStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetITStatus.c: 52: ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
;	-----------------------------------------
;	 function TIM2_GetITStatus
;	-----------------------------------------
_TIM2_GetITStatus:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetITStatus.c: 58: assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
	ld	(0x02, sp), a
	dec	a
	jreq	00108$
	ld	a, (0x02, sp)
	cp	a, #0x02
	jreq	00108$
	ld	a, (0x02, sp)
	cp	a, #0x04
	jreq	00108$
	ld	a, (0x02, sp)
	cp	a, #0x08
	jreq	00108$
	push	#0x3a
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetITStatus.c: 60: TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
	ld	a, 0x5302
	and	a, (0x02, sp)
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetITStatus.c: 62: TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
	ld	a, 0x5301
	and	a, (0x02, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetITStatus.c: 64: if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
	tnz	(0x01, sp)
	jreq	00102$
	tnz	a
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetITStatus.c: 66: bitstatus = SET;
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetITStatus.c: 70: bitstatus = RESET;
	.byte 0x21
00102$:
	clr	a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetITStatus.c: 72: return (ITStatus)(bitstatus);
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetITStatus.c: 73: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetITStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

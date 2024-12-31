;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_GetITStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM3_GetITStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetITStatus.c: 51: ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
;	-----------------------------------------
;	 function TIM3_GetITStatus
;	-----------------------------------------
_TIM3_GetITStatus:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetITStatus.c: 57: assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
	ld	(0x02, sp), a
	dec	a
	jreq	00108$
	ld	a, (0x02, sp)
	cp	a, #0x02
	jreq	00108$
	ld	a, (0x02, sp)
	cp	a, #0x04
	jreq	00108$
	push	#0x39
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetITStatus.c: 59: TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
	ld	a, 0x5322
	and	a, (0x02, sp)
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetITStatus.c: 61: TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
	ld	a, 0x5321
	and	a, (0x02, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetITStatus.c: 63: if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
	tnz	(0x01, sp)
	jreq	00102$
	tnz	a
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetITStatus.c: 65: bitstatus = SET;
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetITStatus.c: 69: bitstatus = RESET;
	.byte 0x21
00102$:
	clr	a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetITStatus.c: 71: return (ITStatus)(bitstatus);
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetITStatus.c: 72: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetITStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim2_GetFlagStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM2_GetFlagStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetFlagStatus.c: 55: FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
;	-----------------------------------------
;	 function TIM2_GetFlagStatus
;	-----------------------------------------
_TIM2_GetFlagStatus:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetFlagStatus.c: 61: assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
	ldw	(0x02, sp), x
	cpw	x, #0x0001
	jreq	00107$
	cpw	x, #0x0002
	jreq	00107$
	cpw	x, #0x0004
	jreq	00107$
	cpw	x, #0x0008
	jreq	00107$
	cpw	x, #0x0200
	jreq	00107$
	cpw	x, #0x0400
	jreq	00107$
	cpw	x, #0x0800
	jreq	00107$
	pushw	x
	push	#0x3d
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetFlagStatus.c: 63: tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
	ld	a, 0x5302
	ld	(0x01, sp), a
	ld	a, (0x03, sp)
	and	a, (0x01, sp)
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetFlagStatus.c: 64: tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetFlagStatus.c: 66: if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
	ld	a, 0x5303
	pushw	x
	and	a, (1, sp)
	popw	x
	or	a, (0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetFlagStatus.c: 68: bitstatus = SET;
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetFlagStatus.c: 72: bitstatus = RESET;
	.byte 0x21
00102$:
	clr	a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetFlagStatus.c: 74: return (FlagStatus)bitstatus;
;	../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetFlagStatus.c: 75: }
	addw	sp, #3
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim2_GetFlagStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_GetFlagStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM3_GetFlagStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetFlagStatus.c: 53: FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
;	-----------------------------------------
;	 function TIM3_GetFlagStatus
;	-----------------------------------------
_TIM3_GetFlagStatus:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetFlagStatus.c: 59: assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
	ldw	(0x02, sp), x
	cpw	x, #0x0001
	jreq	00107$
	cpw	x, #0x0002
	jreq	00107$
	cpw	x, #0x0004
	jreq	00107$
	cpw	x, #0x0200
	jreq	00107$
	cpw	x, #0x0400
	jreq	00107$
	pushw	x
	push	#0x3b
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetFlagStatus.c: 61: tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
	ld	a, 0x5322
	ld	(0x01, sp), a
	ld	a, (0x03, sp)
	and	a, (0x01, sp)
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetFlagStatus.c: 62: tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetFlagStatus.c: 64: if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
	ld	a, 0x5323
	pushw	x
	and	a, (1, sp)
	popw	x
	or	a, (0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetFlagStatus.c: 66: bitstatus = SET;
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetFlagStatus.c: 70: bitstatus = RESET;
	.byte 0x21
00102$:
	clr	a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetFlagStatus.c: 72: return (FlagStatus)bitstatus;
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetFlagStatus.c: 73: }
	addw	sp, #3
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim3_GetFlagStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_GetFlagStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_GetFlagStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetFlagStatus.c: 60: FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
;	-----------------------------------------
;	 function TIM1_GetFlagStatus
;	-----------------------------------------
_TIM1_GetFlagStatus:
	sub	sp, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetFlagStatus.c: 66: assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
	ldw	(0x02, sp), x
	cpw	x, #0x0001
	jreq	00107$
	cpw	x, #0x0002
	jreq	00107$
	cpw	x, #0x0004
	jreq	00107$
	cpw	x, #0x0008
	jreq	00107$
	cpw	x, #0x0010
	jreq	00107$
	cpw	x, #0x0020
	jreq	00107$
	cpw	x, #0x0040
	jreq	00107$
	cpw	x, #0x0080
	jreq	00107$
	cpw	x, #0x0200
	jreq	00107$
	cpw	x, #0x0400
	jreq	00107$
	cpw	x, #0x0800
	jreq	00107$
	cpw	x, #0x1000
	jreq	00107$
	pushw	x
	push	#0x42
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetFlagStatus.c: 68: tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
	ld	a, 0x5255
	ld	(0x01, sp), a
	ld	a, (0x03, sp)
	and	a, (0x01, sp)
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetFlagStatus.c: 69: tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetFlagStatus.c: 71: if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
	ld	a, 0x5256
	pushw	x
	and	a, (1, sp)
	popw	x
	or	a, (0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetFlagStatus.c: 73: bitstatus = SET;
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetFlagStatus.c: 77: bitstatus = RESET;
	.byte 0x21
00102$:
	clr	a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetFlagStatus.c: 79: return (FlagStatus)(bitstatus);
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetFlagStatus.c: 80: }
	addw	sp, #3
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_GetFlagStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_SelectSlaveMode
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_SelectSlaveMode
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectSlaveMode.c: 52: void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
;	-----------------------------------------
;	 function TIM1_SelectSlaveMode
;	-----------------------------------------
_TIM1_SelectSlaveMode:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectSlaveMode.c: 55: assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
	ld	(0x01, sp), a
	cp	a, #0x04
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x05
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x06
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x07
	jreq	00104$
	push	#0x37
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectSlaveMode.c: 58: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
	ld	a, 0x5252
	and	a, #0xf8
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectSlaveMode.c: 59: (uint8_t)TIM1_SlaveMode);
	or	a, (0x01, sp)
	ld	0x5252, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectSlaveMode.c: 60: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectSlaveMode.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_SelectMasterSlaveMode
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_SelectMasterSlaveMode
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectMasterSlaveMode.c: 48: void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_SelectMasterSlaveMode
;	-----------------------------------------
_TIM1_SelectMasterSlaveMode:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectMasterSlaveMode.c: 51: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	ld	(0x01, sp), a
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectMasterSlaveMode.c: 56: TIM1->SMCR |= TIM1_SMCR_MSM;
	ld	a, 0x5252
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectMasterSlaveMode.c: 54: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectMasterSlaveMode.c: 56: TIM1->SMCR |= TIM1_SMCR_MSM;
	or	a, #0x80
	ld	0x5252, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectMasterSlaveMode.c: 60: TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
	and	a, #0x7f
	ld	0x5252, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectMasterSlaveMode.c: 62: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_SelectMasterSlaveMo"
	.ascii "de.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

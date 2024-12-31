;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_BDTRConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_BDTRConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_BDTRConfig.c: 55: void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
;	-----------------------------------------
;	 function TIM1_BDTRConfig
;	-----------------------------------------
_TIM1_BDTRConfig:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_BDTRConfig.c: 63: assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
	ld	(0x02, sp), a
	cp	a, #0x04
	jreq	00104$
	tnz	(0x02, sp)
	jreq	00104$
	push	#0x3f
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_BDTRConfig.c: 64: assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
	tnz	(0x05, sp)
	jreq	00109$
	ld	a, (0x05, sp)
	dec	a
	jreq	00109$
	ld	a, (0x05, sp)
	cp	a, #0x02
	jreq	00109$
	ld	a, (0x05, sp)
	cp	a, #0x03
	jreq	00109$
	push	#0x40
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00109$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_BDTRConfig.c: 65: assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
	ld	a, (0x07, sp)
	cp	a, #0x10
	jreq	00120$
	tnz	(0x07, sp)
	jreq	00120$
	push	#0x41
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00120$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_BDTRConfig.c: 66: assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
	tnz	(0x08, sp)
	jreq	00125$
	ld	a, (0x08, sp)
	cp	a, #0x20
	jreq	00125$
	push	#0x42
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00125$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_BDTRConfig.c: 67: assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
	ld	a, (0x09, sp)
	cp	a, #0x40
	jreq	00130$
	tnz	(0x09, sp)
	jreq	00130$
	push	#0x43
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00130$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_BDTRConfig.c: 69: TIM1->DTR = (uint8_t)(TIM1_DeadTime);
	ldw	x, #0x526e
	ld	a, (0x06, sp)
	ld	(x), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_BDTRConfig.c: 73: TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
	ld	a, (0x02, sp)
	or	a, (0x05, sp)
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_BDTRConfig.c: 74: (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
	ld	a, (0x07, sp)
	or	a, (0x08, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_BDTRConfig.c: 75: (uint8_t)TIM1_AutomaticOutput));
	or	a, (0x09, sp)
	or	a, (0x01, sp)
	ld	0x526d, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_BDTRConfig.c: 76: }
	ldw	x, (3, sp)
	addw	sp, #9
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_BDTRConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

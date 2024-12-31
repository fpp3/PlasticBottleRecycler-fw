;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim4_PrescalerConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM4_PrescalerConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_PrescalerConfig.c: 61: void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
;	-----------------------------------------
;	 function TIM4_PrescalerConfig
;	-----------------------------------------
_TIM4_PrescalerConfig:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_PrescalerConfig.c: 64: assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
	tnz	(0x03, sp)
	jreq	00104$
	tnz	(0x03, sp)
	jrne	00104$
	push	a
	push	#0x40
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_PrescalerConfig.c: 65: assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
	tnz	a
	jreq	00109$
	cp	a, #0x01
	jreq	00109$
	cp	a, #0x02
	jreq	00109$
	cp	a, #0x03
	jreq	00109$
	cp	a, #0x04
	jreq	00109$
	cp	a, #0x05
	jreq	00109$
	cp	a, #0x06
	jreq	00109$
	cp	a, #0x07
	jreq	00109$
	push	a
	push	#0x41
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00109$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_PrescalerConfig.c: 68: TIM4->PSCR = (uint8_t)Prescaler;
	ld	0x5345, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_PrescalerConfig.c: 71: TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
	ld	a, (0x03, sp)
	ld	0x5343, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim4_PrescalerConfig.c: 72: }
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim4_PrescalerConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

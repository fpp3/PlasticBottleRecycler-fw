;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim1_PrescalerConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM1_PrescalerConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PrescalerConfig.c: 52: void TIM1_PrescalerConfig(uint16_t Prescaler,
;	-----------------------------------------
;	 function TIM1_PrescalerConfig
;	-----------------------------------------
_TIM1_PrescalerConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PrescalerConfig.c: 56: assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
	ld	(0x01, sp), a
	jreq	00104$
	tnz	(0x01, sp)
	jrne	00104$
	pushw	x
	push	#0x38
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PrescalerConfig.c: 59: TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
	ld	a, xh
	ld	0x5260, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PrescalerConfig.c: 60: TIM1->PSCRL = (uint8_t)(Prescaler);
	ld	a, xl
	ld	0x5261, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PrescalerConfig.c: 63: TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
	ld	a, (0x01, sp)
	ld	0x5257, a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim1_PrescalerConfig.c: 64: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim1_PrescalerConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

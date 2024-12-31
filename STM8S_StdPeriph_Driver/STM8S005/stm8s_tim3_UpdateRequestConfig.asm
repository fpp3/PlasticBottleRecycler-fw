;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_tim3_UpdateRequestConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _TIM3_UpdateRequestConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_UpdateRequestConfig.c: 50: void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
;	-----------------------------------------
;	 function TIM3_UpdateRequestConfig
;	-----------------------------------------
_TIM3_UpdateRequestConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_UpdateRequestConfig.c: 53: assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
	ld	(0x01, sp), a
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_UpdateRequestConfig.c: 58: TIM3->CR1 |= TIM3_CR1_URS;
	ld	a, 0x5320
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_UpdateRequestConfig.c: 56: if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_UpdateRequestConfig.c: 58: TIM3->CR1 |= TIM3_CR1_URS;
	or	a, #0x04
	ld	0x5320, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_UpdateRequestConfig.c: 62: TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
	and	a, #0xfb
	ld	0x5320, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_tim3_UpdateRequestConfig.c: 64: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_tim3_UpdateRequestConfig"
	.ascii ".c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

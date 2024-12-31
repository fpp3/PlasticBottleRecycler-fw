;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_adc1_Cmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _ADC1_Cmd
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
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Cmd.c: 46: void ADC1_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_Cmd
;	-----------------------------------------
_ADC1_Cmd:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Cmd.c: 49: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	ld	(0x01, sp), a
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	push	#0x31
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Cmd.c: 53: ADC1->CR1 |= ADC1_CR1_ADON;
	ld	a, 0x5401
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Cmd.c: 51: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Cmd.c: 53: ADC1->CR1 |= ADC1_CR1_ADON;
	or	a, #0x01
	ld	0x5401, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Cmd.c: 57: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
	and	a, #0xfe
	ld	0x5401, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_adc1_Cmd.c: 59: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_adc1_Cmd.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

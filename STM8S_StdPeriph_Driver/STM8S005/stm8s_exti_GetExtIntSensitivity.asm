;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_exti_GetExtIntSensitivity
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _EXTI_GetExtIntSensitivity
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
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 46: EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
;	-----------------------------------------
;	 function EXTI_GetExtIntSensitivity
;	-----------------------------------------
_EXTI_GetExtIntSensitivity:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 48: uint8_t value = 0;
	clr	(0x01, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 51: assert_param(IS_EXTI_PORT_OK(Port));
	tnz	a
	jreq	00111$
	cp	a, #0x01
	jreq	00111$
	cp	a, #0x02
	jreq	00111$
	cp	a, #0x03
	jreq	00111$
	cp	a, #0x04
	jreq	00111$
	push	a
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00111$:
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 53: switch (Port)
	cp	a, #0x04
	jrugt	00107$
	clrw	x
	ld	xl, a
	sllw	x
	ldw	x, (#00180$, x)
	jp	(x)
00180$:
	.dw	#00101$
	.dw	#00102$
	.dw	#00103$
	.dw	#00104$
	.dw	#00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 55: case EXTI_PORT_GPIOA:
00101$:
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 56: value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
	ld	a, 0x50a0
	and	a, #0x03
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 57: break;
	jra	00107$
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 58: case EXTI_PORT_GPIOB:
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 59: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
	ld	a, 0x50a0
	and	a, #0x0c
	srl	a
	srl	a
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 60: break;
	jra	00107$
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 61: case EXTI_PORT_GPIOC:
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 62: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
	ld	a, 0x50a0
	and	a, #0x30
	swap	a
	and	a, #0x0f
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 63: break;
	jra	00107$
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 64: case EXTI_PORT_GPIOD:
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 65: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
	ld	a, 0x50a0
	and	a, #0xc0
	swap	a
	and	a, #0x0f
	srl	a
	srl	a
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 66: break;
	jra	00107$
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 67: case EXTI_PORT_GPIOE:
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 68: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
	ld	a, 0x50a1
	and	a, #0x03
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 72: }
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 74: return((EXTI_Sensitivity_TypeDef)value);
	ld	a, (0x01, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivity.c: 75: }
	addw	sp, #1
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_exti_GetExtIntSensitivit"
	.ascii "y.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

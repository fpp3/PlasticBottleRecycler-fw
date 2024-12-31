;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_gpio_ExternalPullUpConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _GPIO_ExternalPullUpConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_ExternalPullUpConfig.c: 48: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
;	-----------------------------------------
;	 function GPIO_ExternalPullUpConfig
;	-----------------------------------------
_GPIO_ExternalPullUpConfig:
	sub	sp, #3
	ldw	(0x02, sp), x
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_ExternalPullUpConfig.c: 51: assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
	tnz	a
	jrne	00107$
	push	a
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_ExternalPullUpConfig.c: 52: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x06, sp)
	jreq	00109$
	tnz	(0x06, sp)
	jrne	00109$
	push	a
	push	#0x34
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00109$:
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_ExternalPullUpConfig.c: 56: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
	ldw	x, (0x02, sp)
	addw	x, #0x0003
	push	a
	ld	a, (x)
	ld	(0x02, sp), a
	pop	a
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_ExternalPullUpConfig.c: 54: if (NewState != DISABLE) /* External Pull-Up Set*/
	tnz	(0x06, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_ExternalPullUpConfig.c: 56: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
	or	a, (0x01, sp)
	ld	(x), a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_ExternalPullUpConfig.c: 59: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
	cpl	a
	and	a, (0x01, sp)
	ld	(x), a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_ExternalPullUpConfig.c: 61: }
	addw	sp, #3
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_gpio_ExternalPullUpConfi"
	.ascii "g.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

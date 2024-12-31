;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_gpio_Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _GPIO_Init
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
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 51: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
;	-----------------------------------------
;	 function GPIO_Init
;	-----------------------------------------
_GPIO_Init:
	sub	sp, #6
	ldw	(0x05, sp), x
	ld	(0x04, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 57: assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
	tnz	(0x09, sp)
	jreq	00116$
	ld	a, (0x09, sp)
	cp	a, #0x40
	jreq	00116$
	ld	a, (0x09, sp)
	cp	a, #0x20
	jreq	00116$
	ld	a, (0x09, sp)
	cp	a, #0x60
	jreq	00116$
	ld	a, (0x09, sp)
	cp	a, #0xa0
	jreq	00116$
	ld	a, (0x09, sp)
	cp	a, #0xe0
	jreq	00116$
	ld	a, (0x09, sp)
	cp	a, #0x80
	jreq	00116$
	ld	a, (0x09, sp)
	cp	a, #0xc0
	jreq	00116$
	ld	a, (0x09, sp)
	cp	a, #0xb0
	jreq	00116$
	ld	a, (0x09, sp)
	cp	a, #0xf0
	jreq	00116$
	ld	a, (0x09, sp)
	cp	a, #0x90
	jreq	00116$
	ld	a, (0x09, sp)
	cp	a, #0xd0
	jreq	00116$
	push	#0x39
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00116$:
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 58: assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
	tnz	(0x04, sp)
	jrne	00151$
	push	#0x3a
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00151$:
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 61: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
	ldw	x, (0x05, sp)
	addw	x, #0x0004
	ldw	(0x01, sp), x
	ld	a, (x)
	push	a
	ld	a, (0x05, sp)
	cpl	a
	ld	(0x04, sp), a
	pop	a
	and	a, (0x03, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 78: GPIOx->DDR |= (uint8_t)GPIO_Pin;
	ldw	x, (0x05, sp)
	incw	x
	incw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 67: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
	tnz	(0x09, sp)
	jrpl	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 71: GPIOx->ODR |= (uint8_t)GPIO_Pin;
	ldw	y, (0x05, sp)
	ld	a, (y)
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 69: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
	push	a
	ld	a, (0x0a, sp)
	bcp	a, #0x10
	pop	a
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 71: GPIOx->ODR |= (uint8_t)GPIO_Pin;
	or	a, (0x04, sp)
	ldw	y, (0x05, sp)
	ld	(y), a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 75: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
	and	a, (0x03, sp)
	ldw	y, (0x05, sp)
	ld	(y), a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 78: GPIOx->DDR |= (uint8_t)GPIO_Pin;
	ld	a, (x)
	or	a, (0x04, sp)
	ld	(x), a
	jra	00106$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 83: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
	ld	a, (x)
	and	a, (0x03, sp)
	ld	(x), a
00106$:
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 92: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
	ldw	x, (0x05, sp)
	addw	x, #0x0003
	ld	a, (x)
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 90: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
	push	a
	ld	a, (0x0a, sp)
	bcp	a, #0x40
	pop	a
	jreq	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 92: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
	or	a, (0x04, sp)
	ld	(x), a
	jra	00109$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 96: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
	and	a, (0x03, sp)
	ld	(x), a
00109$:
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 61: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
	ldw	x, (0x01, sp)
	ld	a, (x)
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 103: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
	push	a
	ld	a, (0x0a, sp)
	bcp	a, #0x20
	pop	a
	jreq	00111$
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 105: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
	or	a, (0x04, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
	jra	00113$
00111$:
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 109: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
	and	a, (0x03, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c: 111: }
	addw	sp, #6
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_gpio_Init.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

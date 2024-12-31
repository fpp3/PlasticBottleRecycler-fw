;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_i2c_ITConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _I2C_ITConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ITConfig.c: 50: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_ITConfig
;	-----------------------------------------
_I2C_ITConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ITConfig.c: 53: assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
	cp	a, #0x01
	jreq	00107$
	cp	a, #0x02
	jreq	00107$
	cp	a, #0x04
	jreq	00107$
	cp	a, #0x03
	jreq	00107$
	cp	a, #0x05
	jreq	00107$
	cp	a, #0x06
	jreq	00107$
	cp	a, #0x07
	jreq	00107$
	push	a
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ITConfig.c: 54: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x04, sp)
	jreq	00127$
	tnz	(0x04, sp)
	jrne	00127$
	push	a
	push	#0x36
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00127$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ITConfig.c: 59: I2C->ITR |= (uint8_t)I2C_IT;
	ldw	x, #0x521a
	push	a
	ld	a, (x)
	ld	(0x02, sp), a
	pop	a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ITConfig.c: 56: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ITConfig.c: 59: I2C->ITR |= (uint8_t)I2C_IT;
	or	a, (0x01, sp)
	ld	0x521a, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ITConfig.c: 64: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
	cpl	a
	and	a, (0x01, sp)
	ld	0x521a, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ITConfig.c: 66: }
	pop	a
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_i2c_ITConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

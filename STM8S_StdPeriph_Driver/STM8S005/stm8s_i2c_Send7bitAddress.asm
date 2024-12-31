;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_i2c_Send7bitAddress
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _I2C_Send7bitAddress
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
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Send7bitAddress.c: 49: void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
;	-----------------------------------------
;	 function I2C_Send7bitAddress
;	-----------------------------------------
_I2C_Send7bitAddress:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Send7bitAddress.c: 52: assert_param(IS_I2C_ADDRESS_OK(Address));
	bcp	a, #0x01
	jreq	00104$
	push	a
	push	#0x34
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Send7bitAddress.c: 53: assert_param(IS_I2C_DIRECTION_OK(Direction));
	tnz	(0x04, sp)
	jreq	00106$
	tnz	(0x04, sp)
	jrne	00106$
	push	a
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00106$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Send7bitAddress.c: 56: Address &= (uint8_t)0xFE;
	and	a, #0xfe
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Send7bitAddress.c: 59: I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
	ld	a, (0x04, sp)
	or	a, (0x01, sp)
	ld	0x5216, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Send7bitAddress.c: 60: }
	pop	a
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_i2c_Send7bitAddress.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

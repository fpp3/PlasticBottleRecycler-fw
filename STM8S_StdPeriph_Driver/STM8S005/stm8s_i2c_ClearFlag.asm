;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_i2c_ClearFlag
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _I2C_ClearFlag
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
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ClearFlag.c: 74: void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
;	-----------------------------------------
;	 function I2C_ClearFlag
;	-----------------------------------------
_I2C_ClearFlag:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ClearFlag.c: 78: assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
	ld	a, xh
	bcp	a, #0xfd
	jrne	00103$
	tnzw	x
	jrne	00104$
00103$:
	pushw	x
	push	#0x4e
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ClearFlag.c: 81: flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
	clr	a
	ld	xh, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ClearFlag.c: 83: I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
	cplw	x
	ld	a, xl
	ld	0x5218, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ClearFlag.c: 84: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_i2c_ClearFlag.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

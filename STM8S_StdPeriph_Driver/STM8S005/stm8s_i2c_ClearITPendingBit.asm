;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_i2c_ClearITPendingBit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _I2C_ClearITPendingBit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ClearITPendingBit.c: 76: void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
;	-----------------------------------------
;	 function I2C_ClearITPendingBit
;	-----------------------------------------
_I2C_ClearITPendingBit:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ClearITPendingBit.c: 81: assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
	cpw	x, #0x2220
	jreq	00104$
	cpw	x, #0x2108
	jreq	00104$
	cpw	x, #0x2104
	jreq	00104$
	cpw	x, #0x2102
	jreq	00104$
	cpw	x, #0x2101
	jreq	00104$
	pushw	x
	push	#0x51
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ClearITPendingBit.c: 84: flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
	clr	a
	ld	xh, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ClearITPendingBit.c: 87: I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
	cplw	x
	ld	a, xl
	ld	0x5218, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ClearITPendingBit.c: 88: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_i2c_ClearITPendingBit.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

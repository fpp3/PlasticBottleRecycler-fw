;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_i2c_GeneralCallCmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _I2C_GeneralCallCmd
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
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GeneralCallCmd.c: 48: void I2C_GeneralCallCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_GeneralCallCmd
;	-----------------------------------------
_I2C_GeneralCallCmd:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GeneralCallCmd.c: 51: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	ld	(0x01, sp), a
	jreq	00107$
	tnz	(0x01, sp)
	jrne	00107$
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GeneralCallCmd.c: 56: I2C->CR1 |= I2C_CR1_ENGC;
	ld	a, 0x5210
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GeneralCallCmd.c: 53: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GeneralCallCmd.c: 56: I2C->CR1 |= I2C_CR1_ENGC;
	or	a, #0x40
	ld	0x5210, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GeneralCallCmd.c: 61: I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
	and	a, #0xbf
	ld	0x5210, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GeneralCallCmd.c: 63: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_i2c_GeneralCallCmd.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

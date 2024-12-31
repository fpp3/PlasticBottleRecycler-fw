;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_i2c_AcknowledgeConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _I2C_AcknowledgeConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_AcknowledgeConfig.c: 49: void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
;	-----------------------------------------
;	 function I2C_AcknowledgeConfig
;	-----------------------------------------
_I2C_AcknowledgeConfig:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_AcknowledgeConfig.c: 52: assert_param(IS_I2C_ACK_OK(Ack));
	ld	xl, a
	dec	a
	jrne	00153$
	ld	a, #0x01
	ld	xh, a
	jra	00154$
00153$:
	clr	a
	ld	xh, a
00154$:
	ld	a, xl
	tnz	a
	jreq	00110$
	ld	a, xh
	tnz	a
	jrne	00110$
	ld	a, xl
	cp	a, #0x02
	jreq	00110$
	pushw	x
	push	#0x34
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_AcknowledgeConfig.c: 57: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
	ld	a, 0x5211
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_AcknowledgeConfig.c: 54: if (Ack == I2C_ACK_NONE)
	exg	a, xl
	tnz	a
	exg	a, xl
	jrne	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_AcknowledgeConfig.c: 57: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
	and	a, #0xfb
	ld	0x5211, a
	ret
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_AcknowledgeConfig.c: 62: I2C->CR2 |= I2C_CR2_ACK;
	or	a, #0x04
	ld	0x5211, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_AcknowledgeConfig.c: 57: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
	ld	a, 0x5211
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_AcknowledgeConfig.c: 64: if (Ack == I2C_ACK_CURR)
	push	a
	ld	a, xh
	tnz	a
	pop	a
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_AcknowledgeConfig.c: 67: I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
	and	a, #0xf7
	ld	0x5211, a
	ret
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_AcknowledgeConfig.c: 72: I2C->CR2 |= I2C_CR2_POS;
	or	a, #0x08
	ld	0x5211, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_AcknowledgeConfig.c: 75: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_i2c_AcknowledgeConfig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

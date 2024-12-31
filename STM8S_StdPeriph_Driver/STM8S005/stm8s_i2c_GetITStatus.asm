;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_i2c_GetITStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _I2C_GetITStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 62: ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
;	-----------------------------------------
;	 function I2C_GetITStatus
;	-----------------------------------------
_I2C_GetITStatus:
	sub	sp, #6
	ldw	(0x05, sp), x
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 65: __IO uint8_t enablestatus = 0;
	clr	(0x03, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 69: assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
	ldw	x, (0x05, sp)
	cpw	x, #0x1680
	jreq	00115$
	cpw	x, #0x1640
	jreq	00115$
	cpw	x, #0x1210
	jreq	00115$
	cpw	x, #0x1208
	jreq	00115$
	cpw	x, #0x1204
	jreq	00115$
	cpw	x, #0x1202
	jreq	00115$
	cpw	x, #0x1201
	jreq	00115$
	cpw	x, #0x2220
	jreq	00115$
	cpw	x, #0x2108
	jreq	00115$
	cpw	x, #0x2104
	jreq	00115$
	cpw	x, #0x2102
	jreq	00115$
	cpw	x, #0x2101
	jreq	00115$
	pushw	x
	push	#0x45
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00115$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 71: tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
	clr	(0x02, sp)
	ld	a, xh
	and	a, #0x07
	ld	yl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 74: enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
	ld	a, 0x521a
	ld	(0x04, sp), a
	ld	a, yl
	and	a, (0x04, sp)
	ld	(0x03, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 76: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
	clr	a
	rlwa	x
	and	a, #0x30
	ld	xh, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 79: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
	ld	a, (0x06, sp)
	ld	(0x04, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 76: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
	cpw	x, #0x0100
	jrne	00110$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 79: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
	ld	a, 0x5217
	and	a, (0x04, sp)
	jreq	00102$
	tnz	(0x03, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 82: bitstatus = SET;
	ld	a, #0x01
	jra	00111$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 87: bitstatus = RESET;
	clr	a
	jra	00111$
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 93: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
	ld	a, 0x5218
	and	a, (0x04, sp)
	jreq	00106$
	tnz	(0x03, sp)
	jreq	00106$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 96: bitstatus = SET;
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 101: bitstatus = RESET;
	.byte 0x21
00106$:
	clr	a
00111$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 105: return  bitstatus;
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c: 106: }
	addw	sp, #6
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetITStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

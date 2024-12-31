;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_i2c_GetFlagStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _I2C_GetFlagStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 65: FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
;	-----------------------------------------
;	 function I2C_GetFlagStatus
;	-----------------------------------------
_I2C_GetFlagStatus:
	sub	sp, #3
	ldw	(0x02, sp), x
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 67: uint8_t tempreg = 0;
	clr	(0x01, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 72: assert_param(IS_I2C_FLAG_OK(I2C_Flag));
	ldw	x, (0x02, sp)
	cpw	x, #0x0180
	jreq	00112$
	cpw	x, #0x0140
	jreq	00112$
	cpw	x, #0x0110
	jreq	00112$
	cpw	x, #0x0108
	jreq	00112$
	cpw	x, #0x0104
	jreq	00112$
	cpw	x, #0x0102
	jreq	00112$
	cpw	x, #0x0101
	jreq	00112$
	cpw	x, #0x0220
	jreq	00112$
	cpw	x, #0x0208
	jreq	00112$
	cpw	x, #0x0204
	jreq	00112$
	cpw	x, #0x0202
	jreq	00112$
	cpw	x, #0x0201
	jreq	00112$
	cpw	x, #0x0310
	jreq	00112$
	cpw	x, #0x0304
	jreq	00112$
	cpw	x, #0x0302
	jreq	00112$
	cpw	x, #0x0301
	jreq	00112$
	pushw	x
	push	#0x48
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00112$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 75: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
	ld	a, xh
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 77: switch (regindex)
	cp	a, #0x01
	jreq	00101$
	cp	a, #0x02
	jreq	00102$
	cp	a, #0x03
	jreq	00103$
	jra	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 80: case 0x01:
00101$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 81: tempreg = (uint8_t)I2C->SR1;
	ld	a, 0x5217
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 82: break;
	jra	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 85: case 0x02:
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 86: tempreg = (uint8_t)I2C->SR2;
	ld	a, 0x5218
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 87: break;
	jra	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 90: case 0x03:
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 91: tempreg = (uint8_t)I2C->SR3;
	ld	a, 0x5219
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 96: }
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 99: if ((tempreg & (uint8_t)I2C_Flag ) != 0)
	ld	a, (0x03, sp)
	and	a, (0x01, sp)
	jreq	00107$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 102: bitstatus = SET;
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 107: bitstatus = RESET;
	.byte 0x21
00107$:
	clr	a
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 110: return bitstatus;
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c: 111: }
	addw	sp, #3
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_i2c_GetFlagStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

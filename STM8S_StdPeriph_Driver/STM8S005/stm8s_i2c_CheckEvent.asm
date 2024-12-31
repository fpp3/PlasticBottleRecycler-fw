;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_i2c_CheckEvent
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _I2C_CheckEvent
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
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_CheckEvent.c: 71: ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
;	-----------------------------------------
;	 function I2C_CheckEvent
;	-----------------------------------------
_I2C_CheckEvent:
	sub	sp, #6
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_CheckEvent.c: 73: __IO uint16_t lastevent = 0x00;
	clr	(0x02, sp)
	clr	(0x01, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_CheckEvent.c: 79: assert_param(IS_I2C_EVENT_OK(I2C_Event));
	cpw	x, #0x0004
	jrne	00283$
	ld	a, #0x01
	.byte 0x21
00283$:
	clr	a
00284$:
	cpw	x, #0x0682
	jreq	00110$
	cpw	x, #0x0202
	jreq	00110$
	cpw	x, #0x1200
	jreq	00110$
	cpw	x, #0x0240
	jreq	00110$
	cpw	x, #0x0350
	jreq	00110$
	cpw	x, #0x0684
	jreq	00110$
	cpw	x, #0x0794
	jreq	00110$
	tnz	a
	jrne	00110$
	cpw	x, #0x0010
	jreq	00110$
	cpw	x, #0x0301
	jreq	00110$
	cpw	x, #0x0782
	jreq	00110$
	cpw	x, #0x0302
	jreq	00110$
	cpw	x, #0x0340
	jreq	00110$
	cpw	x, #0x0784
	jreq	00110$
	cpw	x, #0x0780
	jreq	00110$
	cpw	x, #0x0308
	jreq	00110$
	push	a
	pushw	x
	push	#0x4f
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
	pop	a
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_CheckEvent.c: 81: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
	tnz	a
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_CheckEvent.c: 83: lastevent = I2C->SR2 & I2C_SR2_AF;
	ld	a, 0x5218
	and	a, #0x04
	clr	(0x05, sp)
	ld	(0x02, sp), a
	clr	(0x01, sp)
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_CheckEvent.c: 87: flag1 = I2C->SR1;
	ld	a, 0x5217
	ld	yl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_CheckEvent.c: 88: flag2 = I2C->SR3;
	ld	a, 0x5219
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_CheckEvent.c: 89: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
	ld	yh, a
	clr	(0x04, sp)
	clr	(0x05, sp)
	ldw	(0x01, sp), y
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_CheckEvent.c: 92: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
	ld	a, xl
	and	a, (0x02, sp)
	ld	(0x06, sp), a
	ld	a, xh
	and	a, (0x01, sp)
	ld	(0x05, sp), a
	cpw	x, (0x05, sp)
	jrne	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_CheckEvent.c: 95: status = SUCCESS;
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_CheckEvent.c: 100: status = ERROR;
	.byte 0x21
00105$:
	clr	a
00106$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_CheckEvent.c: 104: return status;
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_CheckEvent.c: 105: }
	addw	sp, #6
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_i2c_CheckEvent.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

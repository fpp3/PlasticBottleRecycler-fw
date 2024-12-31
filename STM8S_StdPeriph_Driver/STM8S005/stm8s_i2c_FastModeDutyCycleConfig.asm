;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_i2c_FastModeDutyCycleConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _I2C_FastModeDutyCycleConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_FastModeDutyCycleConfig.c: 48: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
;	-----------------------------------------
;	 function I2C_FastModeDutyCycleConfig
;	-----------------------------------------
_I2C_FastModeDutyCycleConfig:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_FastModeDutyCycleConfig.c: 51: assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
	cp	a, #0x40
	jrne	00133$
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	.byte 0xc5
00133$:
	clr	(0x01, sp)
00134$:
	tnz	a
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
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_FastModeDutyCycleConfig.c: 56: I2C->CCRH |= I2C_CCRH_DUTY;
	ld	a, 0x521c
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_FastModeDutyCycleConfig.c: 53: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
	ld	a, (0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_FastModeDutyCycleConfig.c: 56: I2C->CCRH |= I2C_CCRH_DUTY;
	ld	a, xl
	or	a, #0x40
	ld	0x521c, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_FastModeDutyCycleConfig.c: 61: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
	ld	a, xl
	and	a, #0xbf
	ld	0x521c, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_FastModeDutyCycleConfig.c: 63: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_i2c_FastModeDutyCycleCon"
	.ascii "fig.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

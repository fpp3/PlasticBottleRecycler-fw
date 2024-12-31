;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_i2c_ReceiveData
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _I2C_ReceiveData
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
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ReceiveData.c: 47: uint8_t I2C_ReceiveData(void)
;	-----------------------------------------
;	 function I2C_ReceiveData
;	-----------------------------------------
_I2C_ReceiveData:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ReceiveData.c: 50: return ((uint8_t)I2C->DR);
	ld	a, 0x5216
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_ReceiveData.c: 51: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

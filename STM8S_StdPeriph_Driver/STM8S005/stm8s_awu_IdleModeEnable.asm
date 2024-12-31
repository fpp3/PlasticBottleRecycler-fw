;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_awu_IdleModeEnable
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _AWU_IdleModeEnable
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
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_IdleModeEnable.c: 47: void AWU_IdleModeEnable(void)
;	-----------------------------------------
;	 function AWU_IdleModeEnable
;	-----------------------------------------
_AWU_IdleModeEnable:
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_IdleModeEnable.c: 50: AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
	bres	0x50f0, #4
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_IdleModeEnable.c: 53: AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
	mov	0x50f2+0, #0xf0
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_IdleModeEnable.c: 54: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

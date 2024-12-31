;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_awu_DeInit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _AWU_DeInit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_DeInit.c: 48: void AWU_DeInit(void)
;	-----------------------------------------
;	 function AWU_DeInit
;	-----------------------------------------
_AWU_DeInit:
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_DeInit.c: 50: AWU->CSR = AWU_CSR_RESET_VALUE;
	mov	0x50f0+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_DeInit.c: 51: AWU->APR = AWU_APR_RESET_VALUE;
	mov	0x50f1+0, #0x3f
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_DeInit.c: 52: AWU->TBR = AWU_TBR_RESET_VALUE;
	mov	0x50f2+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_DeInit.c: 53: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

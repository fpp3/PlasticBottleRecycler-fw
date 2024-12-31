;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_iwdg_ReloadCounter
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _IWDG_ReloadCounter
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
;	../STM8S_StdPeriph_Driver/src/stm8s_iwdg_ReloadCounter.c: 47: void IWDG_ReloadCounter(void)
;	-----------------------------------------
;	 function IWDG_ReloadCounter
;	-----------------------------------------
_IWDG_ReloadCounter:
;	../STM8S_StdPeriph_Driver/src/stm8s_iwdg_ReloadCounter.c: 49: IWDG->KR = IWDG_KEY_REFRESH;
	mov	0x50e0+0, #0xaa
;	../STM8S_StdPeriph_Driver/src/stm8s_iwdg_ReloadCounter.c: 50: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

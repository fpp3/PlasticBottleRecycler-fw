;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_flash_GetLowPowerMode
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FLASH_GetLowPowerMode
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
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetLowPowerMode.c: 47: FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
;	-----------------------------------------
;	 function FLASH_GetLowPowerMode
;	-----------------------------------------
_FLASH_GetLowPowerMode:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetLowPowerMode.c: 49: return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
	ld	a, 0x505a
	and	a, #0x0c
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetLowPowerMode.c: 50: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

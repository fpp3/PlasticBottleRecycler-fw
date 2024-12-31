;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_flash_DeInit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FLASH_DeInit
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
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_DeInit.c: 47: void FLASH_DeInit(void)
;	-----------------------------------------
;	 function FLASH_DeInit
;	-----------------------------------------
_FLASH_DeInit:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_DeInit.c: 49: FLASH->CR1 = FLASH_CR1_RESET_VALUE;
	mov	0x505a+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_DeInit.c: 50: FLASH->CR2 = FLASH_CR2_RESET_VALUE;
	mov	0x505b+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_DeInit.c: 51: FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
	mov	0x505c+0, #0xff
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_DeInit.c: 52: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
	bres	0x505f, #3
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_DeInit.c: 53: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
	bres	0x505f, #1
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_DeInit.c: 54: (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
	ld	a, 0x505f
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_DeInit.c: 55: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

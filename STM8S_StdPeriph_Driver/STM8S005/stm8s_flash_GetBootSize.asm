;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_flash_GetBootSize
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FLASH_GetBootSize
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
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetBootSize.c: 47: uint32_t FLASH_GetBootSize(void)
;	-----------------------------------------
;	 function FLASH_GetBootSize
;	-----------------------------------------
_FLASH_GetBootSize:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetBootSize.c: 52: temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
	ld	a, 0x505d
	clrw	y
	swapw	y
	ld	xh, a
	clr	a
	ld	xl, a
	sllw	x
	rlcw	y
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetBootSize.c: 55: if(FLASH->FPR == 0xFF)
	ld	a, 0x505d
	inc	a
	jreq	00114$
	ret
00114$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetBootSize.c: 57: temp += 512;
	addw	x, #0x0200
	ld	a, yl
	adc	a, #0x00
	ld	yl, a
	clr	a
	adc	a, #0x00
	ld	yh, a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetBootSize.c: 61: return(temp);
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetBootSize.c: 62: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

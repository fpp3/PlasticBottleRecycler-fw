;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_flash_SetLowPowerMode
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _FLASH_SetLowPowerMode
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
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_SetLowPowerMode.c: 48: void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
;	-----------------------------------------
;	 function FLASH_SetLowPowerMode
;	-----------------------------------------
_FLASH_SetLowPowerMode:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_SetLowPowerMode.c: 51: assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
	ld	(0x01, sp), a
	cp	a, #0x04
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x08
	jreq	00104$
	tnz	(0x01, sp)
	jreq	00104$
	ld	a, (0x01, sp)
	cp	a, #0x0c
	jreq	00104$
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_SetLowPowerMode.c: 54: FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
	ld	a, 0x505a
	and	a, #0xf3
	ld	0x505a, a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_SetLowPowerMode.c: 57: FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
	ld	a, 0x505a
	or	a, (0x01, sp)
	ld	0x505a, a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_SetLowPowerMode.c: 58: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_flash_SetLowPowerMode.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

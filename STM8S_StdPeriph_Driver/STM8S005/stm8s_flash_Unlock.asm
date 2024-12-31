;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_flash_Unlock
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _FLASH_Unlock
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
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_Unlock.c: 48: void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
;	-----------------------------------------
;	 function FLASH_Unlock
;	-----------------------------------------
_FLASH_Unlock:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_Unlock.c: 51: assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
	ld	xl, a
	sub	a, #0xfd
	jrne	00133$
	inc	a
	.byte 0x21
00133$:
	clr	a
00134$:
	tnz	a
	jrne	00107$
	push	a
	ld	a, xl
	cp	a, #0xf7
	pop	a
	jreq	00107$
	push	a
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_Unlock.c: 54: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
	tnz	a
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_Unlock.c: 56: FLASH->PUKR = FLASH_RASS_KEY1;
	mov	0x5062+0, #0x56
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_Unlock.c: 57: FLASH->PUKR = FLASH_RASS_KEY2;
	mov	0x5062+0, #0xae
	ret
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_Unlock.c: 62: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
	mov	0x5064+0, #0xae
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_Unlock.c: 63: FLASH->DUKR = FLASH_RASS_KEY1;
	mov	0x5064+0, #0x56
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_Unlock.c: 65: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_flash_Unlock.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

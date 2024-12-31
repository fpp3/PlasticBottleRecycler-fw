;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_flash_GetFlagStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _FLASH_GetFlagStatus
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
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetFlagStatus.c: 50: FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
;	-----------------------------------------
;	 function FLASH_GetFlagStatus
;	-----------------------------------------
_FLASH_GetFlagStatus:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetFlagStatus.c: 54: assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
	cp	a, #0x40
	jreq	00107$
	cp	a, #0x08
	jreq	00107$
	cp	a, #0x04
	jreq	00107$
	cp	a, #0x02
	jreq	00107$
	cp	a, #0x01
	jreq	00107$
	push	a
	push	#0x36
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetFlagStatus.c: 57: if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
	ldw	x, #0x505f
	push	a
	ld	a, (x)
	ld	(0x02, sp), a
	pop	a
	and	a, (0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetFlagStatus.c: 59: status = SET; /* FLASH_FLAG is set */
	ld	a, #0x01
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetFlagStatus.c: 63: status = RESET; /* FLASH_FLAG is reset*/
	.byte 0x21
00102$:
	clr	a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetFlagStatus.c: 67: return status;
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_GetFlagStatus.c: 68: }
	addw	sp, #1
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_flash_GetFlagStatus.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

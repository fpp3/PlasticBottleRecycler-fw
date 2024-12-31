;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_flash_SetProgrammingTime
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _FLASH_SetProgrammingTime
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
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_SetProgrammingTime.c: 48: void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
;	-----------------------------------------
;	 function FLASH_SetProgrammingTime
;	-----------------------------------------
_FLASH_SetProgrammingTime:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_SetProgrammingTime.c: 51: assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
	ld	(0x02, sp), a
	jreq	00104$
	tnz	(0x02, sp)
	jrne	00104$
	push	#0x33
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_SetProgrammingTime.c: 53: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
	ld	a, 0x505a
	and	a, #0xfe
	ld	0x505a, a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_SetProgrammingTime.c: 54: FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
	ld	a, 0x505a
	ld	(0x01, sp), a
	ld	a, (0x02, sp)
	or	a, (0x01, sp)
	ld	0x505a, a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_SetProgrammingTime.c: 55: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_flash_SetProgrammingTime"
	.ascii ".c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

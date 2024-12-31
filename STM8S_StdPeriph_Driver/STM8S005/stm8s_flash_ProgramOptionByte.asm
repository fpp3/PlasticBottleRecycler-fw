;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_flash_ProgramOptionByte
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FLASH_WaitForLastOperation
	.globl _assert_failed
	.globl _FLASH_ProgramOptionByte
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
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte.c: 48: void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
;	-----------------------------------------
;	 function FLASH_ProgramOptionByte
;	-----------------------------------------
_FLASH_ProgramOptionByte:
	sub	sp, #5
	ld	(0x05, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte.c: 51: assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
	cpw	x, #0x4800
	jrc	00106$
	cpw	x, #0x487f
	jrule	00107$
00106$:
	pushw	x
	push	#0x33
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	x
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte.c: 54: FLASH->CR2 |= FLASH_CR2_OPT;
	bset	0x505b, #7
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte.c: 55: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
	bres	0x505c, #7
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte.c: 58: if(Address == 0x4800)
	ldw	(0x01, sp), x
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte.c: 61: *((NEAR uint8_t*)Address) = Data;
	ldw	(0x03, sp), x
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte.c: 58: if(Address == 0x4800)
	ldw	x, (0x01, sp)
	cpw	x, #0x4800
	jrne	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte.c: 61: *((NEAR uint8_t*)Address) = Data;
	ldw	x, (0x03, sp)
	ld	a, (0x05, sp)
	ld	(x), a
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte.c: 66: *((NEAR uint8_t*)Address) = Data;
	ldw	x, (0x03, sp)
	ld	a, (0x05, sp)
	ld	(x), a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte.c: 67: *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
	ldw	x, (0x01, sp)
	incw	x
	ld	a, (0x05, sp)
	cpl	a
	ld	(x), a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte.c: 69: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
	ld	a, #0xfd
	call	_FLASH_WaitForLastOperation
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte.c: 72: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
	bres	0x505b, #7
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte.c: 73: FLASH->NCR2 |= FLASH_NCR2_NOPT;
	bset	0x505c, #7
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte.c: 74: }
	addw	sp, #5
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramOptionByte."
	.ascii "c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

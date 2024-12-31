;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_flash_ProgramWord
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _FLASH_ProgramWord
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
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramWord.c: 50: void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
;	-----------------------------------------
;	 function FLASH_ProgramWord
;	-----------------------------------------
_FLASH_ProgramWord:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramWord.c: 53: assert_param(IS_FLASH_ADDRESS_OK(Address));
	ldw	x, (0x07, sp)
	cpw	x, #0x8000
	ld	a, (0x06, sp)
	sbc	a, #0x00
	ld	a, (0x05, sp)
	sbc	a, #0x00
	jrc	00110$
	ldw	x, (0x05, sp)
	jreq	00104$
00110$:
	ldw	x, (0x07, sp)
	cpw	x, #0x4000
	ld	a, (0x06, sp)
	sbc	a, #0x00
	ld	a, (0x05, sp)
	sbc	a, #0x00
	jrc	00103$
	ldw	x, #0x43ff
	cpw	x, (0x07, sp)
	clr	a
	sbc	a, (0x06, sp)
	clr	a
	sbc	a, (0x05, sp)
	jrnc	00104$
00103$:
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramWord.c: 56: FLASH->CR2 |= FLASH_CR2_WPRG;
	bset	0x505b, #6
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramWord.c: 57: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
	bres	0x505c, #6
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramWord.c: 62: *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
	ldw	y, (0x07, sp)
	ld	a, (9, sp)
	ld	(y), a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramWord.c: 64: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
	ldw	x, y
	incw	x
	ldw	(0x01, sp), x
	ldw	x, sp
	addw	x, #9
	ld	a, (0x1, x)
	ldw	x, (0x01, sp)
	ld	(x), a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramWord.c: 66: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
	ldw	x, y
	incw	x
	incw	x
	ldw	(0x01, sp), x
	ldw	x, sp
	addw	x, #9
	ld	a, (0x2, x)
	ldw	x, (0x01, sp)
	ld	(x), a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramWord.c: 68: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
	addw	y, #0x0003
	ldw	x, sp
	addw	x, #9
	ld	a, (0x3, x)
	ld	(y), a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramWord.c: 75: }
	ldw	x, (3, sp)
	addw	sp, #12
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_flash_ProgramWord.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

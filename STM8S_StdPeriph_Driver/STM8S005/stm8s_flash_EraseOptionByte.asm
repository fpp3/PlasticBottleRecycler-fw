;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_flash_EraseOptionByte
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FLASH_WaitForLastOperation
	.globl _assert_failed
	.globl _FLASH_EraseOptionByte
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
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c: 47: void FLASH_EraseOptionByte(uint16_t Address)
;	-----------------------------------------
;	 function FLASH_EraseOptionByte
;	-----------------------------------------
_FLASH_EraseOptionByte:
	pushw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c: 50: assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
	ldw	(0x01, sp), x
	cpw	x, #0x4800
	jrc	00106$
	ldw	x, (0x01, sp)
	cpw	x, #0x487f
	jrule	00107$
00106$:
	push	#0x32
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c: 53: FLASH->CR2 |= FLASH_CR2_OPT;
	bset	0x505b, #7
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c: 54: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
	bres	0x505c, #7
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c: 57: if(Address == 0x4800)
	ldw	y, (0x01, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c: 60: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
	ldw	x, (0x01, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c: 57: if(Address == 0x4800)
	cpw	y, #0x4800
	jrne	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c: 60: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
	clr	(x)
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c: 65: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
	clr	(x)
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c: 66: *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
	ldw	x, (0x01, sp)
	incw	x
	ld	a, #0xff
	ld	(x), a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c: 68: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
	ld	a, #0xfd
	call	_FLASH_WaitForLastOperation
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c: 71: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
	bres	0x505b, #7
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c: 72: FLASH->NCR2 |= FLASH_NCR2_NOPT;
	bset	0x505c, #7
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c: 73: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_flash_EraseOptionByte.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

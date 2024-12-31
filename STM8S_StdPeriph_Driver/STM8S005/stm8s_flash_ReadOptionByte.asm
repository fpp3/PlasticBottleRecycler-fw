;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_flash_ReadOptionByte
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _FLASH_ReadOptionByte
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
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c: 47: uint16_t FLASH_ReadOptionByte(uint16_t Address)
;	-----------------------------------------
;	 function FLASH_ReadOptionByte
;	-----------------------------------------
_FLASH_ReadOptionByte:
	pushw	x
	exgw	x, y
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c: 53: assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
	cpw	y, #0x4800
	jrc	00109$
	cpw	y, #0x487f
	jrule	00110$
00109$:
	pushw	y
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	popw	y
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c: 55: value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
	ldw	x, y
	ld	a, (x)
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c: 56: value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
	ld	a, (0x1, x)
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c: 59: if(Address == 0x4800)	 
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c: 61: res_value =	 value_optbyte;
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c: 59: if(Address == 0x4800)	 
	cpw	y, #0x4800
	jreq	00106$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c: 61: res_value =	 value_optbyte;
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c: 65: if(value_optbyte == (uint8_t)(~value_optbyte_complement))
	ld	a, (0x02, sp)
	cpl	a
	cp	a, (0x01, sp)
	jrne	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c: 67: res_value = (uint16_t)((uint16_t)value_optbyte << 8);
	clr	a
	rlwa	x
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c: 68: res_value = res_value | (uint16_t)value_optbyte_complement;
	ld	a, (0x02, sp)
	clr	(0x01, sp)
	pushw	x
	popw	x
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c: 72: res_value = FLASH_OPTIONBYTE_ERROR;
	.byte 0xbc
00102$:
	ldw	x, #0x5555
00106$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c: 75: return(res_value);
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c: 76: }
	addw	sp, #2
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_flash_ReadOptionByte.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

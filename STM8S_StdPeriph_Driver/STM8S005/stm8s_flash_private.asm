;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_flash_private
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _FLASH_WaitForLastOperation
	.globl _FLASH_EraseBlock
	.globl _FLASH_ProgramBlock
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
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 120: IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
;	-----------------------------------------
;	 function FLASH_WaitForLastOperation
;	-----------------------------------------
_FLASH_WaitForLastOperation:
	ld	xl, a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 122: uint8_t flagstatus = 0x00;
	clr	a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 128: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
	push	a
	ld	a, xl
	cp	a, #0xfd
	pop	a
	jrne	00121$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 130: while((flagstatus == 0x00) && (timeout != 0x00))
	clrw	x
	decw	x
00102$:
	tnz	a
	jrne	00111$
	tnzw	x
	jreq	00111$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 132: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
	ld	a, 0x505f
	and	a, #0x05
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 134: timeout--;
	decw	x
	jra	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 139: while((flagstatus == 0x00) && (timeout != 0x00))
00121$:
	clrw	x
	decw	x
00106$:
	tnz	a
	jrne	00124$
	tnzw	x
	jreq	00124$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 141: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
	ld	a, 0x505f
	and	a, #0x41
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 143: timeout--;
	decw	x
	jra	00106$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 159: return((FLASH_Status_TypeDef)flagstatus);
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 143: timeout--;
00124$:
00111$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 154: if(timeout == 0x00 )
	tnzw	x
	jreq	00180$
	ret
00180$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 156: flagstatus = FLASH_STATUS_TIMEOUT;
	ld	a, #0x02
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 159: return((FLASH_Status_TypeDef)flagstatus);
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 160: }
	ret
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 169: IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
;	-----------------------------------------
;	 function FLASH_EraseBlock
;	-----------------------------------------
_FLASH_EraseBlock:
	sub	sp, #4
	ldw	(0x03, sp), x
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 181: assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
	ld	xl, a
	sub	a, #0xfd
	jrne	00151$
	inc	a
	.byte 0x21
00151$:
	clr	a
00152$:
	tnz	a
	jrne	00107$
	push	a
	ld	a, xl
	cp	a, #0xf7
	pop	a
	jreq	00107$
	push	a
	push	#0xb5
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
	pop	a
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 182: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
	tnz	a
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 184: assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
	ldw	x, (0x03, sp)
	cpw	x, #0x0100
	jrc	00112$
	push	#0xb8
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00112$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 185: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
	ldw	y, #0x8000
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 189: assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
	ldw	x, (0x03, sp)
	cpw	x, #0x0008
	jrc	00114$
	push	#0xbd
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00114$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 190: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
	ldw	y, #0x4000
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 198: pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
	ldw	x, (0x03, sp)
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x01, sp), x
	ldw	x, y
	addw	x, (0x01, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 202: FLASH->CR2 |= FLASH_CR2_ERASE;
	bset	0x505b, #5
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 203: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
	bres	0x505c, #5
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 207: *pwFlash = (uint32_t)0;
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 215: }
	addw	sp, #4
	ret
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 226: IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
;	-----------------------------------------
;	 function FLASH_ProgramBlock
;	-----------------------------------------
_FLASH_ProgramBlock:
	sub	sp, #14
	ldw	(0x0d, sp), x
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 233: assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
	cp	a, #0xfd
	jrne	00191$
	push	a
	ld	a, #0x01
	ld	(0x0d, sp), a
	pop	a
	.byte 0xc5
00191$:
	clr	(0x0c, sp)
00192$:
	tnz	(0x0c, sp)
	jrne	00113$
	cp	a, #0xf7
	jreq	00113$
	push	#0xe9
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 234: assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
	tnz	(0x11, sp)
	jreq	00118$
	ld	a, (0x11, sp)
	cp	a, #0x10
	jreq	00118$
	push	#0xea
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00118$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 235: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
	ld	a, (0x0c, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 237: assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
	ldw	x, (0x0d, sp)
	cpw	x, #0x0100
	jrc	00123$
	push	#0xed
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00123$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 238: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
	clrw	x
	ld	a, #0x80
	ldw	(0x01, sp), x
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 242: assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
	ldw	x, (0x0d, sp)
	cpw	x, #0x0008
	jrc	00125$
	push	#0xf2
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00125$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 243: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
	clrw	x
	ld	a, #0x40
	ldw	(0x01, sp), x
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 247: startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
	ldw	y, (0x0d, sp)
	clr	(0x06, sp)
	clr	(0x05, sp)
	push	a
	ldw	(0x0c, sp), y
	ldw	y, (0x06, sp)
	ld	a, #0x07
00204$:
	sll	(0x0d, sp)
	rlc	(0x0c, sp)
	rlcw	y
	dec	a
	jrne	00204$
	ld	a, xl
	add	a, (0x0d, sp)
	ld	(0x09, sp), a
	pop	a
	adc	a, (0x0b, sp)
	ld	(0x07, sp), a
	ld	a, yl
	adc	a, (0x02, sp)
	ld	(0x06, sp), a
	ld	a, yh
	adc	a, (0x01, sp)
	ld	(0x05, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 253: FLASH->CR2 |= FLASH_CR2_PRG;
	ld	a, 0x505b
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 250: if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
	tnz	(0x11, sp)
	jrne	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 253: FLASH->CR2 |= FLASH_CR2_PRG;
	or	a, #0x01
	ld	0x505b, a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 254: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
	bres	0x505c, #0
	jra	00134$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 259: FLASH->CR2 |= FLASH_CR2_FPRG;
	or	a, #0x10
	ld	0x505b, a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 260: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
	bres	0x505c, #4
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 264: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
00134$:
	clrw	x
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 266: *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
	ldw	y, (0x07, sp)
	ldw	(0x09, sp), y
	ld	a, xl
	add	a, (0x0a, sp)
	ld	(0x0c, sp), a
	clr	a
	adc	a, (0x09, sp)
	ld	(0x0b, sp), a
	ldw	y, x
	addw	y, (0x12, sp)
	ld	a, (y)
	ldw	y, (0x0b, sp)
	ld	(y), a
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 264: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
	incw	x
	cpw	x, #0x0080
	jrc	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c: 268: }
	ldw	x, (15, sp)
	addw	sp, #19
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_flash_private.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

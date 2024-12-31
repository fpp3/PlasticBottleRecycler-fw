;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_i2c_Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _I2C_AcknowledgeConfig
	.globl _assert_failed
	.globl _I2C_Init
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
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 58: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
;	-----------------------------------------
;	 function I2C_Init
;	-----------------------------------------
_I2C_Init:
	sub	sp, #7
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 64: uint8_t tmpccrh = 0;
	clr	(0x05, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 67: assert_param(IS_I2C_ACK_OK(Ack));
	tnz	(0x11, sp)
	jreq	00114$
	ld	a, (0x11, sp)
	dec	a
	jreq	00114$
	ld	a, (0x11, sp)
	cp	a, #0x02
	jreq	00114$
	push	#0x43
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00114$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 68: assert_param(IS_I2C_ADDMODE_OK(AddMode));
	tnz	(0x12, sp)
	jreq	00122$
	ld	a, (0x12, sp)
	cp	a, #0x80
	jreq	00122$
	push	#0x44
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00122$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 69: assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
	ldw	x, (0x0e, sp)
	cpw	x, #0x03ff
	jrule	00127$
	push	#0x45
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00127$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 70: assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
	tnz	(0x10, sp)
	jreq	00129$
	ld	a, (0x10, sp)
	cp	a, #0x40
	jreq	00129$
	push	#0x46
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00129$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 71: assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
	ld	a, (0x13, sp)
	cp	a, #0x01
	jrc	00133$
	ld	a, (0x13, sp)
	cp	a, #0x10
	jrule	00134$
00133$:
	push	#0x47
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00134$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 72: assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
	ldw	x, (0x0c, sp)
	cpw	x, #0x0001
	ld	a, (0x0b, sp)
	sbc	a, #0x00
	ld	a, (0x0a, sp)
	sbc	a, #0x00
	jrc	00138$
	ldw	x, #0x1a80
	cpw	x, (0x0c, sp)
	ld	a, #0x06
	sbc	a, (0x0b, sp)
	clr	a
	sbc	a, (0x0a, sp)
	jrnc	00139$
00138$:
	push	#0x48
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00139$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 77: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
	ld	a, 0x5212
	and	a, #0xc0
	ld	0x5212, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 79: I2C->FREQR |= InputClockFrequencyMHz;
	ld	a, 0x5212
	or	a, (0x13, sp)
	ld	0x5212, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 83: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
	bres	0x5210, #0
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 86: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
	ld	a, 0x521c
	and	a, #0x30
	ld	0x521c, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 87: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
	ld	a, 0x521b
	mov	0x521b+0, #0x00
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 98: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
	ld	a, (0x13, sp)
	clrw	x
	clr	(0x01, sp)
	push	a
	pushw	x
	clr	a
	push	a
	push	#0x40
	push	#0x42
	push	#0x0f
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 90: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
	ldw	x, #0x86a0
	cpw	x, (0x0c, sp)
	ld	a, #0x01
	sbc	a, (0x0b, sp)
	clr	a
	sbc	a, (0x0a, sp)
	jrnc	00109$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 93: tmpccrh = I2C_CCRH_FS;
	ld	a, #0x80
	ld	(0x05, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 95: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
	tnz	(0x10, sp)
	jrne	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 98: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	jra	00103$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 103: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	push	#0x19
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ld	a, xl
	push	a
	ld	a, xh
	push	a
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 105: tmpccrh |= I2C_CCRH_DUTY;
	ld	a, #0xc0
	ld	(0x05, sp), a
00103$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 109: if (result < (uint16_t)0x01)
	cpw	x, #0x0001
	jrnc	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 112: result = (uint16_t)0x0001;
	clrw	x
	incw	x
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 118: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
	ld	a, (0x13, sp)
	ld	(0x07, sp), a
	clr	(0x06, sp)
	pushw	x
	ldw	x, (0x08, sp)
	sllw	x
	addw	x, (0x08, sp)
	exgw	x, y
	push	#0x0a
	push	#0x00
	ldw	x, y
	call	__divsint
	ldw	y, x
	ld	a, xl
	popw	x
	inc	a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 119: I2C->TRISER = (uint8_t)tmpval;
	ld	0x521d, a
	jra	00110$
00109$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 126: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
	ldw	x, (0x0c, sp)
	ldw	y, (0x0a, sp)
	sllw	x
	rlcw	y
	pushw	x
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 129: if (result < (uint16_t)0x0004)
	cpw	x, #0x0004
	jrnc	00107$
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 132: result = (uint16_t)0x0004;
	ldw	x, #0x0004
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 138: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
	ld	a, (0x13, sp)
	inc	a
	ld	0x521d, a
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 143: I2C->CCRL = (uint8_t)result;
	ld	a, xl
	ld	0x521b, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 144: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
	ld	a, xh
	and	a, #0x0f
	or	a, (0x05, sp)
	ld	0x521c, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 147: I2C->CR1 |= I2C_CR1_PE;
	bset	0x5210, #0
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 150: I2C_AcknowledgeConfig(Ack);
	ld	a, (0x11, sp)
	call	_I2C_AcknowledgeConfig
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 153: I2C->OARL = (uint8_t)(OwnAddress);
	ld	a, (0x0f, sp)
	ld	0x5213, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 154: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
	ld	a, (0x12, sp)
	or	a, #0x40
	ld	(0x07, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 155: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
	clr	a
	ld	xl, a
	ld	a, (0x0e, sp)
	and	a, #0x03
	ld	xh, a
	ld	a, #0x80
	div	x, a
	ld	a, xl
	or	a, (0x07, sp)
	ld	0x5214, a
;	../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c: 156: }
	ldw	x, (8, sp)
	addw	sp, #19
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_i2c_Init.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

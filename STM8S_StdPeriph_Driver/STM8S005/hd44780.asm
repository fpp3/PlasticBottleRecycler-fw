;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module hd44780
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __delay_ms
	.globl _lcd_gpioinit
	.globl _lcd_send_byte
	.globl _lcd_init
	.globl _lcd_puts
	.globl _lcd_setpos
	.globl _lcd_puts_auto
	.globl _lcd_puti
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
;	../hd44780.c: 23: void lcd_gpioinit(void){
;	-----------------------------------------
;	 function lcd_gpioinit
;	-----------------------------------------
_lcd_gpioinit:
;	../hd44780.c: 24: LCD_PORT_DDR |= LCD_PORT_DATAMASK; //set all used pins as output
	ld	a, 0x5007
	or	a, #0x3f
	ld	0x5007, a
;	../hd44780.c: 25: LCD_PORT_ODR |= (1<<LCD_PORT_E); //keep E high
	bset	0x5005, #1
;	../hd44780.c: 26: LCD_PORT_CR1 |= LCD_PORT_DATAMASK; //slow push pull output
	ld	a, 0x5008
	or	a, #0x3f
	ld	0x5008, a
;	../hd44780.c: 27: }
	ret
;	../hd44780.c: 30: void lcd_send_byte(uint8_t b, uint8_t cmd){
;	-----------------------------------------
;	 function lcd_send_byte
;	-----------------------------------------
_lcd_send_byte:
	pushw	x
	ld	(0x02, sp), a
;	../hd44780.c: 31: cmd &= 0x01;
	ld	a, (0x05, sp)
	and	a, #0x01
	ld	(0x05, sp), a
;	../hd44780.c: 33: LCD_PORT_ODR &= ~( LCD_PORT_DATAMASK & ~(1<<LCD_PORT_E) ); //all bits off
	ld	a, 0x5005
	and	a, #0xc2
	ld	0x5005, a
;	../hd44780.c: 35: LCD_PORT_ODR |= (cmd << LCD_PORT_RS); //command or data?
	ld	a, 0x5005
	ld	(0x01, sp), a
	ld	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x5005, a
;	../hd44780.c: 37: LCD_PORT_ODR |= (1<<LCD_PORT_E); //E up
	bset	0x5005, #1
;	../hd44780.c: 38: LCD_PORT_ODR |= ( (b>>4) << LCD_PORT_D); //send data bit (MS nibble)
	ld	a, 0x5005
	ld	(0x01, sp), a
	ld	a, (0x02, sp)
	swap	a
	and	a, #0x0f
	sll	a
	sll	a
	or	a, (0x01, sp)
	ld	0x5005, a
;	../hd44780.c: 39: LCD_PORT_ODR &= ~(1<<LCD_PORT_E); //E down
	bres	0x5005, #1
;	../hd44780.c: 40: _delay_ms(2);
	ldw	x, #0x0002
	call	__delay_ms
;	../hd44780.c: 41: LCD_PORT_ODR |= (1<<LCD_PORT_E); //E up
	bset	0x5005, #1
;	../hd44780.c: 42: LCD_PORT_ODR &= ~(0x0F << LCD_PORT_D);
	ld	a, 0x5005
	and	a, #0xc3
	ld	0x5005, a
;	../hd44780.c: 43: LCD_PORT_ODR |= ( (b & 0x0F) << LCD_PORT_D); //send data bit (LS nibble)
	ld	a, 0x5005
	ld	(0x01, sp), a
	ld	a, (0x02, sp)
	and	a, #0x0f
	sll	a
	sll	a
	or	a, (0x01, sp)
	ld	0x5005, a
;	../hd44780.c: 44: LCD_PORT_ODR &= ~(1<<LCD_PORT_E); //E down
	bres	0x5005, #1
;	../hd44780.c: 45: _delay_ms(2);
	ldw	x, #0x0002
	call	__delay_ms
;	../hd44780.c: 46: LCD_PORT_ODR |= (1<<LCD_PORT_E); //E up
	ld	a, 0x5005
	or	a, #0x02
	ld	0x5005, a
;	../hd44780.c: 48: }
	popw	x
	popw	x
	pop	a
	jp	(x)
;	../hd44780.c: 50: void lcd_init(void){
;	-----------------------------------------
;	 function lcd_init
;	-----------------------------------------
_lcd_init:
;	../hd44780.c: 52: lcd_send_byte(0x33, LCD_CMD);
	push	#0x00
	ld	a, #0x33
	call	_lcd_send_byte
;	../hd44780.c: 53: lcd_send_byte(0x32, LCD_CMD);
	push	#0x00
	ld	a, #0x32
	call	_lcd_send_byte
;	../hd44780.c: 56: lcd_send_byte(0x40, LCD_CMD);
	push	#0x00
	ld	a, #0x40
	call	_lcd_send_byte
;	../hd44780.c: 57: lcd_send_byte(0x01, LCD_CMD);
	push	#0x00
	ld	a, #0x01
	call	_lcd_send_byte
;	../hd44780.c: 58: lcd_send_byte(0x02, LCD_CMD);
	push	#0x00
	ld	a, #0x02
	call	_lcd_send_byte
;	../hd44780.c: 59: }
	ret
;	../hd44780.c: 62: void lcd_puts(uint8_t *c){
;	-----------------------------------------
;	 function lcd_puts
;	-----------------------------------------
_lcd_puts:
;	../hd44780.c: 63: while(*c){
00101$:
	ld	a, (x)
	jrne	00121$
	ret
00121$:
;	../hd44780.c: 64: lcd_send_byte(*c, LCD_DATA);
	pushw	x
	push	#0x01
	call	_lcd_send_byte
	popw	x
;	../hd44780.c: 65: c++;
	incw	x
	jra	00101$
;	../hd44780.c: 67: }
	ret
;	../hd44780.c: 69: void lcd_setpos(uint8_t l, uint8_t c){
;	-----------------------------------------
;	 function lcd_setpos
;	-----------------------------------------
_lcd_setpos:
	push	a
;	../hd44780.c: 70: lcd_send_byte(LCD_DDRAM_SET | c + (l * LCD_LINE2), LCD_CMD);
	swap	a
	and	a, #0xf0
	sll	a
	sll	a
	ld	(0x01, sp), a
	ld	a, (0x04, sp)
	add	a, (0x01, sp)
	or	a, #0x80
	push	#0x00
	call	_lcd_send_byte
;	../hd44780.c: 71: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	../hd44780.c: 73: void lcd_puts_auto(uint8_t *c){
;	-----------------------------------------
;	 function lcd_puts_auto
;	-----------------------------------------
_lcd_puts_auto:
	pushw	x
;	../hd44780.c: 75: while(*c){
	clr	(0x02, sp)
	clr	(0x01, sp)
00103$:
	ld	a, (x)
	jreq	00106$
;	../hd44780.c: 76: if (count == 8)
	ldw	y, (0x01, sp)
	cpw	y, #0x0008
	jrne	00102$
;	../hd44780.c: 77: lcd_setpos(1,0);
	pushw	x
	push	#0x00
	ld	a, #0x01
	call	_lcd_setpos
	popw	x
00102$:
;	../hd44780.c: 78: lcd_send_byte(*c, LCD_DATA);
	ld	a, (x)
	pushw	x
	push	#0x01
	call	_lcd_send_byte
	popw	x
;	../hd44780.c: 79: c++;
	incw	x
;	../hd44780.c: 80: count++;
	ldw	y, (0x01, sp)
	incw	y
	ldw	(0x01, sp), y
	jra	00103$
00106$:
;	../hd44780.c: 82: }
	popw	x
	ret
;	../hd44780.c: 84: void lcd_puti(int16_t number){
;	-----------------------------------------
;	 function lcd_puti
;	-----------------------------------------
_lcd_puti:
	sub	sp, #18
;	../hd44780.c: 86: if(number == 0) { string[0] = '0'; return; };
	ldw	(0x0f, sp), x
	jrne	00102$
	ld	a, #0x30
	ld	(0x01, sp), a
	jp	00114$
00102$:
;	../hd44780.c: 89: int  length = 0;
	clrw	x
;	../hd44780.c: 90: int isNegative = 0;
	clr	(0x08, sp)
;	../hd44780.c: 93: copyOfNumber = number;
	ldw	y, (0x0f, sp)
	ldw	(0x11, sp), y
;	../hd44780.c: 94: if( number < 0 ) {
	tnzw	y
	jrpl	00119$
;	../hd44780.c: 95: isNegative = 1;
	ld	a, #0x01
	ld	(0x08, sp), a
;	../hd44780.c: 96: number = 0 - number;
	neg	(0x10, sp)
	clr	a
	sbc	a, (0x0f, sp)
	ld	(0x0f, sp), a
;	../hd44780.c: 97: length++;
	clrw	x
	incw	x
;	../hd44780.c: 99: while(copyOfNumber != 0)
00119$:
00105$:
	ldw	y, (0x11, sp)
	jreq	00123$
;	../hd44780.c: 101: length++;
	incw	x
;	../hd44780.c: 102: copyOfNumber /= 10;
	pushw	x
	push	#0x0a
	push	#0x00
	ldw	x, (0x15, sp)
	call	__divsint
	ldw	(0x13, sp), x
	popw	x
	jra	00105$
00123$:
	ldw	(0x09, sp), x
;	../hd44780.c: 105: for(divide = 0; divide < length; divide++) {
	clrw	x
	ldw	(0x11, sp), x
00112$:
	ldw	x, (0x11, sp)
	cpw	x, (0x09, sp)
	jrsge	00108$
;	../hd44780.c: 106: modResult = number % 10;
	ldw	x, (0x0f, sp)
	pushw	x
	push	#0x0a
	push	#0x00
;	../hd44780.c: 107: number    = number / 10;
	call	__modsint
	ldw	(0x0d, sp), x
	popw	x
	push	#0x0a
	push	#0x00
	call	__divsint
	ldw	(0x0f, sp), x
;	../hd44780.c: 108: string[length - (divide + 1)] = modResult + '0';
	ld	a, (0x0a, sp)
	ld	xl, a
	ld	a, (0x12, sp)
	inc	a
	ld	(0x0e, sp), a
	ld	a, xl
	sub	a, (0x0e, sp)
	ld	(0x0e, sp), a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x0d, sp), a
	ldw	x, sp
	incw	x
	addw	x, (0x0d, sp)
	ld	a, (0x0c, sp)
	add	a, #0x30
	ld	(x), a
;	../hd44780.c: 105: for(divide = 0; divide < length; divide++) {
	ldw	x, (0x11, sp)
	incw	x
	ldw	(0x11, sp), x
	jra	00112$
00108$:
;	../hd44780.c: 110: if(isNegative) {
	tnz	(0x08, sp)
	jreq	00110$
;	../hd44780.c: 111: string[0] = '-';
	ld	a, #0x2d
	ld	(0x01, sp), a
00110$:
;	../hd44780.c: 113: string[length] = '\0';
	ldw	x, sp
	incw	x
	addw	x, (0x09, sp)
	clr	(x)
;	../hd44780.c: 115: lcd_puts(string);
	ldw	x, sp
	incw	x
	call	_lcd_puts
00114$:
;	../hd44780.c: 116: }
	addw	sp, #18
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

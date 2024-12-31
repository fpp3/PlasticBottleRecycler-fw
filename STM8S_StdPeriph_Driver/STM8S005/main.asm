;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _hr4988_setStepper
	.globl _hr4988_setStepMode
	.globl _hr4988_setSpeed
	.globl _hr4988_setSteps
	.globl _hr4988_init
	.globl __delay_ms
	.globl _lcd_puts_auto
	.globl _lcd_setpos
	.globl _lcd_puts
	.globl _lcd_send_byte
	.globl _lcd_init
	.globl _lcd_gpioinit
	.globl _GPIO_WriteReverse
	.globl _GPIO_Init
	.globl _CLK_SYSCLKConfig
	.globl _CLK_ClockSwitchConfig
	.globl _CLK_DeInit
	.globl _assert_failed
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

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
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
	int _TRAP_IRQHandler ; trap
	int _TLI_IRQHandler ; int0
	int _AWU_IRQHandler ; int1
	int _CLK_IRQHandler ; int2
	int _EXTI_PORTA_IRQHandler ; int3
	int _EXTI_PORTB_IRQHandler ; int4
	int _EXTI_PORTC_IRQHandler ; int5
	int _EXTI_PORTD_IRQHandler ; int6
	int _EXTI_PORTE_IRQHandler ; int7
	int 0x000000 ; int8
	int 0x000000 ; int9
	int _SPI_IRQHandler ; int10
	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
	int _TIM1_CAP_COM_IRQHandler ; int12
	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
	int _TIM2_CAP_COM_IRQHandler ; int14
	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
	int _TIM3_CAP_COM_IRQHandler ; int16
	int 0x000000 ; int17
	int 0x000000 ; int18
	int _I2C_IRQHandler ; int19
	int _UART2_TX_IRQHandler ; int20
	int _UART2_RX_IRQHandler ; int21
	int _ADC1_IRQHandler ; int22
	int _TIM4_UPD_OVF_IRQHandler ; int23
	int _EEPROM_EEC_IRQHandler ; int24
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	call	___sdcc_external_startup
	tnz	a
	jreq	__sdcc_init_data
	jp	__sdcc_program_startup
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	../main.c: 44: void main(void) { // NOLINT 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	../main.c: 45: CLK_DeInit();
	call	_CLK_DeInit
;	../main.c: 47: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	ld	a, #0x80
	call	_CLK_SYSCLKConfig
;	../main.c: 49: CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
	clr	a
	call	_CLK_SYSCLKConfig
;	../main.c: 51: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
	push	#0x00
	push	#0x00
	push	#0xe1
	ld	a, #0x01
	call	_CLK_ClockSwitchConfig
;	../main.c: 53: GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_SLOW);
	push	#0xc0
	ld	a, #0x20
	ldw	x, #0x5014
	call	_GPIO_Init
;	../main.c: 54: hr4988_init();
	call	_hr4988_init
;	../main.c: 55: hr4988_setSteps(40);
	ldw	x, #0x0028
	call	_hr4988_setSteps
;	../main.c: 56: hr4988_setSpeed(100);
	ldw	x, #0x0064
	call	_hr4988_setSpeed
;	../main.c: 57: hr4988_setStepper(ENABLE);
	ld	a, #0x01
	call	_hr4988_setStepper
;	../main.c: 59: _delay_ms(100);
	ldw	x, #0x0064
	call	__delay_ms
;	../main.c: 60: lcd_gpioinit();
	call	_lcd_gpioinit
;	../main.c: 61: lcd_init();
	call	_lcd_init
;	../main.c: 62: lcd_send_byte(LCD_CTL | LCD_ON | LCD_CUR_ON | LCD_CUR_BLNK, LCD_CMD);
	push	#0x00
	ld	a, #0x0f
	call	_lcd_send_byte
;	../main.c: 65: lcd_puts_auto("Hello from STM8!");
	ldw	x, #(___str_0+0)
	call	_lcd_puts_auto
;	../main.c: 66: lcd_send_byte(LCD_CTL | LCD_ON | LCD_CUR_OFF, LCD_CMD);
	push	#0x00
	ld	a, #0x0c
	call	_lcd_send_byte
;	../main.c: 68: _delay_ms(1000);
	ldw	x, #0x03e8
	call	__delay_ms
;	../main.c: 69: lcd_send_byte(LCD_CLR, LCD_CMD);
	push	#0x00
	ld	a, #0x01
	call	_lcd_send_byte
;	../main.c: 70: lcd_setpos(0,0);
	push	#0x00
	clr	a
	call	_lcd_setpos
;	../main.c: 71: lcd_puts("MODE:");
	ldw	x, #(___str_1+0)
	call	_lcd_puts
;	../main.c: 72: while (1) {
00102$:
;	../main.c: 73: lcd_setpos(1,0);
	push	#0x00
	ld	a, #0x01
	call	_lcd_setpos
;	../main.c: 74: lcd_puts("1/16 ");
	ldw	x, #(___str_2+0)
	call	_lcd_puts
;	../main.c: 75: hr4988_setStepMode(STEP_1_16);
	ld	a, #0x04
	call	_hr4988_setStepMode
;	../main.c: 76: _delay_ms(5000);
	ldw	x, #0x1388
	call	__delay_ms
;	../main.c: 77: lcd_setpos(1,0);
	push	#0x00
	ld	a, #0x01
	call	_lcd_setpos
;	../main.c: 78: lcd_puts("1/32 ");
	ldw	x, #(___str_3+0)
	call	_lcd_puts
;	../main.c: 79: hr4988_setStepMode(STEP_1_32);
	ld	a, #0x05
	call	_hr4988_setStepMode
;	../main.c: 80: _delay_ms(5000);
	ldw	x, #0x1388
	call	__delay_ms
;	../main.c: 81: lcd_setpos(1,0);
	push	#0x00
	ld	a, #0x01
	call	_lcd_setpos
;	../main.c: 82: lcd_puts("1/64 ");
	ldw	x, #(___str_4+0)
	call	_lcd_puts
;	../main.c: 83: hr4988_setStepMode(STEP_1_64);
	ld	a, #0x06
	call	_hr4988_setStepMode
;	../main.c: 84: _delay_ms(5000);
	ldw	x, #0x1388
	call	__delay_ms
;	../main.c: 85: lcd_setpos(1,0);
	push	#0x00
	ld	a, #0x01
	call	_lcd_setpos
;	../main.c: 86: lcd_puts("1/128");
	ldw	x, #(___str_5+0)
	call	_lcd_puts
;	../main.c: 87: hr4988_setStepMode(STEP_1_128);
	ld	a, #0x07
	call	_hr4988_setStepMode
;	../main.c: 88: _delay_ms(5000);
	ldw	x, #0x1388
	call	__delay_ms
;	../main.c: 89: lcd_setpos(1,0);
	push	#0x00
	ld	a, #0x01
	call	_lcd_setpos
;	../main.c: 90: lcd_puts("1/1");
	ldw	x, #(___str_6+0)
	call	_lcd_puts
;	../main.c: 91: hr4988_setStepMode(STEP_1_1);
	clr	a
	call	_hr4988_setStepMode
;	../main.c: 92: _delay_ms(5000);
	ldw	x, #0x1388
	call	__delay_ms
	jra	00102$
;	../main.c: 94: }
	ret
;	../main.c: 106: void assert_failed(u8* file, u32 line) { 
;	-----------------------------------------
;	 function assert_failed
;	-----------------------------------------
_assert_failed:
;	../main.c: 111: while (1) {
00102$:
;	../main.c: 112: GPIO_WriteReverse(GPIOE, GPIO_PIN_5);
	ld	a, #0x20
	ldw	x, #0x5014
	call	_GPIO_WriteReverse
;	../main.c: 113: _delay_ms(500);
	ldw	x, #0x01f4
	call	__delay_ms
	jra	00102$
;	../main.c: 115: }
	ldw	x, (1, sp)
	addw	sp, #6
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "Hello from STM8!"
	.db 0x00
	.area CODE
	.area CONST
___str_1:
	.ascii "MODE:"
	.db 0x00
	.area CODE
	.area CONST
___str_2:
	.ascii "1/16 "
	.db 0x00
	.area CODE
	.area CONST
___str_3:
	.ascii "1/32 "
	.db 0x00
	.area CODE
	.area CONST
___str_4:
	.ascii "1/64 "
	.db 0x00
	.area CODE
	.area CONST
___str_5:
	.ascii "1/128"
	.db 0x00
	.area CODE
	.area CONST
___str_6:
	.ascii "1/1"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

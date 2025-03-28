/*
 * HD44780 driver library for STM8 (sdcc)
 * Uses 4 bit mode
 *
 * MCU-LCD pinout (default, override with defines):
 * Px0 - RS
 * Px1 - E
 * Px2-5 - D4-D7
 * where x is defined by LCD_PORT_*, by default PORTD
 * RS, E can be freely assigned in range of the same port
 * D4-D7 must be 4 consecutive pins (D4 is LSb of all 4)
 * Redefine D4-D7 by defining D4 pin bit number
 *
 * By Chris "polprog" Lasocki
 * 2018
 */


#ifndef _HD44780_H
#define _HD44780_H

#include <stm8s.h>

/* REDEFINABLE */
/* Port register definitions */
/* Data direction register */
#ifndef LCD_PORT_DDR
#define LCD_PORT_DDR GPIOB->DDR
#endif
/* Control register 1 */
#ifndef LCD_PORT_CR1
#define LCD_PORT_CR1 GPIOB->CR1
#endif
/* Output data register */
#ifndef LCD_PORT_ODR
#define LCD_PORT_ODR GPIOB->ODR
#endif
/* Enable pin */
#ifndef LCD_PORT_E
#define LCD_PORT_E 1
#endif
/* RS pin */
#ifndef LCD_PORT_RS
#define LCD_PORT_RS 0
#endif
/* Data pin 4 (first data pin, D5 = this + 1, ...)*/
#ifndef LCD_PORT_D
#define LCD_PORT_D 2
#endif

/* NON REDEFINABLE */
/* General */
#define LCD_PORT_DATAMASK ((1<<LCD_PORT_E) | (1<<LCD_PORT_RS) | (0x0F << LCD_PORT_D))
#define LCD_CMD 0
#define LCD_DATA 1

/* Clear display */
#define LCD_CLR 0x01

/* Cursor home */
#define LCD_HOME 0x02

/* Entry mode set */
#define LCD_EMS 0x04
#define LCD_INC 0x02

/* Display ON/OFF control */
#define LCD_CTL 0x08
#define LCD_ON 0x04
#define LCD_OFF 0x00
#define LCD_CUR_ON 0x02
#define LCD_CUR_OFF 0x00
#define LCD_CUR_BLNK 0x01
#define LCD_CUR_NBLNK 0x00

/* Cursor or display shitft */

#define LCD_CURDISP 0x10
#define LCD_SHIFT_CUR 0x80
#define LCD_SHIFT 0x00
#define LCD_SHIFT_R 0x40
#define LCD_SHIFT_L 0x00

/* DDRAM set */
#define LCD_DDRAM_SET 0x80
#define LCD_LINE2 0x40

/* CGRAM set */
#define LCD_CGRAM_SET 0x40


/* 
 * Initialize the GPIO pins
 */
void lcd_gpioinit(void);

/*
 * Initialize the display to 4 bit mode */
void lcd_init(void);

/*
 * Send data or command byte
 * b - data bit
 * cmd - command (0) / data (1)
 */
void lcd_send_byte(uint8_t b, uint8_t cmd);

/* 
 * Send a null terminated string to the display
 * \n is not supported
 */
void lcd_puts(uint8_t *c);

/*
 * Set cursor position
 * l - line (0 or 1 usually)
 * c - column
 * Top left is (0, 0)
 */
void lcd_setpos(uint8_t l, uint8_t c);


/*
 * Send a null terminated string to the display with auto-wrapping
 * \n is not supportes
 */
void lcd_puts_auto(uint8_t *c);

void lcd_create_char(uint8_t location, const uint8_t *charmap);

#endif

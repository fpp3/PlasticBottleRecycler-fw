/* 
 * Based on delay.h by Oleg Terentiev 
 * Hand tuned delay functions by polprog
 */

#ifndef _DELAY_H_
#define _DELAY_H_

#include "stm8s.h"

void _delay_us(uint16_t microseconds);
void _delay_ms(uint16_t miliseconds);

#endif


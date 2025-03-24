#ifndef _HOTEND_H
#define _HOTEND_H

#include "stm8s_conf.h"
#include "stm8s_it.h"
#include "FastPID.h"
#include <math.h>

void hotend_init(void);
void hotend_setTemp(int16_t temp);
void hotend_off(void);
uint16_t hotend_getTemp(void);
void hotend_setFanSpeed(uint8_t percent);
#endif

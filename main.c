/**
  ******************************************************************************
  * @file    Project/main.c 
  * @author  MCD Application Team
  * @version V2.2.0
  * @date    30-September-2014
  * @brief   Main program body
   ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */ 


/* Includes ------------------------------------------------------------------*/
#include <stdlib.h>
#include <stdio.h>
#include "stm8s_conf.h"
#include "stm8s_it.h"    /* SDCC patch: required by SDCC for interrupts */
#include "hd44780.h"
#include "delay.h"
#include "hr4988.h"
#include "hotend.h"

/* Private defines -----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

#define BTN_PLUS GPIO_PIN_7
#define BTN_MINUS GPIO_PIN_5
#define BTN_OK GPIO_PIN_6
#define BTN_GPIO GPIOD

#define TEMP_UPPER_LIMIT 260
#define TEMP_LOWER_LIMIT 100
#define STEPPER_UPPER_LIMIT 1750
#define STEPPER_LOWER_LIMIT 10

#define EEPROM_BASE 0x4000
#define EEPROM_TEMP_H 0
#define EEPROM_TEMP_L 1
#define EEPROM_SPEED_H 2
#define EEPROM_SPEED_L 3

typedef union REGISTER {
  uint8_t REG;
  struct {
    unsigned : 2;
    unsigned minus : 1;
    unsigned ok : 1;
    unsigned plus : 1;
    unsigned minusp : 1;
    unsigned okp : 1;
    unsigned plusp : 1;
  }bits;
}btnReg_t;

const char *menues[] = {"Temperatura", "Velocidad", "Iniciar", "Informacion", "Des/Act Stepper", "Velocidad", "Detener"};
const uint8_t char_arrUp[] = {0x04, 0x0E, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00};
const uint8_t char_arrUpNDown[] = {0x04, 0x0E, 0x1F, 0x00, 0x00, 0x1F, 0x0E, 0x04};
const uint8_t char_arrDown[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x0E, 0x04};

void main(void) { // NOLINT 
  CLK_DeInit();
  /* Configure the Fcpu to DIV1*/
  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
  /* Configure the HSI prescaler to the optimal value */
  CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
  /* Configure the system clock to use HSI clock source and to run at 16Mhz */
  CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
  GPIO_DeInit(GPIOA);
  GPIO_DeInit(GPIOB);
  GPIO_DeInit(GPIOC);
  GPIO_DeInit(GPIOD);
  GPIO_DeInit(GPIOE);
  GPIO_DeInit(GPIOF);
  GPIO_DeInit(GPIOG);

  lcd_gpioinit();
  lcd_init();
  lcd_send_byte(LCD_CTL | LCD_ON | LCD_CUR_OFF | LCD_CUR_NBLNK, LCD_CMD);
  lcd_create_char(1, char_arrUp);
  lcd_create_char(2, char_arrUpNDown);
  lcd_create_char(3, char_arrDown);
  lcd_setpos(0,0);
  lcd_puts_auto("Bottle Recycler");
  
  FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);

  hr4988_init();
  hr4988_setSteps(200);
  hr4988_setSpeed(0);
  hr4988_setStepper(DISABLE);

  hotend_init();

  GPIO_Init(BTN_GPIO, BTN_MINUS | BTN_OK | BTN_PLUS, GPIO_MODE_IN_FL_NO_IT);

  _delay_ms(1500);
  char buff[17];
  uint8_t menuPos = 0, fastCount = 0;
  bool selected = 0, minPress = 0, plsPress = 0, okPress = 0, running = 0, stepper = 0;
  volatile bool minus = 0, minusp = 0, plus = 0, plusp = 0, ok = 0, okp = 0;
  uint16_t setTemp = FLASH_ReadByte(EEPROM_BASE | EEPROM_TEMP_H) | FLASH_ReadByte(EEPROM_BASE | EEPROM_TEMP_L);
  uint16_t setSpeed = FLASH_ReadByte(EEPROM_BASE | EEPROM_SPEED_H) | FLASH_ReadByte(EEPROM_BASE | EEPROM_SPEED_L);
  lcd_send_byte(LCD_CLR, LCD_CMD);
  while (1) {
    minus = GPIO_ReadInputPin(BTN_GPIO, BTN_MINUS);
    plus = GPIO_ReadInputPin(BTN_GPIO, BTN_PLUS);
    ok = GPIO_ReadInputPin(BTN_GPIO, BTN_OK);
    if (minus == 1 && minusp == 0){
      if (selected) {
        minPress = 1;
      } else {
        if ((menuPos > 0 && !running) || (menuPos > 3 && running))
          menuPos--;
      }
    }
    if (plus == 1 && plusp == 0) {
      if (selected){
        plsPress = 1;
      } else {
        if ((menuPos < 3 && !running) || (menuPos < 6 && running))
        menuPos++;
      }
    }
    if (ok == 1 && okp == 0){
      if (selected)
        okPress = 1;
      else
        selected = 1;
    }

    if (selected){
      if (minus == 1 && minusp == 1){
        fastCount++;
        if (fastCount >= 10)
          minPress = 1;
      }
      if (minus == 0 && minusp == 1)
        fastCount = 0;
      if (plus == 1 && plusp == 1){
        fastCount++;
        if (fastCount >= 10)
          plsPress = 1;
      }
      if (plus == 0 && plusp == 1)
        fastCount = 0;
      switch (menuPos) {
        case 0:
          sprintf(buff, "Temp: %3d%cC    %c", setTemp, 210, (setTemp < TEMP_UPPER_LIMIT && setTemp > TEMP_LOWER_LIMIT) ? 2 : (setTemp == TEMP_UPPER_LIMIT ? 3 : 1));
          if (minPress) {
            if (setTemp > TEMP_LOWER_LIMIT)
              setTemp--;
            minPress = 0;
          }
          if (plsPress) {
            if (setTemp < TEMP_UPPER_LIMIT)
              setTemp++;
            plsPress = 0;
          }
          break;
        case 5:
        case 1:
          sprintf(buff, "Veloc: %-4dRPM %c", setSpeed, (setSpeed < STEPPER_UPPER_LIMIT && setSpeed > STEPPER_LOWER_LIMIT) ? 2 : (setSpeed == STEPPER_UPPER_LIMIT ? 3 : 1));
          if (minPress) {
            if (setSpeed > STEPPER_LOWER_LIMIT)
              setSpeed -= 10;
            minPress = 0;
            hr4988_setSpeed(setSpeed);
          }
          if (plsPress) {
            if (setSpeed < STEPPER_UPPER_LIMIT)
              setSpeed += 10;
            plsPress = 0;
            hr4988_setSpeed(setSpeed);
          }
          break;
        case 2:
          running = 1;
          selected = 0;
          menuPos = 3;
          hotend_setTemp(setTemp);
          hotend_setFanSpeed(50);
          hr4988_setSpeed(setSpeed);
          break;
        case 3:
          sprintf(buff, "Temp:      %-3d%cC", hotend_getTemp(), 210);
          break;
        case 4:
          stepper = !stepper;
          selected = 0;
          hr4988_setStepper((FunctionalState)stepper);
          break;
        case 6:
          running = 0;
          selected = 0;
          menuPos = 2;
          hotend_off();
          hr4988_setStepper(DISABLE);
          break;
      }
      if (okPress){
        okPress = 0;
        if (menuPos == 5 || menuPos == 1){
          FLASH_Unlock(FLASH_MEMTYPE_DATA);
          FLASH_ProgramByte(EEPROM_BASE | EEPROM_SPEED_H, setSpeed >> 8);
          FLASH_ProgramByte(EEPROM_BASE | EEPROM_SPEED_L, setSpeed & 0xFF);
          FLASH_Lock(FLASH_MEMTYPE_DATA);
        }
        if (menuPos == 0){
          FLASH_Unlock(FLASH_MEMTYPE_DATA);
          FLASH_ProgramByte(EEPROM_BASE | EEPROM_TEMP_H, setTemp >> 8);
          FLASH_ProgramByte(EEPROM_BASE | EEPROM_TEMP_L, setTemp & 0xFF);
          FLASH_Lock(FLASH_MEMTYPE_DATA);
        }


        selected = 0;
      }
    } else {
      if (running){
        sprintf(buff, "%-15.15s%c", menues[menuPos], menuPos == 3 ? 3 : (menuPos == 6 ? 1 : 2));
      } else {
        sprintf(buff, "%-15.15s%c", menues[menuPos], menuPos == 0 ? 3 : (menuPos == 3 ? 1 : 2));
      }
    }
    if (!running){
      if (hotend_getTemp() > 40)
        hotend_setFanSpeed(100);
      else
        hotend_setFanSpeed(0);
    }
    lcd_setpos(0,0);
    lcd_puts_auto(buff);
    //buttonStates.REG >>= 3;
    minusp = minus;
    plusp = plus;
    okp = ok;
  }
}



#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line) { 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  uint8_t *tmp;
  uint8_t buff[16];
  while (1){
    uint8_t eol = 0;
    tmp = file;
    while (!eol){
      for (uint8_t i = 0; i < 16; i++){
        if (tmp[i]) {
          buff[i] = tmp[i];
        } else {
          eol = 1;
          buff[i] = 0;
          break;
        }
      }
      lcd_send_byte(LCD_CLR, LCD_CMD);
      lcd_setpos(0,0);
      lcd_puts_auto(buff);
      _delay_ms(1500);
      tmp++;
    }
    sprintf(buff, "line: %04d", line);
    lcd_send_byte(LCD_CLR, LCD_CMD);
    lcd_setpos(0,0);
    lcd_puts_auto(buff);

    _delay_ms(5000);
  }
}
#endif

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/

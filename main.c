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

#define CHAR_ARROW_UP 1
#define CHAR_ARROW_UPNDOWN 2
#define CHAR_ARROW_DOWN 3

#define TEMP_UPPER_LIMIT 260
#define TEMP_LOWER_LIMIT 100
#define STEPPER_UPPER_LIMIT 1750
#define STEPPER_LOWER_LIMIT 1

#define EEPROM_BASE 0x4000
#define EEPROM_TEMP 0
#define EEPROM_SPEED 2
#define EEPROM_USTEPPING 4
#define EEPROM_ROTATION 8

const char back[] = "Volver";
const char *submenu0_0[] = {"Iniciar", NULL};
const char *submenu0_1[] = {"Hotend", "Temperatura", back, NULL};
const char *submenu0_2[] = {"Stepper", "Velocidad", "Microstepping", "Direccion", back, NULL};
const char *submenu1_0[] = {"Detener", NULL};
const char *submenu1_1[] = {"Informacion", NULL};
const char *submenu1_3[] = {"Stepper", "Velocidad", "Microstepping", "Direccion", "Act/Des Stepper", back, NULL};

const char **menu0[] = {submenu0_0, submenu0_1, submenu0_2, NULL}; // First item of EVERY menu is going to work as a "button". No sub-menues there
const char **menu1[] = {submenu1_0, submenu1_1, submenu0_1, submenu1_3, NULL}; // Repeating submenues is possible by repeating them in their respective menu

const char ***menu[] = {menu0, menu1, NULL};

const char *uSteps_numMask[] = {"1:1", "1:2", "1:4", "1:8", "1:16"};
const char *dir_numMask[] = {"A", "B"};

const uint8_t char_arrUp[] = {0x04, 0x0E, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00};
const uint8_t char_arrUpNDown[] = {0x04, 0x0E, 0x1F, 0x00, 0x00, 0x1F, 0x0E, 0x04};
const uint8_t char_arrDown[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x0E, 0x04};

int8_t button_getEdge(volatile bool newState, volatile bool *currentState, volatile bool *previousState, volatile uint8_t *holdCount);
size_t count_items(const char **submenu);
size_t count_submenus(const char ***menu_level);
bool menu_value_selector(char *buffer, const char *string, const char *unit, const uint16_t lowerLimit, const uint16_t upperLimit, const char *numMask[], uint16_t *variable, volatile int8_t *minusEdge, volatile int8_t *plusEdge, volatile int8_t *okEdge);
void save_to_EEPROM(void *value, uint8_t size, uint8_t address);
void submenu_hotend(char *buff, uint8_t *currPos, uint8_t *currSubMenu, bool *selected, uint16_t *setTemp, volatile int8_t *minusEdge, volatile int8_t *plusEdge, volatile int8_t *okEdge, bool running);
void submenu_stepper(char *buff, uint8_t *currPos, uint8_t *currSubMenu, bool *selected, uint16_t *setSpeed, uint16_t *uStepping, uint16_t *rotation, bool *stepper, volatile int8_t *minusEdge, volatile int8_t *plusEdge, volatile int8_t *okEdge, bool running);

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
  lcd_create_char(CHAR_ARROW_UP, char_arrUp);
  lcd_create_char(CHAR_ARROW_UPNDOWN, char_arrUpNDown);
  lcd_create_char(CHAR_ARROW_DOWN, char_arrDown);
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
  char buff[17], arrow = 0;
  uint8_t currPos = 0, currMenu = 0, currSubMenu = 0, maxPos = 0, inacTime = 0;
  bool selected = 0, stepper = 0;
  volatile bool minus = 0, minusp = 0, plus = 0, plusp = 0, ok = 0, okp = 0;
  volatile int8_t minusEdge = 0,  plusEdge = 0, okEdge = 0;
  volatile uint8_t minusHold = 0, plusHold = 0, okHold = 0;
  uint16_t setTemp = FLASH_ReadByte(EEPROM_BASE + EEPROM_TEMP) << 8 | FLASH_ReadByte(EEPROM_BASE + EEPROM_TEMP + 1);
  uint16_t setSpeed = FLASH_ReadByte(EEPROM_BASE + EEPROM_SPEED) << 8 | FLASH_ReadByte(EEPROM_BASE + EEPROM_SPEED + 1);
  uint16_t uStepping = FLASH_ReadByte(EEPROM_BASE + EEPROM_USTEPPING) << 8 | FLASH_ReadByte(EEPROM_BASE + EEPROM_USTEPPING + 1);
  uint16_t rotation = FLASH_ReadByte(EEPROM_BASE + EEPROM_ROTATION) << 8 | FLASH_ReadByte(EEPROM_BASE + EEPROM_ROTATION + 1);
  lcd_send_byte(LCD_CLR, LCD_CMD);
  while (1) {
    minusEdge = button_getEdge(GPIO_ReadInputPin(BTN_GPIO, BTN_MINUS), &minus, &minusp, &minusHold);
    plusEdge = button_getEdge(GPIO_ReadInputPin(BTN_GPIO, BTN_PLUS), &plus, &plusp, &plusHold);
    okEdge = button_getEdge(GPIO_ReadInputPin(BTN_GPIO, BTN_OK), &ok, &okp, &okHold);

    if (selected == 0) {
      if (currMenu == 1)
        inacTime++;
      else
        inacTime = 0;

      if (inacTime < 200) {
        if (minusEdge == 1)
          if (currPos > 0)
            currPos--;
        if (plusEdge == 1)
          if (currPos < maxPos)
            currPos++;
        if (okEdge == 1) {
          if (currPos == 0 || (currPos == 1 && currMenu == 1)) {
            // Action occurs (start/stop)
            selected = 1;
          }
          if (currSubMenu == 0) {
            currSubMenu = currPos;
            currPos = 0;
          } else {
            // Action occurs again (set speed/temp/ustep/pid)
            selected = 1;
          }
        }
        if (currSubMenu == 0) {
          maxPos = count_submenus(menu[currMenu]) - 1;
          if (currPos == 0)
            arrow = CHAR_ARROW_DOWN;
          else if (currPos == maxPos)
            arrow = CHAR_ARROW_UP;
          else
            arrow = CHAR_ARROW_UPNDOWN;

          sprintf(buff, "%-15.15s%c", menu[currMenu][currPos][0], arrow);
        } else {
          maxPos = count_items(menu[currMenu][currSubMenu]) - 2;
          if (currPos == 0)
            arrow = CHAR_ARROW_DOWN;
          else if (currPos == maxPos)
            arrow = CHAR_ARROW_UP;
          else
            arrow = CHAR_ARROW_UPNDOWN;

          sprintf(buff, "%-15.15s%c", menu[currMenu][currSubMenu][currPos + 1], arrow);
        }
      } else {
        inacTime = 200;
        sprintf(buff, " %-3.3u\322C  %4.4uRPM ", hotend_getTemp(), hr4988_getSpeed());
      }
      if (okEdge == 1 || minusEdge == 1 || plusEdge == 1)
        inacTime = 0;
    } else {
      switch (currMenu) {
        case 0:
          switch (currSubMenu){
            case 0:
              hotend_setTemp(setTemp);
              hr4988_setSpeed(setSpeed);
              hr4988_setStepMode((stepMode_t)(uStepping > 3 ? 7 : uStepping));
              hr4988_setRotation((rotation_t)rotation);
              currMenu = 1;
              selected = 0;
              break;
            case 1:
              submenu_hotend(buff, &currPos, &currSubMenu, &selected, &setTemp, &minusEdge, &plusEdge, &okEdge, 0);
              break;
            case 2:
              submenu_stepper(buff, &currPos, &currSubMenu, &selected, &setSpeed, &uStepping, &rotation, &stepper, &minusEdge, &plusEdge, &okEdge, 0);
              break;
          }
          break;
        case 1:
          switch (currSubMenu){
            case 0:
              hotend_off();
              hr4988_setStepper(DISABLE);
              currMenu = 0;
              selected = 0;
              break;
            case 1:
              selected = 0;
              currPos = currSubMenu;
              currSubMenu = 0;
              inacTime = 200;
              break;
            case 2:
              submenu_hotend(buff, &currPos, &currSubMenu, &selected, &setTemp, &minusEdge, &plusEdge, &okEdge, 1);
              break;
            case 3:
              submenu_stepper(buff, &currPos, &currSubMenu, &selected, &setSpeed, &uStepping, &rotation, &stepper, &minusEdge, &plusEdge, &okEdge, 1);
              break;
          }

          break;
      }
    }

    lcd_setpos(0,0);
    lcd_puts_auto(buff);
  }
}

int8_t button_getEdge(volatile bool newState, volatile bool *currentState, volatile bool *previousState, volatile uint8_t *holdCount) {
  int8_t edge = 0;
  *currentState = newState;
  if (*holdCount < 10){
    if (*currentState == 1 && *previousState == 0)
      edge = 1;
    else if(*currentState == 1 && *previousState == 1)
      (*holdCount)++;
    else if(*currentState == 0 && *previousState == 1)
      edge = -1;
  } else {
    if (*holdCount > 48) {
      edge = 3;
    } else {
      edge = 2;
      (*holdCount)++;
    }
    if(*currentState == 0 && *previousState == 1)
      *holdCount = 0;
  }
  *previousState = *currentState;
  return edge;
}

size_t count_items(const char **submenu) {
    size_t count = 0;
    while (submenu[count] != NULL) {
        count++;
    }
    return count;
}

size_t count_submenus(const char ***menu_level) {
    size_t count = 0;
    while (menu_level[count] != NULL) {
        count++;
    }
    return count;
}

bool menu_value_selector(char *buffer, const char *string, const char *unit, const uint16_t lowerLimit, const uint16_t upperLimit, const char *numMask[], uint16_t *variable, volatile int8_t *minusEdge, volatile int8_t *plusEdge, volatile int8_t *okEdge) {
  char arrow = 0;
  if (*minusEdge > 0) {
    if (*variable > lowerLimit) {
      if (*minusEdge < 3)
        (*variable)--;
      else
        if ((*variable - 10) > lowerLimit)
          (*variable) -= 10;
    }
  }
  if (*plusEdge > 0) {
    if (*variable < upperLimit) {
      if (*plusEdge < 3)
        (*variable)++;
      else
        if ((*variable + 10) < upperLimit)
          (*variable) += 10;
    }
  }
  if (*okEdge == 1)
    return 0;
  if (*minusEdge == 1 && *plusEdge == 1)
    *variable = lowerLimit;

  if (*variable == upperLimit)
    arrow = CHAR_ARROW_DOWN;
  else if (*variable == lowerLimit)
    arrow = CHAR_ARROW_UP;
  else
    arrow = CHAR_ARROW_UPNDOWN;
  if (numMask == NULL)
    sprintf(buffer, "%-7.7s %4.4u%-3.3s%c", string, *variable, unit, arrow);
  else
    sprintf(buffer, "%-9.9s %5.5s%c", string, numMask[*variable], arrow);
  return 1;
}

void save_to_EEPROM(void *value, uint8_t size, uint8_t address) {
  FLASH_Unlock(FLASH_MEMTYPE_DATA);
  uint8_t *bytePtr = (uint8_t *) value;
  for (uint8_t i = 0; i < size; i++)
    FLASH_ProgramByte(EEPROM_BASE + address + i, bytePtr[i]);
  FLASH_Lock(FLASH_MEMTYPE_DATA);
}

void submenu_hotend(char *buff, uint8_t *currPos, uint8_t *currSubMenu, bool *selected, uint16_t *setTemp, volatile int8_t *minusEdge, volatile int8_t *plusEdge, volatile int8_t *okEdge, bool running) {
  switch (*currPos + 1) {
    case 1:
      *selected = menu_value_selector(buff, "Temp.:", "\322C", TEMP_LOWER_LIMIT, TEMP_UPPER_LIMIT, NULL, setTemp, minusEdge, plusEdge, okEdge);
      break;
    case 2:
      //go back
      *selected = 0;
      *currPos = *currSubMenu;
      *currSubMenu = 0;
      save_to_EEPROM(setTemp, sizeof(*setTemp), EEPROM_TEMP);
      if (running)
        hotend_setTemp(*setTemp);
      break;
  }
}

void submenu_stepper(char *buff, uint8_t *currPos, uint8_t *currSubMenu, bool *selected, uint16_t *setSpeed, uint16_t *uStepping, uint16_t *rotation, bool *stepper, volatile int8_t *minusEdge, volatile int8_t *plusEdge, volatile int8_t *okEdge, bool running) {
  switch (*currPos + 1) {
    case 1:
      *selected = menu_value_selector(buff, "Veloc.:", "RPM", STEPPER_LOWER_LIMIT, STEPPER_UPPER_LIMIT, NULL, setSpeed, minusEdge, plusEdge, okEdge);
      if (*selected == 0)
        save_to_EEPROM(setSpeed, sizeof(*setSpeed), EEPROM_SPEED);
      if (running)
        hr4988_setSpeed(*setSpeed);
      break;
    case 2:
      *selected = menu_value_selector(buff, "\371Stepping:", NULL, 0, 4, uSteps_numMask, uStepping, minusEdge, plusEdge, okEdge);
      if (*selected == 0)
        save_to_EEPROM(uStepping, sizeof(*uStepping), EEPROM_USTEPPING);
      if (running)
        hr4988_setStepMode((stepMode_t)(*uStepping > 3 ? 7 : *uStepping));
      break;
    case 3:
      *selected = menu_value_selector(buff, "Direccion:", NULL, 0, 1, dir_numMask, rotation, minusEdge, plusEdge, okEdge);
      if (*selected == 0)
        save_to_EEPROM(rotation, sizeof(*rotation), EEPROM_ROTATION);
      if (running)
        hr4988_setRotation((rotation_t)*rotation);
      break;
    case 4:
      if (running) {
        *stepper = !(*stepper);
        hr4988_setStepper((FunctionalState)(*stepper));
        *selected = 0;
        break;
      }
      //break;  // <------ CAREFUL ------ this is so i dont need to make two switches depending on the state of 'running' in order to have always the "back" at the end of the list
    case 5:
      //go back
      *selected = 0;
      *currPos = *currSubMenu;
      *currSubMenu = 0;
      break;
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
  char buff[16];
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
    sprintf(buff, "line: %04lu", line);
    lcd_send_byte(LCD_CLR, LCD_CMD);
    lcd_setpos(0,0);
    lcd_puts_auto(buff);

    _delay_ms(5000);
  }
}
#endif

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/

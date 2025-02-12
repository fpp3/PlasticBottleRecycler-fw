#ifndef _HR4988_H_
#define _HR4988_H_
#include "stm8s_conf.h"
#include "stm8s_it.h"

#define STEPPER_MS1 GPIO_PIN_2
#define STEPPER_MS1_PINN 2
#define STEPPER_MS2 GPIO_PIN_3
#define STEPPER_MS2_PINN 3
#define STEPPER_MS3 GPIO_PIN_5
#define STEPPER_MS3_PINN 5
#define STEPPER_SLP GPIO_PIN_6
#define STEPPER_STP GPIO_PIN_4
#define STEPPER_DIR GPIO_PIN_7
#define STEPPER_ENA GPIO_PIN_1
#define STEPPER_GPIO GPIOC

typedef enum {
  CLKWISE = (bool) 0,
  C_CLkWISE = (bool) 1
} rotation_t;

typedef enum {
  STEP_1_1 = 0,
  STEP_1_2 = 1,
  STEP_1_4 = 2,
  STEP_1_8 = 3,
  STEP_1_16 = 7,
} stepMode_t;

// public functions
void hr4988_init(void);
void hr4988_setSteps(uint16_t steps);
void hr4988_setSpeed(uint16_t rpm);
void hr4988_setRotation(rotation_t rot);
void hr4988_setStepMode(stepMode_t mode);
void hr4988_setStepper(FunctionalState state);

#endif

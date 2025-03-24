#include "hr4988.h"
#include "stm8s_gpio.h"

// private function declarations
static void TIM1_PWM_Init(uint16_t frequency);
static void TIM1_SetFrequency(uint16_t frequency);
static void stepperService(void);
static void TIM2_INT_Init(void);
static void setSpeed(uint16_t speed);
static void changeRotation(void);

// private variables
static volatile uint16_t currentSpeed;
static volatile bool rotationChange;
static FunctionalState stepperState;
static rotation_t rotation;
static stepMode_t stepMode = STEP_1_1;
static uint16_t desiredSpeed, stepsPerRevolution = 50;

// ----- public function definitions -----
void hr4988_init(void) {
  GPIO_Init(STEPPER_GPIO,
            STEPPER_MS1 | STEPPER_MS2 | STEPPER_MS3 | STEPPER_ENA | STEPPER_DIR | STEPPER_SLP | STEPPER_STP,
            GPIO_MODE_OUT_PP_LOW_FAST);
  GPIO_WriteLow(STEPPER_GPIO, STEPPER_MS1 | STEPPER_MS2 | STEPPER_MS3);
  GPIO_WriteHigh(STEPPER_GPIO, STEPPER_SLP | STEPPER_ENA);

  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
  TIM1_PWM_Init(0);
  TIM2_INT_Init();
}

void hr4988_setSpeed(uint16_t rpm) { desiredSpeed = rpm; }

void hr4988_setSteps(uint16_t steps) { stepsPerRevolution = steps; }

void hr4988_setRotation(rotation_t rot) {
  if (rot != rotation) {
    rotation = rot;
    rotationChange = 1;
  }
}

void hr4988_setStepMode(stepMode_t mode) {
  stepMode = mode;
  GPIO_Write(STEPPER_GPIO, GPIO_ReadOutputData(STEPPER_GPIO) & ~(STEPPER_MS1 | STEPPER_MS2 | STEPPER_MS3) |
                               ((stepMode >> 2) & 0x01) << STEPPER_MS3_PINN |
                               ((stepMode >> 1) & 0x01) << STEPPER_MS2_PINN | ((stepMode) & 0x01) << STEPPER_MS1_PINN);
  setSpeed(currentSpeed);
}

void hr4988_setStepper(FunctionalState state) {
  if (state) {
    GPIO_WriteLow(STEPPER_GPIO, STEPPER_ENA);
  } else {
    GPIO_WriteHigh(STEPPER_GPIO, STEPPER_ENA);
  }
  currentSpeed = 0;
  TIM1_CtrlPWMOutputs(state);
  stepperState = state;
}

uint16_t hr4988_getSpeed(void) { return currentSpeed; }

// ------ private function definitions ------
void TIM2_INT_Init(void) {
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
  TIM2_TimeBaseInit(TIM2_PRESCALER_1, 799);

  TIM2_InterruptCallback = stepperService;
  TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
  TIM2_Cmd(ENABLE);
  enableInterrupts();
}

void TIM1_PWM_Init(uint16_t frequency) {
  uint16_t prescaler = (F_CPU / frequency) / 65536;
  uint16_t arr = (F_CPU / (frequency * (prescaler + 1))) - 1;

  TIM1_TimeBaseInit(prescaler, TIM1_COUNTERMODE_UP, arr, 0);
  TIM1_OC4Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, (arr + 1) / 2, TIM1_OCPOLARITY_HIGH, TIM1_OCIDLESTATE_RESET);

  TIM1_OC4PreloadConfig(ENABLE);
  TIM1_ARRPreloadConfig(ENABLE);
  TIM1_Cmd(ENABLE);
}

void TIM1_SetFrequency(uint16_t frequency) {
  uint16_t prescaler = (F_CPU / frequency) / 65536;
  uint16_t arr = (F_CPU / (frequency * (prescaler + 1))) - 1;

  TIM1_TimeBaseInit(prescaler, TIM1_COUNTERMODE_UP, arr, 0);
  TIM1_SetCompare4((arr + 1) / 2);
}

void stepperService(void) {
  static uint32_t update = 0;

  if (update >= 1000) {

    if (rotationChange)
      changeRotation();

    if (currentSpeed != desiredSpeed) {
      if (currentSpeed < desiredSpeed)
        currentSpeed++;
      else if (currentSpeed > desiredSpeed)
        currentSpeed--;
      setSpeed(currentSpeed);
    }

    update = 0;
  }
  if (stepperState)
    update += 50;
}

void changeRotation(void) {
  static bool deaccelPasses = 0;
  if (deaccelPasses | !stepperState) {
    if (rotation == CLKWISE)
      GPIO_WriteLow(STEPPER_GPIO, STEPPER_DIR);
    else
      GPIO_WriteHigh(STEPPER_GPIO, STEPPER_DIR);
    rotationChange = 0;
    deaccelPasses = 0;
  } else {
    if (currentSpeed >= 5)
      currentSpeed -= 3;
    else
      deaccelPasses = 1;
  }
}

void setSpeed(uint16_t speed) {
  TIM1_SetFrequency(
      (((uint32_t)((uint32_t)speed * stepsPerRevolution * (1 << (stepMode > 3 ? 4 : stepMode))) * 1092) >> 16));
}

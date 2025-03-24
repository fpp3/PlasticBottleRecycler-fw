#include "hotend.h"
#include "stm8s.h"

// private variables
static FastPID tune;

static const int16_t NTC_table[129] = {
    556, 469, 382, 340, 313, 294, 279, 267, 256, 247, 240, 233, 227, 221, 216, 212, 207, 203, 199, 196, 192, 189,
    186, 183, 181, 178, 176, 173, 171, 169, 166, 164, 162, 160, 158, 157, 155, 153, 151, 150, 148, 146, 145, 143,
    142, 140, 139, 137, 136, 134, 133, 132, 130, 129, 128, 126, 125, 124, 123, 121, 120, 119, 118, 116, 115, 114,
    113, 112, 111, 109, 108, 107, 106, 105, 104, 102, 101, 100, 99,  98,  97,  96,  94,  93,  92,  91,  90,  89,
    87,  86,  85,  84,  82,  81,  80,  79,  77,  76,  75,  73,  72,  71,  69,  68,  66,  65,  63,  62,  60,  58,
    57,  55,  53,  51,  49,  47,  44,  42,  39,  37,  34,  30,  27,  22,  17,  11,  3,   -10, -23};
static volatile uint16_t curr_adc;
static int16_t curr_pw;
static uint16_t set_temp;
// private functions
static uint16_t NTC_ADC2Temperature(void);
static void hotend_update(void);

void hotend_init(void) {
  GPIO_Init(GPIOF, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
  ADC1_DeInit();
  ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_12, ADC1_PRESSEL_FCPU_D18, ADC1_EXTTRIG_TIM, DISABLE,
            ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL12, ENABLE);
  ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
  adcValue = &curr_adc;
  ADC1_Cmd(ENABLE);

  GPIO_Init(GPIOD, GPIO_PIN_3 | GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);

  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
  TIM2_TimeBaseInit(TIM2_PRESCALER_1, 799);

  TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_HIGH);
  TIM2_OC2PreloadConfig(ENABLE);
  TIM2_ITConfig(TIM2_IT_CC2, ENABLE);

  TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_HIGH);
  TIM2_OC1PreloadConfig(ENABLE);

  TIM2_Cmd(ENABLE);
  enableInterrupts();
}

void hotend_setTemp(int16_t temp) {
  set_temp = temp;
  pid_configure(&tune, 45, 7, 0, 1000, 10, false);
  pid_set_limits(&tune, 0, 799);
  TIM2_OCC2_InterruptCallback = hotend_update;
}

void hotend_off(void) {
  TIM2_OCC2_InterruptCallback = 0;
  curr_pw = 0;
  TIM2_SetCompare2(0);
}

uint16_t hotend_getTemp(void) { return NTC_ADC2Temperature(); }

void hotend_setFanSpeed(uint8_t percent) { TIM2_SetCompare1((percent * 799L) / 100); }

// private function definition

uint16_t NTC_ADC2Temperature(void) {
  uint16_t p1, p2;
  /* Estimate the interpolating point before and after the ADC value. */
  p1 = NTC_table[(curr_adc >> 3)];
  p2 = NTC_table[(curr_adc >> 3) + 1];

  /* Interpolate between both points. */
  return p1 - ((p1 - p2) * (curr_adc & 0x0007)) / 8;
}

void hotend_update(void) {
  curr_pw = pid_step(&tune, set_temp, NTC_ADC2Temperature());
  TIM2_SetCompare2((uint16_t)curr_pw);
}

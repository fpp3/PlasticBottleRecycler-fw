#include "buzzer.h"

static void TIM3_PWM_init(void);
static void TIM3_SetPWM(uint16_t frequency, uint8_t width);
static void buzzer_service_single(void);
static void buzzer_service_multi(void);

static volatile uint32_t _cycles, _currentCycles;
static volatile buzzerTone_s *_currentMelody;
static volatile uint8_t _melodyRepetitions, _currentMelodyRepetitions;
static volatile uint16_t _melodyDelay;
static volatile bool _busy;

void buzzer_init(void) {
  GPIO_Init(BUZZER_GPIO, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

  TIM3_PWM_init();
}

void buzzer_tone(uint16_t period, uint16_t frequency, uint8_t volume) {
  if (volume <= 100 && frequency <= 20000) {
    TIM3_SetPWM(frequency, volume);
    if (period != 0) {
      _cycles = ((uint32_t)period * 1000) / (float)(((F_CPU / (frequency * (TIM3_PRESCALER_16 + 1)))) - 1);
      TIM3_OCC1_InterruptCallback = buzzer_service_single;
    }
    _busy = TRUE;
  }
}

void buzzer_melody(buzzerTone_s *melody, uint8_t repetitions, uint16_t delay) {
  _currentMelody = melody;
  _melodyRepetitions = repetitions;
  _melodyDelay = delay;
  TIM3_OCC1_InterruptCallback = buzzer_service_multi;
  _busy = TRUE;
}

bool buzzer_ready(void) { return _busy; }

void buzzer_stop(void) {
  TIM3_OCC1_InterruptCallback = 0;
  _cycles = 0;
  _currentCycles = 0;
  _melodyDelay = 0;
  _melodyRepetitions = 0;
  _currentMelodyRepetitions = 0;
  _currentMelody = 0;
  TIM3_SetPWM(0, 0);
  _busy = FALSE;
}

void TIM3_PWM_init(void) {
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);
  TIM3_TimeBaseInit(TIM3_PRESCALER_16, 50000);
  TIM3_OC1Init(TIM3_OCMODE_PWM1, TIM3_OUTPUTSTATE_ENABLE, 0, TIM3_OCPOLARITY_HIGH);
  TIM3_OC1PreloadConfig(ENABLE);
  TIM3_ARRPreloadConfig(ENABLE);
  TIM3_ITConfig(TIM3_IT_CC1, ENABLE);
  TIM3_Cmd(ENABLE);
  enableInterrupts();
}

void TIM3_SetPWM(uint16_t frequency, uint8_t width) {
  uint16_t arr = (F_CPU / (frequency * (TIM3_PRESCALER_16 + 1))) - 1;

  TIM3_SetAutoreload(arr);
  TIM3_SetCompare1(width * ((arr + 1) / 255));
}

void buzzer_service_single(void) {
  if (_currentCycles >= _cycles) {
    TIM3_OCC1_InterruptCallback = 0;
    _cycles = 0;
    _currentCycles = 0;
    TIM3_SetPWM(0, 0);
    _busy = FALSE;
  } else {
    _currentCycles++;
  }
}

void buzzer_service_multi(void) {
  static bool done = TRUE;
  static uint8_t count = 0;
  if (done == TRUE) {
    if ((_currentMelody + count)->frequency != 0) {
      TIM3_SetPWM((_currentMelody + count)->frequency, (_currentMelody + count)->volume);
      _cycles = ((uint32_t)(_currentMelody + count)->period * 1000) /
                (float)(((F_CPU / ((_currentMelody + count)->frequency * (TIM3_PRESCALER_16 + 1)))) - 1);
      count++;
      done = FALSE;
    } else {
      if (_currentMelodyRepetitions >= _melodyRepetitions) {
        TIM3_OCC1_InterruptCallback = 0;
        _cycles = 0;
        _currentCycles = 0;
        _melodyDelay = 0;
        _melodyRepetitions = 0;
        _currentMelodyRepetitions = 0;
        _currentMelody = 0;
        TIM3_SetPWM(0, 0);
        _busy = FALSE;
      } else {
        _currentMelodyRepetitions++;
        _cycles = ((uint32_t)_melodyDelay * 1000) /
                  (float)(((F_CPU / ((_currentMelody + count - 1)->frequency * (TIM3_PRESCALER_16 + 1)))) - 1);
        TIM3_SetPWM((_currentMelody + count - 1)->frequency, 0);
        count = 0;
        done = FALSE;
      }
    }
  } else {
    if (_currentCycles >= _cycles) {
      _cycles = 0;
      _currentCycles = 0;
      done = TRUE;
    } else {
      _currentCycles++;
    }
  }
}

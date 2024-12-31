;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module hr4988
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM2_ITConfig
	.globl _TIM2_Cmd
	.globl _TIM2_TimeBaseInit
	.globl _TIM1_SetCompare2
	.globl _TIM1_OC2PreloadConfig
	.globl _TIM1_ARRPreloadConfig
	.globl _TIM1_CtrlPWMOutputs
	.globl _TIM1_Cmd
	.globl _TIM1_OC2Init
	.globl _TIM1_TimeBaseInit
	.globl _GPIO_ReadOutputData
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Write
	.globl _GPIO_Init
	.globl _CLK_PeripheralClockConfig
	.globl _hr4988_init
	.globl _hr4988_setSpeed
	.globl _hr4988_setSteps
	.globl _hr4988_setRotation
	.globl _hr4988_setStepMode
	.globl _hr4988_setStepper
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_currentSpeed:
	.ds 2
_rotationChange:
	.ds 1
_stepperState:
	.ds 1
_rotation:
	.ds 1
_desiredSpeed:
	.ds 2
_stepperService_update_10000_401:
	.ds 4
_changeRotation_deaccelPasses_10000_404:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_stepMode:
	.ds 1
_stepsPerRevolution:
	.ds 2
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;	../hr4988.c: 101: static uint32_t update = 0;
	clrw	x
	ldw	_stepperService_update_10000_401+2, x
	ldw	_stepperService_update_10000_401+0, x
;	../hr4988.c: 120: static bool deaccelPasses = 0;
	clr	_changeRotation_deaccelPasses_10000_404+0
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	../hr4988.c: 22: void hr4988_init(void){
;	-----------------------------------------
;	 function hr4988_init
;	-----------------------------------------
_hr4988_init:
;	../hr4988.c: 23: GPIO_Init(STEPPER_GPIO, STEPPER_MS1 | STEPPER_MS2 | STEPPER_MS3 | STEPPER_ENA | STEPPER_DIR | STEPPER_SLP | STEPPER_STP, GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	ld	a, #0xfe
	ldw	x, #0x500a
	call	_GPIO_Init
;	../hr4988.c: 24: GPIO_WriteLow(STEPPER_GPIO, STEPPER_MS1 | STEPPER_MS2 | STEPPER_MS3 | STEPPER_ENA);
	ld	a, #0xf0
	ldw	x, #0x500a
	call	_GPIO_WriteLow
;	../hr4988.c: 25: GPIO_WriteHigh(STEPPER_GPIO, STEPPER_SLP);
	ld	a, #0x08
	ldw	x, #0x500a
	call	_GPIO_WriteHigh
;	../hr4988.c: 27: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
	push	#0x01
	ld	a, #0x07
	call	_CLK_PeripheralClockConfig
;	../hr4988.c: 28: TIM1_PWM_Init(100);
	ldw	x, #0x0064
	call	_TIM1_PWM_Init
;	../hr4988.c: 29: TIM2_INT_Init();
;	../hr4988.c: 30: }
	jp	_TIM2_INT_Init
;	../hr4988.c: 32: void hr4988_setSpeed(uint16_t rpm){
;	-----------------------------------------
;	 function hr4988_setSpeed
;	-----------------------------------------
_hr4988_setSpeed:
;	../hr4988.c: 33: desiredSpeed = rpm;
	ldw	_desiredSpeed+0, x
;	../hr4988.c: 34: }
	ret
;	../hr4988.c: 36: void hr4988_setSteps(uint16_t steps){
;	-----------------------------------------
;	 function hr4988_setSteps
;	-----------------------------------------
_hr4988_setSteps:
;	../hr4988.c: 37: stepsPerRevolution = steps;
	ldw	_stepsPerRevolution+0, x
;	../hr4988.c: 38: }
	ret
;	../hr4988.c: 40: void hr4988_setRotation(rotation_t rot){
;	-----------------------------------------
;	 function hr4988_setRotation
;	-----------------------------------------
_hr4988_setRotation:
;	../hr4988.c: 41: if (rot != rotation) {
	cp	a, _rotation+0
	jrne	00113$
	ret
00113$:
;	../hr4988.c: 42: rotation = rot;
	ld	_rotation+0, a
;	../hr4988.c: 43: rotationChange = 1;
	mov	_rotationChange+0, #0x01
;	../hr4988.c: 45: }
	ret
;	../hr4988.c: 47: void hr4988_setStepMode(stepMode_t mode){
;	-----------------------------------------
;	 function hr4988_setStepMode
;	-----------------------------------------
_hr4988_setStepMode:
	push	a
	ld	_stepMode+0, a
;	../hr4988.c: 49: GPIO_Write(STEPPER_GPIO, GPIO_ReadOutputData(STEPPER_GPIO) & ~(STEPPER_MS1 | STEPPER_MS2 | STEPPER_MS3) | 
	ldw	x, #0x500a
	call	_GPIO_ReadOutputData
	and	a, #0x8f
	ld	(0x01, sp), a
;	../hr4988.c: 50: ((stepMode >> 2) & 0x01) << STEPPER_MS3_PINN |
	ld	a, _stepMode+0
	srl	a
	srl	a
	and	a, #0x01
	swap	a
	and	a, #0xf0
	or	a, (0x01, sp)
	ld	(0x01, sp), a
;	../hr4988.c: 51: ((stepMode >> 1) & 0x01) << STEPPER_MS2_PINN |
	ld	a, _stepMode+0
	srl	a
	and	a, #0x01
	swap	a
	and	a, #0xf0
	sll	a
	or	a, (0x01, sp)
	ld	(0x01, sp), a
;	../hr4988.c: 52: ((stepMode) & 0x01) << STEPPER_MS1_PINN
	ld	a, _stepMode+0
	and	a, #0x01
	swap	a
	and	a, #0xf0
	sll	a
	sll	a
	or	a, (0x01, sp)
;	../hr4988.c: 49: GPIO_Write(STEPPER_GPIO, GPIO_ReadOutputData(STEPPER_GPIO) & ~(STEPPER_MS1 | STEPPER_MS2 | STEPPER_MS3) | 
	ldw	x, #0x500a
	addw	sp, #1
	jp	_GPIO_Write
;	../hr4988.c: 54: }
	pop	a
	ret
;	../hr4988.c: 56: void hr4988_setStepper(FunctionalState state){
;	-----------------------------------------
;	 function hr4988_setStepper
;	-----------------------------------------
_hr4988_setStepper:
;	../hr4988.c: 57: TIM1_CtrlPWMOutputs(state);
	push	a
	call	_TIM1_CtrlPWMOutputs
	pop	a
;	../hr4988.c: 58: stepperState = state;
	ld	_stepperState+0, a
;	../hr4988.c: 59: }
	ret
;	../hr4988.c: 62: void TIM2_INT_Init(void) {
;	-----------------------------------------
;	 function TIM2_INT_Init
;	-----------------------------------------
_TIM2_INT_Init:
;	../hr4988.c: 63: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
	push	#0x01
	ld	a, #0x05
	call	_CLK_PeripheralClockConfig
;	../hr4988.c: 64: TIM2_TimeBaseInit(TIM2_PRESCALER_16, 49);
	ldw	x, #0x0031
	ld	a, #0x04
	call	_TIM2_TimeBaseInit
;	../hr4988.c: 65: TIM2_InterruptCallback = stepperService;
	ldw	x, #(_stepperService+0)
	ldw	_TIM2_InterruptCallback+0, x
;	../hr4988.c: 66: TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
	push	#0x01
	ld	a, #0x01
	call	_TIM2_ITConfig
;	../hr4988.c: 67: TIM2_Cmd(ENABLE);
	ld	a, #0x01
	call	_TIM2_Cmd
;	../hr4988.c: 68: enableInterrupts();
	rim
;	../hr4988.c: 69: }
	ret
;	../hr4988.c: 71: void TIM1_PWM_Init(uint16_t frequency) {
;	-----------------------------------------
;	 function TIM1_PWM_Init
;	-----------------------------------------
_TIM1_PWM_Init:
	sub	sp, #4
;	../hr4988.c: 72: uint16_t prescaler = (F_CPU / frequency) / 65536;
	ldw	(0x03, sp), x
	ldw	y, x
	clrw	x
	pushw	y
	pushw	x
	push	#0x00
	push	#0x24
	push	#0xf4
	push	#0x00
	call	__divslong
	addw	sp, #8
	push	#0x00
	push	#0x00
	push	#0x01
	push	#0x00
	pushw	x
	pushw	y
	call	__divslong
	addw	sp, #8
;	../hr4988.c: 73: uint16_t arr = (F_CPU / (frequency * (prescaler + 1))) - 1;
	ldw	(0x01, sp), x
	incw	x
	ldw	y, (0x03, sp)
	pushw	x
	ldw	x, y
	call	__mulint
	clrw	y
	pushw	x
	pushw	y
	push	#0x00
	push	#0x24
	push	#0xf4
	push	#0x00
	call	__divslong
	addw	sp, #8
	decw	x
;	../hr4988.c: 75: TIM1_TimeBaseInit(prescaler, TIM1_COUNTERMODE_UP, arr, 0);
	pushw	x
	push	#0x00
	pushw	x
	clr	a
	ldw	x, (0x06, sp)
	call	_TIM1_TimeBaseInit
	popw	x
;	../hr4988.c: 80: (arr + 1) / 2,
	incw	x
	srlw	x
;	../hr4988.c: 77: TIM1_OCMODE_PWM1,
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	push	#0x00
	push	#0x11
	ld	a, #0x60
	call	_TIM1_OC2Init
;	../hr4988.c: 87: TIM1_OC2PreloadConfig(ENABLE); // Habilitar pre-carga para CCR2
	ld	a, #0x01
	call	_TIM1_OC2PreloadConfig
;	../hr4988.c: 88: TIM1_ARRPreloadConfig(ENABLE);
	ld	a, #0x01
	call	_TIM1_ARRPreloadConfig
;	../hr4988.c: 89: TIM1_Cmd(ENABLE);
	ld	a, #0x01
	addw	sp, #4
;	../hr4988.c: 90: }
	jp	_TIM1_Cmd
;	../hr4988.c: 92: void TIM1_SetFrequency(uint16_t frequency) {
;	-----------------------------------------
;	 function TIM1_SetFrequency
;	-----------------------------------------
_TIM1_SetFrequency:
	sub	sp, #4
;	../hr4988.c: 93: uint16_t prescaler = (F_CPU / frequency) / 65536;
	ldw	(0x03, sp), x
	ldw	y, x
	clrw	x
	pushw	y
	pushw	x
	push	#0x00
	push	#0x24
	push	#0xf4
	push	#0x00
	call	__divslong
	addw	sp, #8
	push	#0x00
	push	#0x00
	push	#0x01
	push	#0x00
	pushw	x
	pushw	y
	call	__divslong
	addw	sp, #8
;	../hr4988.c: 94: uint16_t arr = (F_CPU / (frequency * (prescaler + 1))) - 1;
	ldw	(0x01, sp), x
	incw	x
	ldw	y, (0x03, sp)
	pushw	x
	ldw	x, y
	call	__mulint
	clrw	y
	pushw	x
	pushw	y
	push	#0x00
	push	#0x24
	push	#0xf4
	push	#0x00
	call	__divslong
	addw	sp, #8
	decw	x
;	../hr4988.c: 96: TIM1_TimeBaseInit(prescaler, TIM1_COUNTERMODE_UP, arr, 0);
	pushw	x
	push	#0x00
	pushw	x
	clr	a
	ldw	x, (0x06, sp)
	call	_TIM1_TimeBaseInit
	popw	x
;	../hr4988.c: 97: TIM1_SetCompare2((arr + 1) / 2);
	incw	x
	srlw	x
	addw	sp, #4
;	../hr4988.c: 98: }
	jp	_TIM1_SetCompare2
;	../hr4988.c: 100: void stepperService(void) {
;	-----------------------------------------
;	 function stepperService
;	-----------------------------------------
_stepperService:
;	../hr4988.c: 103: if (update >= 1000){
	ldw	x, _stepperService_update_10000_401+2
	cpw	x, #0x03e8
	ld	a, _stepperService_update_10000_401+1
	sbc	a, #0x00
	ld	a, _stepperService_update_10000_401+0
	sbc	a, #0x00
	jrc	00111$
;	../hr4988.c: 104: if (rotationChange)
	btjf	_rotationChange+0, #0, 00102$
;	../hr4988.c: 105: changeRotation();
	call	_changeRotation
00102$:
;	../hr4988.c: 107: if (currentSpeed < desiredSpeed)
	ldw	x, _desiredSpeed+0
	cpw	x, _currentSpeed+0
	jrule	00106$
;	../hr4988.c: 108: currentSpeed++;
	ldw	x, _currentSpeed+0
	incw	x
	ldw	_currentSpeed+0, x
	jra	00107$
00106$:
;	../hr4988.c: 109: else if (currentSpeed > desiredSpeed)
	ldw	x, _desiredSpeed+0
	cpw	x, _currentSpeed+0
	jrnc	00107$
;	../hr4988.c: 110: currentSpeed--;
	ldw	x, _currentSpeed+0
	decw	x
	ldw	_currentSpeed+0, x
00107$:
;	../hr4988.c: 112: if (currentSpeed != desiredSpeed)
	ldw	x, _desiredSpeed+0
	cpw	x, _currentSpeed+0
	jreq	00109$
;	../hr4988.c: 113: setSpeed(currentSpeed);
	ldw	x, _currentSpeed+0
	call	_setSpeed
00109$:
;	../hr4988.c: 114: update = 0;
	clrw	x
	ldw	_stepperService_update_10000_401+2, x
	ldw	_stepperService_update_10000_401+0, x
00111$:
;	../hr4988.c: 116: update += 50;
	ldw	x, _stepperService_update_10000_401+2
	addw	x, #0x0032
	ldw	y, _stepperService_update_10000_401+0
	jrnc	00156$
	incw	y
00156$:
	ldw	_stepperService_update_10000_401+2, x
	ldw	_stepperService_update_10000_401+0, y
;	../hr4988.c: 117: }
	ret
;	../hr4988.c: 119: void changeRotation(void){
;	-----------------------------------------
;	 function changeRotation
;	-----------------------------------------
_changeRotation:
;	../hr4988.c: 121: if (deaccelPasses | !stepperState){
	ld	a, _stepperState+0
	xor	a, #0x01
	or	a, _changeRotation_deaccelPasses_10000_404+0
	jreq	00108$
;	../hr4988.c: 122: if (rotation == CLKWISE)
	btjt	_rotation+0, #0, 00102$
;	../hr4988.c: 123: GPIO_WriteLow(STEPPER_GPIO, STEPPER_DIR);
	ld	a, #0x02
	ldw	x, #0x500a
	call	_GPIO_WriteLow
	jra	00103$
00102$:
;	../hr4988.c: 125: GPIO_WriteHigh(STEPPER_GPIO, STEPPER_DIR);
	ld	a, #0x02
	ldw	x, #0x500a
	call	_GPIO_WriteHigh
00103$:
;	../hr4988.c: 126: rotationChange = 0;
	clr	_rotationChange+0
;	../hr4988.c: 127: deaccelPasses = 0;
	clr	_changeRotation_deaccelPasses_10000_404+0
	ret
00108$:
;	../hr4988.c: 129: if (currentSpeed >= 5)
	ldw	x, _currentSpeed+0
	cpw	x, #0x0005
	jrc	00105$
;	../hr4988.c: 130: currentSpeed -= 3;
	ldw	x, _currentSpeed+0
	subw	x, #0x0003
	ldw	_currentSpeed+0, x
	ret
00105$:
;	../hr4988.c: 132: deaccelPasses = 1;
	mov	_changeRotation_deaccelPasses_10000_404+0, #0x01
;	../hr4988.c: 134: }
	ret
;	../hr4988.c: 136: void setSpeed(uint16_t speed){
;	-----------------------------------------
;	 function setSpeed
;	-----------------------------------------
_setSpeed:
;	../hr4988.c: 137: TIM1_SetFrequency((speed/stepsPerRevolution)*60);
	ldw	y, _stepsPerRevolution+0
	divw	x, y
	pushw	x
	ldw	x, #0x003c
	call	__mulint
;	../hr4988.c: 138: }
	jp	_TIM1_SetFrequency
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__stepMode:
	.db #0x04	; 4
__xinit__stepsPerRevolution:
	.dw #0x0032
	.area CABS (ABS)

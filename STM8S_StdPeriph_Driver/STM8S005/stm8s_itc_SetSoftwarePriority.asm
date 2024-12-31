;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_itc_SetSoftwarePriority
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ITC_GetSoftIntStatus
	.globl _assert_failed
	.globl _ITC_SetSoftwarePriority
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 54: void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
;	-----------------------------------------
;	 function ITC_SetSoftwarePriority
;	-----------------------------------------
_ITC_SetSoftwarePriority:
	sub	sp, #4
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 60: assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
	ld	(0x04, sp), a
	cp	a, #0x18
	jrugt	00190$
	clr	(0x01, sp)
	jra	00191$
00190$:
	ld	a, #0x01
	ld	(0x01, sp), a
00191$:
	tnz	(0x01, sp)
	jreq	00127$
	push	#0x3c
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00127$:
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 61: assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
	ld	a, (0x07, sp)
	cp	a, #0x02
	jreq	00129$
	ld	a, (0x07, sp)
	dec	a
	jreq	00129$
	tnz	(0x07, sp)
	jreq	00129$
	ld	a, (0x07, sp)
	cp	a, #0x03
	jreq	00129$
	push	#0x3d
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00129$:
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 64: assert_param(IS_ITC_INTERRUPTS_DISABLED);
	call	_ITC_GetSoftIntStatus
	cp	a, #0x28
	jreq	00140$
	push	#0x40
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00140$:
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 68: Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
	ld	a, (0x04, sp)
	and	a, #0x03
	sll	a
	ld	xl, a
	ld	a, #0x03
	push	a
	ld	a, xl
	tnz	a
	jreq	00207$
00206$:
	sll	(1, sp)
	dec	a
	jrne	00206$
00207$:
	pop	a
	cpl	a
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 71: NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
	ld	a, (0x07, sp)
	push	a
	ld	a, xl
	tnz	a
	jreq	00209$
00208$:
	sll	(1, sp)
	dec	a
	jrne	00208$
00209$:
	pop	a
	ld	(0x03, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 73: switch (IrqNum)
	ld	a, (0x01, sp)
	jreq	00210$
	jp	00124$
00210$:
	clrw	x
	ld	a, (0x04, sp)
	ld	xl, a
	sllw	x
	ldw	x, (#00211$, x)
	jp	(x)
00211$:
	.dw	#00104$
	.dw	#00104$
	.dw	#00104$
	.dw	#00104$
	.dw	#00108$
	.dw	#00108$
	.dw	#00108$
	.dw	#00108$
	.dw	#00124$
	.dw	#00124$
	.dw	#00110$
	.dw	#00110$
	.dw	#00114$
	.dw	#00114$
	.dw	#00114$
	.dw	#00114$
	.dw	#00116$
	.dw	#00124$
	.dw	#00124$
	.dw	#00116$
	.dw	#00120$
	.dw	#00120$
	.dw	#00120$
	.dw	#00120$
	.dw	#00121$
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 78: case ITC_IRQ_PORTA:
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 79: ITC->ISPR1 &= Mask;
	ld	a, 0x7f70
	and	a, (0x02, sp)
	ld	0x7f70, a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 80: ITC->ISPR1 |= NewPriority;
	ld	a, 0x7f70
	or	a, (0x03, sp)
	ld	0x7f70, a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 81: break;
	jra	00124$
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 86: case ITC_IRQ_PORTE:
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 87: ITC->ISPR2 &= Mask;
	ld	a, 0x7f71
	and	a, (0x02, sp)
	ld	0x7f71, a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 88: ITC->ISPR2 |= NewPriority;
	ld	a, 0x7f71
	or	a, (0x03, sp)
	ld	0x7f71, a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 89: break;
	jra	00124$
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 99: case ITC_IRQ_TIM1_OVF:
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 100: ITC->ISPR3 &= Mask;
	ld	a, 0x7f72
	and	a, (0x02, sp)
	ld	0x7f72, a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 101: ITC->ISPR3 |= NewPriority;
	ld	a, 0x7f72
	or	a, (0x03, sp)
	ld	0x7f72, a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 102: break;
	jra	00124$
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 112: case ITC_IRQ_TIM3_OVF:
00114$:
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 113: ITC->ISPR4 &= Mask;
	ld	a, 0x7f73
	and	a, (0x02, sp)
	ld	0x7f73, a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 114: ITC->ISPR4 |= NewPriority;
	ld	a, 0x7f73
	or	a, (0x03, sp)
	ld	0x7f73, a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 115: break;
	jra	00124$
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 127: case ITC_IRQ_I2C:
00116$:
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 128: ITC->ISPR5 &= Mask;
	ld	a, 0x7f74
	and	a, (0x02, sp)
	ld	0x7f74, a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 129: ITC->ISPR5 |= NewPriority;
	ld	a, 0x7f74
	or	a, (0x03, sp)
	ld	0x7f74, a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 130: break;
	jra	00124$
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 152: case ITC_IRQ_TIM4_OVF:
00120$:
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 154: ITC->ISPR6 &= Mask;
	ld	a, 0x7f75
	and	a, (0x02, sp)
	ld	0x7f75, a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 155: ITC->ISPR6 |= NewPriority;
	ld	a, 0x7f75
	or	a, (0x03, sp)
	ld	0x7f75, a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 156: break;
	jra	00124$
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 158: case ITC_IRQ_EEPROM_EEC:
00121$:
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 159: ITC->ISPR7 &= Mask;
	ld	a, 0x7f76
	and	a, (0x02, sp)
	ld	0x7f76, a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 160: ITC->ISPR7 |= NewPriority;
	ld	a, 0x7f76
	or	a, (0x03, sp)
	ld	0x7f76, a
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 165: }
00124$:
;	../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority.c: 166: }
	addw	sp, #4
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_itc_SetSoftwarePriority."
	.ascii "c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

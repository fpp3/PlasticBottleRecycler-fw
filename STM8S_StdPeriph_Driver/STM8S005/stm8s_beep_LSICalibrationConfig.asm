;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_beep_LSICalibrationConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _BEEP_LSICalibrationConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_LSICalibrationConfig.c: 54: void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
;	-----------------------------------------
;	 function BEEP_LSICalibrationConfig
;	-----------------------------------------
_BEEP_LSICalibrationConfig:
	sub	sp, #9
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_LSICalibrationConfig.c: 60: assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
	ldw	x, (0x0e, sp)
	cpw	x, #0xadb0
	ld	a, (0x0d, sp)
	sbc	a, #0x01
	ld	a, (0x0c, sp)
	sbc	a, #0x00
	jrc	00106$
	ldw	x, #0x49f0
	cpw	x, (0x0e, sp)
	ld	a, #0x02
	sbc	a, (0x0d, sp)
	clr	a
	sbc	a, (0x0c, sp)
	jrnc	00107$
00106$:
	push	#0x3c
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_LSICalibrationConfig.c: 62: lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
	ldw	x, (0x12, sp)
	pushw	x
	ldw	x, (0x12, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x01, sp), x
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_LSICalibrationConfig.c: 66: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
	ld	a, 0x50f3
	and	a, #0xe0
	ld	0x50f3, a
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_LSICalibrationConfig.c: 68: A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
	ldw	x, (0x01, sp)
	srlw	x
	srlw	x
	srlw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_LSICalibrationConfig.c: 70: if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
	ldw	(0x03, sp), x
	ldw	(0x08, sp), x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x05, sp), x
	ldw	y, (0x01, sp)
	subw	y, (0x05, sp)
	ldw	x, (0x08, sp)
	sllw	x
	incw	x
	pushw	x
	ldw	x, y
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_LSICalibrationConfig.c: 66: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
	call	__mulint
	ldw	(0x07, sp), x
	ld	a, 0x50f3
	ld	(0x09, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_LSICalibrationConfig.c: 72: BEEP->CSR |= (uint8_t)(A - 2U);
	ld	a, (0x04, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_LSICalibrationConfig.c: 70: if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
	ldw	x, (0x05, sp)
	cpw	x, (0x07, sp)
	jrc	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_LSICalibrationConfig.c: 72: BEEP->CSR |= (uint8_t)(A - 2U);
	sub	a, #0x02
	or	a, (0x09, sp)
	ld	0x50f3, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_LSICalibrationConfig.c: 76: BEEP->CSR |= (uint8_t)(A - 1U);
	dec	a
	or	a, (0x09, sp)
	ld	0x50f3, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_LSICalibrationConfig.c: 78: }
	ldw	x, (10, sp)
	addw	sp, #15
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_beep_LSICalibrationConfi"
	.ascii "g.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

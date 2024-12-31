;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_awu_LSICalibrationConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _AWU_LSICalibrationConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_LSICalibrationConfig.c: 55: void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
;	-----------------------------------------
;	 function AWU_LSICalibrationConfig
;	-----------------------------------------
_AWU_LSICalibrationConfig:
	sub	sp, #6
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_LSICalibrationConfig.c: 61: assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
	ldw	x, (0x0b, sp)
	cpw	x, #0xadb0
	ld	a, (0x0a, sp)
	sbc	a, #0x01
	ld	a, (0x09, sp)
	sbc	a, #0x00
	jrc	00106$
	ldw	x, #0x49f0
	cpw	x, (0x0b, sp)
	ld	a, #0x02
	sbc	a, (0x0a, sp)
	clr	a
	sbc	a, (0x09, sp)
	jrnc	00107$
00106$:
	push	#0x3d
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00107$:
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_LSICalibrationConfig.c: 63: lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
	ldw	x, (0x0f, sp)
	pushw	x
	ldw	x, (0x0f, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_LSICalibrationConfig.c: 67: A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
	ldw	(0x05, sp), x
	srlw	x
	srlw	x
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_LSICalibrationConfig.c: 69: if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
	ldw	(0x01, sp), x
	ldw	(0x03, sp), x
	sll	(0x04, sp)
	rlc	(0x03, sp)
	sll	(0x04, sp)
	rlc	(0x03, sp)
	ldw	y, (0x05, sp)
	subw	y, (0x03, sp)
	sllw	x
	incw	x
	pushw	x
	ldw	x, y
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_LSICalibrationConfig.c: 71: AWU->APR = (uint8_t)(A - 2U);
	call	__mulint
	ldw	(0x05, sp), x
	ld	a, (0x02, sp)
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_LSICalibrationConfig.c: 69: if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
	ldw	x, (0x03, sp)
	cpw	x, (0x05, sp)
	jrc	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_LSICalibrationConfig.c: 71: AWU->APR = (uint8_t)(A - 2U);
	sub	a, #0x02
	ld	0x50f1, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_LSICalibrationConfig.c: 75: AWU->APR = (uint8_t)(A - 1U);
	dec	a
	ld	0x50f1, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_awu_LSICalibrationConfig.c: 77: }
	ldw	x, (7, sp)
	addw	sp, #12
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_awu_LSICalibrationConfig"
	.ascii ".c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

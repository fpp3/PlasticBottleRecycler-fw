;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_beep_Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _BEEP_Init
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
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_Init.c: 49: void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
;	-----------------------------------------
;	 function BEEP_Init
;	-----------------------------------------
_BEEP_Init:
	push	a
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_Init.c: 52: assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
	ld	(0x01, sp), a
	jreq	00106$
	ld	a, (0x01, sp)
	cp	a, #0x40
	jreq	00106$
	ld	a, (0x01, sp)
	cp	a, #0x80
	jreq	00106$
	push	#0x34
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00106$:
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_Init.c: 55: if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
	ld	a, 0x50f3
	cpl	a
	bcp	a, #0x1f
	jrne	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_Init.c: 57: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
	ld	a, 0x50f3
	and	a, #0xe0
	ld	0x50f3, a
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_Init.c: 58: BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
	ld	a, 0x50f3
	or	a, #0x0b
	ld	0x50f3, a
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_Init.c: 62: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
	ld	a, 0x50f3
	and	a, #0x3f
	ld	0x50f3, a
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_Init.c: 63: BEEP->CSR |= (uint8_t)(BEEP_Frequency);
	ld	a, 0x50f3
	or	a, (0x01, sp)
	ld	0x50f3, a
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_Init.c: 64: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_beep_Init.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

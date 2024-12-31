;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_beep_Cmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _BEEP_Cmd
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
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_Cmd.c: 48: void BEEP_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function BEEP_Cmd
;	-----------------------------------------
_BEEP_Cmd:
	push	a
	ld	(0x01, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_Cmd.c: 53: BEEP->CSR |= BEEP_CSR_BEEPEN;
	ld	a, 0x50f3
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_Cmd.c: 50: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_Cmd.c: 53: BEEP->CSR |= BEEP_CSR_BEEPEN;
	or	a, #0x20
	ld	0x50f3, a
	jra	00104$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_Cmd.c: 58: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
	and	a, #0xdf
	ld	0x50f3, a
00104$:
;	../STM8S_StdPeriph_Driver/src/stm8s_beep_Cmd.c: 60: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_clk_PeripheralClockConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _assert_failed
	.globl _CLK_PeripheralClockConfig
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
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 50: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_PeripheralClockConfig
;	-----------------------------------------
_CLK_PeripheralClockConfig:
	sub	sp, #3
	ld	(0x03, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 53: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	tnz	(0x06, sp)
	jreq	00113$
	tnz	(0x06, sp)
	jrne	00113$
	push	#0x35
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00113$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 54: assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
	tnz	(0x03, sp)
	jreq	00118$
	ld	a, (0x03, sp)
	dec	a
	jreq	00118$
	ld	a, (0x03, sp)
	sub	a, #0x03
	jrne	00298$
	inc	a
	.byte 0x21
00298$:
	clr	a
00299$:
	tnz	a
	jrne	00118$
	tnz	a
	jrne	00118$
	tnz	a
	jrne	00118$
	ld	a, (0x03, sp)
	sub	a, #0x04
	jrne	00304$
	inc	a
	ld	xl, a
	jra	00305$
00304$:
	clr	a
	ld	xl, a
00305$:
	ld	a, xl
	tnz	a
	jrne	00118$
	ld	a, (0x03, sp)
	sub	a, #0x05
	jrne	00308$
	inc	a
	.byte 0x21
00308$:
	clr	a
00309$:
	tnz	a
	jrne	00118$
	tnz	a
	jrne	00118$
	ld	a, xl
	tnz	a
	jrne	00118$
	ld	a, (0x03, sp)
	cp	a, #0x06
	jreq	00118$
	ld	a, (0x03, sp)
	cp	a, #0x07
	jreq	00118$
	ld	a, (0x03, sp)
	cp	a, #0x17
	jreq	00118$
	ld	a, (0x03, sp)
	cp	a, #0x13
	jreq	00118$
	ld	a, (0x03, sp)
	cp	a, #0x12
	jreq	00118$
	push	#0x36
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, #(___str_0+0)
	call	_assert_failed
00118$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 61: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ld	a, (0x03, sp)
	and	a, #0x0f
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	tnz	a
	jreq	00329$
00328$:
	sll	(0x01, sp)
	dec	a
	jrne	00328$
00329$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 66: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
	ld	a, (0x01, sp)
	cpl	a
	ld	(0x02, sp), a
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 56: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
	ld	a, (0x03, sp)
	bcp	a, #0x10
	jrne	00108$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 61: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ld	a, 0x50c7
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 58: if (NewState != DISABLE)
	tnz	(0x06, sp)
	jreq	00102$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 61: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	or	a, (0x01, sp)
	ld	0x50c7, a
	jra	00110$
00102$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 66: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
	and	a, (0x02, sp)
	ld	0x50c7, a
	jra	00110$
00108$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 74: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ld	a, 0x50ca
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 71: if (NewState != DISABLE)
	tnz	(0x06, sp)
	jreq	00105$
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 74: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	or	a, (0x01, sp)
	ld	0x50ca, a
	jra	00110$
00105$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 79: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
	and	a, (0x02, sp)
	ld	0x50ca, a
00110$:
;	../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfig.c: 82: }
	addw	sp, #3
	popw	x
	pop	a
	jp	(x)
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "../STM8S_StdPeriph_Driver/src/stm8s_clk_PeripheralClockConfi"
	.ascii "g.c"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

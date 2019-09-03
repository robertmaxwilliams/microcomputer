	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"P1-1.c"
	.global	var1
	.data
	.type	var1, %object
	.size	var1, 1
var1:
	.byte	1
	.global	var2
	.type	var2, %object
	.size	var2, 1
var2:
	.byte	2
	.global	var3
	.align	2
	.type	var3, %object
	.size	var3, 4
var3:
	.word	3
	.global	var4
	.align	2
	.type	var4, %object
	.size	var4, 4
var4:
	.word	4
	.global	num
	.section	.rodata
	.align	2
	.type	num, %object
	.size	num, 4
num:
	.word	-10
	.global	wave
	.data
	.align	2
	.type	wave, %object
	.size	wave, 10
wave:
	.ascii	"goodbye!!!"
	.global	__aeabi_idiv
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #5
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, .L9
	ldrsb	r3, [r3]
	uxtb	r2, r3
	ldr	r3, .L9
	ldrsb	r3, [r3]
	uxtb	r3, r3
	smulbb	r3, r2, r3
	uxtb	r3, r3
	sxtb	r2, r3
	ldr	r3, .L9
	strb	r2, [r3]
	ldr	r3, .L9
	ldrsb	r3, [r3]
	mov	r2, r3
	ldr	r3, .L9
	ldrsb	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_idiv
	mov	r3, r0
	sxtb	r2, r3
	ldr	r3, .L9
	strb	r2, [r3]
	ldr	r3, .L9
	ldrsb	r3, [r3]
	uxtb	r2, r3
	ldr	r3, .L9
	ldrsb	r3, [r3]
	uxtb	r3, r3
	add	r3, r2, r3
	uxtb	r3, r3
	sxtb	r2, r3
	ldr	r3, .L9
	strb	r2, [r3]
	ldr	r3, .L9
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bgt	.L3
.L4:
	ldr	r3, .L9+4
	ldr	r3, [r3]
	sub	r3, r3, #1
	ldr	r2, .L9+4
	str	r3, [r2]
	ldr	r3, .L9+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L4
	b	.L8
.L7:
	ldr	r3, .L9+8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, .L9+8
	strb	r2, [r3]
	b	.L6
.L8:
	ldr	r3, .L9+12
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L7
.L6:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L10:
	.align	2
.L9:
	.word	var1
	.word	var4
	.word	var2
	.word	var3
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits

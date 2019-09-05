//Assembly Subroutine
//original: Eugene Rockey, Copyright 2018, All Rights Reserved
//modified: Robert Williams, Kopyleft, All Rights Reversed

.section ".text" // declare read only

// in all of these, arguments come in in r0 and r1, and result 
// is put in r0 before using "MOV pc, lr".
// MOV pc, lr means to set the program counter to the link register, 
// where the link registers is the place in the program that called
// out function.

.global add
add:
    ADD r0, r1 // trivial call to add instruction
	MOV pc, lr // return

.global sub
    sub:
	SUB r0, r1 // trivial call to subtract instruction
    MOV pc, lr // return

.global mult
mult:
    MUL r0, r0, r1 // trivial call to multiply instruction
    MOV pc, lr     // return

.global divide
divide:

    MOV r3, #0   // r3 = 0

    // if r0 is negative, make it positive and add one to r3
    cmp r0, #0   // if r0 < 0:
    NEGLT r0, r0 //     r0 = -r0
    ADDLT r3, #1 //     r3 += 1

    // if r1 is negative, make it positive and add one to r3
    cmp r1, #0   // if r1 < 0
    NEGLT r1, r1 //     r1 = -r1
    ADDLT r3, #1

    MOV r2, #0 // temp to store result

loop1: // start of division loop
    SUBS r0, r0, r1 // r0 = r0 - r2
    ADD r2, r2, #1 // r2 = r2 + 1, count number of times we have to subtract
    BGE loop1 // branch if r1 is greater than r0
    MOV r0, r2 // move answer into return register
    SUB r0, #1


    // negate r0 if r3's lsb is 1
    AND r3, r3, #1 // get lsb of r3
    CMP r3, #1     // if r3 == 1:
    NEGEQ r0, r0   //     r0 = -r0

    MOV pc, lr // return


.global rem
rem:
    MOV r3, #0  // r3 = 0

    // make r0 and r1 positive, and 
    // have r3 = 1 * is_r0_pos + 2 * is_r1_pos
    // so we can tell what case we started with when we get to the end.
    cmp r0, #0    // if r0 < 0:
    NEGLT r0, r0  //     r0 = -r0
    ADDLT r3, #1  //     r3 += 1

    cmp r1, #0    // if r1 < 0:
    NEGLT r1, r1  //     r1 = -r1
    ADDLT r3, #2  //     r3 += 2

    MOV r2, #0 // r0 divided by r1, r2 is counter
loop2:
    SUBS r0, r0, r1 // r0 = r0 - r2
    ADD r2, r2, #1 // r2 = r2 + 1
    BGE loop2 // branch if r1 is greater than r0
    ADD r0, r0, r1 // undo one step, since we always go one too far.

    // negate r0 if r3 = 1, aka numerator is negative and denominator is positive
    CMP r3, #1   // if r3 == 1:
    NEGEQ r0, r0 //     r0 = -r0

    MOV pc, lr // return

.end // end of whole file

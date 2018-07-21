//Assembly Subroutine
//Eugene Rockey, Copyright 2018, All Rights Reserved

.section ".text" // not sure what this does

.global next_char
next_char:
    ADD r0,#1 //How is the ARM calling convention obeyed here?
    MOV pc,lr

.global add
add:
    ADD r0, r1

.global sub
    sub:
	SUB r0, r1
	MOV pc, lr
    MOV pc, lr

.global mult
mult:
    MUL r0, r0, r1
    MOV pc, lr

.global divide
divide:
    // make r0 and r1 positive, and increment r3 for each one 
    // that had its sign flipped
    MOV r3, #0
    cmp r0, #0
    NEGLT r0, r0
    ADDLT r3, #1

    cmp r1, #0
    NEGLT r1, r1
    ADDLT r3, #1

    MOV r2, #0 // r0 divided by r1, r2 is counter
loop1:
    SUBS r0, r0, r1 // r0 = r0 - r2
    ADD r2, r2, #1 // r2 = r2 + 1
    BGE loop1 // branch if r1 is greater than r0
    MOV r0, r2
    SUB r0, #1


    // negate r0 if r3's lsb is 1
    AND r3, r3, #1
    CMP r3, #1
    NEGEQ r0, r0

    MOV pc, lr


.global rem
rem:
    // make r0 and r1 positive, and increment r3 for each one 
    // that had its sign flipped
    MOV r3, #0
    cmp r0, #0
    NEGLT r0, r0
    ADDLT r3, #1

    cmp r1, #0
    NEGLT r1, r1
    ADDLT r3, #2

    MOV r2, #0 // r0 divided by r1, r2 is counter
loop2:
    SUBS r0, r0, r1 // r0 = r0 - r2
    ADD r2, r2, #1 // r2 = r2 + 1
    BGE loop2 // branch if r1 is greater than r0
    ADD r0, r0, r1 // undo one step


    // negate r0 if r3 = 1
    CMP r3, #1
    NEGEQ r0, r0

    MOV pc, lr

.end // end of whole file ;)

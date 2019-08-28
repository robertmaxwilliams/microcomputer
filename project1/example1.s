@ ARM assembly to have a lot of fun and also addition
.global _start

_start:
MOV R1, #15
MOV R2, #12
ADD R3, R2, R1
MOV R0, R3
MOV R7, #1
SVC 0

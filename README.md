
Calling conventions:

+ From left to right, pass as many parameters as will fit in registers. The order in which registers are allocated, are:
+ For integers and pointers, rdi, rsi, rdx, rcx, r8, r9.
+ For floating-point (float, double), xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7
+ Additional parameters are pushed on the stack, right to left, and are removed by the caller after the call.
+ After the parameters are pushed, the call instruction is made, so when the called function gets control, the return
   address is at (%rsp), the first memory parameter is at 8(%rsp), etc.
+ THE STACK POINTER %RSP MUST BE ALIGNED TO A 16-BYTE BOUNDARY BEFORE MAKING A CALL. Fine, but the process of making a
   call pushes the return address (8 bytes) on the stack, so when a function gets control, %rsp is not aligned. You have to
   make that extra space yourself, by pushing something or subtracting 8 from %rsp.
+ The only registers that the called function is required to preserve (the calle-save registers) are: rbp, rbx, r12,
   r13, r14, r15. All others are free to be changed by the called function.
+ The callee is also supposed to save the control bits of the XMCSR and the x87 control word, but x87 instructions are
   rare in 64-bit code so you probably don't have to worry about this.
+ Integers are returned in rax or rdx:rax, and floating point values are returned in xmm0 or xmm1:xmm0.


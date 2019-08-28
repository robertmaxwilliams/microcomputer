        .global add
        .global subtract
        .global multiply
        .global divide

        .text
add:
        mov     %rdi, %rax
        add     %rsi, %rax
        ret

subtract:
        mov     %rdi, %rax
        sub     %rsi, %rax
        ret

multiply:
        mov     %rdi, %rax
        imul    %rsi
        ret

divide:
        mov     %rdi, %rax
        clr     %rdx
        idiv    %rsi
        ret
        

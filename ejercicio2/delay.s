.equ DELAY, 0xFFF0000

.globl delay


delay:
    sub sp, sp, #16
    str x30, [sp, #8]    
    str x19, [sp]        
    mov x19, DELAY
    
loop: 
    sub x19, x19, #1
    cbnz x19, loop        

    ldr x19, [sp]
    ldr x30, [sp, #8]
    add sp, sp, #16
    ret

<<<<<<< HEAD
.equ DELAY, 0x4FFF0000
=======
.equ DELAY, 0xFFF0000
// 0x1FFFFFFF 
// 0x3FFFFFFF
>>>>>>> 94e3c66cdc408dfc2afcb06316d9ebbeffb6b9ae

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

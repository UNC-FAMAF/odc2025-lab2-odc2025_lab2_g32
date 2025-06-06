.globl fondo
fondo:
    
    sub sp, sp, #64      // guardar registros
    str x10, [sp, #0]
    str x11, [sp, #8]
    str x12, [sp, #16]
    str x13, [sp, #24]
    str x14, [sp, #32]
    str x5, [sp, #40]
    str x30, [sp, #56]    // link register  
    //cielo
    mov x0, x20                
    movz x10, 0x9DFF, lsl 0    
    movk x10, 0x0022, lsl 16
    mov x11, #240          
    mov x12, #640          
    mov x13, #0            
    mov x14, #0            
    mov x5, #640           

    bl dibujar_rectangulo

    //pasto
    mov x0, x20                
    movz x10, 0x8B22, lsl 00   
    movk x10, 0x0022, lsl 16
    mov x11, #480          
    mov x12, #640          
    mov x13, #240            
    mov x14, #0            
    mov x5, #640           

    bl dibujar_rectangulo

    ldr x0, [sp, #0]          // recuperar registros
    ldr x10, [sp, #8]
    ldr x11, [sp, #16]
    ldr x12, [sp, #24]
    ldr x13, [sp, #32]
    ldr x14, [sp, #40]
    ldr x5, [sp, #48]
    ldr x30, [sp, #56]
    add sp, sp, #64           // liberar registros
    
    ret

/*------------------------------ Nube 1 -----------------------------*/	 
/*
mov x0, x20 // framebuffer_base
mov x1, #50              // centro_x
mov x2, #90         // centro_y
mov x3, #20     // radio
movz x4, 0xFFFF, lsl 00  // blanco
movk x4, 0xFFFF, lsl 16
bl dibujar_circulo

mov x0, x20
mov x1, #70             // centro 2, un poco a la derecha
mov x2, #85
mov x3, #25
movz x4, 0xFFFF, lsl 00
movk x4, 0xFFFF, lsl 16
bl dibujar_circulo

mov x0, x20
mov x1, #90
mov x2, #90
mov x3, #20
movz x4, 0xFFFF, lsl 00
movk x4, 0xFFFF, lsl 16
bl dibujar_circulo
*/

/*-------------------------------- Sol -------------------------------*/
/*
mov x0, x20        // framebuffer base
mov x1, #555       // centro_x (ancho)
mov x2, #140       // centro_y (altura)
mov x3, #45        // radio
movz x4, 0xD700, lsl 00
movk x4, 0x00FF, lsl 16 // color (sol)
bl dibujar_circulo
*/
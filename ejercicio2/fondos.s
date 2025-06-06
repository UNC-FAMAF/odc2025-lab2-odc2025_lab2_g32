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

    // Color gris-azulado: 0xFFB0B8C8
    movz w5, #0xB8C8
    movk w5, #0xFFB0, lsl #16

    // Nube 1 (central)
    mov x0, x20
    mov x1, #570
    mov x2, #50
    mov x3, #28
    mov x4, #16
    bl dibujar_elipse

    // Nube 1 (izquierda)
    mov x0, x20
    mov x1, #545
    mov x2, #55
    mov x3, #16
    mov x4, #11
    bl dibujar_elipse

    // Nube 1 (derecha)
    mov x0, x20
    mov x1, #595
    mov x2, #55
    mov x3, #16
    mov x4, #11
    bl dibujar_elipse

    // Nube 1 (superior)
    mov x0, x20
    mov x1, #570
    mov x2, #38
    mov x3, #12
    mov x4, #8
    bl dibujar_elipse

    // Nube 2 (más a la derecha)
    mov x0, x20
    mov x1, #610
    mov x2, #30
    mov x3, #18
    mov x4, #10
    bl dibujar_elipse

    // Nube 2 (más arriba)
    mov x0, x20
    mov x1, #630
    mov x2, #25
    mov x3, #10
    mov x4, #6
    bl dibujar_elipse

    // Nube 3 (centro-derecha)
    mov x0, x20
    mov x1, #500
    mov x2, #60
    mov x3, #22
    mov x4, #13
    bl dibujar_elipse

    // Nube 4 (centro)
    mov x0, x20
    mov x1, #400
    mov x2, #45
    mov x3, #28
    mov x4, #16
    bl dibujar_elipse

    // Nube 5 (centro-izquierda)
    mov x0, x20
    mov x1, #300
    mov x2, #55
    mov x3, #20
    mov x4, #12
    bl dibujar_elipse

    // Nube 6 (más a la izquierda)
    mov x0, x20
    mov x1, #180
    mov x2, #38
    mov x3, #24
    mov x4, #14
    bl dibujar_elipse

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

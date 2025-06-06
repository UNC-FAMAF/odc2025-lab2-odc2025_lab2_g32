.globl dibujar_arbol
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480

//---------------------------- Arbol ---------------------------//

dibujar_arbol:

    sub sp, sp, #80
    str x30, [sp, #0] 
    str x1, [sp, #8] 
    str x2, [sp, #16]
    str x3, [sp, #24] 
    str x4, [sp, #32]
    str x5, [sp, #40]
    str x11, [sp, #48] 
    str x12, [sp, #56]
    str x13, [sp, #64]  
    str x14, [sp, #72]
    
    //Tronco
    mov x0, x20   
    movz x10, 0x860B, lsl 00 // Color Marron Claro
    movk x10, 0x00B8, lsl 16 
    mov x11, #400 // Posición Y final
    mov x12, #200  // Posición X final
    mov x13, #50  // Posición Y inicial
    mov x14, #80  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla

    bl dibujar_rectangulo


    mov x0, x20   
    movz x10, 0x4513 , lsl 00 // Color Marron
    movk x10, 0x008B, lsl 16 
    mov x11, #400 // Posición Y final
    mov x12, #195  // Posición X final
    mov x13, #50  // Posición Y inicial
    mov x14, #85  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla

    bl dibujar_rectangulo


    mov x0, x20               // framebuffer base
    mov x1, #125             // centro_x
    mov x2, #150             // centro_y
    mov x3, #13              // a (radio horizontal)
    mov x4, #18              // b (radio vertical)
    movz w5, #0x860B, lsl 0        
    movk w5, #0x00B8, lsl 16  // Color Marron Claro
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #170             // centro_x
    mov x2, #150             // centro_y
    mov x3, #15              // a (radio horizontal)
    mov x4, #13              // b (radio vertical)
    movz w5, #0x860B, lsl 0         
    movk w5, #0x00B8, lsl 16 /// Color Marron Claro
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #150             // centro_x
    mov x2, #210             // centro_y
    mov x3, #15              // a (radio horizontal)
    mov x4, #20              // b (radio vertical)
    movz w5, #0x860B, lsl 0     // Color Marron Claro
    movk w5, #0x00B8, lsl 16 
    bl dibujar_elipse

    mov x0, x20   
    movz x10, 0x860B, lsl 00 // Color Marron Claro
    movk x10, 0x00B8, lsl 16 
    mov x11, #190 // Posición Y final
    mov x12, #230  // Posición X final
    mov x13, #170  // Posición Y inicial
    mov x14, #160  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla

    bl dibujar_rectangulo

    mov x0, x20   
    movz x10, 0x4513 , lsl 00 // Color Marron
    movk x10, 0x008B, lsl 16 
    mov x11, #186 // Posición Y final
    mov x12, #227  // Posición X final
    mov x13, #172  // Posición Y inicial
    mov x14, #160  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla

    bl dibujar_rectangulo

    ldr x30, [sp,#0]
    ldr x30, [sp, #0] 
    ldr x1, [sp, #8] 
    ldr x2, [sp, #16]
    ldr x3, [sp, #24] 
    ldr x4,[sp, #32]
    ldr x5, [sp, #40]
    ldr x11,[sp, #48] 
    ldr x12,[sp, #56]
    ldr x13,[sp, #64]  
    ldr x14,[sp, #72]
    add sp, sp, #80

ret

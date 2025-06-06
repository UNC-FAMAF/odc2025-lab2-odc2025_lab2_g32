.equ SCREEN_WIDTH, 640
.globl dialogo
dialogo:
    sub sp, sp, #8
    str x30, [sp, #0] // Guardar el link register
    //---------------------------- LETRA "O" ---------------------------//
    // Círculo exterior blanco
    mov x0, x20               // framebuffer base
    mov x1, #240              // centro_x
    mov x2, #130              // centro_y
    mov x3, #20          // radio
    movz x4, 0x0000, lsl 00   // Negro
    movk x4, 0x0000, lsl 16
    bl dibujar_circulo
    
    // Círculo interior azul
    mov x0, x20               // framebuffer base
    mov x1, #240              // centro_x
    mov x2, #130              // centro_y
    mov x3, #14               // radio
    movz x4, 0xFFFF, lsl 00   // Color Blanco
    movk x4, 0xFFFF, lsl 16
    bl dibujar_circulo
    
    //-------------------------------------------------------------------//
    
    
    //---------------------------- LETRA "d" ---------------------------//
    
    // Círculo exterior blanco
    mov x0, x20               // framebuffer base
    mov x1, #285              // centro_x
    mov x2, #130              // centro_y
    mov x3, #20          // radio
    movz x4, 0x0000, lsl 00   // Negro
    movk x4, 0x0000, lsl 16
    bl dibujar_circulo
    
    // Círculo interior
    mov x0, x20               // framebuffer base
    mov x1, #285              // centro_x
    mov x2, #130              // centro_y
    mov x3, #14               // radio
    movz x4, 0xFFFF, lsl 00   // Color Blanco
    movk x4, 0xFFFF, lsl 16
    bl dibujar_circulo
    
    // dibujar el palito de la letra "d"
    mov x0, x20   
    movz x10, 0x0000, lsl 00 // Color verde
    movk x10, 0x0000, lsl 16 
    mov x11, #150 // Posición Y final
    mov x12, #279  // Posición X final
    mov x13, #111  // Posición Y inicial
    mov x14, #266  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    // Fin del palito de la Letra "d"
    
    //---------------------------- LETRA "c" ---------------------------//
    
    // Círculo exterior blanco
    mov x0, x20               // framebuffer base
    mov x1, #330              // centro_x
    mov x2, #130              // centro_y
    mov x3, #20          // radio
    movz x4, 0x0000, lsl 00   // Negro
    movk x4, 0x0000, lsl 16
    bl dibujar_circulo
    
    // Círculo interior azul
    mov x0, x20               // framebuffer base
    mov x1, #330              // centro_x
    mov x2, #130              // centro_y
    mov x3, #14               // radio
    movz x4, 0xFFFF, lsl 00   // Color blanco
    movk x4, 0xFFFF, lsl 16
    bl dibujar_circulo
    
    
    mov x0, x20   
    movz x10, 0xFFFF, lsl 00 // Color Celeste
    movk x10, 0xFFFF, lsl 16  
    mov x11, #150 // Posición Y final
    mov x12, #360  // Posición X final
    mov x13, #111  // Posición Y inicial
    mov x14, #339  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    // Fin de la Letra "c"
    
    //---------------------------- 1º NUMERO "2" ---------------------------//
    mov x0, x20   
    movz x10, 0x0000, lsl 00 // Color Blanco
    movk x10, 0x00, lsl 16 
    mov x11, #150 // Posición Y final
    mov x12, #390  // Posición X final
    mov x13, #111  // Posición Y inicial
    mov x14, #360  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    mov x0, x20   
    movz x10, 0xFFFF, lsl 00 // Color Blanco
    movk x10, 0xFFFF, lsl 16 
    mov x11, #129 // Posición Y final
    mov x12, #380  // Posición X final
    mov x13, #120  // Posición Y inicial
    mov x14, #360  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    mov x0, x20   
    movz x10, 0xFFFF, lsl 00 // Color Blanco
    movk x10, 0xFFFF, lsl 16 
    mov x11, #143 // Posición Y final
    mov x12, #390  // Posición X final
    mov x13, #134  // Posición Y inicial
    mov x14, #370  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    //---------------------------- NUMERO "0" ---------------------------//
    
    mov x0, x20   
    movz x10, 0x0000, lsl 00 // Color Blanco
    movk x10, 0x0000, lsl 16 
    mov x11, #150 // Posición Y final
    mov x12, #430  // Posición X final
    mov x13, #111  // Posición Y inicial
    mov x14, #400  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    mov x0, x20   
    movz x10, 0xFFFF, lsl 00 // Color Celeste
    movk x10, 0xFFFF, lsl 16 
    mov x11, #142 // Posición Y final
    mov x12, #422  // Posición X final
    mov x13, #119  // Posición Y inicial
    mov x14, #409  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    //---------------------------- 2º NUMERO "2" ---------------------------//
    
    mov x0, x20   
    movz x10, 0x0000, lsl 00 // Color Blanco
    movk x10, 0x0000, lsl 16 
    mov x11, #150 // Posición Y final
    mov x12, #470  // Posición X final
    mov x13, #111  // Posición Y inicial
    mov x14, #440  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    mov x0, x20   
    movz x10, 0xFFFF, lsl 00 // Color Blanco
    movk x10, 0xFFFF, lsl 16 
    mov x11, #129 // Posición Y final
    mov x12, #460  // Posición X final
    mov x13, #120  // Posición Y inicial
    mov x14, #440  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    mov x0, x20   
    movz x10, 0xFFFF, lsl 00 // Color Blanco
    movk x10, 0xFFFF, lsl 16 
    mov x11, #143 // Posición Y final
    mov x12, #470  // Posición X final
    mov x13, #134  // Posición Y inicial
    mov x14, #450  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    //---------------------------- NUMERO "5" ---------------------------//
    
    mov x0, x20   
    movz x10, 0x0000, lsl 00 // Color Blanco
    movk x10, 0x00, lsl 16 
    mov x11, #150 // Posición Y final
    mov x12, #510  // Posición X final
    mov x13, #111  // Posición Y inicial
    mov x14, #480  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    mov x0, x20   
    movz x10, 0xFFFF, lsl 00 // Color Blanco
    movk x10, 0x00FF, lsl 16 
    mov x11, #129 // Posición Y final
    mov x12, #510  // Posición X final
    mov x13, #120  // Posición Y inicial
    mov x14, #490  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    mov x0, x20   
    movz x10, 0xFFFF, lsl 00 // Color Blanco
    movk x10, 0x00FF, lsl 16 
    mov x11, #143 // Posición Y final
    mov x12, #500  // Posición X final
    mov x13, #134  // Posición Y inicial
    mov x14, #480  // Posición X inicial
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo

    ldr x30, [sp, #0] // Recuperar el link register
    add sp, sp, #8 
    
    ret 


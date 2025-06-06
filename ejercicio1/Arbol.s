.global arbol
.equ SCREEN_WIDTH, 640
arbol:

    sub sp, sp, #8 // Reservar espacio en la pila
    str x30, [sp, #0] // Guardar dirección base del framebuffer
    

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


    //Hojas Del Arbol(Arriba)

    mov x0, x20               // framebuffer base
    mov x1, #60             // centro_x
    mov x2, #50             // centro_y
    mov x3, #80              // a (radio horizontal)
    mov x4, #50              // b (radio vertical)
    movz w5, #0x0080         
    movk w5, #0x0080, lsl 16 // Rosa Oscuro 
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #65            // centro_x
    mov x2, #47             // centro_y
    mov x3, #77              // a (radio horizontal)
    mov x4, #47              // b (radio vertical)
    movz w5, #0x69B4         
    movk w5, #0xFFFF, lsl #16 // Rosa Claro
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #240             // centro_x
    mov x2, #20             // centro_y
    mov x3, #80              // a (radio horizontal)
    mov x4, #70              // b (radio vertical)
    movz w5, #0x0080         
    movk w5, #0x0080, lsl 16 // Rosa Oscuro 
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #237             // centro_x
    mov x2, #17             // centro_y
    mov x3, #77              // a (radio horizontal)
    mov x4, #67              // b (radio vertical)
    movz w5, #0x69B4         
    movk w5, #0xFFFF, lsl #16 // Rosa Claro
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #173             // centro_x
    mov x2, #20             // centro_y
    mov x3, #90              // a (radio horizontal)
    mov x4, #70              // b (radio vertical)
    movz w5, #0x0080         
    movk w5, #0x0080, lsl 16 // Rosa Oscuro 
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #170             // centro_x
    mov x2, #17             // centro_y
    mov x3, #87              // a (radio horizontal)
    mov x4, #67              // b (radio vertical)
    movz w5, #0x69B4         
    movk w5, #0xFFFF, lsl #16 // Rosa Claro
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #20             // centro_x
    mov x2, #10             // centro_y
    mov x3, #80              // a (radio horizontal)
    mov x4, #70              // b (radio vertical)
    movz w5, #0x0080         
    movk w5, #0x0080, lsl 16 // Rosa Oscuro 
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #17             // centro_x
    mov x2, #10             // centro_y
    mov x3, #77              // a (radio horizontal)
    mov x4, #67              // b (radio vertical)
    movz w5, #0x69B4         
    movk w5, #0xFFFF, lsl #16 // Rosa Claro
    bl dibujar_elipse

    // Arbusto Debajo del Arbol
    mov x0, x20               // framebuffer base
    mov x1, #105              // centro_x
    mov x2, #390              // centro_y
    mov x3, #40               // radio
    movz x4, 0xCD32, lsl 00   // Verde Claro
    movk x4, 0x0032, lsl 16
    bl dibujar_circulo

    mov x0, x20               // framebuffer base
    mov x1, #100              // centro_x
    mov x2, #400              // centro_y
    mov x3, #42               // radio
    movz x4, 0x8B22, lsl 00   // Verde Oscuro
    movk x4, 0x0022, lsl 16
    bl dibujar_circulo


    mov x0, x20               // framebuffer base
    mov x1, #185              // centro_x
    mov x2, #380              // centro_y
    mov x3, #40               // radio
    movz x4, 0xCD32, lsl 00   // Verde Claro
    movk x4, 0x0032, lsl 16
    bl dibujar_circulo


    mov x0, x20               // framebuffer base
    mov x1, #190              // centro_x
    mov x2, #390              // centro_y
    mov x3, #42               // radio
    movz x4, 0x8B22, lsl 00   // Verde Oscuro
    movk x4, 0x0022, lsl 16
    bl dibujar_circulo




    mov x0, x20               // framebuffer base
    mov x1, #145              // centro_x
    mov x2, #400              // centro_y
    mov x3, #40               // radio
    movz x4, 0xCD32, lsl 00   // Verde Claro
    movk x4, 0x0032, lsl 16
    bl dibujar_circulo


    mov x0, x20               // framebuffer base
    mov x1, #145              // centro_x
    mov x2, #410              // centro_y
    mov x3, #45               // radio
    movz x4, 0x8B22, lsl 00   // Verde Oscuro
    movk x4, 0x0022, lsl 16
    bl dibujar_circulo


    //Hojas del Arbol Caidas
    mov x0, x20               // framebuffer base
    mov x1, #295             // centro_x
    mov x2, #360             // centro_y
    mov x3, #15              // a (radio horizontal)
    mov x4, #10                // b (radio vertical)
    movz w5, #0x0080         
    movk w5, #0x0080, lsl 16 // Rosa Oscuro 
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #295             // centro_x
    mov x2, #360             // centro_y
    mov x3, #12              // a (radio horizontal)
    mov x4, #7             // b (radio vertical)
    movz w5, 0x69B4, lsl 00   // Rosa Claro
    movk w5, 0xFFFF, lsl 16
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #270             // centro_x
    mov x2, #355             // centro_y
    mov x3, #18              // a (radio horizontal)
    mov x4, #10              // b (radio vertical)
    movz w5, #0x0080         
    movk w5, #0x0080, lsl 16 // Rosa Oscuro 
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #270             // centro_x
    mov x2, #355             // centro_y
    mov x3, #15              // a (radio horizontal)
    mov x4, #7              // b (radio vertical)
    movz w5, 0x69B4, lsl 00   // Rosa Claro
    movk w5, 0xFFFF, lsl 16
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #255             // centro_x
    mov x2, #370             // centro_y
    mov x3, #18              // a (radio horizontal)
    mov x4, #10              // b (radio vertical)
    movz w5, #0x0080         
    movk w5, #0x0080, lsl 16 // Rosa Oscuro 
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #255             // centro_x
    mov x2, #370             // centro_y
    mov x3, #15              // a (radio horizontal)
    mov x4, #7              // b (radio vertical)
    movz w5, 0x69B4, lsl 00   // Rosa Claro
    movk w5, 0xFFFF, lsl 16
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #255             // centro_x
    mov x2, #345             // centro_y
    mov x3, #15              // a (radio horizontal)
    mov x4, #10                // b (radio vertical)
    movz w5, #0x0080         
    movk w5, #0x0080, lsl 16 // Rosa Oscuro 
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #255             // centro_x
    mov x2, #345             // centro_y
    mov x3, #12              // a (radio horizontal)
    mov x4, #7             // b (radio vertical)
    movz w5, 0x69B4, lsl 00   // Rosa Claro
    movk w5, 0xFFFF, lsl 16
    bl dibujar_elipse
    
    //---------------- Hojas Cayendo -----------------------//

    mov x0, x20               // framebuffer base
    mov x1, #255             // centro_x
    mov x2, #155             // centro_y
    mov x3, #7              // a (radio horizontal)
    mov x4, #10                // b (radio vertical)
    movz w5, #0x0080         
    movk w5, #0x0080, lsl 16 // Rosa Oscuro 
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #255             // centro_x
    mov x2, #155             // centro_y
    mov x3, #4              // a (radio horizontal)
    mov x4, #7             // b (radio vertical)
    movz w5, 0x69B4, lsl 00   // Rosa Claro
    movk w5, 0xFFFF, lsl 16
    bl dibujar_elipse

    ldr x30, [sp, #0] // Recuperar dirección base del framebuffer
    add sp, sp, #8 // Liberar espacio en la pila    

    ret

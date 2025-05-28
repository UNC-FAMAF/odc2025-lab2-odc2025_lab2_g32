.global dibujar_cuadrado
.global dibujar_rectangulo
.global main  
  
dibujar_cuadrado:
		mov x0, x20             // Dirección base del framebuffer  
cuad_y_loop:
    mov x7, x11      // X inicial
cuad_x_loop:
    // Calcula la dirección del píxel: x0 + (y * SCREEN_WIDTH + x) * 4
    mul x8, x6, x5             // y * SCREEN_WIDTH
    add x8, x8, x7             // + x
    lsl x8, x8, 2              // * 4 (bytes por píxel)
    add x9, x0, x8             // Dirección final

    stur w10, [x9]             // Escribe el color

    add x7, x7, 1              // x++
    cmp x7, x4
    blt cuad_x_loop            // Si x < ancho, sigue

    add x6, x6, 1              // y++
    cmp x6, x3
    blt cuad_y_loop            // Si y < alto, sigue

    ret

dibujar_rectangulo:
    mov x0, x20                // Dirección base del framebuffer
    movz x10, 0x00, lsl 00   // Color: verde (por ejemplo)
    movk x10, 0x0000, lsl 16

    mov x3, 240            // Alto del rectángulo (Y)
    mov x4, 320             // Ancho del rectángulo (X)
    mov x5, 640       // Ancho de la pantalla

    mov x6, 120         // Y inicial  
rect_y_loop:
    mov x7, 160      // X inicial
rect_x_loop:
    // Calcula la dirección del píxel: x0 + (y * SCREEN_WIDTH + x) * 4
    mul x8, x6, x5             // y * SCREEN_WIDTH
    add x8, x8, x7             // + x
    lsl x8, x8, 2              // * 4 (bytes por píxel)
    add x9, x0, x8             // Dirección final

    stur w10, [x9]             // Escribe el color

    add x7, x7, 1              // x++
    cmp x7, x4
    blt rect_x_loop            // Si x < ancho, sigue

    add x6, x6, 1              // y++
    cmp x6, x3
    blt rect_y_loop            // Si y < alto, sigue

    ret




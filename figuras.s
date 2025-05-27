.global dibujar_rectangulo
.blobal dibujar_circulo
.global dibujar_triangulo
.global dibujar_rectangulo

dibujar_rectangulo:
    mov x10. x2  // x inicial
    mov x11, x3  // y inicial
    mov x12, x4  // ancho del rectngulo
    mov x13, x5  // alto del rectangulo
    mov x14, x1  // SCREEN_WIDTH
    mov x15, x6 // color

    mov x16, 0 // contador de filas
rect_y_loop:
    mov x17, 0 // contador de columnas
rect_x_loop:
    //
    add x18, x11, x16   // y inicial + contador de filas
    mul x19, x18, x14   // y * SCREEN_WIDTH
    add x20, x10, x17   // x inicial + contador de columnas
    add x21, x19, x20   // y * SCREEN_WIDTH + x inicial + contador de columnas
    lsl x22, x21, 2     // (y * SCREEN_WIDTH + x inicial + contador de columnas) * 4
    add x23, x0, x22    // dirección del pixel

    stur w15, [x23]     // Escribe el color en la dirección del pixel
    
    add x17, x17, 1     // contador de columnas++

    cmp x17, x12        // compara contador de columnas con ancho
    blt rect_x_loop     // si contador de columnas < ancho, sigue

    add x16, x16, 1     // contador de filas++
    cmp x16, x13        // compara contador de filas con alto
    blt rect_y_loop     // si contador de filas < alto, sigue

    ret

dibujar_circulo:
    mov x10, x2         // x_centro
    mov x11, x3         // y_centro
    mov x12, x4         // radio
    mov x14, x1         // SCREEN_WIDTH
    mov x15, x6         // color

    mov x6,0            // y = 0
circle_y_loop:
    mov x7,0            // x= 0
circle_x_loop:
    sub x16, x7, x10    // dx = x - x_centro
    sub x17, x6, x11    // dy = y - y_centro
    mul x18, x16, x16   // dx^2
    mul x19, x17, x17   // dy^2
    add x20, x18, x19   // dx^2 + dy^2
    mul x21, x12, x12   // radio^2
    cmp x20, x21        // compara dx^2 + dy^2 con radio^2
    bge circle_skip     // si dx^2 + dy^2 > radio^2, salta
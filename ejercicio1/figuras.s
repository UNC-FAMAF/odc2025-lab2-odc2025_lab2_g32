.global dibujar_cuadrado
.global dibujar_rectangulo
.global dibujar_circulo
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

//Funcion de nacho  |
                    

/*dibujar_circulo:
        mov x0, x20                // framebuffer_base
        mov x5, #640               // SCREEN_WIDTH
    
        // Carga el Color 
        movz x10, 0xF022, lsl 0    // amarillo 
        movk x10, 0x00FF, lsl 16   

        // Define las coordenadas del centro del círculo y su radio.
        mov x11, #550           // centro_x
        mov x12, #100           // centro_y
        mov x13, #70            // radio

        mov x6, #0             // y = 0
circle_y_loop:
        mov x7, #0             // x = 0
circle_x_loop:
        sub x14, x7, x11       // dx = x - centro_x
        sub x15, x6, x12       // dy = y - centro_y
        mul x16, x14, x14      // dx²
        mul x17, x15, x15      // dy²
        add x18, x16, x17      // dx² + dy²
        mul x19, x13, x13      // r²
        cmp x18, x19           // Comparar con r^2, ¿(dx² + dy²) ≤ r²?
        bge no_circle_pixel    // Si (dx² + dy²) ≥ r², no pintes


        // dirección framebuffer = base + ((y * ancho) + x) * 4
        mul x8, x6, x5
        add x8, x8, x7
        lsl x8, x8, #2
        add x9, x0, x8
        stur w10, [x9]

no_circle_pixel:
        add x7, x7, #1
        cmp x7, #640            // x < 640, para x: recorrer hasta el ancho de pantalla
        blt circle_x_loop

        add x6, x6, #1
        cmp x6, #480            // y < 480, para y: recorrer hasta el alto de pantalla
        blt circle_y_loop

    ret
*/

dibujar_circulo:

// Define las coordenadas del centro del círculo y su radio.
    mov x5, x1          // centro_x
    mov x6, x2          // centro_y
    mov x7, x3          // radio
    mov w10, w4         // color en w10 (32 bits)

    mov x8, #0          // y = 0

circle_y_loop:
    mov x9, #0          // x = 0

circle_x_loop:
    sub x11, x9, x5      // dx = x - centro_x
    sub x12, x8, x6      // dy = y - centro_y
    mul x13, x11, x11    // dx²
    mul x14, x12, x12    // dy²
    add x15, x13, x14    // dx² + dy²
    mul x16, x7, x7      // r²
    cmp x15, x16         // Comparar con r^2, ¿(dx² + dy²) ≤ r²?
    bge no_circle_pixel  // Si (dx² + dy²) ≥ r², no pintes

    // dirección framebuffer = base + ((y * ancho) + x) * 4
    mov x17, #640       // SCREEN_WIDTH, o pasar como parámetro si quieres
    mul x18, x8, x17
    add x18, x18, x9
    lsl x18, x18, #2
    add x19, x0, x18
    stur w10, [x19]

no_circle_pixel:
    add x9, x9, #1
    cmp x9, #640
    blt circle_x_loop

    add x8, x8, #1
    cmp x8, #480
    blt circle_y_loop

    ret

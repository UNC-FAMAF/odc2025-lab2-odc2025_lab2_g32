.globl dibujar_circulo
.globl dibujar_rectangulo
.globl dibujar_elipse


dibujar_circulo:

// Define las coordenadas del centro del círculo y su radio.
    mov x5, x1          // centro_x
    mov x6, x2          // centro_y
    mov x7, x3          // radio

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
    stur w4, [x19]

no_circle_pixel:
    add x9, x9, #1
    cmp x9, #640
    blt circle_x_loop

    add x8, x8, #1
    cmp x8, #480
    blt circle_y_loop
    
    ret

dibujar_rectangulo:
    mov x3, x11           // Alto del rectángulo (Y)
    mov x4, x12             // Ancho del rectángulo (X)

    mov x6, x13         // Y inicial  
rect_y_loop:
    mov x7, x14      // X inicial
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


 // Parámetros:
// x0 = dirección base del framebuffer
// x1 = centro_x
// x2 = centro_y
// x3 = a (radio horizontal)
// x4 = b (radio vertical)
// w5 = color (ARGB 32 bits)
dibujar_elipse:
    mov x6, #0              // y = 0

.loop_y:
    mov x7, #0              // x = 0

.loop_x:

sub x8, x7, x1               // dx = x - centro_x
    mul x9, x8, x8          // dx²

    
    sub x10, x6, x2         // dy = y - centro_y
    mul x11, x10, x10       // dy²

    // a² y b²
    mul x12, x3, x3         // a²
    mul x13, x4, x4         // b²

    // dx² * b² + dy² * a²
    mul x14, x9, x13
    mul x15, x11, x12
    add x16, x14, x15       // numerador

    // a² * b²
    mul x17, x12, x13       // denominador

    cmp x16, x17
    bgt .skip_pixel

    // dirección framebuffer = framebuffer + ((y * ancho + x) * 4)
    mov x18, #640
    mul x19, x6, x18
    add x19, x19, x7
    lsl x19, x19, #2
    add x21, x0, x19
    stur w5, [x21]          // escribir color (ARGB)

.skip_pixel:
    add x7, x7, #1
    cmp x7, #640
    blt .loop_x

    add x6, x6, #1
    cmp x6, #480
    blt .loop_y

    ret


//---------------------------------- FIN -------------------------------//


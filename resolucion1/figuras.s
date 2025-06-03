.globl dibujar_circulo
.globl dibujar_triangulo_vertices
.globl dibujar_rectangulo
.globl main

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


    
dibujar_triangulo_vertices:
    // Guardar los vértices originales en registros temporales
    mov x9,  x3 // vx0
    mov x10, x4 // vy0
    mov x11, x5 // vx1
    mov x12, x6 // vy1
    mov x13, x7 // vx2
    mov x14, x8 // vy2

    // Ordenar los vértices por Y (vy0 <= vy1 <= vy2)
    // Si vy0 > vy1, intercambiar (vx0,vy0) <-> (vx1,vy1)
    cmp x10, x12
    ble 1f
    mov x15, x9
    mov x9,  x11
    mov x11, x15
    mov x15, x10
    mov x10, x12
    mov x12, x15
1:
    // Si vy0 > vy2, intercambiar (vx0,vy0) <-> (vx2,vy2)
    cmp x10, x14
    ble 2f
    mov x15, x9
    mov x9,  x13
    mov x13, x15
    mov x15, x10
    mov x10, x14
    mov x14, x15
2:
    // Si vy1 > vy2, intercambiar (vx1,vy1) <-> (vx2,vy2)
    cmp x12, x14
    ble 3f
    mov x15, x11
    mov x11, x13
    mov x13, x15
    mov x15, x12
    mov x12, x14
    mov x14, x15
3:
    // Ahora: (x9,x10) = v0, (x11,x12) = v1, (x13,x14) = v2, con y ordenado

    // Calcular diferencias
    sub x16, x12, x10      // dy01 = vy1 - vy0
    sub x17, x14, x10      // dy02 = vy2 - vy0
    sub x18, x14, x12      // dy12 = vy2 - vy1

    // Si dy02 == 0, triángulo degenerado
    cbz x17, dtv_end

    // Bucle para cada scanline (y)
    mov x19, x10         // y = vy0
dtv_y_loop:
    cmp x19, x14
    bgt dtv_end

    // Calcular xA (interpolación entre v0 y v2)
    sub x20, x19, x10    // y - vy0
    sub x21, x13, x9     // vx2 - vx0
    mul x21, x21, x20
    sdiv x21, x21, x17   // (vx2-vx0)*(y-vy0)/(vy2-vy0)
    add x22, x9, x21     // xA = vx0 + ...

    // Calcular xB (interpolación entre v0-v1 o v1-v2)
    cmp x19, x12
    ble dtv_upper
    // Parte baja (v1-v2)
    sub x23, x14, x12     // vy2 - vy1
    cbz x23, dtv_next_y
    sub x24, x19, x12     // y - vy1
    sub x25, x13, x11     // vx2 - vx1
    mul x25, x25, x24
    sdiv x25, x25, x23
    add x26, x11, x25     // xB = vx1 + ...
    b dtv_draw_line
dtv_upper:
    // Parte alta (v0-v1)
    sub x23, x12, x10     // vy1 - vy0
    cbz x23, dtv_next_y
    sub x24, x19, x10     // y - vy0
    sub x25, x11, x9      // vx1 - vx0
    mul x25, x25, x24
    sdiv x25, x25, x23
    add x26, x9, x25      // xB = vx0 + ...
dtv_draw_line:
    // Ordenar x22 y x26
    cmp x22, x26
    ble dtv_x_ok
    mov x27, x22
    mov x22, x26
    mov x26, x27
dtv_x_ok:
    // Pintar línea horizontal entre x22 y x26 en la fila x19
    mov x28, x22
dtv_x_loop:
    cmp x28, x26
    bgt dtv_next_y

    // dirección framebuffer = base + ((y * ancho) + x) * 4
    mul x29, x19, x1
    add x29, x29, x28
    lsl x29, x29, #2
    add x30, x0, x29
    stur w2, [x30]

    add x28, x28, #1
    b dtv_x_loop

dtv_next_y:
    add x19, x19, #1
    b dtv_y_loop

dtv_end:
    ret



.global dibujar_circulo
.global main

dibujar_circulo:
    mov x0, x20                // Dirección base del framebuffer
    movz x10, 0xB6D4, lsl 00   // Color: rojo (formato RGB565)
    movk x10, 0xEF, lsl 16

    mov x11, 320               // xc (centro x)
    mov x12, 240               // yc (centro y)
    mov x13, 240                // radio

    mov x6, 0                  // y = 0
circle_y_loop:
    mov x7, 0                  // x = 0
circle_x_loop:
    // dx = x - xc
    sub x14, x7, x11
    // dy = y - yc
    sub x15, x6, x12
    // dxdx
    mul x16, x14, x14
    // dydy
    mul x17, x15, x15
    // dxdx + dydy
    add x18, x16, x17
    // radioradio
    mul x19, x13, x13
    // Si (dxdx + dydy) < radioradio, pintar
    cmp x18, x19
    bge no_circle_pixel

    // Calcula la dirección del píxel: x0 + (y * SCREEN_WIDTH + x) * 4
    mul x8, x6, x5
    add x8, x8, x7
    lsl x8, x8, 2
    add x9, x0, x8
    stur w10, [x9]

no_circle_pixel:
    add x7, x7, 1
    cmp x7, 640                // Limita el área de dibujo
    blt circle_x_loop

    add x6, x6, 1
    cmp x6, 480                // Limita el área de dibujo
    blt circle_y_loop

    ret
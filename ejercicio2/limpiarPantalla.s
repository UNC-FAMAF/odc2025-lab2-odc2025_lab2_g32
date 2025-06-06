// limpiar_pantalla
// Entrada: x0 = dirección base del framebuffer
//          w1 = color de fondo (ARGB, por ejemplo 0x00000000 para negro)

.globl limpiar_pantalla
limpiar_pantalla:
movz x3, #0xB400        // 0xB400 = 46080
movk x3, #0x0004, lsl #16 // (0x0004 << 16 = 0x40000) → total: 0x0004B400 = 307200

.loop_limpiar:
    lsl x4, x2, #2              // multiplicar por 4 (offset en bytes)
    add x5, x0, x4              // dirección del píxel
    stur w1, [x5]               // escribir color (ARGB)

    add x2, x2, #1              // siguiente píxel
    cmp x2, x3
    blt .loop_limpiar

    ret
/*
Implementacion en el main

mov x0, x20           // framebuffer base
mov w1, #0x0000       // negro
bl limpiar_pantalla

bl limpiar_pantalla 
*/

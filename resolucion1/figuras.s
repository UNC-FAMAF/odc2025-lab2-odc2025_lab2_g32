mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0xFF, lsl 16 
mov x11, #150 // Posición Y final
mov x12, #310  // Posición X final
mov x13, #111  // Posición Y inicial
mov x14, #280  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0x9DFF, lsl 00 // Color Celeste
mov x11, #129 // Posición Y final
mov x12, #300  // Posición X final
mov x13, #120  // Posición Y inicial
mov x14, #280  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0x9DFF, lsl 00 // Color Celeste
mov x11, #143 // Posición Y final
mov x12, #310  // Posición X final
mov x13, #134  // Posición Y inicial
mov x14, #290  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

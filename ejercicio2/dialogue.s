.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.globl dialogue 


dialogue:
    
    sub sp, sp, #56      // guardar registros
    str x0, [sp, #0]
    str x1, [sp, #8]
    str x2, [sp, #16]
    str x3, [sp, #24]
    str x4, [sp, #32]
    str x5, [sp, #40]
    str x30, [sp, #48]
   
   
   //------------------------- Globo ---------------------------//
   //cuadrado grande
   mov x0, x20   
   movz x10, 0xC0C0, lsl 00 // Color Negro
   movk x10, 0x00C0, lsl 16 
   mov x11, #175 // Posición Y final
   mov x12, #625  // Posición X final
   mov x13, #85  // Posición Y inicial
   mov x14, #310  // Posición X inicial
   mov x5, SCREEN_WIDTH // Ancho de la pantalla	
   bl dibujar_rectangulo

   mov x0, x20   
   movz x10, 0xFFFF, lsl 00 // Color Negro
   movk x10, 0xFFFF, lsl 16 
   mov x11, #170 // Posición Y final
   mov x12, #620  // Posición X final
   mov x13, #90  // Posición Y inicial
   mov x14, #315  // Posición X inicial
   mov x5, SCREEN_WIDTH // Ancho de la pantalla	
   bl dibujar_rectangulo

   //Triangulo, 1ro contornos, 2do rellenos

   mov x0, x20   
   movz x10, 0xC0C0, lsl 00 // Color Negro
   movk x10, 0x00C0, lsl 16 
   mov x13, #175  // Posición Y inicial
   mov x14, #430  // Posición X inicial
   mov x11, #195 // Posición Y final
   mov x12, #460  // Posición X final
   mov x5, SCREEN_WIDTH // Ancho de la pantalla	
   bl dibujar_rectangulo


   
   mov x0, x20   
   movz x10, 0xC0C0, lsl 00 // Color Negro
   movk x10, 0x00C0, lsl 16 
   mov x13, #175  // Posición Y inicial
   mov x14, #440  // Posición X inicial
   mov x11, #220 // Posición Y final
   mov x12, #460  // Posición X final
   mov x5, SCREEN_WIDTH // Ancho de la pantalla	
   bl dibujar_rectangulo

      
   mov x0, x20   
   movz x10, 0xC0C0, lsl 00 // Color Negro
   movk x10, 0x00C0, lsl 16 
   mov x13, #205  // Posición Y inicial
   mov x14, #450  // Posición X inicial
   mov x11, #245 // Posición Y final
   mov x12, #465  // Posición X final
   mov x5, SCREEN_WIDTH // Ancho de la pantalla	
   bl dibujar_rectangulo
 
   mov x0, x20   
   movz x10, 0xFFFF, lsl 00 // Color Negro
   movk x10, 0x00FF, lsl 16 
   mov x11, #215 // Posición Y final
   mov x12, #455  // Posición X final
   mov x13, #95  // Posición Y inicial
   mov x14, #443  // Posición X inicial
   mov x5, SCREEN_WIDTH // Ancho de la pantalla	
   bl dibujar_rectangulo


   mov x0, x20   
   movz x10, 0xFFFF, lsl 00 // Color Negro
   movk x10, 0xFFFF, lsl 16 
   mov x13, #90  // Posición Y inicial
   mov x14, #435  // Posición X inicial
   mov x11, #190 // Posición Y final
   mov x12, #455  // Posición X final
   mov x5, SCREEN_WIDTH // Ancho de la pantalla	
   bl dibujar_rectangulo
   
   mov x0, x20   
   movz x10, 0xFFFF, lsl 00 // Color Negro
   movk x10, 0xFFFF, lsl 16 
   mov x13, #210  // Posición Y inicial
   mov x14, #455  // Posición X inicial
   mov x11, #240 // Posición Y final
   mov x12, #460  // Posición X final
   mov x5, SCREEN_WIDTH // Ancho de la pantalla	
   bl dibujar_rectangulo
 
    // Restaurar registros desde la pila
    ldr x0, [sp, #0]
    ldr x1, [sp, #8]
    ldr x2, [sp, #16]
    ldr x3, [sp, #24]       
    ldr x4, [sp, #32]
    ldr x5, [sp, #40]
    ldr x30, [sp, #48]        
    add sp, sp, #56            // Y Size #48        


ret


/*

   Pensamienot anterior
    mov x0, x20               // framebuffer base
    mov x1, #490               // centro_x
    mov x2, #235               // centro_y
    mov x3, #15                // radio
    mov w4, #0xC0C0C0C0        // gris (ARGB)
    bl dibujar_circulo

    mov x0, x20               // framebuffer base
    mov x1, #490              // centro_x
    mov x2, #235               // centro_y
    mov x3, #11                // radio
    mov w4, #0xFFFFFFFF        // rosa blanco
    bl dibujar_circulo

    mov x0, x20               // framebuffer base
    mov x1, #460               // centro_x
    mov x2, #200               // centro_y
    mov x3, #21                // radio
    mov w4, #0xC0C0C0C0        // gris (ARGB)
    bl dibujar_circulo

    mov x0, x20               // framebuffer base
    mov x1, #460              // centro_x
    mov x2, #200               // centro_y
    mov x3, #17                // radio
    mov w4, #0xFFFFFFFF        // rosa blanco
    bl dibujar_circulo

    mov x0, x20               // framebuffer base
    mov x1, #370             // centro_x
    mov x2, #130             // centro_y
    mov x3, #165              // a (radio horizontal)
    mov x4, #55              // b (radio vertical)
    movz w5, #0xC0C0         // parte baja: azul
    movk w5, #0x00C0, lsl #16 // parte alta: rojo → color: magenta (0x00FF00FF)
    bl dibujar_elipse


    mov x0, x20               // framebuffer base
    mov x1, #370             // centro_x
    mov x2, #130             // centro_y
    mov x3, #160              // a (radio horizontal)
    mov x4, #50              // b (radio vertical)
    movz w5, #0xFFFF         // parte baja: azul
    movk w5, #0xFFFF, lsl #16 // parte alta: rojo → color: magenta (0x00FF00FF)
    bl dibujar_elipse

 */



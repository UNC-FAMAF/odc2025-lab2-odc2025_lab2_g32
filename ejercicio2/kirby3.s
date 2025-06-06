.globl kirby3


kirby3:
    

    sub sp, sp, #56      // guardar registros
    str x0, [sp, #0]
    str x1, [sp, #8]
    str x2, [sp, #16]
    str x3, [sp, #24]
    str x4, [sp, #32]
    str x5, [sp, #40]
    str x30, [sp, #48]
    
    mov x0, x20               // framebuffer base
    mov x1, #520               // centro_x
    mov x2, #340               // centro_y
    mov x3, #88                // radio
    mov w4, #0x800080        // Rosa Oscuro
    bl dibujar_circulo

    mov x0, x20               // framebuffer base
    mov x1, #520               // centro_x
    mov x2, #340               // centro_y
    mov x3, #80                // radio
    mov w4, 0x1493        // Rosa Claro
    movk w4, 0xFF, lsl 16
    bl dibujar_circulo

    mov x0, x20               // framebuffer base
    mov x1, #514               // centro_x
    mov x2, #341               // centro_y
    mov x3, #77                // radio
    mov w4, #0xFFFF69B4        // rosa claro
    bl dibujar_circulo


    //kirby Sonrisa

    mov x0, x20               // framebuffer base
    mov x1, #495               // centro_x
    mov x2, #360               // centro_y
    mov x3, #30                // radio
    mov w4, #0xFFFF1493        // rosa oscuro (ARGB)0x00000000
    bl dibujar_circulo

    mov x0, x20               // framebuffer base
    mov x1, #495               // centro_x
    mov x2, #340               // centro_y
    mov x3, #35                // radio
    mov w4, #0xFFFF69B4	       // rosa claro (ARGB)
    bl dibujar_circulo

    //cachetes

    mov x0, x20               // framebuffer base
    mov x1, #455             // centro_x
    mov x2, #340             // centro_y
    mov x3, #6              // a (radio horizontal)
    mov x4, #10              // b (radio vertical)
    movz w5, #0x1493         // parte baja: azul
    movk w5, #0xFFFF, lsl #16 // parte alta: rojo → color: magenta (0x00FF00FF)
    bl dibujar_elipse

    mov x1, #555             // centro_x
    mov x2, #350             // centro_y
    mov x3, #13              // a (radio horizontal)
    mov x4, #12              // b (radio vertical)
    movz w5, #0x1493         // parte baja: azul
    movk w5, #0xFFFF, lsl #16 // parte alta: rojo → color: magenta (0x00FF00FF)
    bl dibujar_elipse

    // Ojos cerrados
    mov x0, x20              // framebuffer base
    mov x1, #480             // centro_x
    mov x2, #315             // centro_y
    mov x3, #12               // a (radio horizontal)
    mov x4, #2              // b (radio vertical)
    movz w5, #0x0000         // parte baja: azul
    movk w5, #0x0000, lsl #16 // parte alta: rojo → color: magenta (0x00FF00FF)
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #525             // centro_x
    mov x2, #318             // centro_y
    mov x3, #12              // a (radio horizontal)
    mov x4, #2              // b (radio vertical)
    movz w5, #0x0000         // parte baja: azul
    movk w5, #0x0000, lsl #16 // parte alta: rojo → color: magenta (0x00FF00FF)
    bl dibujar_elipse


    // Zapatos

    mov x0, x20               // framebuffer base
    mov x1, #455             // centro_x
    mov x2, #405             // centro_y
    mov x3, #12              // a (radio horizontal)
    mov x4, #25              // b (radio vertical)
    movz w5, #0x0000         // Parte baja: 0x143C
    movk w5, #0x00FF, lsl #16 // Parte alta: 0x00DC0000
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #505             // centro_x
    mov x2, #418             // centro_y
    mov x3, #12              // a (radio horizontal)
    mov x4, #25              // b (radio vertical)
    movz w5, #0x0000         // parte baja: azul
    movk w5, #0x00FF, lsl #16 // Parte alta: 0x00DC0000
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #455             // centro_x
    mov x2, #405             // centro_y
    mov x3, #7              // a (radio horizontal)
    mov x4, #20              // b (radio vertical)
    movz w5, #0x143C         // Parte baja: 0x143C
    movk w5, #0x00DC, lsl #16  // Parte alta: 0x00DC0000

    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #505             // centro_x
    mov x2, #418             // centro_y
    mov x3, #7              // a (radio horizontal)
    mov x4, #20              // b (radio vertical)
    movz w5, #0x143C         // Parte baja: 0x143C
    movk w5, #0x00DC, lsl #16  // Parte alta: 0x00DC0000

    bl dibujar_elipse

    //Manitos
    //Izq
    mov x0, x20               // framebuffer base
    mov x1, #426             // centro_x
    mov x2, #340             // centro_y
    mov x3, #20              // a (radio horizontal)
    mov x4, #19              // b (radio vertical)
    movz w5, #0x0080         
    movk w5, #0x0080, lsl 16 // Rosa Oscuro 
    bl dibujar_elipse

    mov x0, x20               // framebuffer base
    mov x1, #427             // centro_x
    mov x2, #340             // centro_y
    mov x3, #18              // a (radio horizontal)
    mov x4, #13              // b (radio vertical)
    movz w5, #0x69B4         
    movk w5, #0xFFFF, lsl #16 // Rosa Claro
    bl dibujar_elipse

    //Der
    mov x0, x20               // framebuffer base
    mov x1, #610             // centro_x
    mov x2, #350             // centro_y
    mov x3, #25              // a (radio horizontal)
    mov x4, #18              // b (radio vertical)
    movz w5, #0x0080         
    movk w5, #0x0080, lsl 16 // Rosa Oscuro )
    bl dibujar_elipse


    mov x0, x20               // framebuffer base
    mov x1, #605             // centro_x
    mov x2, #350             // centro_y
    mov x3, #22              // a (radio horizontal)
    mov x4, #15              // b (radio vertical)
    movz w5, #0x69B4         
    movk w5, #0xFFFF, lsl #16 // Rosa Claro
    bl dibujar_elipse

    //------------------------- Pensamiento ---------------------------//

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

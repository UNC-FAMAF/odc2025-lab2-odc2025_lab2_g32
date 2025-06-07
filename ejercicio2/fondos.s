.globl fondo
.equ SCREEN_WIDTH, 		640
fondo:
    
    sub sp, sp, #64      // guardar registros
    str x10, [sp, #0]
    str x11, [sp, #8]
    str x12, [sp, #16]
    str x13, [sp, #24]
    str x14, [sp, #32]
    str x5, [sp, #40]
    str x30, [sp, #56]    // link register  
//------------------------------------Cielo------------------------------------//
    mov x0, x20                
    movz x10, 0x9DFF, lsl 0    
    movk x10, 0x0022, lsl 16
    mov x11, #240          
    mov x12, #640          
    mov x13, #0            
    mov x14, #0            
    mov x5, #640           

    bl dibujar_rectangulo

//-------------------------------Pasto------------------------------------//
    mov x0, x20                
    movz x10, 0x8B22, lsl 00   
    movk x10, 0x0022, lsl 16
    mov x11, #480          
    mov x12, #640          
    mov x13, #240            
    mov x14, #0            
    mov x5, #640           

    bl dibujar_rectangulo

//--------------------Nubes----------------------------//

// Color gris-azulado: 0xFFB0B8C8
    movz w5, #0x4A4A
    movk w5, #0x004A, lsl #16

    // Nube 1 (central)
    mov x0, x20
    mov x1, #570
    mov x2, #50
    mov x3, #28
    mov x4, #16
    bl dibujar_elipse

    // Nube 1 (izquierda)
    mov x0, x20
    mov x1, #545
    mov x2, #55
    mov x3, #16
    mov x4, #11
    bl dibujar_elipse

    // Nube 1 (derecha)
    mov x0, x20
    mov x1, #595
    mov x2, #55
    mov x3, #16
    mov x4, #11
    bl dibujar_elipse

    // Nube 1 (superior)
    mov x0, x20
    mov x1, #570
    mov x2, #38
    mov x3, #12
    mov x4, #8
    bl dibujar_elipse

    // Nube 2 (más a la derecha)
    mov x0, x20
    mov x1, #610
    mov x2, #30
    mov x3, #18
    mov x4, #10
    bl dibujar_elipse

    // Nube 2 (más arriba)
    mov x0, x20
    mov x1, #630
    mov x2, #25
    mov x3, #10
    mov x4, #6
    bl dibujar_elipse

    // Nube 3 (centro-derecha)
    mov x0, x20
    mov x1, #500
    mov x2, #60
    mov x3, #22
    mov x4, #13
    bl dibujar_elipse

    // Nube 4 (centro)
    mov x0, x20
    mov x1, #400
    mov x2, #45
    mov x3, #28
    mov x4, #16
    bl dibujar_elipse

    // Nube 5 (centro-izquierda)
    mov x0, x20
    mov x1, #300
    mov x2, #55
    mov x3, #20
    mov x4, #12
    bl dibujar_elipse


    movz w5, #0xFFFF
    movk w5, #0xFFFF, lsl #16

    // Nube 1 (central)
    mov x0, x20
    mov x1, #570
    mov x2, #50
    mov x3, #25
    mov x4, #13
    bl dibujar_elipse

    // Nube 1 (izquierda)
    mov x0, x20
    mov x1, #545
    mov x2, #55
    mov x3, #13
    mov x4, #8
    bl dibujar_elipse

    // Nube 1 (derecha)
    mov x0, x20
    mov x1, #595
    mov x2, #55
    mov x3, #13
    mov x4, #8
    bl dibujar_elipse

    // Nube 1 (superior)
    mov x0, x20
    mov x1, #570
    mov x2, #38
    mov x3, #9
    mov x4, #5
    bl dibujar_elipse


    // Nube 2 (más a la derecha)
    mov x0, x20
    mov x1, #608
    mov x2, #30
    mov x3, #15
    mov x4, #8
    bl dibujar_elipse

    // Nube 2 (más arriba)
    mov x0, x20
    mov x1, #628
    mov x2, #26
    mov x3, #7
    mov x4, #5
    bl dibujar_elipse

    // Nube 3 (centro-derecha)
    mov x0, x20
    mov x1, #499
    mov x2, #60
    mov x3, #18
    mov x4, #10
    bl dibujar_elipse
   
    // Nube 4 (centro)
    mov x0, x20
    mov x1, #398
    mov x2, #45
    mov x3, #23
    mov x4, #13
    bl dibujar_elipse
    

//-------------------------------Piedras------------------------------------//
    mov x0, x20   
    movz x10, 0x8080, lsl 0    
    movk x10, 0x8080, lsl 16
    mov x13, #270  // Posición Y inicial
    mov x14, #10   // Posición X inicial
    mov x11, #310 // Posición Y final
    mov x12, #30  // Posición X final
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    
    mov x0, x20   
    movz x10, 0xC0C0, lsl 0    
    movk x10, 0x00C0, lsl 16
    mov x13, #275  // Posición Y inicial
    mov x14, #15   // Posición X inicial
    mov x11, #310 // Posición Y final
    mov x12, #35  // Posición X final
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    
    mov x0, x20   
    movz x10, 0x8080, lsl 0    
    movk x10, 0x8080, lsl 16
    mov x13, #295  // Posición Y inicial
    mov x14, #15   // Posición X inicial
    mov x11, #325 // Posición Y final
    mov x12, #65  // Posición X final
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    mov x0, x20   
    movz x10, 0x8080, lsl 0    
    movk x10, 0x8080, lsl 16
    mov x13, #280  // Posición Y inicial
    mov x14, #20   // Posición X inicial
    mov x11, #320 // Posición Y final
    mov x12, #55  // Posición X final
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    mov x0, x20   
    movz x10, 0xC0C0, lsl 0    
    movk x10, 0x00C0, lsl 16
    mov x13, #300  // Posición Y inicial
    mov x14, #20   // Posición X inicial
    mov x11, #320 // Posición Y final
    mov x12, #50  // Posición X final
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    mov x0, x20   
    movz x10, 0xC0C0, lsl 0    
    movk x10, 0x00C0, lsl 16
    mov x13, #285  // Posición Y inicial
    mov x14, #25   // Posición X inicial
    mov x11, #315 // Posición Y final
    mov x12, #45  // Posición X final
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    mov x0, x20   
    movz x10, 0x8080, lsl 0    
    movk x10, 0x8080, lsl 16
    mov x13, #310  // Posición Y inicial
    mov x14, #55   // Posición X inicial
    mov x11, #320 // Posición Y final
    mov x12, #60  // Posición X final
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo
    
    mov x0, x20   
    movz x10, 0x8080, lsl 0    
    movk x10, 0x8080, lsl 16
    mov x13, #305  // Posición Y inicial
    mov x14, #50   // Posición X inicial
    mov x11, #315 // Posición Y final
    mov x12, #55  // Posición X final
    mov x5, SCREEN_WIDTH // Ancho de la pantalla	
    bl dibujar_rectangulo


    ldr x0, [sp, #0]          // recuperar registros
    ldr x10, [sp, #8]
    ldr x11, [sp, #16]
    ldr x12, [sp, #24]
    ldr x13, [sp, #32]
    ldr x14, [sp, #40]
    ldr x5, [sp, #48]
    ldr x30, [sp, #56]
    add sp, sp, #64           // liberar registros


    
    ret

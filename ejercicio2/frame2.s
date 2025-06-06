.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,   32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl frame_2

frame_2:
    sub sp, sp, #80
    str x30, [sp, #0] 
    str x1, [sp, #8] 
    str x2, [sp, #16]
    str x3, [sp, #24] 
    str x4, [sp, #32]
    str x5, [sp, #40]
    str x11, [sp, #48] 
    str x12, [sp, #56]
    str x13, [sp, #64]  
    str x14, [sp, #72] 

 	mov x20, x0	



//---------------------------- LETRA "O" ---------------------------//
// Círculo exterior blanco
mov x0, x20               // framebuffer base
mov x1, #341              // centro_x
mov x2, #135              // centro_y
mov x3, #19          // radio
movz x4, 0x0000, lsl 00   // Negro
movk x4, 0x0000, lsl 16
bl dibujar_circulo

// Círculo interior azul
mov x0, x20               // framebuffer base
mov x1, #341              // centro_x
mov x2, #135              // centro_y
mov x3, #15               // radio
movz x4, 0xFFFF, lsl 00   // Color Blanco
movk x4, 0xFFFF, lsl 16
bl dibujar_circulo

//-------------------------------------------------------------------//


//---------------------------- LETRA "d" ---------------------------//

// Círculo exterior blanco
mov x0, x20               // framebuffer base
mov x1, #385              // centro_x
mov x2, #125              // centro_y
mov x3, #20          // radio
movz x4, 0x0000, lsl 00   // Negro
movk x4, 0x0000, lsl 16
bl dibujar_circulo

// Círculo interior
mov x0, x20               // framebuffer base
mov x1, #385              // centro_x
mov x2, #125              // centro_y
mov x3, #14               // radio
movz x4, 0xFFFF, lsl 00   // Color Blanco
movk x4, 0xFFFF, lsl 16
bl dibujar_circulo

// dibujar el palito de la letra "d"
mov x0, x20   
movz x10, 0x0000, lsl 00 // Color Negro
movk x10, 0x0000, lsl 16 
mov x11, #145 // Posición Y final
mov x12, #379  // Posición X final
mov x13, #106  // Posición Y inicial
mov x14, #366  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

// Fin del palito de la Letra "d"

//---------------------------- LETRA "c" ---------------------------//

// Círculo exterior blanco
mov x0, x20               // framebuffer base
mov x1, #427              // centro_x
mov x2, #127              // centro_y
mov x3, #20          // radio
movz x4, 0x0000, lsl 00   // Negro
movk x4, 0x0000, lsl 16
bl dibujar_circulo

// Círculo interior azul
mov x0, x20               // framebuffer base
mov x1, #432              // centro_x
mov x2, #132              // centro_y
mov x3, #14               // radio
movz x4, 0xFFFF, lsl 00   // Color Blanco
movk x4, 0xFFFF, lsl 16
bl dibujar_circulo


mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0xFFFF, lsl 16  
mov x11, #150 // Posición Y final
mov x12, #460  // Posición X final
mov x13, #111  // Posición Y inicial
mov x14, #439  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo
// Fin de la Letra "c"

//---------------------------- 1º NUMERO "2" ---------------------------//
mov x0, x20   
movz x10, 0x0000, lsl 00 // Color Negro
movk x10, 0x00, lsl 16 
mov x11, #149 // Posición Y final
mov x12, #490  // Posición X final
mov x13, #110  // Posición Y inicial
mov x14, #460  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0xFFFF, lsl 16 
mov x11, #128 // Posición Y final
mov x12, #480  // Posición X final
mov x13, #119  // Posición Y inicial
mov x14, #460  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0xFFFF, lsl 16 
mov x11, #142 // Posición Y final
mov x12, #490  // Posición X final
mov x13, #133  // Posición Y inicial
mov x14, #470  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

//---------------------------- NUMERO "0" ---------------------------//

mov x0, x20   
movz x10, 0x0000, lsl 00 // Color Negro
movk x10, 0x0000, lsl 16 
mov x11, #151 // Posición Y final
mov x12, #530  // Posición X final
mov x13, #112  // Posición Y inicial
mov x14, #500  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0xFFFF, lsl 16 
mov x11, #143 // Posición Y final
mov x12, #522  // Posición X final
mov x13, #120  // Posición Y inicial
mov x14, #509  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

//---------------------------- 2º NUMERO "2" ---------------------------//

mov x0, x20   
movz x10, 0x0000, lsl 00 // Color Negro
movk x10, 0x0000, lsl 16 
mov x11, #149 // Posición Y final
mov x12, #570  // Posición X final
mov x13, #110  // Posición Y inicial
mov x14, #540  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0xFFFF, lsl 16 
mov x11, #128 // Posición Y final
mov x12, #560  // Posición X final
mov x13, #119  // Posición Y inicial
mov x14, #540  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0xFFFF, lsl 16 
mov x11, #143 // Posición Y final
mov x12, #570  // Posición X final
mov x13, #134  // Posición Y inicial
mov x14, #550  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

//---------------------------- NUMERO "5" ---------------------------//

mov x0, x20   
movz x10, 0x0000, lsl 00 // Color Negro
movk x10, 0x00, lsl 16 
mov x11, #151 // Posición Y final
mov x12, #610  // Posición X final
mov x13, #111  // Posición Y inicial
mov x14, #580  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0x00FF, lsl 16 
mov x11, #128 // Posición Y final
mov x12, #610  // Posición X final
mov x13, #119  // Posición Y inicial
mov x14, #590  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0x00FF, lsl 16 
mov x11, #144 // Posición Y final
mov x12, #600  // Posición X final
mov x13, #135  // Posición Y inicial
mov x14, #580  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

//------------------Hojas Del Arbol (Arriba)------------------//
mov x0, x20               // framebuffer base
mov x1, #60             // centro_x
mov x2, #55             // centro_y
mov x3, #80              // a (radio horizontal)
mov x4, #50              // b (radio vertical)
movz w5, #0x0080         
movk w5, #0x0080, lsl 16 // Rosa Oscuro 
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #65            // centro_x
mov x2, #47             // centro_y
mov x3, #77              // a (radio horizontal)
mov x4, #47              // b (radio vertical)
movz w5, #0x69B4         
movk w5, #0xFFFF, lsl #16 // Rosa Claro
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #240             // centro_x
mov x2, #20             // centro_y
mov x3, #80              // a (radio horizontal)
mov x4, #70              // b (radio vertical)
movz w5, #0x0080         
movk w5, #0x0080, lsl 16 // Rosa Oscuro 
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #237             // centro_x
mov x2, #17             // centro_y
mov x3, #77              // a (radio horizontal)
mov x4, #67              // b (radio vertical)
movz w5, #0x69B4         
movk w5, #0xFFFF, lsl #16 // Rosa Claro
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #173             // centro_x
mov x2, #20             // centro_y
mov x3, #90              // a (radio horizontal)
mov x4, #70              // b (radio vertical)
movz w5, #0x0080         
movk w5, #0x0080, lsl 16 // Rosa Oscuro 
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #170             // centro_x
mov x2, #17             // centro_y
mov x3, #87              // a (radio horizontal)
mov x4, #67              // b (radio vertical)
movz w5, #0x69B4         
movk w5, #0xFFFF, lsl #16 // Rosa Claro
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #20             // centro_x
mov x2, #10             // centro_y
mov x3, #80              // a (radio horizontal)
mov x4, #70              // b (radio vertical)
movz w5, #0x0080         
movk w5, #0x0080, lsl 16 // Rosa Oscuro 
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #17             // centro_x
mov x2, #10             // centro_y
mov x3, #77              // a (radio horizontal)
mov x4, #67              // b (radio vertical)
movz w5, #0x69B4         
movk w5, #0xFFFF, lsl #16 // Rosa Claro
bl dibujar_elipse


    //---------------------- Arbusto Debajo del Arbol ---------------------//


mov x0, x20               // framebuffer base
mov x1, #97              // centro_x
mov x2, #397              // centro_y
mov x3, #42               // radio
movz x4, 0x8B22, lsl 00   // Verde Oscuro
movk x4, 0x0022, lsl 16
bl dibujar_circulo


mov x0, x20               // framebuffer base
mov x1, #187              // centro_x
mov x2, #393              // centro_y
mov x3, #42               // radio
movz x4, 0x8B22, lsl 00   // Verde Oscuro
movk x4, 0x0022, lsl 16
bl dibujar_circulo


mov x0, x20               // framebuffer base
mov x1, #142              // centro_x
mov x2, #415              // centro_y
mov x3, #45               // radio
movz x4, 0x8B22, lsl 00   // Verde Oscuro
movk x4, 0x0022, lsl 16
bl dibujar_circulo

//Hojas del Arbol Caidas
mov x0, x20               // framebuffer base
mov x1, #295             // centro_x
mov x2, #360             // centro_y
mov x3, #15              // a (radio horizontal)
mov x4, #10                // b (radio vertical)
movz w5, #0x0080         
movk w5, #0x0080, lsl 16 // Rosa Oscuro 
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #295             // centro_x
mov x2, #360             // centro_y
mov x3, #12              // a (radio horizontal)
mov x4, #7             // b (radio vertical)
movz w5, 0x69B4, lsl 00   // Rosa Claro
movk w5, 0xFFFF, lsl 16
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #270             // centro_x
mov x2, #355             // centro_y
mov x3, #18              // a (radio horizontal)
mov x4, #10              // b (radio vertical)
movz w5, #0x0080         
movk w5, #0x0080, lsl 16 // Rosa Oscuro 
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #270             // centro_x
mov x2, #355             // centro_y
mov x3, #15              // a (radio horizontal)
mov x4, #7              // b (radio vertical)
movz w5, 0x69B4, lsl 00   // Rosa Claro
movk w5, 0xFFFF, lsl 16
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #255             // centro_x
mov x2, #370             // centro_y
mov x3, #18              // a (radio horizontal)
mov x4, #10              // b (radio vertical)
movz w5, #0x0080         
movk w5, #0x0080, lsl 16 // Rosa Oscuro 
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #255             // centro_x
mov x2, #370             // centro_y
mov x3, #15              // a (radio horizontal)
mov x4, #7              // b (radio vertical)
movz w5, 0x69B4, lsl 00   // Rosa Claro
movk w5, 0xFFFF, lsl 16
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #255             // centro_x
mov x2, #345             // centro_y
mov x3, #15              // a (radio horizontal)
mov x4, #10                // b (radio vertical)
movz w5, #0x0080         
movk w5, #0x0080, lsl 16 // Rosa Oscuro 
bl dibujar_elipse


mov x0, x20               // framebuffer base
mov x1, #255             // centro_x
mov x2, #345             // centro_y
mov x3, #12              // a (radio horizontal)
mov x4, #7             // b (radio vertical)
movz w5, 0x69B4, lsl 00   // Rosa Claro
movk w5, 0xFFFF, lsl 16
bl dibujar_elipse


//---------------------------- Hojas Cayendo ---------------------------//

mov x0, x20               // framebuffer base
mov x1, #280             // centro_x
mov x2, #105             // centro_y
mov x3, #9              // a (radio horizontal)
mov x4, #12                // b (radio vertical)
movz w5, #0x9DFF         
movk w5, #0x0022, lsl 16 // Rosa Oscuro 
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #240             // centro_x
mov x2, #145             // centro_y
mov x3, #9              // a (radio horizontal)
mov x4, #12                // b (radio vertical)
movz w5, #0x9DFF         
movk w5, #0x0022, lsl 16  
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #268             // centro_x
mov x2, #275             // centro_y
mov x3, #9             // a (radio horizontal)
mov x4, #12                // b (radio vertical)
movz w5, #0x8B22         
movk w5, #0x0022, lsl 16
bl dibujar_elipse


mov x0, x20               // framebuffer base
mov x1, #255             // centro_x
mov x2, #205             // centro_y
mov x3, #7              // a (radio horizontal)
mov x4, #10                // b (radio vertical)
movz w5, #0x9DFF         
movk w5, #0x0022, lsl 16 
bl dibujar_elipse


//hoja 1
mov x0, x20               // framebuffer base
mov x1, #275             // centro_x
mov x2, #225             // centro_y
mov x3, #10              // a (radio horizontal)
mov x4, #7                // b (radio vertical)
movz w5, #0x0080         
movk w5, #0x0080, lsl 16 
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #275             // centro_x
mov x2, #225             // centro_y
mov x3, #7              // a (radio horizontal)
mov x4, #4                // b (radio vertical)
movz w5, #0x69B4         
movk w5, #0x00FF, lsl 16 
bl dibujar_elipse

//hoja 2
mov x0, x20               // framebuffer base
mov x1, #260             // centro_x
mov x2, #298             // centro_y
mov x3, #9              // a (radio horizontal)
mov x4, #6                // b (radio vertical)
movz w5, #0x0080         
movk w5, #0x0080, lsl 16 
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #260             // centro_x
mov x2, #298             // centro_y
mov x3, #6              // a (radio horizontal)
mov x4, #3                // b (radio vertical)
movz w5, #0x69B4         
movk w5, #0x00FF, lsl 16 
bl dibujar_elipse

//hoja 3
mov x0, x20               // framebuffer base
mov x1, #225             // centro_x
mov x2, #170             // centro_y
mov x3, #9              // a (radio horizontal)
mov x4, #6                // b (radio vertical)
movz w5, #0x0080         
movk w5, #0x0080, lsl 16 
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #225             // centro_x
mov x2, #170             // centro_y
mov x3, #6              // a (radio horizontal)
mov x4, #3                // b (radio vertical)
movz w5, #0x69B4         
movk w5, #0x00FF, lsl 16 
bl dibujar_elipse


//hoja 4
mov x0, x20               // framebuffer base
mov x1, #285             // centro_x
mov x2, #140             // centro_y
mov x3, #9              // a (radio horizontal)
mov x4, #6                // b (radio vertical)
movz w5, #0x0080         
movk w5, #0x0080, lsl 16 
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #285             // centro_x
mov x2, #140             // centro_y
mov x3, #6              // a (radio horizontal)
mov x4, #3                // b (radio vertical)
movz w5, #0x69B4         
movk w5, #0x00FF, lsl 16 
bl dibujar_elipse


    ldr x30, [sp,#0]
    ldr x30, [sp, #0] 
    ldr x1, [sp, #8] 
    ldr x2, [sp, #16]
    ldr x3, [sp, #24] 
    ldr x4,[sp, #32]
    ldr x5, [sp, #40]
    ldr x11,[sp, #48] 
    ldr x12,[sp, #56]
    ldr x13,[sp, #64]  
    ldr x14,[sp, #72]
    add sp, sp, #80

 
ret



.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0	// Guarda la dirección base del framebuffer en x20
	bl fondo	
	bl kirby
	bl arbol

//---------------------------- LETRA "O" ---------------------------//
// Círculo exterior blanco
mov x0, x20               // framebuffer base
mov x1, #240              // centro_x
mov x2, #130              // centro_y
mov x3, #20          // radio
movz x4, 0x0000, lsl 00   // Negro
movk x4, 0x0000, lsl 16
bl dibujar_circulo

// Círculo interior azul
mov x0, x20               // framebuffer base
mov x1, #240              // centro_x
mov x2, #130              // centro_y
mov x3, #14               // radio
movz x4, 0xFFFF, lsl 00   // Color Blanco
movk x4, 0xFFFF, lsl 16
bl dibujar_circulo

//-------------------------------------------------------------------//


//---------------------------- LETRA "d" ---------------------------//

// Círculo exterior blanco
mov x0, x20               // framebuffer base
mov x1, #285              // centro_x
mov x2, #130              // centro_y
mov x3, #20          // radio
movz x4, 0x0000, lsl 00   // Negro
movk x4, 0x0000, lsl 16
bl dibujar_circulo

// Círculo interior
mov x0, x20               // framebuffer base
mov x1, #285              // centro_x
mov x2, #130              // centro_y
mov x3, #14               // radio
movz x4, 0xFFFF, lsl 00   // Color Blanco
movk x4, 0xFFFF, lsl 16
bl dibujar_circulo

// dibujar el palito de la letra "d"
mov x0, x20   
movz x10, 0x0000, lsl 00 // Color verde
movk x10, 0x0000, lsl 16 
mov x11, #150 // Posición Y final
mov x12, #279  // Posición X final
mov x13, #111  // Posición Y inicial
mov x14, #266  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

// Fin del palito de la Letra "d"

//---------------------------- LETRA "c" ---------------------------//

// Círculo exterior blanco
mov x0, x20               // framebuffer base
mov x1, #330              // centro_x
mov x2, #130              // centro_y
mov x3, #20          // radio
movz x4, 0x0000, lsl 00   // Negro
movk x4, 0x0000, lsl 16
bl dibujar_circulo

// Círculo interior azul
mov x0, x20               // framebuffer base
mov x1, #330              // centro_x
mov x2, #130              // centro_y
mov x3, #14               // radio
movz x4, 0xFFFF, lsl 00   // Color blanco
movk x4, 0xFFFF, lsl 16
bl dibujar_circulo


mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Celeste
movk x10, 0xFFFF, lsl 16  
mov x11, #150 // Posición Y final
mov x12, #360  // Posición X final
mov x13, #111  // Posición Y inicial
mov x14, #339  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo
// Fin de la Letra "c"

//---------------------------- 1º NUMERO "2" ---------------------------//
mov x0, x20   
movz x10, 0x0000, lsl 00 // Color Blanco
movk x10, 0x00, lsl 16 
mov x11, #150 // Posición Y final
mov x12, #390  // Posición X final
mov x13, #111  // Posición Y inicial
mov x14, #360  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0xFFFF, lsl 16 
mov x11, #129 // Posición Y final
mov x12, #380  // Posición X final
mov x13, #120  // Posición Y inicial
mov x14, #360  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0xFFFF, lsl 16 
mov x11, #143 // Posición Y final
mov x12, #390  // Posición X final
mov x13, #134  // Posición Y inicial
mov x14, #370  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

//---------------------------- NUMERO "0" ---------------------------//

mov x0, x20   
movz x10, 0x0000, lsl 00 // Color Blanco
movk x10, 0x0000, lsl 16 
mov x11, #150 // Posición Y final
mov x12, #430  // Posición X final
mov x13, #111  // Posición Y inicial
mov x14, #400  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Celeste
movk x10, 0xFFFF, lsl 16 
mov x11, #142 // Posición Y final
mov x12, #422  // Posición X final
mov x13, #119  // Posición Y inicial
mov x14, #409  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

//---------------------------- 2º NUMERO "2" ---------------------------//

mov x0, x20   
movz x10, 0x0000, lsl 00 // Color Blanco
movk x10, 0x0000, lsl 16 
mov x11, #150 // Posición Y final
mov x12, #470  // Posición X final
mov x13, #111  // Posición Y inicial
mov x14, #440  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0xFFFF, lsl 16 
mov x11, #129 // Posición Y final
mov x12, #460  // Posición X final
mov x13, #120  // Posición Y inicial
mov x14, #440  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0xFFFF, lsl 16 
mov x11, #143 // Posición Y final
mov x12, #470  // Posición X final
mov x13, #134  // Posición Y inicial
mov x14, #450  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

//---------------------------- NUMERO "5" ---------------------------//

mov x0, x20   
movz x10, 0x0000, lsl 00 // Color Blanco
movk x10, 0x00, lsl 16 
mov x11, #150 // Posición Y final
mov x12, #510  // Posición X final
mov x13, #111  // Posición Y inicial
mov x14, #480  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0x00FF, lsl 16 
mov x11, #129 // Posición Y final
mov x12, #510  // Posición X final
mov x13, #120  // Posición Y inicial
mov x14, #490  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

mov x0, x20   
movz x10, 0xFFFF, lsl 00 // Color Blanco
movk x10, 0x00FF, lsl 16 
mov x11, #143 // Posición Y final
mov x12, #500  // Posición X final
mov x13, #134  // Posición Y inicial
mov x14, #480  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla	
bl dibujar_rectangulo

bl arbol
//---------------- Hojas Cayendo -----------------------//

mov x0, x20               // framebuffer base
mov x1, #255             // centro_x
mov x2, #155             // centro_y
mov x3, #7              // a (radio horizontal)
mov x4, #10                // b (radio vertical)
movz w5, #0x0080         
movk w5, #0x0080, lsl 16 // Rosa Oscuro 
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #255             // centro_x
mov x2, #155             // centro_y
mov x3, #4              // a (radio horizontal)
mov x4, #7             // b (radio vertical)
movz w5, 0x69B4, lsl 00   // Rosa Claro
movk w5, 0xFFFF, lsl 16
bl dibujar_elipse

delay: //Modifica el tiempo del delay con x25
    sub x25, x25, 1
    cbnz x25, delay
    ret






//-------------------------------------------------------------------//

	// Ejemplo de uso de gpios
	mov x9, GPIO_BASE

	// Atención: se utilizan registros w porque la documentación de broadcom
	// indica que los registros que estamos leyendo y escribiendo son de 32 bits

	// Setea gpios 0 - 9 como lectura
	str wzr, [x9, GPIO_GPFSEL0]

	// Lee el estado de los GPIO 0 - 31
	ldr w10, [x9, GPIO_GPLEV0]

	// And bit a bit mantiene el resultado del bit 2 en w10
	and w11, w10, 0b10

	// w11 será 1 si había un 1 en la posición 2 de w10, si no será 0
	// efectivamente, su valor representará si GPIO 2 está activo
	lsr w11, w11, 1

	//---------------------------------------------------------------
	// Infinite Loop

InfLoop:
	b InfLoop


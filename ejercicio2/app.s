	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,   32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0	// Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE ------------------------------------

	movz x10, 0x8B22, lsl 00                  // Color verde
	movk x10, 0x0022, lsl 16                  

	mov x2, SCREEN_HEIGH         
loop1:
	mov x1, SCREEN_WIDTH         
loop0:
	stur w10,[x0]  
	add x0,x0,4	   
	sub x1,x1,1	   
	cbnz x1,loop0  
	sub x2,x2,1	   
	cbnz x2,loop1  
	
	//-------------------------------------------------------------------//

    // Pinta parate de arriba pantalla
	mov x0, x20	// Guarda la dirección base del framebuffer en x0
	mov x1, SCREEN_HEIGH
	movz x10, 0x9DFF, lsl 00                  // Color celeste
	movk x10, 0x0000, lsl 16                  

	lsr x12, x1, #1 		
	mov x2, X12          
loop2:
	mov x1, SCREEN_WIDTH        
loop3:
	stur w10,[x0]  
	add x0,x0,4	     // Voy al sig pixel
	sub x1,x1,1	   
	cbnz x1,loop3  
	sub x2,x2,1	   
	cbnz x2,loop2  
	 


/*------------------------------ Nube 1 -----------------------------//	 
mov x0, x20 // framebuffer_base
mov x1, #50              // centro_x
mov x2, #90         // centro_y
mov x3, #20     // radio
movz x4, 0xFFFF, lsl 00  // blanco
movk x4, 0xFFFF, lsl 16
bl dibujar_circulo

mov x0, x20
mov x1, #70             // centro 2, un poco a la derecha
mov x2, #85
mov x3, #25
movz x4, 0xFFFF, lsl 00
movk x4, 0xFFFF, lsl 16
bl dibujar_circulo

mov x0, x20
mov x1, #90
mov x2, #90
mov x3, #20
movz x4, 0xFFFF, lsl 00
movk x4, 0xFFFF, lsl 16
bl dibujar_circulo
 */
	bl kirby

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



//---------------------------- Arbol ---------------------------//

//Tronco
mov x0, x20   
movz x10, 0x860B, lsl 00 // Color Marron Claro
movk x10, 0x00B8, lsl 16 
mov x11, #400 // Posición Y final
mov x12, #200  // Posición X final
mov x13, #50  // Posición Y inicial
mov x14, #80  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla

bl dibujar_rectangulo


mov x0, x20   
movz x10, 0x4513 , lsl 00 // Color Marron
movk x10, 0x008B, lsl 16 
mov x11, #400 // Posición Y final
mov x12, #195  // Posición X final
mov x13, #50  // Posición Y inicial
mov x14, #85  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla

bl dibujar_rectangulo


mov x0, x20               // framebuffer base
mov x1, #125             // centro_x
mov x2, #150             // centro_y
mov x3, #13              // a (radio horizontal)
mov x4, #18              // b (radio vertical)
movz w5, #0x860B, lsl 0        
movk w5, #0x00B8, lsl 16  // Color Marron Claro
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #170             // centro_x
mov x2, #150             // centro_y
mov x3, #15              // a (radio horizontal)
mov x4, #13              // b (radio vertical)
movz w5, #0x860B, lsl 0         
movk w5, #0x00B8, lsl 16 /// Color Marron Claro
bl dibujar_elipse

mov x0, x20               // framebuffer base
mov x1, #150             // centro_x
mov x2, #210             // centro_y
mov x3, #15              // a (radio horizontal)
mov x4, #20              // b (radio vertical)
movz w5, #0x860B, lsl 0     // Color Marron Claro
movk w5, #0x00B8, lsl 16 
bl dibujar_elipse

mov x0, x20   
movz x10, 0x860B, lsl 00 // Color Marron Claro
movk x10, 0x00B8, lsl 16 
mov x11, #190 // Posición Y final
mov x12, #230  // Posición X final
mov x13, #170  // Posición Y inicial
mov x14, #160  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla

bl dibujar_rectangulo

mov x0, x20   
movz x10, 0x4513 , lsl 00 // Color Marron
movk x10, 0x008B, lsl 16 
mov x11, #186 // Posición Y final
mov x12, #227  // Posición X final
mov x13, #172  // Posición Y inicial
mov x14, #160  // Posición X inicial
mov x5, SCREEN_WIDTH // Ancho de la pantalla

bl dibujar_rectangulo


//Hojas Del Arbol(Arriba)

mov x0, x20               // framebuffer base
mov x1, #60             // centro_x
mov x2, #50             // centro_y
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

// Arbusto Debajo del Arbol
mov x0, x20               // framebuffer base
mov x1, #105              // centro_x
mov x2, #390              // centro_y
mov x3, #40               // radio
movz x4, 0xCD32, lsl 00   // Verde Claro
movk x4, 0x0032, lsl 16
bl dibujar_circulo

mov x0, x20               // framebuffer base
mov x1, #100              // centro_x
mov x2, #400              // centro_y
mov x3, #42               // radio
movz x4, 0x8B22, lsl 00   // Verde Oscuro
movk x4, 0x0022, lsl 16
bl dibujar_circulo


mov x0, x20               // framebuffer base
mov x1, #185              // centro_x
mov x2, #380              // centro_y
mov x3, #40               // radio
movz x4, 0xCD32, lsl 00   // Verde Claro
movk x4, 0x0032, lsl 16
bl dibujar_circulo


mov x0, x20               // framebuffer base
mov x1, #190              // centro_x
mov x2, #390              // centro_y
mov x3, #42               // radio
movz x4, 0x8B22, lsl 00   // Verde Oscuro
movk x4, 0x0022, lsl 16
bl dibujar_circulo




mov x0, x20               // framebuffer base
mov x1, #145              // centro_x
mov x2, #400              // centro_y
mov x3, #40               // radio
movz x4, 0xCD32, lsl 00   // Verde Claro
movk x4, 0x0032, lsl 16
bl dibujar_circulo


mov x0, x20               // framebuffer base
mov x1, #145              // centro_x
mov x2, #410              // centro_y
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


bl delay
//---------------- Hojas Cayendo -----------------------//

mov x0, x20               // framebuffer base
mov x1, #255             // centro_x
mov x2, #155             // centro_y
mov x3, #7              // a (radio horizontal)
mov x4, #10                // b (radio vertical)
movz w5, #0x0080         
movk w5, #0x0080, lsl 16 // Rosa Oscuro 
bl dibujar_elipse


bl delay

mov x0, x20               // framebuffer base
mov x1, #255             // centro_x
mov x2, #155             // centro_y
mov x3, #4              // a (radio horizontal)
mov x4, #7             // b (radio vertical)
movz w5, 0x69B4, lsl 00   // Rosa Claro
movk w5, 0xFFFF, lsl 16
bl dibujar_elipse









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


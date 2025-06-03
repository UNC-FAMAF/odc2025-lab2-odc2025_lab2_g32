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
	//---------------- CODE HERE ------------------------------------

	movz x10, 0xFF0B, lsl 00                  // Color verde
	movk x10, 0x0000, lsl 16                  // Cambiamos los COLORES

	mov x2, SCREEN_HEIGH         // Y Size
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w10,[x0]  // Colorear el pixel N
	add x0,x0,4	   // Siguiente pixel
	sub x1,x1,1	   // Decrementar contador X
	cbnz x1,loop0  // Si no terminó la fila, salto
	sub x2,x2,1	   // Decrementar contador Y
	cbnz x2,loop1  // Si no es la última fila, salto
	
	//-------------------------------------------------------------------//

    // Pinta parate de arriba pantalla
	mov x0, x20	// Guarda la dirección base del framebuffer en x0
	mov x1, SCREEN_HEIGH
	movz x10, 0x9DFF, lsl 00                  // Color celeste
	movk x10, 0x0000, lsl 16                  // Cambiamos los COLORES

	lsr x12, x1, #1 		// x11 = SCREEN_HEIGH / 2
	mov x2, X12         // Y Size
loop2:
	mov x1, SCREEN_WIDTH         // X Size
loop3:
	stur w10,[x0]  // Colorear el pixel N
	add x0,x0,4	   // Siguiente pixel
	sub x1,x1,1	   // Decrementar contador X
	cbnz x1,loop3  // Si no terminó la fila, salto
	sub x2,x2,1	   // Decrementar contador Y
	cbnz x2,loop2  // Si no es la última fila, salto

	//-------------------------------- Sol -------------------------------//
 	mov x0, x20        // framebuffer base
	mov x1, #555       // centro_x
	mov x2, #140       // centro_y
	mov x3, #45        // radio
	movz x4, 0xD700, lsl 00
	movk x4, 0x00FF, lsl 16 // color (sol)
	bl dibujar_circulo
	//-------------------------------------------------------------------//
 
	//------------------------------ Nube 1 -----------------------------//
	mov x0, x20				 // framebuffer_base
	mov x1, #50              // centro_x
	mov x2, #90		         // centro_y
	mov x3, #20			     // radio
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
	//-------------------------------------------------------------------//


	//------------------------------ Nube 2 -----------------------------//
	mov x0, x20				 // framebuffer_base
	mov x1, #375             // centro_x
	mov x2, #90		         // centro_y
	mov x3, #20			     // radio
	movz x4, 0xFFFF, lsl 00  // blanco 
	movk x4, 0xFFFF, lsl 16  
	bl dibujar_circulo

	mov x0, x20
	mov x1, 395             // centro 2, un poco a la derecha
	mov x2, #85
	mov x3, #25
	movz x4, 0xFFFF, lsl 00   
	movk x4, 0xFFFF, lsl 16  
	bl dibujar_circulo

	mov x0, x20
	mov x1, #415
	mov x2, #90
	mov x3, #20
	movz x4, 0xFFFF, lsl 00   
	movk x4, 0xFFFF, lsl 16  
	bl dibujar_circulo
	//-------------------------------------------------------------------//

 

//---------------------------- LETRA "O" ---------------------------//
// Círculo exterior 
mov x0, x20               // framebuffer base
mov x1, #160              // centro_x
mov x2, #130              // centro_y
mov x3, #20          // radio
movz x4, 0xFFFF, lsl 00   // blanco
movk x4, 0xFFFF, lsl 16
bl dibujar_circulo

// Círculo interior 
mov x0, x20               // framebuffer base
mov x1, #160              // centro_x
mov x2, #130              // centro_y
mov x3, #14               // radio
movz x4, 0x9DFF, lsl 00   // Color celeste
movk x4, 0x0000, lsl 16
bl dibujar_circulo

//-------------------------------------------------------------------//


//---------------------------- LETRA "d" ---------------------------//

// Círculo exterior blanco
mov x0, x20               // framebuffer base
mov x1, #205              // centro_x
mov x2, #130              // centro_y
mov x3, #20          // radio
movz x4, 0xFFFF, lsl 00   // blanco
movk x4, 0xFFFF, lsl 16
bl dibujar_circulo

// Círculo interior violeta
mov x0, x20               // framebuffer base
mov x1, #205              // centro_x
mov x2, #130              // centro_y
mov x3, #14               // radio
movz x4, 0x9DFF, lsl 00   // Color celeste
movk x4, 0x0000, lsl 16
bl dibujar_circulo

// Falta el palito
	
//-------------------------------------------------------------------//

  // Triángulo de vértices arbitrarios (ejemplo)
	mov x0, x20
	mov x1, SCREEN_WIDTH
	movz x2, 0xFFD4, lsl 0 // color rojo
	movk x2, 0x007F, lsl 16
	mov x3, #0   // (x3,x4)=(x,y) del vértice 1
	mov x4, #480	  
	mov x5, #320   // (x5,x6)=(x,y) del vértice 2
	mov x6, #205   
	mov x7, #640	 // (x7,x8)=(x,y) del vértice 3
	mov x8, #480 	 
	bl dibujar_triangulo_vertices
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


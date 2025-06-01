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
	 
     
	
	
	//-------------------------------------------------------------------//

    // dibujar_circulo

    // Inicialización
    mov x0, x20                // framebuffer_base
    mov x5, #640               // SCREEN_WIDTH
   
    // Carga el Color 
    movz x10, 0xF022, lsl 0    // amarillo 
    movk x10, 0x00FF, lsl 16   

    // Define las coordenadas del centro del círculo y su radio.
    mov x11, #550           // centro_x
    mov x12, #100           // centro_y
    mov x13, #70            // radio

    mov x6, #0             // y = 0
circle_y_loop:
    mov x7, #0             // x = 0
circle_x_loop:
    sub x14, x7, x11       // dx = x - centro_x
    sub x15, x6, x12       // dy = y - centro_y
    mul x16, x14, x14      // dx²
    mul x17, x15, x15      // dy²
    add x18, x16, x17      // dx² + dy²
    mul x19, x13, x13      // r²
    cmp x18, x19           // Comparar con r^2, ¿(dx² + dy²) ≤ r²?
    bge no_circle_pixel    // Si (dx² + dy²) ≥ r², no pintes


    // dirección framebuffer = base + ((y * ancho) + x) * 4
    mul x8, x6, x5
    add x8, x8, x7
    lsl x8, x8, #2
    add x9, x0, x8
    stur w10, [x9]

no_circle_pixel:
    add x7, x7, #1
    cmp x7, #640            // x < 640, para x: recorrer hasta el ancho de pantalla
    blt circle_x_loop

    add x6, x6, #1
    cmp x6, #480            // y < 480, para y: recorrer hasta el alto de pantalla
    blt circle_y_loop
    
//-------------------------------------------------------------------//
  
/*

    // cuadrado
	mov x0, x20                // Dirección base del framebuffer
    movz x10, 0xFF0B, lsl 00   // Color: azul (por ejemplo) 0x00FF
    movk x10, 0x0000, lsl 16   // 13FF0B verde

    mov x3, 300            // Alto del cuadrado (Y)
    mov x4, 480             // Ancho del cuadrado (X)
    mov x5, SCREEN_WIDTH       // Ancho de la pantalla

    mov x6, 160         // Y inicial
cuad_y_loop:
    mov x7, 213      // X inicial
cuad_x_loop:
    // Calcula la dirección del píxel: x0 + (y * SCREEN_WIDTH + x) * 4
    mul x8, x6, x5             // y * SCREEN_WIDTH
    add x8, x8, x7             // + x
    lsl x8, x8, 2              // * 4 (bytes por píxel)
    add x9, x0, x8             // Dirección final

    stur w10, [x9]             // Escribe el color

    add x7, x7, 1              // x++
    cmp x7, x4
    blt cuad_x_loop            // Si x < ancho, sigue

    add x6, x6, 1              // y++
    cmp x6, x3
    blt cuad_y_loop            // Si y < alto, sigue

*/


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


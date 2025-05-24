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

	movz x10, 0x0000, lsl 00                  // Cambiamos los COLORES
	movk x10, 0xFFFF, lsl 16                  // Cambiamos los COLORES

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
	mov x0, x20	// Guarda la dirección base del framebuffer en x0
	mov x1, SCREEN_HEIGH
	movz x10, 0xFFFF, lsl 00                  // Cambiamos los COLORES
	movk x10, 0xFFFF, lsl 16                  // Cambiamos los COLORES

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


	mov x0, x20                // Dirección base del framebuffer
    movz x10, 0x00FF, lsl 00   // Color: azul (por ejemplo)
    movk x10, 0x0000, lsl 16

    mov x3, 320            // Alto del cuadrado (Y)
    mov x4, 427             // Ancho del cuadrado (X)
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

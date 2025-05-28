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

	movz x10, 0x00FF00, lsl 00                  // Color: Rojo
	movk x10, 0x00, lsl 16                  // 

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
	mov x1, SCREEN_HEIGH                      // en x1 guardamos el alto de la pantalla
	movz x10, 0x0000, lsl 00                  // Color: Blanco
	movk x10, 0x00, lsl 16                  // 

	lsr x12, x1, #1 		// x12 = SCREEN_HEIGH / 2
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
	

    movz x10, 0xFFFF, lsl 00   // Color: azul (por ejemplo)
    movk x10, 0xFF, lsl 16
    mov x3, 320            // Alto del cuadrado (Y)
    mov x4, 427             // Ancho del cuadrado (X)
    mov x5, 640       // Ancho de la pantalla
    mov x6, 160         // Y inicial
		mov x11, 213      // X inicial


	bl dibujar_cuadrado						// Dibuja un cuadrado
	
	//-------------------------------------------------------------------//
// Dibuja un circulo en el framebuffer
	
    mov x0, x20                // Dirección base del framebuffer
    movz x10, 0xB6D4, lsl 00   // Color: rojo (formato RGB565)
    movk x10, 0xEF, lsl 16

    mov x11, 320               // xc (centro x)
    mov x12, 240               // yc (centro y)
    mov x13, 240                // radio

    mov x6, 0                  // y = 0
circle_y_loop:
    mov x7, 0                  // x = 0
circle_x_loop:
    // dx = x - xc
    sub x14, x7, x11
    // dy = y - yc
    sub x15, x6, x12
    // dxdx
    mul x16, x14, x14
    // dydy
    mul x17, x15, x15
    // dxdx + dydy
    add x18, x16, x17
    // radioradio
    mul x19, x13, x13
    // Si (dxdx + dydy) < radioradio, pintar
    cmp x18, x19
    bge no_circle_pixel

    // Calcula la dirección del píxel: x0 + (y * SCREEN_WIDTH + x) * 4
    mul x8, x6, x5
    add x8, x8, x7
    lsl x8, x8, 2
    add x9, x0, x8
    stur w10, [x9]

no_circle_pixel:
    add x7, x7, 1
    cmp x7, 640                // Limita el área de dibujo
    blt circle_x_loop

    add x6, x6, 1
    cmp x6, 480                // Limita el área de dibujo
    blt circle_y_loop

  
// termina el circulo
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

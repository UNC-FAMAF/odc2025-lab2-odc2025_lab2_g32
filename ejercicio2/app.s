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
    bl fondo
	bl dibujar_arbol
InfLoop:

	bl kirby
	bl frame_1
	bl delay
	bl frame_2
	bl kirby2
	bl delay
	bl frame_1
	bl kirby3
	bl delay
	bl frame_3
	bl kirby2
	bl delay
	b InfLoop


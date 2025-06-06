	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,   32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main

main:
	
	mov x20, x0	
	//---------------- Fondo ------------------------------------

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
	 
	bl kirby
	bl dibujar_arbol
InfLoop:

	bl frame_1
	bl delay
	bl frame_2
	bl delay
	b InfLoop


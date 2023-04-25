   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2551                     ; 29 void attend_1ms( void)
2551                     ; 30 {
2553                     	switch	.text
2554  0000               _attend_1ms:
2558                     ; 33 	PUSHW	X			; 1 cycles
2561  0000 89            PUSHW	X			; 1 cycles
2563                     ; 35 	LDW		X,#397      ; 2 cycles 
2566  0001 ae018d        LDW		X,#397      ; 2 cycles 
2568                     ; 37 tempo5cyc:
2571  0004               tempo5cyc:
2573                     ; 39 	NOP					; 1 cycle
2576  0004 9d            NOP					; 1 cycle
2578                     ; 40 	NOP					; 1 cycle
2581  0005 9d            NOP					; 1 cycle
2583                     ; 42 	DECW 	X			; 1 cycles X = X-1
2586  0006 5a            DECW 	X			; 1 cycles X = X-1
2588                     ; 43 	JRNE	tempo5cyc	 ; 2 cycles si X <> 0 alors continue tempo (1 cycle si X=0)
2591  0007 26fb          JRNE	tempo5cyc	 ; 2 cycles si X <> 0 alors continue tempo (1 cycle si X=0)
2593                     ; 45 	POPW		X			; 2 cycles
2596  0009 85            POPW		X			; 2 cycles
2598                     ; 47 }	// RET = 4 cycles
2601  000a 81            	ret
2636                     ; 57 void attend_500ms( void)
2636                     ; 58 {
2637                     	switch	.text
2638  000b               _attend_500ms:
2640  000b 89            	pushw	x
2641       00000002      OFST:	set	2
2644                     ; 62 	for ( n = 0; n < 500; n++)
2646  000c 5f            	clrw	x
2647  000d 1f01          	ldw	(OFST-1,sp),x
2648  000f               L7561:
2649                     ; 63 		attend_1ms(); // duree  cycles par boucle 
2651  000f adef          	call	_attend_1ms
2653                     ; 62 	for ( n = 0; n < 500; n++)
2655  0011 1e01          	ldw	x,(OFST-1,sp)
2656  0013 1c0001        	addw	x,#1
2657  0016 1f01          	ldw	(OFST-1,sp),x
2660  0018 1e01          	ldw	x,(OFST-1,sp)
2661  001a a301f4        	cpw	x,#500
2662  001d 25f0          	jrult	L7561
2663                     ; 64 }
2666  001f 85            	popw	x
2667  0020 81            	ret
2711                     ; 73 void attend_ms( unsigned char nb_ms)
2711                     ; 74 {
2712                     	switch	.text
2713  0021               _attend_ms:
2715  0021 88            	push	a
2716  0022 88            	push	a
2717       00000001      OFST:	set	1
2720                     ; 78 	for ( n = 0; n < nb_ms; n++)
2722  0023 0f01          	clr	(OFST+0,sp)
2724  0025 2004          	jra	L3171
2725  0027               L7071:
2726                     ; 79 		attend_1ms();  
2728  0027 add7          	call	_attend_1ms
2730                     ; 78 	for ( n = 0; n < nb_ms; n++)
2732  0029 0c01          	inc	(OFST+0,sp)
2733  002b               L3171:
2736  002b 7b01          	ld	a,(OFST+0,sp)
2737  002d 1102          	cp	a,(OFST+1,sp)
2738  002f 25f6          	jrult	L7071
2739                     ; 80 }
2742  0031 85            	popw	x
2743  0032 81            	ret
2756                     	xdef	_attend_ms
2757                     	xdef	_attend_500ms
2758                     	xdef	_attend_1ms
2777                     	end

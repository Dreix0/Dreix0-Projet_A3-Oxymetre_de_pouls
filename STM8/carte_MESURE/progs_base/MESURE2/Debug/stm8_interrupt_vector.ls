   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2553                     ; 18 @far @interrupt void NonHandledInterrupt (void)
2553                     ; 19 {
2554                     	switch	.text
2555  0000               f_NonHandledInterrupt:
2559                     ; 23 	return;
2562  0000 80            	iret
2586                     ; 28 @far @interrupt void int_PE5 (void)
2586                     ; 29 {
2587                     	switch	.text
2588  0001               f_int_PE5:
2590  0001 8a            	push	cc
2591  0002 84            	pop	a
2592  0003 a4bf          	and	a,#191
2593  0005 88            	push	a
2594  0006 86            	pop	cc
2595  0007 3b0002        	push	c_x+2
2596  000a be00          	ldw	x,c_x
2597  000c 89            	pushw	x
2598  000d 3b0002        	push	c_y+2
2599  0010 be00          	ldw	x,c_y
2600  0012 89            	pushw	x
2603                     ; 30 	sal_bas += 2;
2605  0013 3c00          	inc	_sal_bas
2606  0015 3c00          	inc	_sal_bas
2607                     ; 31 	if(sal_bas > 60)
2609  0017 b600          	ld	a,_sal_bas
2610  0019 a13d          	cp	a,#61
2611  001b 2504          	jrult	L1561
2612                     ; 32 		sal_bas = 40;
2614  001d 35280000      	mov	_sal_bas,#40
2615  0021               L1561:
2616                     ; 33 	affiche_nombre(sal_bas, 80, 70); 
2618  0021 4b46          	push	#70
2619  0023 4b50          	push	#80
2620  0025 b600          	ld	a,_sal_bas
2621  0027 5f            	clrw	x
2622  0028 97            	ld	xl,a
2623  0029 cd0000        	call	_affiche_nombre
2625  002c 85            	popw	x
2626                     ; 34 	return;
2629  002d 85            	popw	x
2630  002e bf00          	ldw	c_y,x
2631  0030 320002        	pop	c_y+2
2632  0033 85            	popw	x
2633  0034 bf00          	ldw	c_x,x
2634  0036 320002        	pop	c_x+2
2635  0039 80            	iret
2659                     ; 37 @far @interrupt void int_PD3 (void)
2659                     ; 38 {
2660                     	switch	.text
2661  003a               f_int_PD3:
2663  003a 8a            	push	cc
2664  003b 84            	pop	a
2665  003c a4bf          	and	a,#191
2666  003e 88            	push	a
2667  003f 86            	pop	cc
2668  0040 3b0002        	push	c_x+2
2669  0043 be00          	ldw	x,c_x
2670  0045 89            	pushw	x
2671  0046 3b0002        	push	c_y+2
2672  0049 be00          	ldw	x,c_y
2673  004b 89            	pushw	x
2676                     ; 39 	sal_haut -= 10;
2678  004c b600          	ld	a,_sal_haut
2679  004e a00a          	sub	a,#10
2680  0050 b700          	ld	_sal_haut,a
2681                     ; 40 	if(sal_haut < 100)
2683  0052 b600          	ld	a,_sal_haut
2684  0054 a164          	cp	a,#100
2685  0056 2404          	jruge	L3661
2686                     ; 41 		sal_haut = 240;
2688  0058 35f00000      	mov	_sal_haut,#240
2689  005c               L3661:
2690                     ; 42 	affiche_nombre(sal_haut, 90, 90); 
2692  005c 4b5a          	push	#90
2693  005e 4b5a          	push	#90
2694  0060 b600          	ld	a,_sal_haut
2695  0062 5f            	clrw	x
2696  0063 97            	ld	xl,a
2697  0064 cd0000        	call	_affiche_nombre
2699  0067 85            	popw	x
2700                     ; 43 	return;
2703  0068 85            	popw	x
2704  0069 bf00          	ldw	c_y,x
2705  006b 320002        	pop	c_y+2
2706  006e 85            	popw	x
2707  006f bf00          	ldw	c_x,x
2708  0071 320002        	pop	c_x+2
2709  0074 80            	iret
2733                     ; 46 @far @interrupt void int_timer1_2ms(void)
2733                     ; 47 {
2734                     	switch	.text
2735  0075               f_int_timer1_2ms:
2739                     ; 48 	int_2ms_ok = 1;
2741  0075 35010000      	mov	_int_2ms_ok,#1
2742                     ; 49 	TIM1_SR1 = TIM1_SR1 &~(1<<0);
2744  0079 72115255      	bres	_TIM1_SR1,#0
2745                     ; 50 	return;
2748  007d 80            	iret
2750                     .const:	section	.text
2751  0000               __vectab:
2752  0000 82            	dc.b	130
2754  0001 00            	dc.b	page(__stext)
2755  0002 0000          	dc.w	__stext
2756  0004 82            	dc.b	130
2758  0005 00            	dc.b	page(f_NonHandledInterrupt)
2759  0006 0000          	dc.w	f_NonHandledInterrupt
2760  0008 82            	dc.b	130
2762  0009 00            	dc.b	page(f_NonHandledInterrupt)
2763  000a 0000          	dc.w	f_NonHandledInterrupt
2764  000c 82            	dc.b	130
2766  000d 00            	dc.b	page(f_NonHandledInterrupt)
2767  000e 0000          	dc.w	f_NonHandledInterrupt
2768  0010 82            	dc.b	130
2770  0011 00            	dc.b	page(f_NonHandledInterrupt)
2771  0012 0000          	dc.w	f_NonHandledInterrupt
2772  0014 82            	dc.b	130
2774  0015 00            	dc.b	page(f_NonHandledInterrupt)
2775  0016 0000          	dc.w	f_NonHandledInterrupt
2776  0018 82            	dc.b	130
2778  0019 00            	dc.b	page(f_NonHandledInterrupt)
2779  001a 0000          	dc.w	f_NonHandledInterrupt
2780  001c 82            	dc.b	130
2782  001d 00            	dc.b	page(f_NonHandledInterrupt)
2783  001e 0000          	dc.w	f_NonHandledInterrupt
2784  0020 82            	dc.b	130
2786  0021 3a            	dc.b	page(f_int_PD3)
2787  0022 003a          	dc.w	f_int_PD3
2788  0024 82            	dc.b	130
2790  0025 01            	dc.b	page(f_int_PE5)
2791  0026 0001          	dc.w	f_int_PE5
2792  0028 82            	dc.b	130
2794  0029 00            	dc.b	page(f_NonHandledInterrupt)
2795  002a 0000          	dc.w	f_NonHandledInterrupt
2796  002c 82            	dc.b	130
2798  002d 00            	dc.b	page(f_NonHandledInterrupt)
2799  002e 0000          	dc.w	f_NonHandledInterrupt
2800  0030 82            	dc.b	130
2802  0031 00            	dc.b	page(f_NonHandledInterrupt)
2803  0032 0000          	dc.w	f_NonHandledInterrupt
2804  0034 82            	dc.b	130
2806  0035 75            	dc.b	page(f_int_timer1_2ms)
2807  0036 0075          	dc.w	f_int_timer1_2ms
2808  0038 82            	dc.b	130
2810  0039 00            	dc.b	page(f_NonHandledInterrupt)
2811  003a 0000          	dc.w	f_NonHandledInterrupt
2812  003c 82            	dc.b	130
2814  003d 00            	dc.b	page(f_NonHandledInterrupt)
2815  003e 0000          	dc.w	f_NonHandledInterrupt
2816  0040 82            	dc.b	130
2818  0041 00            	dc.b	page(f_NonHandledInterrupt)
2819  0042 0000          	dc.w	f_NonHandledInterrupt
2820  0044 82            	dc.b	130
2822  0045 00            	dc.b	page(f_NonHandledInterrupt)
2823  0046 0000          	dc.w	f_NonHandledInterrupt
2824  0048 82            	dc.b	130
2826  0049 00            	dc.b	page(f_NonHandledInterrupt)
2827  004a 0000          	dc.w	f_NonHandledInterrupt
2828  004c 82            	dc.b	130
2830  004d 00            	dc.b	page(f_NonHandledInterrupt)
2831  004e 0000          	dc.w	f_NonHandledInterrupt
2832  0050 82            	dc.b	130
2834  0051 00            	dc.b	page(f_NonHandledInterrupt)
2835  0052 0000          	dc.w	f_NonHandledInterrupt
2836  0054 82            	dc.b	130
2838  0055 00            	dc.b	page(f_NonHandledInterrupt)
2839  0056 0000          	dc.w	f_NonHandledInterrupt
2840  0058 82            	dc.b	130
2842  0059 00            	dc.b	page(f_NonHandledInterrupt)
2843  005a 0000          	dc.w	f_NonHandledInterrupt
2844  005c 82            	dc.b	130
2846  005d 00            	dc.b	page(f_NonHandledInterrupt)
2847  005e 0000          	dc.w	f_NonHandledInterrupt
2848  0060 82            	dc.b	130
2850  0061 00            	dc.b	page(f_NonHandledInterrupt)
2851  0062 0000          	dc.w	f_NonHandledInterrupt
2852  0064 82            	dc.b	130
2854  0065 00            	dc.b	page(f_NonHandledInterrupt)
2855  0066 0000          	dc.w	f_NonHandledInterrupt
2856  0068 82            	dc.b	130
2858  0069 00            	dc.b	page(f_NonHandledInterrupt)
2859  006a 0000          	dc.w	f_NonHandledInterrupt
2860  006c 82            	dc.b	130
2862  006d 00            	dc.b	page(f_NonHandledInterrupt)
2863  006e 0000          	dc.w	f_NonHandledInterrupt
2864  0070 82            	dc.b	130
2866  0071 00            	dc.b	page(f_NonHandledInterrupt)
2867  0072 0000          	dc.w	f_NonHandledInterrupt
2868  0074 82            	dc.b	130
2870  0075 00            	dc.b	page(f_NonHandledInterrupt)
2871  0076 0000          	dc.w	f_NonHandledInterrupt
2872  0078 82            	dc.b	130
2874  0079 00            	dc.b	page(f_NonHandledInterrupt)
2875  007a 0000          	dc.w	f_NonHandledInterrupt
2876  007c 82            	dc.b	130
2878  007d 00            	dc.b	page(f_NonHandledInterrupt)
2879  007e 0000          	dc.w	f_NonHandledInterrupt
2930                     	xdef	__vectab
2931                     	xref	__stext
2932                     	xdef	f_int_timer1_2ms
2933                     	xdef	f_int_PD3
2934                     	xdef	f_int_PE5
2935                     	xdef	f_NonHandledInterrupt
2936                     	xref.b	_int_2ms_ok
2937                     	xref.b	_sal_haut
2938                     	xref.b	_sal_bas
2939                     	xref	_affiche_nombre
2940                     	xref.b	c_x
2941                     	xref.b	c_y
2960                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2553                     ; 17 @far @interrupt void NonHandledInterrupt (void)
2553                     ; 18 {
2554                     	switch	.text
2555  0000               f_NonHandledInterrupt:
2559                     ; 22 	return;
2562  0000 80            	iret
2586                     ; 27 @far @interrupt void int_PE5 (void)
2586                     ; 28 {
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
2603                     ; 29 	sal_bas += 2;
2605  0013 3c00          	inc	_sal_bas
2606  0015 3c00          	inc	_sal_bas
2607                     ; 30 	if(sal_bas > 60)
2609  0017 b600          	ld	a,_sal_bas
2610  0019 a13d          	cp	a,#61
2611  001b 2504          	jrult	L1561
2612                     ; 31 		sal_bas = 40;
2614  001d 35280000      	mov	_sal_bas,#40
2615  0021               L1561:
2616                     ; 32 	affiche_nombre(sal_bas, 70, 70); 
2618  0021 4b46          	push	#70
2619  0023 4b46          	push	#70
2620  0025 b600          	ld	a,_sal_bas
2621  0027 5f            	clrw	x
2622  0028 97            	ld	xl,a
2623  0029 cd0000        	call	_affiche_nombre
2625  002c 85            	popw	x
2626                     ; 33 	return;
2629  002d 85            	popw	x
2630  002e bf00          	ldw	c_y,x
2631  0030 320002        	pop	c_y+2
2632  0033 85            	popw	x
2633  0034 bf00          	ldw	c_x,x
2634  0036 320002        	pop	c_x+2
2635  0039 80            	iret
2659                     ; 36 @far @interrupt void int_PD3 (void)
2659                     ; 37 {
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
2676                     ; 38 	sal_haut -= 10;
2678  004c b600          	ld	a,_sal_haut
2679  004e a00a          	sub	a,#10
2680  0050 b700          	ld	_sal_haut,a
2681                     ; 39 	if(sal_haut < 100)
2683  0052 b600          	ld	a,_sal_haut
2684  0054 a164          	cp	a,#100
2685  0056 2404          	jruge	L3661
2686                     ; 40 		sal_haut = 240;
2688  0058 35f00000      	mov	_sal_haut,#240
2689  005c               L3661:
2690                     ; 41 	affiche_nombre(sal_haut, 70, 90); 
2692  005c 4b5a          	push	#90
2693  005e 4b46          	push	#70
2694  0060 b600          	ld	a,_sal_haut
2695  0062 5f            	clrw	x
2696  0063 97            	ld	xl,a
2697  0064 cd0000        	call	_affiche_nombre
2699  0067 85            	popw	x
2700                     ; 42 	return;
2703  0068 85            	popw	x
2704  0069 bf00          	ldw	c_y,x
2705  006b 320002        	pop	c_y+2
2706  006e 85            	popw	x
2707  006f bf00          	ldw	c_x,x
2708  0071 320002        	pop	c_x+2
2709  0074 80            	iret
2711                     .const:	section	.text
2712  0000               __vectab:
2713  0000 82            	dc.b	130
2715  0001 00            	dc.b	page(__stext)
2716  0002 0000          	dc.w	__stext
2717  0004 82            	dc.b	130
2719  0005 00            	dc.b	page(f_NonHandledInterrupt)
2720  0006 0000          	dc.w	f_NonHandledInterrupt
2721  0008 82            	dc.b	130
2723  0009 00            	dc.b	page(f_NonHandledInterrupt)
2724  000a 0000          	dc.w	f_NonHandledInterrupt
2725  000c 82            	dc.b	130
2727  000d 00            	dc.b	page(f_NonHandledInterrupt)
2728  000e 0000          	dc.w	f_NonHandledInterrupt
2729  0010 82            	dc.b	130
2731  0011 00            	dc.b	page(f_NonHandledInterrupt)
2732  0012 0000          	dc.w	f_NonHandledInterrupt
2733  0014 82            	dc.b	130
2735  0015 00            	dc.b	page(f_NonHandledInterrupt)
2736  0016 0000          	dc.w	f_NonHandledInterrupt
2737  0018 82            	dc.b	130
2739  0019 00            	dc.b	page(f_NonHandledInterrupt)
2740  001a 0000          	dc.w	f_NonHandledInterrupt
2741  001c 82            	dc.b	130
2743  001d 00            	dc.b	page(f_NonHandledInterrupt)
2744  001e 0000          	dc.w	f_NonHandledInterrupt
2745  0020 82            	dc.b	130
2747  0021 3a            	dc.b	page(f_int_PD3)
2748  0022 003a          	dc.w	f_int_PD3
2749  0024 82            	dc.b	130
2751  0025 01            	dc.b	page(f_int_PE5)
2752  0026 0001          	dc.w	f_int_PE5
2753  0028 82            	dc.b	130
2755  0029 00            	dc.b	page(f_NonHandledInterrupt)
2756  002a 0000          	dc.w	f_NonHandledInterrupt
2757  002c 82            	dc.b	130
2759  002d 00            	dc.b	page(f_NonHandledInterrupt)
2760  002e 0000          	dc.w	f_NonHandledInterrupt
2761  0030 82            	dc.b	130
2763  0031 00            	dc.b	page(f_NonHandledInterrupt)
2764  0032 0000          	dc.w	f_NonHandledInterrupt
2765  0034 82            	dc.b	130
2767  0035 00            	dc.b	page(f_NonHandledInterrupt)
2768  0036 0000          	dc.w	f_NonHandledInterrupt
2769  0038 82            	dc.b	130
2771  0039 00            	dc.b	page(f_NonHandledInterrupt)
2772  003a 0000          	dc.w	f_NonHandledInterrupt
2773  003c 82            	dc.b	130
2775  003d 00            	dc.b	page(f_NonHandledInterrupt)
2776  003e 0000          	dc.w	f_NonHandledInterrupt
2777  0040 82            	dc.b	130
2779  0041 00            	dc.b	page(f_NonHandledInterrupt)
2780  0042 0000          	dc.w	f_NonHandledInterrupt
2781  0044 82            	dc.b	130
2783  0045 00            	dc.b	page(f_NonHandledInterrupt)
2784  0046 0000          	dc.w	f_NonHandledInterrupt
2785  0048 82            	dc.b	130
2787  0049 00            	dc.b	page(f_NonHandledInterrupt)
2788  004a 0000          	dc.w	f_NonHandledInterrupt
2789  004c 82            	dc.b	130
2791  004d 00            	dc.b	page(f_NonHandledInterrupt)
2792  004e 0000          	dc.w	f_NonHandledInterrupt
2793  0050 82            	dc.b	130
2795  0051 00            	dc.b	page(f_NonHandledInterrupt)
2796  0052 0000          	dc.w	f_NonHandledInterrupt
2797  0054 82            	dc.b	130
2799  0055 00            	dc.b	page(f_NonHandledInterrupt)
2800  0056 0000          	dc.w	f_NonHandledInterrupt
2801  0058 82            	dc.b	130
2803  0059 00            	dc.b	page(f_NonHandledInterrupt)
2804  005a 0000          	dc.w	f_NonHandledInterrupt
2805  005c 82            	dc.b	130
2807  005d 00            	dc.b	page(f_NonHandledInterrupt)
2808  005e 0000          	dc.w	f_NonHandledInterrupt
2809  0060 82            	dc.b	130
2811  0061 00            	dc.b	page(f_NonHandledInterrupt)
2812  0062 0000          	dc.w	f_NonHandledInterrupt
2813  0064 82            	dc.b	130
2815  0065 00            	dc.b	page(f_NonHandledInterrupt)
2816  0066 0000          	dc.w	f_NonHandledInterrupt
2817  0068 82            	dc.b	130
2819  0069 00            	dc.b	page(f_NonHandledInterrupt)
2820  006a 0000          	dc.w	f_NonHandledInterrupt
2821  006c 82            	dc.b	130
2823  006d 00            	dc.b	page(f_NonHandledInterrupt)
2824  006e 0000          	dc.w	f_NonHandledInterrupt
2825  0070 82            	dc.b	130
2827  0071 00            	dc.b	page(f_NonHandledInterrupt)
2828  0072 0000          	dc.w	f_NonHandledInterrupt
2829  0074 82            	dc.b	130
2831  0075 00            	dc.b	page(f_NonHandledInterrupt)
2832  0076 0000          	dc.w	f_NonHandledInterrupt
2833  0078 82            	dc.b	130
2835  0079 00            	dc.b	page(f_NonHandledInterrupt)
2836  007a 0000          	dc.w	f_NonHandledInterrupt
2837  007c 82            	dc.b	130
2839  007d 00            	dc.b	page(f_NonHandledInterrupt)
2840  007e 0000          	dc.w	f_NonHandledInterrupt
2891                     	xdef	__vectab
2892                     	xref	__stext
2893                     	xdef	f_int_PD3
2894                     	xdef	f_int_PE5
2895                     	xdef	f_NonHandledInterrupt
2896                     	xref.b	_sal_haut
2897                     	xref.b	_sal_bas
2898                     	xref	_affiche_nombre
2899                     	xref.b	c_x
2900                     	xref.b	c_y
2919                     	end

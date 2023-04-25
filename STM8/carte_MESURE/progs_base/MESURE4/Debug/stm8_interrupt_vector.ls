   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2553                     ; 20 @far @interrupt void NonHandledInterrupt (void)
2553                     ; 21 {
2554                     	switch	.text
2555  0000               f_NonHandledInterrupt:
2559                     ; 25 	return;
2562  0000 80            	iret
2586                     ; 30 @far @interrupt void int_PE5 (void)
2586                     ; 31 {
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
2603                     ; 32 	sal_bas += 2;
2605  0013 3c00          	inc	_sal_bas
2606  0015 3c00          	inc	_sal_bas
2607                     ; 33 	if(sal_bas > 60)
2609  0017 b600          	ld	a,_sal_bas
2610  0019 a13d          	cp	a,#61
2611  001b 2504          	jrult	L1561
2612                     ; 34 		sal_bas = 40;
2614  001d 35280000      	mov	_sal_bas,#40
2615  0021               L1561:
2616                     ; 35 	affiche_nombre(sal_bas, 80, 70); 
2618  0021 4b46          	push	#70
2619  0023 4b50          	push	#80
2620  0025 b600          	ld	a,_sal_bas
2621  0027 5f            	clrw	x
2622  0028 97            	ld	xl,a
2623  0029 cd0000        	call	_affiche_nombre
2625  002c 85            	popw	x
2626                     ; 36 	return;
2629  002d 85            	popw	x
2630  002e bf00          	ldw	c_y,x
2631  0030 320002        	pop	c_y+2
2632  0033 85            	popw	x
2633  0034 bf00          	ldw	c_x,x
2634  0036 320002        	pop	c_x+2
2635  0039 80            	iret
2659                     ; 39 @far @interrupt void int_PD3 (void)
2659                     ; 40 {
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
2676                     ; 41 	sal_haut -= 10;
2678  004c b600          	ld	a,_sal_haut
2679  004e a00a          	sub	a,#10
2680  0050 b700          	ld	_sal_haut,a
2681                     ; 42 	if(sal_haut < 100)
2683  0052 b600          	ld	a,_sal_haut
2684  0054 a164          	cp	a,#100
2685  0056 2404          	jruge	L3661
2686                     ; 43 		sal_haut = 240;
2688  0058 35f00000      	mov	_sal_haut,#240
2689  005c               L3661:
2690                     ; 44 	affiche_nombre(sal_haut, 90, 90); 
2692  005c 4b5a          	push	#90
2693  005e 4b5a          	push	#90
2694  0060 b600          	ld	a,_sal_haut
2695  0062 5f            	clrw	x
2696  0063 97            	ld	xl,a
2697  0064 cd0000        	call	_affiche_nombre
2699  0067 85            	popw	x
2700                     ; 45 	return;
2703  0068 85            	popw	x
2704  0069 bf00          	ldw	c_y,x
2705  006b 320002        	pop	c_y+2
2706  006e 85            	popw	x
2707  006f bf00          	ldw	c_x,x
2708  0071 320002        	pop	c_x+2
2709  0074 80            	iret
2735                     ; 48 @far @interrupt void int_timer1_2ms(void)
2735                     ; 49 {
2736                     	switch	.text
2737  0075               f_int_timer1_2ms:
2741                     ; 50 	int_2ms_ok = 1;
2743  0075 35010000      	mov	_int_2ms_ok,#1
2744                     ; 51 	cpt_ech += 1;
2746  0079 be00          	ldw	x,_cpt_ech
2747  007b 1c0001        	addw	x,#1
2748  007e bf00          	ldw	_cpt_ech,x
2749                     ; 52 	j ++;
2751  0080 3c00          	inc	_j
2752                     ; 53 	TIM1_SR1 = TIM1_SR1 &~(1<<0);
2754  0082 72115255      	bres	_TIM1_SR1,#0
2755                     ; 54 	return;
2758  0086 80            	iret
2760                     .const:	section	.text
2761  0000               __vectab:
2762  0000 82            	dc.b	130
2764  0001 00            	dc.b	page(__stext)
2765  0002 0000          	dc.w	__stext
2766  0004 82            	dc.b	130
2768  0005 00            	dc.b	page(f_NonHandledInterrupt)
2769  0006 0000          	dc.w	f_NonHandledInterrupt
2770  0008 82            	dc.b	130
2772  0009 00            	dc.b	page(f_NonHandledInterrupt)
2773  000a 0000          	dc.w	f_NonHandledInterrupt
2774  000c 82            	dc.b	130
2776  000d 00            	dc.b	page(f_NonHandledInterrupt)
2777  000e 0000          	dc.w	f_NonHandledInterrupt
2778  0010 82            	dc.b	130
2780  0011 00            	dc.b	page(f_NonHandledInterrupt)
2781  0012 0000          	dc.w	f_NonHandledInterrupt
2782  0014 82            	dc.b	130
2784  0015 00            	dc.b	page(f_NonHandledInterrupt)
2785  0016 0000          	dc.w	f_NonHandledInterrupt
2786  0018 82            	dc.b	130
2788  0019 00            	dc.b	page(f_NonHandledInterrupt)
2789  001a 0000          	dc.w	f_NonHandledInterrupt
2790  001c 82            	dc.b	130
2792  001d 00            	dc.b	page(f_NonHandledInterrupt)
2793  001e 0000          	dc.w	f_NonHandledInterrupt
2794  0020 82            	dc.b	130
2796  0021 3a            	dc.b	page(f_int_PD3)
2797  0022 003a          	dc.w	f_int_PD3
2798  0024 82            	dc.b	130
2800  0025 01            	dc.b	page(f_int_PE5)
2801  0026 0001          	dc.w	f_int_PE5
2802  0028 82            	dc.b	130
2804  0029 00            	dc.b	page(f_NonHandledInterrupt)
2805  002a 0000          	dc.w	f_NonHandledInterrupt
2806  002c 82            	dc.b	130
2808  002d 00            	dc.b	page(f_NonHandledInterrupt)
2809  002e 0000          	dc.w	f_NonHandledInterrupt
2810  0030 82            	dc.b	130
2812  0031 00            	dc.b	page(f_NonHandledInterrupt)
2813  0032 0000          	dc.w	f_NonHandledInterrupt
2814  0034 82            	dc.b	130
2816  0035 75            	dc.b	page(f_int_timer1_2ms)
2817  0036 0075          	dc.w	f_int_timer1_2ms
2818  0038 82            	dc.b	130
2820  0039 00            	dc.b	page(f_NonHandledInterrupt)
2821  003a 0000          	dc.w	f_NonHandledInterrupt
2822  003c 82            	dc.b	130
2824  003d 00            	dc.b	page(f_NonHandledInterrupt)
2825  003e 0000          	dc.w	f_NonHandledInterrupt
2826  0040 82            	dc.b	130
2828  0041 00            	dc.b	page(f_NonHandledInterrupt)
2829  0042 0000          	dc.w	f_NonHandledInterrupt
2830  0044 82            	dc.b	130
2832  0045 00            	dc.b	page(f_NonHandledInterrupt)
2833  0046 0000          	dc.w	f_NonHandledInterrupt
2834  0048 82            	dc.b	130
2836  0049 00            	dc.b	page(f_NonHandledInterrupt)
2837  004a 0000          	dc.w	f_NonHandledInterrupt
2838  004c 82            	dc.b	130
2840  004d 00            	dc.b	page(f_NonHandledInterrupt)
2841  004e 0000          	dc.w	f_NonHandledInterrupt
2842  0050 82            	dc.b	130
2844  0051 00            	dc.b	page(f_NonHandledInterrupt)
2845  0052 0000          	dc.w	f_NonHandledInterrupt
2846  0054 82            	dc.b	130
2848  0055 00            	dc.b	page(f_NonHandledInterrupt)
2849  0056 0000          	dc.w	f_NonHandledInterrupt
2850  0058 82            	dc.b	130
2852  0059 00            	dc.b	page(f_NonHandledInterrupt)
2853  005a 0000          	dc.w	f_NonHandledInterrupt
2854  005c 82            	dc.b	130
2856  005d 00            	dc.b	page(f_NonHandledInterrupt)
2857  005e 0000          	dc.w	f_NonHandledInterrupt
2858  0060 82            	dc.b	130
2860  0061 00            	dc.b	page(f_NonHandledInterrupt)
2861  0062 0000          	dc.w	f_NonHandledInterrupt
2862  0064 82            	dc.b	130
2864  0065 00            	dc.b	page(f_NonHandledInterrupt)
2865  0066 0000          	dc.w	f_NonHandledInterrupt
2866  0068 82            	dc.b	130
2868  0069 00            	dc.b	page(f_NonHandledInterrupt)
2869  006a 0000          	dc.w	f_NonHandledInterrupt
2870  006c 82            	dc.b	130
2872  006d 00            	dc.b	page(f_NonHandledInterrupt)
2873  006e 0000          	dc.w	f_NonHandledInterrupt
2874  0070 82            	dc.b	130
2876  0071 00            	dc.b	page(f_NonHandledInterrupt)
2877  0072 0000          	dc.w	f_NonHandledInterrupt
2878  0074 82            	dc.b	130
2880  0075 00            	dc.b	page(f_NonHandledInterrupt)
2881  0076 0000          	dc.w	f_NonHandledInterrupt
2882  0078 82            	dc.b	130
2884  0079 00            	dc.b	page(f_NonHandledInterrupt)
2885  007a 0000          	dc.w	f_NonHandledInterrupt
2886  007c 82            	dc.b	130
2888  007d 00            	dc.b	page(f_NonHandledInterrupt)
2889  007e 0000          	dc.w	f_NonHandledInterrupt
2940                     	xdef	__vectab
2941                     	xref	__stext
2942                     	xdef	f_int_timer1_2ms
2943                     	xdef	f_int_PD3
2944                     	xdef	f_int_PE5
2945                     	xdef	f_NonHandledInterrupt
2946                     	xref.b	_j
2947                     	xref.b	_cpt_ech
2948                     	xref.b	_int_2ms_ok
2949                     	xref.b	_sal_haut
2950                     	xref.b	_sal_bas
2951                     	xref	_affiche_nombre
2952                     	xref.b	c_x
2953                     	xref.b	c_y
2972                     	end

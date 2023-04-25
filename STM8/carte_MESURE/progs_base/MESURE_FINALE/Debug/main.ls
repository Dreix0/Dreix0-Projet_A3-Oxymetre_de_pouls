   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2524                     .const:	section	.text
2525  0000               L3261_Mesure:
2526  0000 4d4553555245  	dc.b	"MESURE",0
2527  0007               L5261_Simu:
2528  0007 53494d5500    	dc.b	"SIMU",0
2529  000c               L7261_Bpm:
2530  000c 42504d3a00    	dc.b	"BPM:",0
2531  0011               L1361_Seuil_bas:
2532  0011 416c5f626173  	dc.b	"Al_bas:",0
2533  0019               L3361_Seuil_haut:
2534  0019 416c5f686175  	dc.b	"Al_haut:",0
2535  0022               L5361_Puis:
2536  0022 505549533a00  	dc.b	"PUIS:",0
2537  0028               L7361_Demo:
2538  0028 4d4f44452044  	dc.b	"MODE DEMO",0
2539  0032               L1461_Ops:
2540  0032 4d4f4445204f  	dc.b	"MODE OPS ",0
2541  003c               L3461_Texte:
2542  003c 54657874653a  	dc.b	"Texte:",0
2543  0043               L5461_Fond:
2544  0043 466f6e643a00  	dc.b	"Fond:",0
2545  0049               L7461_Valeurs:
2546  0049 56616c657572  	dc.b	"Valeurs:",0
2677                     	bsct
2678  0000               _sal_bas:
2679  0000 28            	dc.b	40
2680  0001               _sal_haut:
2681  0001 c8            	dc.b	200
2682  0002               _ac_cap:
2683  0002 07d0          	dc.w	2000
2684  0004               _dc_cap:
2685  0004 03e8          	dc.w	1000
2686  0006               _tab_cpt_moy:
2687  0006 01ac          	dc.w	428
2688  0008 01ac          	dc.w	428
2689  000a 01ac          	dc.w	428
2690  000c 01ac          	dc.w	428
2691  000e 01ac          	dc.w	428
2692  0010 01ac          	dc.w	428
2693  0012 01ac          	dc.w	428
2694  0014 01ac          	dc.w	428
2695  0016               _j:
2696  0016 00            	dc.b	0
2697  0017               _int_PC4:
2698  0017 00            	dc.b	0
2699  0018               _bg_color:
2700  0018 00            	dc.b	0
2701  0019               _txt_color:
2702  0019 02            	dc.b	2
2703  001a               _val_color:
2704  001a 06            	dc.b	6
2765                     ; 53 main()
2765                     ; 54 {	
2767                     	switch	.text
2768  0000               _main:
2772                     ; 55 	CLK_CKDIVR &= ~(0b11111);
2774  0000 c650c6        	ld	a,_CLK_CKDIVR
2775  0003 a4e0          	and	a,#224
2776  0005 c750c6        	ld	_CLK_CKDIVR,a
2777                     ; 56 	k = 4;
2779  0008 3504000c      	mov	_k,#4
2780                     ; 57 	cpt_moy = (tab_cpt_moy[0]+tab_cpt_moy[1]+tab_cpt_moy[2]+tab_cpt_moy[3]+tab_cpt_moy[4]+tab_cpt_moy[5]+tab_cpt_moy[6]+tab_cpt_moy[7])/8;  
2782  000c be06          	ldw	x,_tab_cpt_moy
2783  000e 72bb0008      	addw	x,_tab_cpt_moy+2
2784  0012 72bb000a      	addw	x,_tab_cpt_moy+4
2785  0016 72bb000c      	addw	x,_tab_cpt_moy+6
2786  001a 72bb000e      	addw	x,_tab_cpt_moy+8
2787  001e 72bb0010      	addw	x,_tab_cpt_moy+10
2788  0022 72bb0012      	addw	x,_tab_cpt_moy+12
2789  0026 72bb0014      	addw	x,_tab_cpt_moy+14
2790  002a 54            	srlw	x
2791  002b 54            	srlw	x
2792  002c 54            	srlw	x
2793  002d bf06          	ldw	_cpt_moy,x
2794                     ; 59 	etat=1; // etat mise à 1 au reset
2796  002f 35010003      	mov	_etat,#1
2797                     ; 62 	init_SPI();
2799  0033 cd0000        	call	_init_SPI
2801                     ; 63 	init_TFT();
2803  0036 cd0000        	call	_init_TFT
2805                     ; 64 	init_Poussoirs();
2807  0039 cd0000        	call	_init_Poussoirs
2809                     ; 65 	init_LED();
2811  003c cd0000        	call	_init_LED
2813                     ; 66 	init_ADC();
2815  003f cd0000        	call	_init_ADC
2817                     ; 68 	init_timer1_2ms();
2819  0042 cd0000        	call	_init_timer1_2ms
2821                     ; 69 	init_timer2_pwm();
2823  0045 cd0000        	call	_init_timer2_pwm
2825                     ; 70 	init_UART2(57600);
2827  0048 aee100        	ldw	x,#57600
2828  004b cd0000        	call	_init_UART2
2830                     ; 72 	Init_I2C_Master();
2832  004e cd0000        	call	_Init_I2C_Master
2834                     ; 74 	EnableGeneralInterrupt(); 
2837  0051 9a            RIM
2839                     ; 75 	ADC_CR1 |= 0x01;
2841  0052 72105401      	bset	_ADC_CR1,#0
2842  0056               L5671:
2843                     ; 81 		if(int_2ms_ok == 1)
2845  0056 b605          	ld	a,_int_2ms_ok
2846  0058 a101          	cp	a,#1
2847  005a 2703          	jreq	L6
2848  005c cc0107        	jp	L1771
2849  005f               L6:
2850                     ; 95 		int_2ms_ok = 0;
2852  005f 3f05          	clr	_int_2ms_ok
2853                     ; 98 		switch (etat) {
2855  0061 b603          	ld	a,_etat
2857                     ; 133 			default: break;
2858  0063 4a            	dec	a
2859  0064 270c          	jreq	L5371
2860  0066 4a            	dec	a
2861  0067 2717          	jreq	L7371
2862  0069 4a            	dec	a
2863  006a 272a          	jreq	L1471
2864  006c 4a            	dec	a
2865  006d 273e          	jreq	L3471
2866  006f cc0107        	jra	L1771
2867  0072               L5371:
2868                     ; 99 			case 1:
2868                     ; 100 				if (ac_cap>2148)
2870  0072 be02          	ldw	x,_ac_cap
2871  0074 a30865        	cpw	x,#2149
2872  0077 25f6          	jrult	L1771
2873                     ; 101 					etat=2;
2875  0079 35020003      	mov	_etat,#2
2876  007d cc0107        	jra	L1771
2877  0080               L7371:
2878                     ; 103 			case 2:
2878                     ; 104 				if (ac_cap<1948)
2880  0080 be02          	ldw	x,_ac_cap
2881  0082 a3079c        	cpw	x,#1948
2882  0085 24f6          	jruge	L1771
2883                     ; 106 				etat=3;
2885  0087 35030003      	mov	_etat,#3
2886                     ; 107 				cpt_ech=0;
2888  008b 5f            	clrw	x
2889  008c bf08          	ldw	_cpt_ech,x
2890                     ; 108 				PB_ODR = PB_ODR|(1<<0);
2892  008e 72105005      	bset	_PB_ODR,#0
2893                     ; 109 				j = 0;
2895  0092 3f16          	clr	_j
2896  0094 2071          	jra	L1771
2897  0096               L1471:
2898                     ; 112 			case 3:
2898                     ; 113 				if(j==50)
2900  0096 b616          	ld	a,_j
2901  0098 a132          	cp	a,#50
2902  009a 2604          	jrne	L3002
2903                     ; 114 					PB_ODR = PB_ODR&~(1<<0);
2905  009c 72115005      	bres	_PB_ODR,#0
2906  00a0               L3002:
2907                     ; 115 				if	(ac_cap>2148)
2909  00a0 be02          	ldw	x,_ac_cap
2910  00a2 a30865        	cpw	x,#2149
2911  00a5 2560          	jrult	L1771
2912                     ; 116 					etat=4;
2914  00a7 35040003      	mov	_etat,#4
2915  00ab 205a          	jra	L1771
2916  00ad               L3471:
2917                     ; 118 			case 4:
2917                     ; 119 				if(ac_cap<1948)
2919  00ad be02          	ldw	x,_ac_cap
2920  00af a3079c        	cpw	x,#1948
2921  00b2 2453          	jruge	L1771
2922                     ; 121 				etat=3;
2924  00b4 35030003      	mov	_etat,#3
2925                     ; 122 				PB_ODR = PB_ODR|(1<<0);
2927  00b8 72105005      	bset	_PB_ODR,#0
2928                     ; 123 				j = 0;
2930  00bc 3f16          	clr	_j
2931                     ; 124 				tab_cpt_moy[i] = cpt_ech;
2933  00be b602          	ld	a,_i
2934  00c0 5f            	clrw	x
2935  00c1 97            	ld	xl,a
2936  00c2 58            	sllw	x
2937  00c3 90be08        	ldw	y,_cpt_ech
2938  00c6 ef06          	ldw	(_tab_cpt_moy,x),y
2939                     ; 125 				cpt_ech=0;
2941  00c8 5f            	clrw	x
2942  00c9 bf08          	ldw	_cpt_ech,x
2943                     ; 126 				i ++;
2945  00cb 3c02          	inc	_i
2946                     ; 127 				if(i==8)
2948  00cd b602          	ld	a,_i
2949  00cf a108          	cp	a,#8
2950  00d1 2602          	jrne	L1102
2951                     ; 128 					i = 0;
2953  00d3 3f02          	clr	_i
2954  00d5               L1102:
2955                     ; 129 				cpt_moy = (tab_cpt_moy[0]+tab_cpt_moy[1]+tab_cpt_moy[2]+tab_cpt_moy[3]+tab_cpt_moy[4]+tab_cpt_moy[5]+tab_cpt_moy[6]+tab_cpt_moy[7])/8;  
2957  00d5 be06          	ldw	x,_tab_cpt_moy
2958  00d7 72bb0008      	addw	x,_tab_cpt_moy+2
2959  00db 72bb000a      	addw	x,_tab_cpt_moy+4
2960  00df 72bb000c      	addw	x,_tab_cpt_moy+6
2961  00e3 72bb000e      	addw	x,_tab_cpt_moy+8
2962  00e7 72bb0010      	addw	x,_tab_cpt_moy+10
2963  00eb 72bb0012      	addw	x,_tab_cpt_moy+12
2964  00ef 72bb0014      	addw	x,_tab_cpt_moy+14
2965  00f3 54            	srlw	x
2966  00f4 54            	srlw	x
2967  00f5 54            	srlw	x
2968  00f6 bf06          	ldw	_cpt_moy,x
2969                     ; 130 				affiche_nombre(30000/cpt_moy, (sizeof(Bpm)-1)*11+1.4, 50);
2971  00f8 4b32          	push	#50
2972  00fa 4b2d          	push	#45
2973  00fc ae7530        	ldw	x,#30000
2974  00ff 90be06        	ldw	y,_cpt_moy
2975  0102 65            	divw	x,y
2976  0103 cd0000        	call	_affiche_nombre
2978  0106 85            	popw	x
2979  0107               L5471:
2980                     ; 133 			default: break;
2982  0107               L5771:
2983  0107               L1771:
2984                     ; 139 		if(cpt_ech > 1000)
2986  0107 be08          	ldw	x,_cpt_ech
2987  0109 a303e9        	cpw	x,#1001
2988  010c 250f          	jrult	L3102
2989                     ; 141 			affiche_nombre(888, (sizeof(Bpm)-1)*11+1.4, 50);
2991  010e 4b32          	push	#50
2992  0110 4b2d          	push	#45
2993  0112 ae0378        	ldw	x,#888
2994  0115 cd0000        	call	_affiche_nombre
2996  0118 85            	popw	x
2997                     ; 142 			etat = 2;
2999  0119 35020003      	mov	_etat,#2
3000  011d               L3102:
3001                     ; 148 		if((30000/cpt_moy <= sal_bas)||(30000/cpt_moy>=sal_haut))
3003  011d ae7530        	ldw	x,#30000
3004  0120 90be06        	ldw	y,_cpt_moy
3005  0123 65            	divw	x,y
3006  0124 b600          	ld	a,_sal_bas
3007  0126 905f          	clrw	y
3008  0128 9097          	ld	yl,a
3009  012a 90bf00        	ldw	c_y,y
3010  012d b300          	cpw	x,c_y
3011  012f 2314          	jrule	L7102
3013  0131 ae7530        	ldw	x,#30000
3014  0134 90be06        	ldw	y,_cpt_moy
3015  0137 65            	divw	x,y
3016  0138 b601          	ld	a,_sal_haut
3017  013a 905f          	clrw	y
3018  013c 9097          	ld	yl,a
3019  013e 90bf00        	ldw	c_y,y
3020  0141 b300          	cpw	x,c_y
3021  0143 2541          	jrult	L5102
3022  0145               L7102:
3023                     ; 149 			PB_ODR = PB_ODR|(1<<1);
3025  0145 72125005      	bset	_PB_ODR,#1
3027  0149               L1202:
3028                     ; 154 		if((ADC_CSR&(1<<7))==128)
3030  0149 c65400        	ld	a,_ADC_CSR
3031  014c a480          	and	a,#128
3032  014e a180          	cp	a,#128
3033  0150 2703          	jreq	L01
3034  0152 cc0056        	jp	L5671
3035  0155               L01:
3036                     ; 156 				if(OLD_ADC_DRH != ADC_DRH)
3038  0155 b604          	ld	a,_OLD_ADC_DRH
3039  0157 c15404        	cp	a,_ADC_DRH
3040  015a 2730          	jreq	L5202
3041                     ; 158 					PUIS = (ADC_DRH*100)/255;
3043  015c c65404        	ld	a,_ADC_DRH
3044  015f 97            	ld	xl,a
3045  0160 a664          	ld	a,#100
3046  0162 42            	mul	x,a
3047  0163 90ae00ff      	ldw	y,#255
3048  0167 cd0000        	call	c_idiv
3050  016a 01            	rrwa	x,a
3051  016b b70d          	ld	_PUIS,a
3052  016d 02            	rlwa	x,a
3053                     ; 159 					TIM2_CCR1L = PUIS;
3055  016e 55000d5310    	mov	_TIM2_CCR1L,_PUIS
3056                     ; 160 					affiche_nombre(PUIS,(sizeof(Puis)-1)*11+1.13, 110);
3058  0173 4b6e          	push	#110
3059  0175 4b38          	push	#56
3060  0177 b60d          	ld	a,_PUIS
3061  0179 5f            	clrw	x
3062  017a 97            	ld	xl,a
3063  017b cd0000        	call	_affiche_nombre
3065  017e 85            	popw	x
3066                     ; 161 					OLD_ADC_DRH = ADC_DRH;
3068  017f 5554040004    	mov	_OLD_ADC_DRH,_ADC_DRH
3069  0184 2006          	jra	L5202
3070  0186               L5102:
3071                     ; 151 			PB_ODR = PB_ODR&~(1<<1);
3073  0186 72135005      	bres	_PB_ODR,#1
3074  018a 20bd          	jra	L1202
3075  018c               L5202:
3076                     ; 164 				ADC_CSR = ADC_CSR&~(1<<7);
3078  018c 721f5400      	bres	_ADC_CSR,#7
3079                     ; 165 				ADC_CR1 |= 0x01;
3081  0190 72105401      	bset	_ADC_CR1,#0
3082  0194 ac560056      	jpf	L5671
3287                     	xdef	_main
3288                     	xdef	_val_color
3289                     	xdef	_txt_color
3290                     	xdef	_bg_color
3291                     	switch	.ubsct
3292  0000               _couleur_ok:
3293  0000 00            	ds.b	1
3294                     	xdef	_couleur_ok
3295  0001               _choix_couleur:
3296  0001 00            	ds.b	1
3297                     	xdef	_choix_couleur
3298                     	xdef	_int_PC4
3299                     	xdef	_j
3300  0002               _i:
3301  0002 00            	ds.b	1
3302                     	xdef	_i
3303  0003               _etat:
3304  0003 00            	ds.b	1
3305                     	xdef	_etat
3306  0004               _OLD_ADC_DRH:
3307  0004 00            	ds.b	1
3308                     	xdef	_OLD_ADC_DRH
3309  0005               _int_2ms_ok:
3310  0005 00            	ds.b	1
3311                     	xdef	_int_2ms_ok
3312                     	xdef	_tab_cpt_moy
3313  0006               _cpt_moy:
3314  0006 0000          	ds.b	2
3315                     	xdef	_cpt_moy
3316  0008               _cpt_ech:
3317  0008 0000          	ds.b	2
3318                     	xdef	_cpt_ech
3319                     	xdef	_dc_cap
3320                     	xdef	_ac_cap
3321  000a               _BPM:
3322  000a 0000          	ds.b	2
3323                     	xdef	_BPM
3324  000c               _k:
3325  000c 00            	ds.b	1
3326                     	xdef	_k
3327  000d               _PUIS:
3328  000d 00            	ds.b	1
3329                     	xdef	_PUIS
3330                     	xdef	_sal_haut
3331                     	xdef	_sal_bas
3332                     	xref	_Init_I2C_Master
3333                     	xref	_init_TFT
3334                     	xref	_init_timer2_pwm
3335                     	xref	_init_UART2
3336                     	xref	_init_timer1_2ms
3337                     	xref	_affiche_nombre
3338                     	xref	_init_LED
3339                     	xref	_init_Poussoirs
3340                     	xref	_init_ADC
3341                     	xref	_init_SPI
3342                     	xref.b	c_y
3362                     	xref	c_idiv
3363                     	end

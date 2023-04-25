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
2745                     ; 40 main()
2745                     ; 41 {	
2747                     	switch	.text
2748  0000               _main:
2752                     ; 42 	BPM = 50;
2754  0000 ae0032        	ldw	x,#50
2755  0003 bf16          	ldw	_BPM,x
2756                     ; 43 	CLK_CKDIVR = 0;
2758  0005 725f50c6      	clr	_CLK_CKDIVR
2759                     ; 46 	init_SPI();
2761  0009 cd0000        	call	_init_SPI
2763                     ; 47 	init_TFT();
2765  000c cd0000        	call	_init_TFT
2767                     ; 48 	init_Poussoirs();
2769  000f cd0000        	call	_init_Poussoirs
2771                     ; 49 	init_LED();
2773  0012 cd0000        	call	_init_LED
2775                     ; 50 	init_ADC();
2777  0015 cd0000        	call	_init_ADC
2779                     ; 52 	init_timer1_2ms();
2781  0018 cd0000        	call	_init_timer1_2ms
2783                     ; 53 	init_timer2_pwm();
2785  001b cd0000        	call	_init_timer2_pwm
2787                     ; 54 	init_UART2(57600);
2789  001e aee100        	ldw	x,#57600
2790  0021 cd0000        	call	_init_UART2
2792                     ; 57 	affiche_mot(Mesure, 28.5, 10);
2794  0024 4b0a          	push	#10
2795  0026 4b1c          	push	#28
2796  0028 ae0000        	ldw	x,#L3261_Mesure
2797  002b cd0000        	call	_affiche_mot
2799  002e 85            	popw	x
2800                     ; 58 	affiche_mot(Bpm, 1.4, 50);
2802  002f 4b32          	push	#50
2803  0031 4b01          	push	#1
2804  0033 ae000c        	ldw	x,#L7261_Bpm
2805  0036 cd0000        	call	_affiche_mot
2807  0039 85            	popw	x
2808                     ; 59 	affiche_mot(Seuil_bas, 1.7, 70);
2810  003a 4b46          	push	#70
2811  003c 4b01          	push	#1
2812  003e ae0011        	ldw	x,#L1361_Seuil_bas
2813  0041 cd0000        	call	_affiche_mot
2815  0044 85            	popw	x
2816                     ; 60 	affiche_mot(Seuil_haut, 1.1, 90);
2818  0045 4b5a          	push	#90
2819  0047 4b01          	push	#1
2820  0049 ae0019        	ldw	x,#L3361_Seuil_haut
2821  004c cd0000        	call	_affiche_mot
2823  004f 85            	popw	x
2824                     ; 61 	affiche_mot(Puis,1.13, 110);
2826  0050 4b6e          	push	#110
2827  0052 4b01          	push	#1
2828  0054 ae0022        	ldw	x,#L5361_Puis
2829  0057 cd0000        	call	_affiche_mot
2831  005a 85            	popw	x
2832                     ; 63 	affiche_nombre(BPM, (sizeof(Bpm)-1)*11+1.4, 50);
2834  005b 4b32          	push	#50
2835  005d 4b2d          	push	#45
2836  005f be16          	ldw	x,_BPM
2837  0061 cd0000        	call	_affiche_nombre
2839  0064 85            	popw	x
2840                     ; 64 	affiche_nombre(sal_bas, 80, 70);
2842  0065 4b46          	push	#70
2843  0067 4b50          	push	#80
2844  0069 b600          	ld	a,_sal_bas
2845  006b 5f            	clrw	x
2846  006c 97            	ld	xl,a
2847  006d cd0000        	call	_affiche_nombre
2849  0070 85            	popw	x
2850                     ; 65 	affiche_nombre(sal_haut, 90, 90);
2852  0071 4b5a          	push	#90
2853  0073 4b5a          	push	#90
2854  0075 b601          	ld	a,_sal_haut
2855  0077 5f            	clrw	x
2856  0078 97            	ld	xl,a
2857  0079 cd0000        	call	_affiche_nombre
2859  007c 85            	popw	x
2860                     ; 67 	EnableGeneralInterrupt(); 
2863  007d 9a            RIM
2865                     ; 68 	ADC_CR1 |= 0x01;
2867  007e 72105401      	bset	_ADC_CR1,#0
2868  0082               L3571:
2869                     ; 72 	if(int_2ms_ok == 1)
2871  0082 b601          	ld	a,_int_2ms_ok
2872  0084 a101          	cp	a,#1
2873  0086 2638          	jrne	L7571
2874                     ; 74 	write_byte_UART2(ac_cap>>8);
2876  0088 b602          	ld	a,_ac_cap
2877  008a cd0000        	call	_write_byte_UART2
2879                     ; 75 	write_byte_UART2(0b10000|(ac_cap&0x0F0)>>4);
2881  008d b603          	ld	a,_ac_cap+1
2882  008f a4f0          	and	a,#240
2883  0091 4e            	swap	a
2884  0092 a40f          	and	a,#15
2885  0094 aa10          	or	a,#16
2886  0096 cd0000        	call	_write_byte_UART2
2888                     ; 76 	write_byte_UART2(0b100000|(ac_cap&0x00F));
2890  0099 b603          	ld	a,_ac_cap+1
2891  009b a40f          	and	a,#15
2892  009d aa20          	or	a,#32
2893  009f cd0000        	call	_write_byte_UART2
2895                     ; 77 	write_byte_UART2((dc_cap>>8)|(1<<7));
2897  00a2 b604          	ld	a,_dc_cap
2898  00a4 aa80          	or	a,#128
2899  00a6 cd0000        	call	_write_byte_UART2
2901                     ; 78 	write_byte_UART2(0b10010000|(dc_cap&0x0F0)>>4);
2903  00a9 b605          	ld	a,_dc_cap+1
2904  00ab a4f0          	and	a,#240
2905  00ad 4e            	swap	a
2906  00ae a40f          	and	a,#15
2907  00b0 aa90          	or	a,#144
2908  00b2 cd0000        	call	_write_byte_UART2
2910                     ; 79 	write_byte_UART2(0b10100000|(dc_cap&0x00F));
2912  00b5 b605          	ld	a,_dc_cap+1
2913  00b7 a40f          	and	a,#15
2914  00b9 aaa0          	or	a,#160
2915  00bb cd0000        	call	_write_byte_UART2
2917                     ; 80 	int_2ms_ok = 0;
2919  00be 3f01          	clr	_int_2ms_ok
2920  00c0               L7571:
2921                     ; 83 	if((BPM <= sal_bas)||(BPM>=sal_haut))
2923  00c0 b600          	ld	a,_sal_bas
2924  00c2 5f            	clrw	x
2925  00c3 97            	ld	xl,a
2926  00c4 bf00          	ldw	c_x,x
2927  00c6 be16          	ldw	x,_BPM
2928  00c8 b300          	cpw	x,c_x
2929  00ca 230c          	jrule	L3671
2931  00cc b601          	ld	a,_sal_haut
2932  00ce 5f            	clrw	x
2933  00cf 97            	ld	xl,a
2934  00d0 bf00          	ldw	c_x,x
2935  00d2 be16          	ldw	x,_BPM
2936  00d4 b300          	cpw	x,c_x
2937  00d6 253e          	jrult	L1671
2938  00d8               L3671:
2939                     ; 84 		PB_ODR = PB_ODR|(1<<1);
2941  00d8 72125005      	bset	_PB_ODR,#1
2943  00dc               L5671:
2944                     ; 88 	if((ADC_CSR&(1<<7))==128)
2946  00dc c65400        	ld	a,_ADC_CSR
2947  00df a480          	and	a,#128
2948  00e1 a180          	cp	a,#128
2949  00e3 269d          	jrne	L3571
2950                     ; 90 			if(OLD_ADC_DRH != ADC_DRH)
2952  00e5 b600          	ld	a,_OLD_ADC_DRH
2953  00e7 c15404        	cp	a,_ADC_DRH
2954  00ea 2730          	jreq	L1771
2955                     ; 92 				PUIS = (ADC_DRH*100)/255;
2957  00ec c65404        	ld	a,_ADC_DRH
2958  00ef 97            	ld	xl,a
2959  00f0 a664          	ld	a,#100
2960  00f2 42            	mul	x,a
2961  00f3 90ae00ff      	ldw	y,#255
2962  00f7 cd0000        	call	c_idiv
2964  00fa 01            	rrwa	x,a
2965  00fb b719          	ld	_PUIS,a
2966  00fd 02            	rlwa	x,a
2967                     ; 93 				TIM2_CCR1L = PUIS;
2969  00fe 5500195310    	mov	_TIM2_CCR1L,_PUIS
2970                     ; 94 				affiche_nombre(PUIS,(sizeof(Puis)-1)*11+1.13, 110);
2972  0103 4b6e          	push	#110
2973  0105 4b38          	push	#56
2974  0107 b619          	ld	a,_PUIS
2975  0109 5f            	clrw	x
2976  010a 97            	ld	xl,a
2977  010b cd0000        	call	_affiche_nombre
2979  010e 85            	popw	x
2980                     ; 95 				OLD_ADC_DRH = ADC_DRH;
2982  010f 5554040000    	mov	_OLD_ADC_DRH,_ADC_DRH
2983  0114 2006          	jra	L1771
2984  0116               L1671:
2985                     ; 86 		PB_ODR = PB_ODR&~(1<<1);
2987  0116 72135005      	bres	_PB_ODR,#1
2988  011a 20c0          	jra	L5671
2989  011c               L1771:
2990                     ; 98 			ADC_CSR = ADC_CSR&~(1<<7);
2992  011c 721f5400      	bres	_ADC_CSR,#7
2993                     ; 99 			ADC_CR1 |= 0x01;
2995  0120 72105401      	bset	_ADC_CR1,#0
2996  0124 ac820082      	jpf	L3571
3120                     	xdef	_main
3121                     	switch	.ubsct
3122  0000               _OLD_ADC_DRH:
3123  0000 00            	ds.b	1
3124                     	xdef	_OLD_ADC_DRH
3125  0001               _int_2ms_ok:
3126  0001 00            	ds.b	1
3127                     	xdef	_int_2ms_ok
3128  0002               _tab_cpt_moy:
3129  0002 000000000000  	ds.b	16
3130                     	xdef	_tab_cpt_moy
3131  0012               _cpt_moy:
3132  0012 0000          	ds.b	2
3133                     	xdef	_cpt_moy
3134  0014               _cpt_ech:
3135  0014 0000          	ds.b	2
3136                     	xdef	_cpt_ech
3137                     	xdef	_dc_cap
3138                     	xdef	_ac_cap
3139  0016               _BPM:
3140  0016 0000          	ds.b	2
3141                     	xdef	_BPM
3142  0018               _k:
3143  0018 00            	ds.b	1
3144                     	xdef	_k
3145  0019               _PUIS:
3146  0019 00            	ds.b	1
3147                     	xdef	_PUIS
3148                     	xdef	_sal_haut
3149                     	xdef	_sal_bas
3150                     	xref	_init_TFT
3151                     	xref	_init_timer2_pwm
3152                     	xref	_write_byte_UART2
3153                     	xref	_init_UART2
3154                     	xref	_init_timer1_2ms
3155                     	xref	_affiche_nombre
3156                     	xref	_affiche_mot
3157                     	xref	_init_LED
3158                     	xref	_init_Poussoirs
3159                     	xref	_init_ADC
3160                     	xref	_init_SPI
3161                     	xref.b	c_x
3181                     	xref	c_idiv
3182                     	end

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
2737                     ; 39 main()
2737                     ; 40 {	
2739                     	switch	.text
2740  0000               _main:
2744                     ; 41 	BPM = 50;
2746  0000 ae0032        	ldw	x,#50
2747  0003 bf16          	ldw	_BPM,x
2748                     ; 42 	CLK_CKDIVR = 0;
2750  0005 725f50c6      	clr	_CLK_CKDIVR
2751                     ; 45 	init_SPI();
2753  0009 cd0000        	call	_init_SPI
2755                     ; 46 	init_TFT();
2757  000c cd0000        	call	_init_TFT
2759                     ; 47 	init_Poussoirs();
2761  000f cd0000        	call	_init_Poussoirs
2763                     ; 48 	init_LED();
2765  0012 cd0000        	call	_init_LED
2767                     ; 49 	init_ADC();
2769  0015 cd0000        	call	_init_ADC
2771                     ; 52 	affiche_mot(Mesure, 28.5, 10);
2773  0018 4b0a          	push	#10
2774  001a 4b1c          	push	#28
2775  001c ae0000        	ldw	x,#L3261_Mesure
2776  001f cd0000        	call	_affiche_mot
2778  0022 85            	popw	x
2779                     ; 53 	affiche_mot(Bpm, 1.4, 50);
2781  0023 4b32          	push	#50
2782  0025 4b01          	push	#1
2783  0027 ae000c        	ldw	x,#L7261_Bpm
2784  002a cd0000        	call	_affiche_mot
2786  002d 85            	popw	x
2787                     ; 54 	affiche_mot(Seuil_bas, 1.7, 70);
2789  002e 4b46          	push	#70
2790  0030 4b01          	push	#1
2791  0032 ae0011        	ldw	x,#L1361_Seuil_bas
2792  0035 cd0000        	call	_affiche_mot
2794  0038 85            	popw	x
2795                     ; 55 	affiche_mot(Seuil_haut, 1.1, 90);
2797  0039 4b5a          	push	#90
2798  003b 4b01          	push	#1
2799  003d ae0019        	ldw	x,#L3361_Seuil_haut
2800  0040 cd0000        	call	_affiche_mot
2802  0043 85            	popw	x
2803                     ; 56 	affiche_mot(Puis,1.13, 110);
2805  0044 4b6e          	push	#110
2806  0046 4b01          	push	#1
2807  0048 ae0022        	ldw	x,#L5361_Puis
2808  004b cd0000        	call	_affiche_mot
2810  004e 85            	popw	x
2811                     ; 58 	affiche_nombre(BPM, (sizeof(Bpm)-1)*11+1.4, 50);
2813  004f 4b32          	push	#50
2814  0051 4b2d          	push	#45
2815  0053 be16          	ldw	x,_BPM
2816  0055 cd0000        	call	_affiche_nombre
2818  0058 85            	popw	x
2819                     ; 59 	affiche_nombre(sal_bas, (sizeof(Seuil_bas)-1)*11+1.7, 70);
2821  0059 4b46          	push	#70
2822  005b 4b4e          	push	#78
2823  005d b600          	ld	a,_sal_bas
2824  005f 5f            	clrw	x
2825  0060 97            	ld	xl,a
2826  0061 cd0000        	call	_affiche_nombre
2828  0064 85            	popw	x
2829                     ; 60 	affiche_nombre(sal_haut, (sizeof(Seuil_haut)-1)*11+1.7, 90);
2831  0065 4b5a          	push	#90
2832  0067 4b59          	push	#89
2833  0069 b601          	ld	a,_sal_haut
2834  006b 5f            	clrw	x
2835  006c 97            	ld	xl,a
2836  006d cd0000        	call	_affiche_nombre
2838  0070 85            	popw	x
2839                     ; 62 	EnableGeneralInterrupt(); 
2842  0071 9a            RIM
2844                     ; 63 	ADC_CR1 |= 0x01;
2846  0072 72105401      	bset	_ADC_CR1,#0
2847  0076               L3571:
2848                     ; 67 	if((BPM <= sal_bas)||(BPM>=sal_haut))
2850  0076 b600          	ld	a,_sal_bas
2851  0078 5f            	clrw	x
2852  0079 97            	ld	xl,a
2853  007a bf00          	ldw	c_x,x
2854  007c be16          	ldw	x,_BPM
2855  007e b300          	cpw	x,c_x
2856  0080 230c          	jrule	L1671
2858  0082 b601          	ld	a,_sal_haut
2859  0084 5f            	clrw	x
2860  0085 97            	ld	xl,a
2861  0086 bf00          	ldw	c_x,x
2862  0088 be16          	ldw	x,_BPM
2863  008a b300          	cpw	x,c_x
2864  008c 2539          	jrult	L7571
2865  008e               L1671:
2866                     ; 68 		PB_ODR = PB_ODR|(1<<1);
2868  008e 72125005      	bset	_PB_ODR,#1
2870  0092               L3671:
2871                     ; 72 	if((ADC_CSR&(1<<7))==128)
2873  0092 c65400        	ld	a,_ADC_CSR
2874  0095 a480          	and	a,#128
2875  0097 a180          	cp	a,#128
2876  0099 26db          	jrne	L3571
2877                     ; 74 			if(OLD_ADC_DRH != ADC_DRH)
2879  009b b600          	ld	a,_OLD_ADC_DRH
2880  009d c15404        	cp	a,_ADC_DRH
2881  00a0 272b          	jreq	L7671
2882                     ; 76 				PUIS = (ADC_DRH*100)/255;
2884  00a2 c65404        	ld	a,_ADC_DRH
2885  00a5 97            	ld	xl,a
2886  00a6 a664          	ld	a,#100
2887  00a8 42            	mul	x,a
2888  00a9 90ae00ff      	ldw	y,#255
2889  00ad cd0000        	call	c_idiv
2891  00b0 01            	rrwa	x,a
2892  00b1 b719          	ld	_PUIS,a
2893  00b3 02            	rlwa	x,a
2894                     ; 77 				affiche_nombre(PUIS,70, 110);
2896  00b4 4b6e          	push	#110
2897  00b6 4b46          	push	#70
2898  00b8 b619          	ld	a,_PUIS
2899  00ba 5f            	clrw	x
2900  00bb 97            	ld	xl,a
2901  00bc cd0000        	call	_affiche_nombre
2903  00bf 85            	popw	x
2904                     ; 78 				OLD_ADC_DRH = ADC_DRH;
2906  00c0 5554040000    	mov	_OLD_ADC_DRH,_ADC_DRH
2907  00c5 2006          	jra	L7671
2908  00c7               L7571:
2909                     ; 70 		PB_ODR = PB_ODR&~(1<<1);
2911  00c7 72135005      	bres	_PB_ODR,#1
2912  00cb 20c5          	jra	L3671
2913  00cd               L7671:
2914                     ; 81 			ADC_CSR = ADC_CSR&~(1<<7);
2916  00cd 721f5400      	bres	_ADC_CSR,#7
2917                     ; 82 			ADC_CR1 |= 0x01;
2919  00d1 72105401      	bset	_ADC_CR1,#0
2920  00d5 209f          	jra	L3571
3044                     	xdef	_main
3045                     	switch	.ubsct
3046  0000               _OLD_ADC_DRH:
3047  0000 00            	ds.b	1
3048                     	xdef	_OLD_ADC_DRH
3049  0001               _int_2ms_ok:
3050  0001 00            	ds.b	1
3051                     	xdef	_int_2ms_ok
3052  0002               _tab_cpt_moy:
3053  0002 000000000000  	ds.b	16
3054                     	xdef	_tab_cpt_moy
3055  0012               _cpt_moy:
3056  0012 0000          	ds.b	2
3057                     	xdef	_cpt_moy
3058  0014               _cpt_ech:
3059  0014 0000          	ds.b	2
3060                     	xdef	_cpt_ech
3061                     	xdef	_dc_cap
3062                     	xdef	_ac_cap
3063  0016               _BPM:
3064  0016 0000          	ds.b	2
3065                     	xdef	_BPM
3066  0018               _k:
3067  0018 00            	ds.b	1
3068                     	xdef	_k
3069  0019               _PUIS:
3070  0019 00            	ds.b	1
3071                     	xdef	_PUIS
3072                     	xdef	_sal_haut
3073                     	xdef	_sal_bas
3074                     	xref	_init_TFT
3075                     	xref	_affiche_nombre
3076                     	xref	_affiche_mot
3077                     	xref	_init_LED
3078                     	xref	_init_Poussoirs
3079                     	xref	_init_ADC
3080                     	xref	_init_SPI
3081                     	xref.b	c_x
3101                     	xref	c_idiv
3102                     	end

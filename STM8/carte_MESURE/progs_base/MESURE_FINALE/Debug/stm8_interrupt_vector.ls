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
2678  0000               _couleur:
2679  0000 0000          	dc.w	0
2680  0002 001f          	dc.w	31
2681  0004 f800          	dc.w	-2048
2682  0006 07e0          	dc.w	2016
2683  0008 07ff          	dc.w	2047
2684  000a f81f          	dc.w	-2017
2685  000c ffe0          	dc.w	-32
2686  000e ffff          	dc.w	-1
2717                     ; 31 @far @interrupt void NonHandledInterrupt (void)
2717                     ; 32 {
2718                     	switch	.text
2719  0000               f_NonHandledInterrupt:
2723                     ; 36 	return;
2726  0000 80            	iret
2756                     ; 41 @far @interrupt void int_PE5 (void)
2756                     ; 42 {
2757                     	switch	.text
2758  0001               f_int_PE5:
2760  0001 8a            	push	cc
2761  0002 84            	pop	a
2762  0003 a4bf          	and	a,#191
2763  0005 88            	push	a
2764  0006 86            	pop	cc
2765  0007 3b0002        	push	c_x+2
2766  000a be00          	ldw	x,c_x
2767  000c 89            	pushw	x
2768  000d 3b0002        	push	c_y+2
2769  0010 be00          	ldw	x,c_y
2770  0012 89            	pushw	x
2773                     ; 43 	if(int_PC4 == 0)
2775  0013 3d00          	tnz	_int_PC4
2776  0015 261c          	jrne	L1771
2777                     ; 45 		sal_bas += 2;
2779  0017 3c00          	inc	_sal_bas
2780  0019 3c00          	inc	_sal_bas
2781                     ; 46 		if(sal_bas > 60)
2783  001b b600          	ld	a,_sal_bas
2784  001d a13d          	cp	a,#61
2785  001f 2504          	jrult	L3771
2786                     ; 47 			sal_bas = 40;
2788  0021 35280000      	mov	_sal_bas,#40
2789  0025               L3771:
2790                     ; 48 		affiche_nombre(sal_bas, 80, 70); 
2792  0025 4b46          	push	#70
2793  0027 4b50          	push	#80
2794  0029 b600          	ld	a,_sal_bas
2795  002b 5f            	clrw	x
2796  002c 97            	ld	xl,a
2797  002d cd0000        	call	_affiche_nombre
2799  0030 85            	popw	x
2801  0031 201a          	jra	L5771
2802  0033               L1771:
2803                     ; 52 		choix_couleur ++;
2805  0033 3c00          	inc	_choix_couleur
2806                     ; 53 		if(choix_couleur == 8)
2808  0035 b600          	ld	a,_choix_couleur
2809  0037 a108          	cp	a,#8
2810  0039 2602          	jrne	L7771
2811                     ; 54 			choix_couleur = 0;
2813  003b 3f00          	clr	_choix_couleur
2814  003d               L7771:
2815                     ; 56 		switch (couleur_ok){
2817  003d b600          	ld	a,_couleur_ok
2819                     ; 65 			break;
2820  003f 4d            	tnz	a
2821  0040 2708          	jreq	L3571
2822  0042 4a            	dec	a
2823  0043 2715          	jreq	L5571
2824  0045 4a            	dec	a
2825  0046 2717          	jreq	L7571
2826  0048 2003          	jra	L5771
2827  004a               L3571:
2828                     ; 57 		case 0:
2828                     ; 58 			bg_color = choix_couleur;
2830  004a 450000        	mov	_bg_color,_choix_couleur
2831                     ; 59 			break;
2832  004d               L5771:
2833                     ; 69 	return;
2836  004d 85            	popw	x
2837  004e bf00          	ldw	c_y,x
2838  0050 320002        	pop	c_y+2
2839  0053 85            	popw	x
2840  0054 bf00          	ldw	c_x,x
2841  0056 320002        	pop	c_x+2
2842  0059 80            	iret
2843  005a               L5571:
2844                     ; 60 		case 1:
2844                     ; 61 			txt_color = choix_couleur;
2846  005a 450000        	mov	_txt_color,_choix_couleur
2847                     ; 62 			break;
2849  005d 20ee          	jra	L5771
2850  005f               L7571:
2851                     ; 63 		case 2:
2851                     ; 64 			val_color = choix_couleur;
2853  005f 450000        	mov	_val_color,_choix_couleur
2854                     ; 65 			break;
2856  0062 20e9          	jra	L5771
2857  0064               L3002:
2858  0064 20e7          	jra	L5771
2884                     ; 72 @far @interrupt void int_PD3 (void)
2884                     ; 73 {
2885                     	switch	.text
2886  0066               f_int_PD3:
2888  0066 8a            	push	cc
2889  0067 84            	pop	a
2890  0068 a4bf          	and	a,#191
2891  006a 88            	push	a
2892  006b 86            	pop	cc
2893  006c 3b0002        	push	c_x+2
2894  006f be00          	ldw	x,c_x
2895  0071 89            	pushw	x
2896  0072 3b0002        	push	c_y+2
2897  0075 be00          	ldw	x,c_y
2898  0077 89            	pushw	x
2901                     ; 74 	if(int_PC4 == 0)
2903  0078 3d00          	tnz	_int_PC4
2904  007a 261e          	jrne	L5102
2905                     ; 76 		sal_haut -= 10;
2907  007c b600          	ld	a,_sal_haut
2908  007e a00a          	sub	a,#10
2909  0080 b700          	ld	_sal_haut,a
2910                     ; 77 		if(sal_haut < 100)
2912  0082 b600          	ld	a,_sal_haut
2913  0084 a164          	cp	a,#100
2914  0086 2404          	jruge	L7102
2915                     ; 78 			sal_haut = 240;
2917  0088 35f00000      	mov	_sal_haut,#240
2918  008c               L7102:
2919                     ; 79 		affiche_nombre(sal_haut, 90, 90); 
2921  008c 4b5a          	push	#90
2922  008e 4b5a          	push	#90
2923  0090 b600          	ld	a,_sal_haut
2924  0092 5f            	clrw	x
2925  0093 97            	ld	xl,a
2926  0094 cd0000        	call	_affiche_nombre
2928  0097 85            	popw	x
2930  0098 200a          	jra	L1202
2931  009a               L5102:
2932                     ; 83 		couleur_ok ++;
2934  009a 3c00          	inc	_couleur_ok
2935                     ; 84 		if(couleur_ok == 3)
2937  009c b600          	ld	a,_couleur_ok
2938  009e a103          	cp	a,#3
2939  00a0 2602          	jrne	L1202
2940                     ; 85 			couleur_ok = 0;
2942  00a2 3f00          	clr	_couleur_ok
2943  00a4               L1202:
2944                     ; 87 	return;
2947  00a4 85            	popw	x
2948  00a5 bf00          	ldw	c_y,x
2949  00a7 320002        	pop	c_y+2
2950  00aa 85            	popw	x
2951  00ab bf00          	ldw	c_x,x
2952  00ad 320002        	pop	c_x+2
2953  00b0 80            	iret
2979                     ; 90 @far @interrupt void int_timer1_2ms(void)
2979                     ; 91 {
2980                     	switch	.text
2981  00b1               f_int_timer1_2ms:
2985                     ; 92 	int_2ms_ok = 1;
2987  00b1 35010000      	mov	_int_2ms_ok,#1
2988                     ; 93 	cpt_ech += 1;
2990  00b5 be00          	ldw	x,_cpt_ech
2991  00b7 1c0001        	addw	x,#1
2992  00ba bf00          	ldw	_cpt_ech,x
2993                     ; 94 	j ++;
2995  00bc 3c00          	inc	_j
2996                     ; 95 	TIM1_SR1 = TIM1_SR1 &~(1<<0);
2998  00be 72115255      	bres	_TIM1_SR1,#0
2999                     ; 96 	return;
3002  00c2 80            	iret
3038                     ; 99 @far @interrupt void PC4(void)
3038                     ; 100 {
3039                     	switch	.text
3040  00c3               f_PC4:
3042  00c3 8a            	push	cc
3043  00c4 84            	pop	a
3044  00c5 a4bf          	and	a,#191
3045  00c7 88            	push	a
3046  00c8 86            	pop	cc
3047  00c9 3b0002        	push	c_x+2
3048  00cc be00          	ldw	x,c_x
3049  00ce 89            	pushw	x
3050  00cf 3b0002        	push	c_y+2
3051  00d2 be00          	ldw	x,c_y
3052  00d4 89            	pushw	x
3055                     ; 101 	int_PC4 ++;
3057  00d5 3c00          	inc	_int_PC4
3058                     ; 102 	if(int_PC4 ==2)
3060  00d7 b600          	ld	a,_int_PC4
3061  00d9 a102          	cp	a,#2
3062  00db 2602          	jrne	L5402
3063                     ; 103 		int_PC4 = 0;
3065  00dd 3f00          	clr	_int_PC4
3066  00df               L5402:
3067                     ; 104 	if(int_PC4 == 0)
3069  00df 3d00          	tnz	_int_PC4
3070  00e1 2637          	jrne	L7402
3071                     ; 106 		affiche_mot(Mesure, 28.5, 10);
3073  00e3 4b0a          	push	#10
3074  00e5 4b1c          	push	#28
3075  00e7 ae0000        	ldw	x,#L3261_Mesure
3076  00ea cd0000        	call	_affiche_mot
3078  00ed 85            	popw	x
3079                     ; 107 		affiche_mot(Bpm, 1.4, 50);
3081  00ee 4b32          	push	#50
3082  00f0 4b01          	push	#1
3083  00f2 ae000c        	ldw	x,#L7261_Bpm
3084  00f5 cd0000        	call	_affiche_mot
3086  00f8 85            	popw	x
3087                     ; 108 		affiche_mot(Seuil_bas, 1.7, 70);
3089  00f9 4b46          	push	#70
3090  00fb 4b01          	push	#1
3091  00fd ae0011        	ldw	x,#L1361_Seuil_bas
3092  0100 cd0000        	call	_affiche_mot
3094  0103 85            	popw	x
3095                     ; 109 		affiche_mot(Seuil_haut, 1.1, 90);
3097  0104 4b5a          	push	#90
3098  0106 4b01          	push	#1
3099  0108 ae0019        	ldw	x,#L3361_Seuil_haut
3100  010b cd0000        	call	_affiche_mot
3102  010e 85            	popw	x
3103                     ; 110 		affiche_mot(Puis,1.13, 110);
3105  010f 4b6e          	push	#110
3106  0111 4b01          	push	#1
3107  0113 ae0022        	ldw	x,#L5361_Puis
3108  0116 cd0000        	call	_affiche_mot
3110  0119 85            	popw	x
3111  011a               L7402:
3112                     ; 113 	if(int_PC4 == 1)
3114  011a b600          	ld	a,_int_PC4
3115  011c a101          	cp	a,#1
3116  011e 2624          	jrne	L1502
3117                     ; 115 		affiche_mot(Fond, 1.1, 20);
3119  0120 4b14          	push	#20
3120  0122 4b01          	push	#1
3121  0124 ae0043        	ldw	x,#L5461_Fond
3122  0127 cd0000        	call	_affiche_mot
3124  012a 85            	popw	x
3125                     ; 116 		affiche_mot(Texte, 1.4, 40);
3127  012b 4b28          	push	#40
3128  012d 4b01          	push	#1
3129  012f ae003c        	ldw	x,#L3461_Texte
3130  0132 cd0000        	call	_affiche_mot
3132  0135 85            	popw	x
3133                     ; 117 		affiche_mot(Valeurs, 1.7, 60);
3135  0136 4b3c          	push	#60
3136  0138 4b01          	push	#1
3137  013a ae0049        	ldw	x,#L7461_Valeurs
3138  013d cd0000        	call	_affiche_mot
3140  0140 85            	popw	x
3141                     ; 119 		lettre_couleur();
3143  0141 cd0000        	call	_lettre_couleur
3145  0144               L1502:
3146                     ; 121 	fillScreen_TFT(couleur[bg_color]);
3148  0144 b600          	ld	a,_bg_color
3149  0146 5f            	clrw	x
3150  0147 97            	ld	xl,a
3151  0148 58            	sllw	x
3152  0149 ee00          	ldw	x,(_couleur,x)
3153  014b cd0000        	call	_fillScreen_TFT
3155                     ; 122 	return;
3158  014e 85            	popw	x
3159  014f bf00          	ldw	c_y,x
3160  0151 320002        	pop	c_y+2
3161  0154 85            	popw	x
3162  0155 bf00          	ldw	c_x,x
3163  0157 320002        	pop	c_x+2
3164  015a 80            	iret
3166                     	switch	.const
3167  0052               __vectab:
3168  0052 82            	dc.b	130
3170  0053 00            	dc.b	page(__stext)
3171  0054 0000          	dc.w	__stext
3172  0056 82            	dc.b	130
3174  0057 00            	dc.b	page(f_NonHandledInterrupt)
3175  0058 0000          	dc.w	f_NonHandledInterrupt
3176  005a 82            	dc.b	130
3178  005b 00            	dc.b	page(f_NonHandledInterrupt)
3179  005c 0000          	dc.w	f_NonHandledInterrupt
3180  005e 82            	dc.b	130
3182  005f 00            	dc.b	page(f_NonHandledInterrupt)
3183  0060 0000          	dc.w	f_NonHandledInterrupt
3184  0062 82            	dc.b	130
3186  0063 00            	dc.b	page(f_NonHandledInterrupt)
3187  0064 0000          	dc.w	f_NonHandledInterrupt
3188  0066 82            	dc.b	130
3190  0067 00            	dc.b	page(f_NonHandledInterrupt)
3191  0068 0000          	dc.w	f_NonHandledInterrupt
3192  006a 82            	dc.b	130
3194  006b 00            	dc.b	page(f_NonHandledInterrupt)
3195  006c 0000          	dc.w	f_NonHandledInterrupt
3196  006e 82            	dc.b	130
3198  006f c3            	dc.b	page(f_PC4)
3199  0070 00c3          	dc.w	f_PC4
3200  0072 82            	dc.b	130
3202  0073 66            	dc.b	page(f_int_PD3)
3203  0074 0066          	dc.w	f_int_PD3
3204  0076 82            	dc.b	130
3206  0077 01            	dc.b	page(f_int_PE5)
3207  0078 0001          	dc.w	f_int_PE5
3208  007a 82            	dc.b	130
3210  007b 00            	dc.b	page(f_NonHandledInterrupt)
3211  007c 0000          	dc.w	f_NonHandledInterrupt
3212  007e 82            	dc.b	130
3214  007f 00            	dc.b	page(f_NonHandledInterrupt)
3215  0080 0000          	dc.w	f_NonHandledInterrupt
3216  0082 82            	dc.b	130
3218  0083 00            	dc.b	page(f_NonHandledInterrupt)
3219  0084 0000          	dc.w	f_NonHandledInterrupt
3220  0086 82            	dc.b	130
3222  0087 b1            	dc.b	page(f_int_timer1_2ms)
3223  0088 00b1          	dc.w	f_int_timer1_2ms
3224  008a 82            	dc.b	130
3226  008b 00            	dc.b	page(f_NonHandledInterrupt)
3227  008c 0000          	dc.w	f_NonHandledInterrupt
3228  008e 82            	dc.b	130
3230  008f 00            	dc.b	page(f_NonHandledInterrupt)
3231  0090 0000          	dc.w	f_NonHandledInterrupt
3232  0092 82            	dc.b	130
3234  0093 00            	dc.b	page(f_NonHandledInterrupt)
3235  0094 0000          	dc.w	f_NonHandledInterrupt
3236  0096 82            	dc.b	130
3238  0097 00            	dc.b	page(f_NonHandledInterrupt)
3239  0098 0000          	dc.w	f_NonHandledInterrupt
3240  009a 82            	dc.b	130
3242  009b 00            	dc.b	page(f_NonHandledInterrupt)
3243  009c 0000          	dc.w	f_NonHandledInterrupt
3244  009e 82            	dc.b	130
3246  009f 00            	dc.b	page(f_NonHandledInterrupt)
3247  00a0 0000          	dc.w	f_NonHandledInterrupt
3248  00a2 82            	dc.b	130
3250  00a3 00            	dc.b	page(f_NonHandledInterrupt)
3251  00a4 0000          	dc.w	f_NonHandledInterrupt
3252  00a6 82            	dc.b	130
3254  00a7 00            	dc.b	page(f_NonHandledInterrupt)
3255  00a8 0000          	dc.w	f_NonHandledInterrupt
3256  00aa 82            	dc.b	130
3258  00ab 00            	dc.b	page(f_NonHandledInterrupt)
3259  00ac 0000          	dc.w	f_NonHandledInterrupt
3260  00ae 82            	dc.b	130
3262  00af 00            	dc.b	page(f_NonHandledInterrupt)
3263  00b0 0000          	dc.w	f_NonHandledInterrupt
3264  00b2 82            	dc.b	130
3266  00b3 00            	dc.b	page(f_NonHandledInterrupt)
3267  00b4 0000          	dc.w	f_NonHandledInterrupt
3268  00b6 82            	dc.b	130
3270  00b7 00            	dc.b	page(f_NonHandledInterrupt)
3271  00b8 0000          	dc.w	f_NonHandledInterrupt
3272  00ba 82            	dc.b	130
3274  00bb 00            	dc.b	page(f_NonHandledInterrupt)
3275  00bc 0000          	dc.w	f_NonHandledInterrupt
3276  00be 82            	dc.b	130
3278  00bf 00            	dc.b	page(f_NonHandledInterrupt)
3279  00c0 0000          	dc.w	f_NonHandledInterrupt
3280  00c2 82            	dc.b	130
3282  00c3 00            	dc.b	page(f_NonHandledInterrupt)
3283  00c4 0000          	dc.w	f_NonHandledInterrupt
3284  00c6 82            	dc.b	130
3286  00c7 00            	dc.b	page(f_NonHandledInterrupt)
3287  00c8 0000          	dc.w	f_NonHandledInterrupt
3288  00ca 82            	dc.b	130
3290  00cb 00            	dc.b	page(f_NonHandledInterrupt)
3291  00cc 0000          	dc.w	f_NonHandledInterrupt
3292  00ce 82            	dc.b	130
3294  00cf 00            	dc.b	page(f_NonHandledInterrupt)
3295  00d0 0000          	dc.w	f_NonHandledInterrupt
3356                     	xdef	__vectab
3357                     	xref	__stext
3358                     	xdef	f_PC4
3359                     	xdef	f_int_timer1_2ms
3360                     	xdef	f_int_PD3
3361                     	xdef	f_int_PE5
3362                     	xdef	f_NonHandledInterrupt
3363                     	xdef	_couleur
3364                     	xref.b	_val_color
3365                     	xref.b	_txt_color
3366                     	xref.b	_bg_color
3367                     	xref.b	_couleur_ok
3368                     	xref.b	_choix_couleur
3369                     	xref.b	_int_PC4
3370                     	xref.b	_j
3371                     	xref.b	_cpt_ech
3372                     	xref.b	_int_2ms_ok
3373                     	xref.b	_sal_haut
3374                     	xref.b	_sal_bas
3375                     	xref	_fillScreen_TFT
3376                     	xref	_lettre_couleur
3377                     	xref	_affiche_nombre
3378                     	xref	_affiche_mot
3379                     	xref.b	c_x
3380                     	xref.b	c_y
3399                     	end

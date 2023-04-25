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
2715                     ; 22 void init_SPI(void)
2715                     ; 23 {
2717                     	switch	.text
2718  0000               _init_SPI:
2722                     ; 24 	CLK_PCKENR1 = CLK_PCKENR1 | (1<<1);
2724  0000 721250c7      	bset	_CLK_PCKENR1,#1
2725                     ; 25 	PC_DDR = PC_DDR|(1<<7);
2727  0004 721e500c      	bset	_PC_DDR,#7
2728                     ; 26 	PC_CR1 = PC_CR1|(1<<7);
2730  0008 721e500d      	bset	_PC_CR1,#7
2731                     ; 27 	PC_CR2 = PC_CR2&~(1<<7);
2733  000c 721f500e      	bres	_PC_CR2,#7
2734                     ; 28 	PC_ODR = PC_ODR|(1<<7);
2736  0010 721e500a      	bset	_PC_ODR,#7
2737                     ; 29 	PD_DDR = (PD_DDR|(1<<7))+1;
2739  0014 c65011        	ld	a,_PD_DDR
2740  0017 aa80          	or	a,#128
2741  0019 4c            	inc	a
2742  001a c75011        	ld	_PD_DDR,a
2743                     ; 30 	PD_CR1 = (PD_CR1|(1<<7))+1;
2745  001d c65012        	ld	a,_PD_CR1
2746  0020 aa80          	or	a,#128
2747  0022 4c            	inc	a
2748  0023 c75012        	ld	_PD_CR1,a
2749                     ; 31 	PD_CR2 = (PD_CR2&~(1<<7))+1;
2751  0026 c65013        	ld	a,_PD_CR2
2752  0029 a47f          	and	a,#127
2753  002b 4c            	inc	a
2754  002c c75013        	ld	_PD_CR2,a
2755                     ; 32 	PD_ODR = PD_ODR&~(1<<7);
2757  002f 721f500f      	bres	_PD_ODR,#7
2758                     ; 33 	PD_ODR = PD_ODR&~(1<<0);
2760  0033 7211500f      	bres	_PD_ODR,#0
2761                     ; 34 	SPI_CR1 = 0x14;
2763  0037 35145200      	mov	_SPI_CR1,#20
2764                     ; 35 	SPI_CR2 = 0x03;
2766  003b 35035201      	mov	_SPI_CR2,#3
2767                     ; 36 	SPI_CR1 = SPI_CR1 |(1<<6);
2769  003f 721c5200      	bset	_SPI_CR1,#6
2770                     ; 37 }
2773  0043 81            	ret
2802                     ; 39 void init_ADC(void)
2802                     ; 40 {
2803                     	switch	.text
2804  0044               _init_ADC:
2808                     ; 41 	CLK_PCKENR2= CLK_PCKENR2|(1<<3);
2810  0044 721650ca      	bset	_CLK_PCKENR2,#3
2811                     ; 42 	PF_DDR = PF_DDR&~(1<<4);
2813  0048 7219501b      	bres	_PF_DDR,#4
2814                     ; 43 	PF_CR1 = PF_CR1&~(1<<4);
2816  004c 7219501c      	bres	_PF_CR1,#4
2817                     ; 44 	PF_CR2 = PF_CR2&~(1<<4);
2819  0050 7219501d      	bres	_PF_CR2,#4
2820                     ; 45 	ADC_CSR = 0x0C;
2822  0054 350c5400      	mov	_ADC_CSR,#12
2823                     ; 46 	ADC_CR1 |= 0x01;
2825  0058 72105401      	bset	_ADC_CR1,#0
2826                     ; 47 }
2829  005c 81            	ret
2863                     ; 49 void init_Poussoirs(void)
2863                     ; 50 {
2864                     	switch	.text
2865  005d               _init_Poussoirs:
2869                     ; 51 	PE_DDR = PE_DDR&~(1<<5);
2871  005d 721b5016      	bres	_PE_DDR,#5
2872                     ; 52 	PE_CR1 = PE_CR1&~(1<<5);
2874  0061 721b5017      	bres	_PE_CR1,#5
2875                     ; 53 	PE_CR2 = PE_CR2|(1<<5);
2877  0065 721a5018      	bset	_PE_CR2,#5
2878                     ; 54 	PD_DDR = PD_DDR&~(1<<3);
2880  0069 72175011      	bres	_PD_DDR,#3
2881                     ; 55 	PD_CR1 = PD_CR1&~(1<<3);
2883  006d 72175012      	bres	_PD_CR1,#3
2884                     ; 56 	PD_CR2 = PD_CR2|(1<<3);
2886  0071 72165013      	bset	_PD_CR2,#3
2887                     ; 57 	PC_DDR = PC_DDR&~(1<<4);
2889  0075 7219500c      	bres	_PC_DDR,#4
2890                     ; 58 	PC_CR1 = PC_CR1&~(1<<4);
2892  0079 7219500d      	bres	_PC_CR1,#4
2893                     ; 59 	PC_CR2 = PC_CR2|(1<<4);
2895  007d 7218500e      	bset	_PC_CR2,#4
2896                     ; 61 	EXTI_CR1 = EXTI_CR1&~(1<<6);
2898  0081 721d50a0      	bres	_EXTI_CR1,#6
2899                     ; 62 	EXTI_CR1 = EXTI_CR1|(1<<7);
2901  0085 721e50a0      	bset	_EXTI_CR1,#7
2902                     ; 63 	EXTI_CR1 = EXTI_CR1&~(1<<4);
2904  0089 721950a0      	bres	_EXTI_CR1,#4
2905                     ; 64 	EXTI_CR1 = EXTI_CR1|(1<<5);
2907  008d 721a50a0      	bset	_EXTI_CR1,#5
2908                     ; 65 	EXTI_CR2 = EXTI_CR2&~(1<<0);
2910  0091 721150a1      	bres	_EXTI_CR2,#0
2911                     ; 66 	EXTI_CR2 = EXTI_CR2|(1<<1);
2913  0095 721250a1      	bset	_EXTI_CR2,#1
2914                     ; 67 }
2917  0099 81            	ret
2943                     ; 69 void init_LED(void)
2943                     ; 70 {
2944                     	switch	.text
2945  009a               _init_LED:
2949                     ; 71 	PB_DDR = PB_DDR |0b00000111;
2951  009a c65007        	ld	a,_PB_DDR
2952  009d aa07          	or	a,#7
2953  009f c75007        	ld	_PB_DDR,a
2954                     ; 72 	PB_CR1 = PB_CR1 |0b00000111;
2956  00a2 c65008        	ld	a,_PB_CR1
2957  00a5 aa07          	or	a,#7
2958  00a7 c75008        	ld	_PB_CR1,a
2959                     ; 73 	PB_CR2 = PB_CR2 |0b00000111;
2961  00aa c65009        	ld	a,_PB_CR2
2962  00ad aa07          	or	a,#7
2963  00af c75009        	ld	_PB_CR2,a
2964                     ; 74 }
2967  00b2 81            	ret
2970                     	switch	.const
2971  0052               L3002_couleur:
2972  0052 0000          	dc.w	0
2973  0054 001f          	dc.w	31
2974  0056 f800          	dc.w	-2048
2975  0058 07e0          	dc.w	2016
2976  005a 07ff          	dc.w	2047
2977  005c f81f          	dc.w	-2017
2978  005e ffe0          	dc.w	-32
2979  0060 ffff          	dc.w	-1
3052                     ; 76 void affiche_mot(uint8_t *mot, uint8_t col, uint8_t ligne)
3052                     ; 77 {
3053                     	switch	.text
3054  00b3               _affiche_mot:
3056  00b3 89            	pushw	x
3057  00b4 5215          	subw	sp,#21
3058       00000015      OFST:	set	21
3061                     ; 78 	uint8_t i=0;
3063  00b6 0f15          	clr	(OFST+0,sp)
3064                     ; 79 	uint16_t couleur[8]={ST7735_BLACK,ST7735_BLUE,ST7735_RED,ST7735_GREEN,ST7735_CYAN,ST7735_MAGENTA,ST7735_YELLOW,ST7735_WHITE};
3066  00b8 96            	ldw	x,sp
3067  00b9 1c0005        	addw	x,#OFST-16
3068  00bc 90ae0052      	ldw	y,#L3002_couleur
3069  00c0 a610          	ld	a,#16
3070  00c2 cd0000        	call	c_xymvx
3073  00c5 2048          	jra	L7402
3074  00c7               L3402:
3075                     ; 83 		displayChar_TFT(col+11*i, ligne, mot[i], couleur[txt_color], couleur[bg_color], 2);
3077  00c7 4b02          	push	#2
3078  00c9 96            	ldw	x,sp
3079  00ca 1c0006        	addw	x,#OFST-15
3080  00cd 1f04          	ldw	(OFST-17,sp),x
3081  00cf b600          	ld	a,_bg_color
3082  00d1 5f            	clrw	x
3083  00d2 97            	ld	xl,a
3084  00d3 58            	sllw	x
3085  00d4 72fb04        	addw	x,(OFST-17,sp)
3086  00d7 fe            	ldw	x,(x)
3087  00d8 89            	pushw	x
3088  00d9 96            	ldw	x,sp
3089  00da 1c0008        	addw	x,#OFST-13
3090  00dd 1f04          	ldw	(OFST-17,sp),x
3091  00df b600          	ld	a,_txt_color
3092  00e1 5f            	clrw	x
3093  00e2 97            	ld	xl,a
3094  00e3 58            	sllw	x
3095  00e4 72fb04        	addw	x,(OFST-17,sp)
3096  00e7 fe            	ldw	x,(x)
3097  00e8 89            	pushw	x
3098  00e9 7b1b          	ld	a,(OFST+6,sp)
3099  00eb 97            	ld	xl,a
3100  00ec 7b1c          	ld	a,(OFST+7,sp)
3101  00ee 1b1a          	add	a,(OFST+5,sp)
3102  00f0 2401          	jrnc	L61
3103  00f2 5c            	incw	x
3104  00f3               L61:
3105  00f3 02            	rlwa	x,a
3106  00f4 f6            	ld	a,(x)
3107  00f5 88            	push	a
3108  00f6 7b21          	ld	a,(OFST+12,sp)
3109  00f8 5f            	clrw	x
3110  00f9 97            	ld	xl,a
3111  00fa 89            	pushw	x
3112  00fb 7b1d          	ld	a,(OFST+8,sp)
3113  00fd 97            	ld	xl,a
3114  00fe a60b          	ld	a,#11
3115  0100 42            	mul	x,a
3116  0101 01            	rrwa	x,a
3117  0102 1b22          	add	a,(OFST+13,sp)
3118  0104 2401          	jrnc	L02
3119  0106 5c            	incw	x
3120  0107               L02:
3121  0107 02            	rlwa	x,a
3122  0108 cd0000        	call	_displayChar_TFT
3124  010b 5b08          	addw	sp,#8
3125                     ; 84 		i++;
3127  010d 0c15          	inc	(OFST+0,sp)
3128  010f               L7402:
3129                     ; 81 	while(mot[i]!='\0')
3131  010f 7b16          	ld	a,(OFST+1,sp)
3132  0111 97            	ld	xl,a
3133  0112 7b17          	ld	a,(OFST+2,sp)
3134  0114 1b15          	add	a,(OFST+0,sp)
3135  0116 2401          	jrnc	L22
3136  0118 5c            	incw	x
3137  0119               L22:
3138  0119 02            	rlwa	x,a
3139  011a 7d            	tnz	(x)
3140  011b 26aa          	jrne	L3402
3141                     ; 86 }
3144  011d 5b17          	addw	sp,#23
3145  011f 81            	ret
3148                     	switch	.const
3149  0062               L3502_couleur:
3150  0062 0000          	dc.w	0
3151  0064 001f          	dc.w	31
3152  0066 f800          	dc.w	-2048
3153  0068 07e0          	dc.w	2016
3154  006a 07ff          	dc.w	2047
3155  006c f81f          	dc.w	-2017
3156  006e ffe0          	dc.w	-32
3157  0070 ffff          	dc.w	-1
3247                     ; 88 void affiche_nombre(uint16_t nombre, uint8_t col, uint8_t ligne)
3247                     ; 89 {
3248                     	switch	.text
3249  0120               _affiche_nombre:
3251  0120 89            	pushw	x
3252  0121 521a          	subw	sp,#26
3253       0000001a      OFST:	set	26
3256                     ; 91 	uint16_t couleur[8]={ST7735_BLACK,ST7735_BLUE,ST7735_RED,ST7735_GREEN,ST7735_CYAN,ST7735_MAGENTA,ST7735_YELLOW,ST7735_WHITE};
3258  0123 96            	ldw	x,sp
3259  0124 1c000b        	addw	x,#OFST-15
3260  0127 90ae0062      	ldw	y,#L3502_couleur
3261  012b a610          	ld	a,#16
3262  012d cd0000        	call	c_xymvx
3264                     ; 93 	CEN = nombre/100;
3266  0130 1e1b          	ldw	x,(OFST+1,sp)
3267  0132 90ae0064      	ldw	y,#100
3268  0136 65            	divw	x,y
3269  0137 1f05          	ldw	(OFST-21,sp),x
3270                     ; 94 	DIZ = (nombre%100)/10;
3272  0139 1e1b          	ldw	x,(OFST+1,sp)
3273  013b 90ae0064      	ldw	y,#100
3274  013f 65            	divw	x,y
3275  0140 51            	exgw	x,y
3276  0141 90ae000a      	ldw	y,#10
3277  0145 65            	divw	x,y
3278  0146 1f07          	ldw	(OFST-19,sp),x
3279                     ; 95 	UNI = (nombre%100)%10;
3281  0148 1e1b          	ldw	x,(OFST+1,sp)
3282  014a 90ae0064      	ldw	y,#100
3283  014e 65            	divw	x,y
3284  014f 51            	exgw	x,y
3285  0150 90ae000a      	ldw	y,#10
3286  0154 65            	divw	x,y
3287  0155 51            	exgw	x,y
3288  0156 1f09          	ldw	(OFST-17,sp),x
3289                     ; 96 	displayChar_TFT(col, ligne, CEN+0x30, couleur[val_color], couleur[bg_color], 2);
3291  0158 4b02          	push	#2
3292  015a 96            	ldw	x,sp
3293  015b 1c000c        	addw	x,#OFST-14
3294  015e 1f04          	ldw	(OFST-22,sp),x
3295  0160 b600          	ld	a,_bg_color
3296  0162 5f            	clrw	x
3297  0163 97            	ld	xl,a
3298  0164 58            	sllw	x
3299  0165 72fb04        	addw	x,(OFST-22,sp)
3300  0168 fe            	ldw	x,(x)
3301  0169 89            	pushw	x
3302  016a 96            	ldw	x,sp
3303  016b 1c000e        	addw	x,#OFST-12
3304  016e 1f04          	ldw	(OFST-22,sp),x
3305  0170 b600          	ld	a,_val_color
3306  0172 5f            	clrw	x
3307  0173 97            	ld	xl,a
3308  0174 58            	sllw	x
3309  0175 72fb04        	addw	x,(OFST-22,sp)
3310  0178 fe            	ldw	x,(x)
3311  0179 89            	pushw	x
3312  017a 7b0b          	ld	a,(OFST-15,sp)
3313  017c ab30          	add	a,#48
3314  017e 88            	push	a
3315  017f 7b26          	ld	a,(OFST+12,sp)
3316  0181 5f            	clrw	x
3317  0182 97            	ld	xl,a
3318  0183 89            	pushw	x
3319  0184 7b27          	ld	a,(OFST+13,sp)
3320  0186 5f            	clrw	x
3321  0187 97            	ld	xl,a
3322  0188 cd0000        	call	_displayChar_TFT
3324  018b 5b08          	addw	sp,#8
3325                     ; 97 	displayChar_TFT(col+12, ligne, DIZ+0x30, couleur[val_color], couleur[bg_color], 2);
3327  018d 4b02          	push	#2
3328  018f 96            	ldw	x,sp
3329  0190 1c000c        	addw	x,#OFST-14
3330  0193 1f04          	ldw	(OFST-22,sp),x
3331  0195 b600          	ld	a,_bg_color
3332  0197 5f            	clrw	x
3333  0198 97            	ld	xl,a
3334  0199 58            	sllw	x
3335  019a 72fb04        	addw	x,(OFST-22,sp)
3336  019d fe            	ldw	x,(x)
3337  019e 89            	pushw	x
3338  019f 96            	ldw	x,sp
3339  01a0 1c000e        	addw	x,#OFST-12
3340  01a3 1f04          	ldw	(OFST-22,sp),x
3341  01a5 b600          	ld	a,_val_color
3342  01a7 5f            	clrw	x
3343  01a8 97            	ld	xl,a
3344  01a9 58            	sllw	x
3345  01aa 72fb04        	addw	x,(OFST-22,sp)
3346  01ad fe            	ldw	x,(x)
3347  01ae 89            	pushw	x
3348  01af 7b0d          	ld	a,(OFST-13,sp)
3349  01b1 ab30          	add	a,#48
3350  01b3 88            	push	a
3351  01b4 7b26          	ld	a,(OFST+12,sp)
3352  01b6 5f            	clrw	x
3353  01b7 97            	ld	xl,a
3354  01b8 89            	pushw	x
3355  01b9 7b27          	ld	a,(OFST+13,sp)
3356  01bb 5f            	clrw	x
3357  01bc 97            	ld	xl,a
3358  01bd 1c000c        	addw	x,#12
3359  01c0 cd0000        	call	_displayChar_TFT
3361  01c3 5b08          	addw	sp,#8
3362                     ; 98 	displayChar_TFT(col+24, ligne, UNI+0x30, couleur[val_color], couleur[bg_color], 2);
3364  01c5 4b02          	push	#2
3365  01c7 96            	ldw	x,sp
3366  01c8 1c000c        	addw	x,#OFST-14
3367  01cb 1f04          	ldw	(OFST-22,sp),x
3368  01cd b600          	ld	a,_bg_color
3369  01cf 5f            	clrw	x
3370  01d0 97            	ld	xl,a
3371  01d1 58            	sllw	x
3372  01d2 72fb04        	addw	x,(OFST-22,sp)
3373  01d5 fe            	ldw	x,(x)
3374  01d6 89            	pushw	x
3375  01d7 96            	ldw	x,sp
3376  01d8 1c000e        	addw	x,#OFST-12
3377  01db 1f04          	ldw	(OFST-22,sp),x
3378  01dd b600          	ld	a,_val_color
3379  01df 5f            	clrw	x
3380  01e0 97            	ld	xl,a
3381  01e1 58            	sllw	x
3382  01e2 72fb04        	addw	x,(OFST-22,sp)
3383  01e5 fe            	ldw	x,(x)
3384  01e6 89            	pushw	x
3385  01e7 7b0f          	ld	a,(OFST-11,sp)
3386  01e9 ab30          	add	a,#48
3387  01eb 88            	push	a
3388  01ec 7b26          	ld	a,(OFST+12,sp)
3389  01ee 5f            	clrw	x
3390  01ef 97            	ld	xl,a
3391  01f0 89            	pushw	x
3392  01f1 7b27          	ld	a,(OFST+13,sp)
3393  01f3 5f            	clrw	x
3394  01f4 97            	ld	xl,a
3395  01f5 1c0018        	addw	x,#24
3396  01f8 cd0000        	call	_displayChar_TFT
3398  01fb 5b08          	addw	sp,#8
3399                     ; 99 }
3402  01fd 5b1c          	addw	sp,#28
3403  01ff 81            	ret
3434                     ; 103 void init_timer1_2ms(void)
3434                     ; 104 {
3435                     	switch	.text
3436  0200               _init_timer1_2ms:
3440                     ; 105 	CLK_PCKENR1 = CLK_PCKENR1|(1<<7);
3442  0200 721e50c7      	bset	_CLK_PCKENR1,#7
3443                     ; 106 	TIM1_PSCRH = 79/256;
3445  0204 725f5260      	clr	_TIM1_PSCRH
3446                     ; 107 	TIM1_PSCRL = 79%256;
3448  0208 354f5261      	mov	_TIM1_PSCRL,#79
3449                     ; 108 	TIM1_ARRH = 399/256;
3451  020c 35015262      	mov	_TIM1_ARRH,#1
3452                     ; 109 	TIM1_ARRL = 399%256;
3454  0210 358f5263      	mov	_TIM1_ARRL,#143
3455                     ; 110 	TIM1_CR1 = 0x00;
3457  0214 725f5250      	clr	_TIM1_CR1
3458                     ; 111 	TIM1_IER |= 1;
3460  0218 72105254      	bset	_TIM1_IER,#0
3461                     ; 112 	TIM1_SR1 = 0x00;
3463  021c 725f5255      	clr	_TIM1_SR1
3464                     ; 113 	TIM1_CR1 |= 1;
3466  0220 72105250      	bset	_TIM1_CR1,#0
3467                     ; 114 }
3470  0224 81            	ret
3519                     ; 116 void init_UART2(uint16_t UART_BAUDRATE)
3519                     ; 117 {
3520                     	switch	.text
3521  0225               _init_UART2:
3523  0225 5206          	subw	sp,#6
3524       00000006      OFST:	set	6
3527                     ; 118 	int uartdiv = 16000000/UART_BAUDRATE;
3529  0227 cd0000        	call	c_uitolx
3531  022a 96            	ldw	x,sp
3532  022b 1c0001        	addw	x,#OFST-5
3533  022e cd0000        	call	c_rtol
3535  0231 ae2400        	ldw	x,#9216
3536  0234 bf02          	ldw	c_lreg+2,x
3537  0236 ae00f4        	ldw	x,#244
3538  0239 bf00          	ldw	c_lreg,x
3539  023b 96            	ldw	x,sp
3540  023c 1c0001        	addw	x,#OFST-5
3541  023f cd0000        	call	c_ldiv
3543  0242 be02          	ldw	x,c_lreg+2
3544  0244 1f05          	ldw	(OFST-1,sp),x
3545                     ; 119 	CLK_PCKENR1 |= (1<<3);
3547  0246 721650c7      	bset	_CLK_PCKENR1,#3
3548                     ; 120 	UART2_BRR1 = (uartdiv >> 4);
3550  024a 1e05          	ldw	x,(OFST-1,sp)
3551  024c 57            	sraw	x
3552  024d 57            	sraw	x
3553  024e 57            	sraw	x
3554  024f 57            	sraw	x
3555  0250 01            	rrwa	x,a
3556  0251 c75242        	ld	_UART2_BRR1,a
3557  0254 02            	rlwa	x,a
3558                     ; 121 	UART2_BRR2 = ((uartdiv&0xF000)>>8)|(uartdiv&0x000F);
3560  0255 7b06          	ld	a,(OFST+0,sp)
3561  0257 a40f          	and	a,#15
3562  0259 5f            	clrw	x
3563  025a 4d            	tnz	a
3564  025b 2a01          	jrpl	L23
3565  025d 53            	cplw	x
3566  025e               L23:
3567  025e 97            	ld	xl,a
3568  025f 1f03          	ldw	(OFST-3,sp),x
3569  0261 7b05          	ld	a,(OFST-1,sp)
3570  0263 97            	ld	xl,a
3571  0264 7b06          	ld	a,(OFST+0,sp)
3572  0266 9f            	ld	a,xl
3573  0267 a4f0          	and	a,#240
3574  0269 97            	ld	xl,a
3575  026a 4f            	clr	a
3576  026b 02            	rlwa	x,a
3577  026c 4f            	clr	a
3578  026d 01            	rrwa	x,a
3579  026e 01            	rrwa	x,a
3580  026f 1a04          	or	a,(OFST-2,sp)
3581  0271 01            	rrwa	x,a
3582  0272 1a03          	or	a,(OFST-3,sp)
3583  0274 01            	rrwa	x,a
3584  0275 01            	rrwa	x,a
3585  0276 c75243        	ld	_UART2_BRR2,a
3586  0279 02            	rlwa	x,a
3587                     ; 122 	UART2_CR1 = 0;
3589  027a 725f5244      	clr	_UART2_CR1
3590                     ; 123 	UART2_CR2 = 0b00001100;
3592  027e 350c5245      	mov	_UART2_CR2,#12
3593                     ; 124 	UART2_CR3 = (UART2_CR3 & 0b10000000);
3595  0282 c65246        	ld	a,_UART2_CR3
3596  0285 a480          	and	a,#128
3597  0287 c75246        	ld	_UART2_CR3,a
3598                     ; 125 }
3601  028a 5b06          	addw	sp,#6
3602  028c 81            	ret
3638                     ; 127 void write_byte_UART2(uint8_t data)
3638                     ; 128 {
3639                     	switch	.text
3640  028d               _write_byte_UART2:
3644                     ; 129 	UART2_DR = data;
3646  028d c75241        	ld	_UART2_DR,a
3648  0290               L7712:
3649                     ; 130 	while((UART2_SR&0b10000000)==0);
3651  0290 c65240        	ld	a,_UART2_SR
3652  0293 a580          	bcp	a,#128
3653  0295 27f9          	jreq	L7712
3654                     ; 131 }
3657  0297 81            	ret
3690                     ; 133 void init_timer2_pwm(void)
3690                     ; 134 {
3691                     	switch	.text
3692  0298               _init_timer2_pwm:
3696                     ; 135 	CLK_PCKENR1 = CLK_PCKENR1|(1<<5);
3698  0298 721a50c7      	bset	_CLK_PCKENR1,#5
3699                     ; 136 	TIM2_PSCR = 0x4;
3701  029c 3504530c      	mov	_TIM2_PSCR,#4
3702                     ; 137 	TIM2_ARRH = 99/256;
3704  02a0 725f530d      	clr	_TIM2_ARRH
3705                     ; 138 	TIM2_ARRL = 99%256;
3707  02a4 3563530e      	mov	_TIM2_ARRL,#99
3708                     ; 139 	TIM2_CCMR1 = 0x68;
3710  02a8 35685305      	mov	_TIM2_CCMR1,#104
3711                     ; 140 	TIM2_CCER1 = 1;
3713  02ac 35015308      	mov	_TIM2_CCER1,#1
3714                     ; 141 	TIM2_CR1 = 0x81;
3716  02b0 35815300      	mov	_TIM2_CR1,#129
3717                     ; 142 	PD_DDR = PD_DDR|(1<<4);
3719  02b4 72185011      	bset	_PD_DDR,#4
3720                     ; 143 	PD_CR1 = PD_CR1|(1<<4);
3722  02b8 72185012      	bset	_PD_CR1,#4
3723                     ; 144 	PD_CR2 = PD_CR2&~(1<<4);
3725  02bc 72195013      	bres	_PD_CR2,#4
3726                     ; 145 }
3729  02c0 81            	ret
3796                     ; 148 uint16_t read_AD7991(uint8_t octet_conf)
3796                     ; 149 {
3797                     	switch	.text
3798  02c1               _read_AD7991:
3800  02c1 88            	push	a
3801  02c2 5204          	subw	sp,#4
3802       00000004      OFST:	set	4
3805                     ; 153 	Start_I2C();
3807  02c4 cd0000        	call	_Start_I2C
3809                     ; 154 	Write_I2C(0b01010000);
3811  02c7 a650          	ld	a,#80
3812  02c9 cd0000        	call	_Write_I2C
3814                     ; 155 	Write_I2C(octet_conf);
3816  02cc 7b05          	ld	a,(OFST+1,sp)
3817  02ce cd0000        	call	_Write_I2C
3819                     ; 156 	Stop_I2C();
3821  02d1 cd0000        	call	_Stop_I2C
3823                     ; 157 	Start_I2C();
3825  02d4 cd0000        	call	_Start_I2C
3827                     ; 158 	Write_I2C(0b01010001);
3829  02d7 a651          	ld	a,#81
3830  02d9 cd0000        	call	_Write_I2C
3832                     ; 159 	Ack_I2C();
3834  02dc cd0000        	call	_Ack_I2C
3836                     ; 160 	adc_MSB = Read_I2C();
3838  02df cd0000        	call	_Read_I2C
3840  02e2 6b01          	ld	(OFST-3,sp),a
3841                     ; 161 	NoAck_I2C();
3843  02e4 cd0000        	call	_NoAck_I2C
3845                     ; 162 	adc_LSB = Read_I2C();
3847  02e7 cd0000        	call	_Read_I2C
3849  02ea 6b02          	ld	(OFST-2,sp),a
3850                     ; 163 	Stop_I2C();
3852  02ec cd0000        	call	_Stop_I2C
3854                     ; 164 	adc_temp = ((adc_MSB&0b00001111)<<8)+ adc_LSB;
3856  02ef 7b01          	ld	a,(OFST-3,sp)
3857  02f1 a40f          	and	a,#15
3858  02f3 5f            	clrw	x
3859  02f4 97            	ld	xl,a
3860  02f5 4f            	clr	a
3861  02f6 02            	rlwa	x,a
3862  02f7 01            	rrwa	x,a
3863  02f8 1b02          	add	a,(OFST-2,sp)
3864  02fa 2401          	jrnc	L24
3865  02fc 5c            	incw	x
3866  02fd               L24:
3867  02fd 02            	rlwa	x,a
3868  02fe 1f03          	ldw	(OFST-1,sp),x
3869  0300 01            	rrwa	x,a
3870                     ; 165 	return adc_temp;
3872  0301 1e03          	ldw	x,(OFST-1,sp)
3875  0303 5b05          	addw	sp,#5
3876  0305 81            	ret
3879                     	switch	.const
3880  0072               L5422_couleur:
3881  0072 0000          	dc.w	0
3882  0074 001f          	dc.w	31
3883  0076 f800          	dc.w	-2048
3884  0078 07e0          	dc.w	2016
3885  007a 07ff          	dc.w	2047
3886  007c f81f          	dc.w	-2017
3887  007e ffe0          	dc.w	-32
3888  0080 ffff          	dc.w	-1
3889  0082               L7422_init_couleur:
3890  0082 4e            	dc.b	78
3891  0083 42            	dc.b	66
3892  0084 52            	dc.b	82
3893  0085 56            	dc.b	86
3894  0086 43            	dc.b	67
3895  0087 4d            	dc.b	77
3896  0088 4a            	dc.b	74
3897  0089 57            	dc.b	87
3948                     ; 169 void lettre_couleur(void)
3948                     ; 170 {
3949                     	switch	.text
3950  0306               _lettre_couleur:
3952  0306 521c          	subw	sp,#28
3953       0000001c      OFST:	set	28
3956                     ; 171 	uint16_t couleur[8]={ST7735_BLACK,ST7735_BLUE,ST7735_RED,ST7735_GREEN,ST7735_CYAN,ST7735_MAGENTA,ST7735_YELLOW,ST7735_WHITE};
3958  0308 96            	ldw	x,sp
3959  0309 1c000d        	addw	x,#OFST-15
3960  030c 90ae0072      	ldw	y,#L5422_couleur
3961  0310 a610          	ld	a,#16
3962  0312 cd0000        	call	c_xymvx
3964                     ; 172 	char init_couleur[8] = {'N','B','R','V','C','M','J','W'};
3966  0315 96            	ldw	x,sp
3967  0316 1c0005        	addw	x,#OFST-23
3968  0319 90ae0082      	ldw	y,#L7422_init_couleur
3969  031d a608          	ld	a,#8
3970  031f cd0000        	call	c_xymvx
3972                     ; 174 	switch (couleur_ok){
3974  0322 b600          	ld	a,_couleur_ok
3976                     ; 183 		break;
3977  0324 4d            	tnz	a
3978  0325 270d          	jreq	L1522
3979  0327 4a            	dec	a
3980  0328 2748          	jreq	L3522
3981  032a 4a            	dec	a
3982  032b 2603cc03b0    	jreq	L5522
3983  0330 acec03ec      	jpf	L3032
3984  0334               L1522:
3985                     ; 175 	case 0:
3985                     ; 176 		displayChar_TFT((sizeof(Fond)-1)*11+1.1, 20, init_couleur[choix_couleur], couleur[val_color], couleur[bg_color], 2);
3987  0334 4b02          	push	#2
3988  0336 96            	ldw	x,sp
3989  0337 1c000e        	addw	x,#OFST-14
3990  033a 1f04          	ldw	(OFST-24,sp),x
3991  033c b600          	ld	a,_bg_color
3992  033e 5f            	clrw	x
3993  033f 97            	ld	xl,a
3994  0340 58            	sllw	x
3995  0341 72fb04        	addw	x,(OFST-24,sp)
3996  0344 fe            	ldw	x,(x)
3997  0345 89            	pushw	x
3998  0346 96            	ldw	x,sp
3999  0347 1c0010        	addw	x,#OFST-12
4000  034a 1f04          	ldw	(OFST-24,sp),x
4001  034c b600          	ld	a,_val_color
4002  034e 5f            	clrw	x
4003  034f 97            	ld	xl,a
4004  0350 58            	sllw	x
4005  0351 72fb04        	addw	x,(OFST-24,sp)
4006  0354 fe            	ldw	x,(x)
4007  0355 89            	pushw	x
4008  0356 96            	ldw	x,sp
4009  0357 1c000a        	addw	x,#OFST-18
4010  035a 9f            	ld	a,xl
4011  035b 5e            	swapw	x
4012  035c bb00          	add	a,_choix_couleur
4013  035e 2401          	jrnc	L64
4014  0360 5c            	incw	x
4015  0361               L64:
4016  0361 02            	rlwa	x,a
4017  0362 f6            	ld	a,(x)
4018  0363 88            	push	a
4019  0364 ae0014        	ldw	x,#20
4020  0367 89            	pushw	x
4021  0368 ae0038        	ldw	x,#56
4022  036b cd0000        	call	_displayChar_TFT
4024  036e 5b08          	addw	sp,#8
4025                     ; 177 		break;
4027  0370 207a          	jra	L3032
4028  0372               L3522:
4029                     ; 178 	case 1:
4029                     ; 179 		displayChar_TFT((sizeof(Texte)-1)*11+1.4, 40, init_couleur[choix_couleur], couleur[val_color], couleur[bg_color], 2);
4031  0372 4b02          	push	#2
4032  0374 96            	ldw	x,sp
4033  0375 1c000e        	addw	x,#OFST-14
4034  0378 1f04          	ldw	(OFST-24,sp),x
4035  037a b600          	ld	a,_bg_color
4036  037c 5f            	clrw	x
4037  037d 97            	ld	xl,a
4038  037e 58            	sllw	x
4039  037f 72fb04        	addw	x,(OFST-24,sp)
4040  0382 fe            	ldw	x,(x)
4041  0383 89            	pushw	x
4042  0384 96            	ldw	x,sp
4043  0385 1c0010        	addw	x,#OFST-12
4044  0388 1f04          	ldw	(OFST-24,sp),x
4045  038a b600          	ld	a,_val_color
4046  038c 5f            	clrw	x
4047  038d 97            	ld	xl,a
4048  038e 58            	sllw	x
4049  038f 72fb04        	addw	x,(OFST-24,sp)
4050  0392 fe            	ldw	x,(x)
4051  0393 89            	pushw	x
4052  0394 96            	ldw	x,sp
4053  0395 1c000a        	addw	x,#OFST-18
4054  0398 9f            	ld	a,xl
4055  0399 5e            	swapw	x
4056  039a bb00          	add	a,_choix_couleur
4057  039c 2401          	jrnc	L05
4058  039e 5c            	incw	x
4059  039f               L05:
4060  039f 02            	rlwa	x,a
4061  03a0 f6            	ld	a,(x)
4062  03a1 88            	push	a
4063  03a2 ae0028        	ldw	x,#40
4064  03a5 89            	pushw	x
4065  03a6 ae0043        	ldw	x,#67
4066  03a9 cd0000        	call	_displayChar_TFT
4068  03ac 5b08          	addw	sp,#8
4069                     ; 180 		break;
4071  03ae 203c          	jra	L3032
4072  03b0               L5522:
4073                     ; 181 	case 2:
4073                     ; 182 		displayChar_TFT((sizeof(Valeurs)-1)*11+1.7, 60, init_couleur[choix_couleur], couleur[val_color], couleur[bg_color], 2);	
4075  03b0 4b02          	push	#2
4076  03b2 96            	ldw	x,sp
4077  03b3 1c000e        	addw	x,#OFST-14
4078  03b6 1f04          	ldw	(OFST-24,sp),x
4079  03b8 b600          	ld	a,_bg_color
4080  03ba 5f            	clrw	x
4081  03bb 97            	ld	xl,a
4082  03bc 58            	sllw	x
4083  03bd 72fb04        	addw	x,(OFST-24,sp)
4084  03c0 fe            	ldw	x,(x)
4085  03c1 89            	pushw	x
4086  03c2 96            	ldw	x,sp
4087  03c3 1c0010        	addw	x,#OFST-12
4088  03c6 1f04          	ldw	(OFST-24,sp),x
4089  03c8 b600          	ld	a,_val_color
4090  03ca 5f            	clrw	x
4091  03cb 97            	ld	xl,a
4092  03cc 58            	sllw	x
4093  03cd 72fb04        	addw	x,(OFST-24,sp)
4094  03d0 fe            	ldw	x,(x)
4095  03d1 89            	pushw	x
4096  03d2 96            	ldw	x,sp
4097  03d3 1c000a        	addw	x,#OFST-18
4098  03d6 9f            	ld	a,xl
4099  03d7 5e            	swapw	x
4100  03d8 bb00          	add	a,_choix_couleur
4101  03da 2401          	jrnc	L25
4102  03dc 5c            	incw	x
4103  03dd               L25:
4104  03dd 02            	rlwa	x,a
4105  03de f6            	ld	a,(x)
4106  03df 88            	push	a
4107  03e0 ae003c        	ldw	x,#60
4108  03e3 89            	pushw	x
4109  03e4 ae0059        	ldw	x,#89
4110  03e7 cd0000        	call	_displayChar_TFT
4112  03ea 5b08          	addw	sp,#8
4113                     ; 183 		break;
4115  03ec               L3032:
4116                     ; 186 }
4119  03ec 5b1c          	addw	sp,#28
4120  03ee 81            	ret
4133                     	xdef	_lettre_couleur
4134                     	xdef	_read_AD7991
4135                     	xdef	_init_timer2_pwm
4136                     	xdef	_write_byte_UART2
4137                     	xdef	_init_UART2
4138                     	xdef	_init_timer1_2ms
4139                     	xdef	_affiche_nombre
4140                     	xdef	_affiche_mot
4141                     	xdef	_init_LED
4142                     	xdef	_init_Poussoirs
4143                     	xdef	_init_ADC
4144                     	xdef	_init_SPI
4145                     	xref.b	_val_color
4146                     	xref.b	_txt_color
4147                     	xref.b	_bg_color
4148                     	xref.b	_couleur_ok
4149                     	xref.b	_choix_couleur
4150                     	xref	_Stop_I2C
4151                     	xref	_NoAck_I2C
4152                     	xref	_Ack_I2C
4153                     	xref	_Read_I2C
4154                     	xref	_Write_I2C
4155                     	xref	_Start_I2C
4156                     	xref	_displayChar_TFT
4157                     	xref.b	c_lreg
4158                     	xref.b	c_x
4177                     	xref	c_ldiv
4178                     	xref	c_rtol
4179                     	xref	c_uitolx
4180                     	xref	c_xymvx
4181                     	end

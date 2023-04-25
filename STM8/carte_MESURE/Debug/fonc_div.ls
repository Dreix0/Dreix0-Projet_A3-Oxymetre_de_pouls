   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2562                     ; 10 void init_SPI(void)
2562                     ; 11 {
2564                     	switch	.text
2565  0000               _init_SPI:
2569                     ; 12 	CLK_PCKENR1 = CLK_PCKENR1 | (1<<1);
2571  0000 721250c7      	bset	_CLK_PCKENR1,#1
2572                     ; 13 	PC_DDR = PC_DDR|(1<<7);
2574  0004 721e500c      	bset	_PC_DDR,#7
2575                     ; 14 	PC_CR1 = PC_CR1|(1<<7);
2577  0008 721e500d      	bset	_PC_CR1,#7
2578                     ; 15 	PC_CR2 = PC_CR2&~(1<<7);
2580  000c 721f500e      	bres	_PC_CR2,#7
2581                     ; 16 	PC_ODR = PC_ODR|(1<<7);
2583  0010 721e500a      	bset	_PC_ODR,#7
2584                     ; 17 	PD_DDR = (PD_DDR|(1<<7))+1;
2586  0014 c65011        	ld	a,_PD_DDR
2587  0017 aa80          	or	a,#128
2588  0019 4c            	inc	a
2589  001a c75011        	ld	_PD_DDR,a
2590                     ; 18 	PD_CR1 = (PD_CR1|(1<<7))+1;
2592  001d c65012        	ld	a,_PD_CR1
2593  0020 aa80          	or	a,#128
2594  0022 4c            	inc	a
2595  0023 c75012        	ld	_PD_CR1,a
2596                     ; 19 	PD_CR2 = (PD_CR2&~(1<<7))+1;
2598  0026 c65013        	ld	a,_PD_CR2
2599  0029 a47f          	and	a,#127
2600  002b 4c            	inc	a
2601  002c c75013        	ld	_PD_CR2,a
2602                     ; 20 	PD_ODR = PD_ODR&~(1<<7);
2604  002f 721f500f      	bres	_PD_ODR,#7
2605                     ; 21 	PD_ODR = PD_ODR&~(1<<0);
2607  0033 7211500f      	bres	_PD_ODR,#0
2608                     ; 22 	SPI_CR1 = 0x14;
2610  0037 35145200      	mov	_SPI_CR1,#20
2611                     ; 23 	SPI_CR2 = 0x03;
2613  003b 35035201      	mov	_SPI_CR2,#3
2614                     ; 24 	SPI_CR1 = SPI_CR1 |(1<<6);
2616  003f 721c5200      	bset	_SPI_CR1,#6
2617                     ; 25 }
2620  0043 81            	ret
2650                     ; 27 void init_ADC(void)
2650                     ; 28 {
2651                     	switch	.text
2652  0044               _init_ADC:
2656                     ; 29 	CLK_PCKENR2= CLK_PCKENR2|(1<<3);
2658  0044 721650ca      	bset	_CLK_PCKENR2,#3
2659                     ; 30 	PF_DDR = PF_DDR&~(1<<4);
2661  0048 7219501b      	bres	_PF_DDR,#4
2662                     ; 31 	PF_CR1 = PF_CR1&~(1<<4);
2664  004c 7219501c      	bres	_PF_CR1,#4
2665                     ; 32 	PF_CR2 = PF_CR2&~(1<<4);
2667  0050 7219501d      	bres	_PF_CR2,#4
2668                     ; 33 	ADC_CSR = 0x0C;
2670  0054 350c5400      	mov	_ADC_CSR,#12
2671                     ; 34 	ADC_CR1 = 0x01;
2673  0058 35015401      	mov	_ADC_CR1,#1
2674                     ; 35 	ADC_CR2 = 0x00;
2676  005c 725f5402      	clr	_ADC_CR2
2677                     ; 36 }
2680  0060 81            	ret
2714                     ; 38 void init_Poussoirs(void)
2714                     ; 39 {
2715                     	switch	.text
2716  0061               _init_Poussoirs:
2720                     ; 40 	PE_DDR = PE_DDR&~(1<<5);
2722  0061 721b5016      	bres	_PE_DDR,#5
2723                     ; 41 	PE_CR1 = PE_CR1&~(1<<5);
2725  0065 721b5017      	bres	_PE_CR1,#5
2726                     ; 42 	PE_CR2 = PE_CR2|(1<<5);
2728  0069 721a5018      	bset	_PE_CR2,#5
2729                     ; 43 	PD_DDR = PD_DDR&~(1<<3);
2731  006d 72175011      	bres	_PD_DDR,#3
2732                     ; 44 	PD_CR1 = PD_CR1&~(1<<3);
2734  0071 72175012      	bres	_PD_CR1,#3
2735                     ; 45 	PD_CR2 = PD_CR2|(1<<3);
2737  0075 72165013      	bset	_PD_CR2,#3
2738                     ; 46 	PC_DDR = PC_DDR&~(1<<4);
2740  0079 7219500c      	bres	_PC_DDR,#4
2741                     ; 47 	PC_CR1 = PC_CR1&~(1<<4);
2743  007d 7219500d      	bres	_PC_CR1,#4
2744                     ; 48 	PC_CR2 = PC_CR2|(1<<4);
2746  0081 7218500e      	bset	_PC_CR2,#4
2747                     ; 50 	EXTI_CR1 = EXTI_CR1&~(1<<6);
2749  0085 721d50a0      	bres	_EXTI_CR1,#6
2750                     ; 51 	EXTI_CR1 = EXTI_CR1|(1<<7);
2752  0089 721e50a0      	bset	_EXTI_CR1,#7
2753                     ; 52 	EXTI_CR1 = EXTI_CR1&~(1<<4);
2755  008d 721950a0      	bres	_EXTI_CR1,#4
2756                     ; 53 	EXTI_CR1 = EXTI_CR1|(1<<5);
2758  0091 721a50a0      	bset	_EXTI_CR1,#5
2759                     ; 54 	EXTI_CR2 = EXTI_CR2&~(1<<0);
2761  0095 721150a1      	bres	_EXTI_CR2,#0
2762                     ; 55 	EXTI_CR2 = EXTI_CR2|(1<<1);
2764  0099 721250a1      	bset	_EXTI_CR2,#1
2765                     ; 56 }
2768  009d 81            	ret
2794                     ; 58 void init_LED(void)
2794                     ; 59 {
2795                     	switch	.text
2796  009e               _init_LED:
2800                     ; 60 	PB_DDR = PB_DDR |0b00000111;
2802  009e c65007        	ld	a,_PB_DDR
2803  00a1 aa07          	or	a,#7
2804  00a3 c75007        	ld	_PB_DDR,a
2805                     ; 61 	PB_CR1 = PB_CR1 |0b00000111;
2807  00a6 c65008        	ld	a,_PB_CR1
2808  00a9 aa07          	or	a,#7
2809  00ab c75008        	ld	_PB_CR1,a
2810                     ; 62 	PB_CR2 = PB_CR2 |0b00000111;
2812  00ae c65009        	ld	a,_PB_CR2
2813  00b1 aa07          	or	a,#7
2814  00b3 c75009        	ld	_PB_CR2,a
2815                     ; 63 }
2818  00b6 81            	ret
2881                     ; 65 void affiche_mot(uint8_t *mot, uint8_t col, uint8_t ligne)
2881                     ; 66 {
2882                     	switch	.text
2883  00b7               _affiche_mot:
2885  00b7 89            	pushw	x
2886  00b8 88            	push	a
2887       00000001      OFST:	set	1
2890                     ; 67 	uint8_t i=0;
2892  00b9 0f01          	clr	(OFST+0,sp)
2894  00bb 202e          	jra	L7271
2895  00bd               L3271:
2896                     ; 71 		displayChar_TFT(col+11*i, ligne, mot[i], ST7735_RED, ST7735_BLACK, 2);
2898  00bd 4b02          	push	#2
2899  00bf 5f            	clrw	x
2900  00c0 89            	pushw	x
2901  00c1 aef800        	ldw	x,#63488
2902  00c4 89            	pushw	x
2903  00c5 7b07          	ld	a,(OFST+6,sp)
2904  00c7 97            	ld	xl,a
2905  00c8 7b08          	ld	a,(OFST+7,sp)
2906  00ca 1b06          	add	a,(OFST+5,sp)
2907  00cc 2401          	jrnc	L61
2908  00ce 5c            	incw	x
2909  00cf               L61:
2910  00cf 02            	rlwa	x,a
2911  00d0 f6            	ld	a,(x)
2912  00d1 88            	push	a
2913  00d2 7b0d          	ld	a,(OFST+12,sp)
2914  00d4 5f            	clrw	x
2915  00d5 97            	ld	xl,a
2916  00d6 89            	pushw	x
2917  00d7 7b09          	ld	a,(OFST+8,sp)
2918  00d9 97            	ld	xl,a
2919  00da a60b          	ld	a,#11
2920  00dc 42            	mul	x,a
2921  00dd 01            	rrwa	x,a
2922  00de 1b0e          	add	a,(OFST+13,sp)
2923  00e0 2401          	jrnc	L02
2924  00e2 5c            	incw	x
2925  00e3               L02:
2926  00e3 02            	rlwa	x,a
2927  00e4 cd0000        	call	_displayChar_TFT
2929  00e7 5b08          	addw	sp,#8
2930                     ; 72 		i++;
2932  00e9 0c01          	inc	(OFST+0,sp)
2933  00eb               L7271:
2934                     ; 69 	while(mot[i]!='\0')
2936  00eb 7b02          	ld	a,(OFST+1,sp)
2937  00ed 97            	ld	xl,a
2938  00ee 7b03          	ld	a,(OFST+2,sp)
2939  00f0 1b01          	add	a,(OFST+0,sp)
2940  00f2 2401          	jrnc	L22
2941  00f4 5c            	incw	x
2942  00f5               L22:
2943  00f5 02            	rlwa	x,a
2944  00f6 7d            	tnz	(x)
2945  00f7 26c4          	jrne	L3271
2946                     ; 74 }
2949  00f9 5b03          	addw	sp,#3
2950  00fb 81            	ret
3030                     ; 76 void affiche_nombre(uint16_t nombre, uint8_t col, uint8_t ligne)
3030                     ; 77 {
3031                     	switch	.text
3032  00fc               _affiche_nombre:
3034  00fc 89            	pushw	x
3035  00fd 5206          	subw	sp,#6
3036       00000006      OFST:	set	6
3039                     ; 79 	CEN = nombre/100;
3041  00ff 90ae0064      	ldw	y,#100
3042  0103 65            	divw	x,y
3043  0104 1f01          	ldw	(OFST-5,sp),x
3044                     ; 80 	DIZ = (nombre%100)/10;
3046  0106 1e07          	ldw	x,(OFST+1,sp)
3047  0108 90ae0064      	ldw	y,#100
3048  010c 65            	divw	x,y
3049  010d 51            	exgw	x,y
3050  010e 90ae000a      	ldw	y,#10
3051  0112 65            	divw	x,y
3052  0113 1f03          	ldw	(OFST-3,sp),x
3053                     ; 81 	UNI = (nombre%100)%10;
3055  0115 1e07          	ldw	x,(OFST+1,sp)
3056  0117 90ae0064      	ldw	y,#100
3057  011b 65            	divw	x,y
3058  011c 51            	exgw	x,y
3059  011d 90ae000a      	ldw	y,#10
3060  0121 65            	divw	x,y
3061  0122 51            	exgw	x,y
3062  0123 1f05          	ldw	(OFST-1,sp),x
3063                     ; 82 	displayChar_TFT(col, ligne, CEN+0x30, 0xFFE0, 0x0000, 2);
3065  0125 4b02          	push	#2
3066  0127 5f            	clrw	x
3067  0128 89            	pushw	x
3068  0129 aeffe0        	ldw	x,#65504
3069  012c 89            	pushw	x
3070  012d 7b07          	ld	a,(OFST+1,sp)
3071  012f ab30          	add	a,#48
3072  0131 88            	push	a
3073  0132 7b12          	ld	a,(OFST+12,sp)
3074  0134 5f            	clrw	x
3075  0135 97            	ld	xl,a
3076  0136 89            	pushw	x
3077  0137 7b13          	ld	a,(OFST+13,sp)
3078  0139 5f            	clrw	x
3079  013a 97            	ld	xl,a
3080  013b cd0000        	call	_displayChar_TFT
3082  013e 5b08          	addw	sp,#8
3083                     ; 83 	displayChar_TFT(col+12, ligne, DIZ+0x30, 0xFFE0, 0x0000, 2);
3085  0140 4b02          	push	#2
3086  0142 5f            	clrw	x
3087  0143 89            	pushw	x
3088  0144 aeffe0        	ldw	x,#65504
3089  0147 89            	pushw	x
3090  0148 7b09          	ld	a,(OFST+3,sp)
3091  014a ab30          	add	a,#48
3092  014c 88            	push	a
3093  014d 7b12          	ld	a,(OFST+12,sp)
3094  014f 5f            	clrw	x
3095  0150 97            	ld	xl,a
3096  0151 89            	pushw	x
3097  0152 7b13          	ld	a,(OFST+13,sp)
3098  0154 5f            	clrw	x
3099  0155 97            	ld	xl,a
3100  0156 1c000c        	addw	x,#12
3101  0159 cd0000        	call	_displayChar_TFT
3103  015c 5b08          	addw	sp,#8
3104                     ; 84 	displayChar_TFT(col+24, ligne, UNI+0x30, 0xFFE0, 0x0000, 2);
3106  015e 4b02          	push	#2
3107  0160 5f            	clrw	x
3108  0161 89            	pushw	x
3109  0162 aeffe0        	ldw	x,#65504
3110  0165 89            	pushw	x
3111  0166 7b0b          	ld	a,(OFST+5,sp)
3112  0168 ab30          	add	a,#48
3113  016a 88            	push	a
3114  016b 7b12          	ld	a,(OFST+12,sp)
3115  016d 5f            	clrw	x
3116  016e 97            	ld	xl,a
3117  016f 89            	pushw	x
3118  0170 7b13          	ld	a,(OFST+13,sp)
3119  0172 5f            	clrw	x
3120  0173 97            	ld	xl,a
3121  0174 1c0018        	addw	x,#24
3122  0177 cd0000        	call	_displayChar_TFT
3124  017a 5b08          	addw	sp,#8
3125                     ; 85 }
3128  017c 5b08          	addw	sp,#8
3129  017e 81            	ret
3142                     	xdef	_affiche_nombre
3143                     	xdef	_affiche_mot
3144                     	xdef	_init_LED
3145                     	xdef	_init_Poussoirs
3146                     	xdef	_init_ADC
3147                     	xdef	_init_SPI
3148                     	xref	_displayChar_TFT
3167                     	end

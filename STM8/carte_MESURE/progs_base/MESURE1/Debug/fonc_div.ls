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
2649                     ; 27 void init_ADC(void)
2649                     ; 28 {
2650                     	switch	.text
2651  0044               _init_ADC:
2655                     ; 29 	CLK_PCKENR2= CLK_PCKENR2|(1<<3);
2657  0044 721650ca      	bset	_CLK_PCKENR2,#3
2658                     ; 30 	PF_DDR = PF_DDR&~(1<<4);
2660  0048 7219501b      	bres	_PF_DDR,#4
2661                     ; 31 	PF_CR1 = PF_CR1&~(1<<4);
2663  004c 7219501c      	bres	_PF_CR1,#4
2664                     ; 32 	PF_CR2 = PF_CR2&~(1<<4);
2666  0050 7219501d      	bres	_PF_CR2,#4
2667                     ; 33 	ADC_CSR = 0x0C;
2669  0054 350c5400      	mov	_ADC_CSR,#12
2670                     ; 34 	ADC_CR1 |= 0x01;
2672  0058 72105401      	bset	_ADC_CR1,#0
2673                     ; 35 }
2676  005c 81            	ret
2710                     ; 37 void init_Poussoirs(void)
2710                     ; 38 {
2711                     	switch	.text
2712  005d               _init_Poussoirs:
2716                     ; 39 	PE_DDR = PE_DDR&~(1<<5);
2718  005d 721b5016      	bres	_PE_DDR,#5
2719                     ; 40 	PE_CR1 = PE_CR1&~(1<<5);
2721  0061 721b5017      	bres	_PE_CR1,#5
2722                     ; 41 	PE_CR2 = PE_CR2|(1<<5);
2724  0065 721a5018      	bset	_PE_CR2,#5
2725                     ; 42 	PD_DDR = PD_DDR&~(1<<3);
2727  0069 72175011      	bres	_PD_DDR,#3
2728                     ; 43 	PD_CR1 = PD_CR1&~(1<<3);
2730  006d 72175012      	bres	_PD_CR1,#3
2731                     ; 44 	PD_CR2 = PD_CR2|(1<<3);
2733  0071 72165013      	bset	_PD_CR2,#3
2734                     ; 45 	PC_DDR = PC_DDR&~(1<<4);
2736  0075 7219500c      	bres	_PC_DDR,#4
2737                     ; 46 	PC_CR1 = PC_CR1&~(1<<4);
2739  0079 7219500d      	bres	_PC_CR1,#4
2740                     ; 47 	PC_CR2 = PC_CR2|(1<<4);
2742  007d 7218500e      	bset	_PC_CR2,#4
2743                     ; 49 	EXTI_CR1 = EXTI_CR1&~(1<<6);
2745  0081 721d50a0      	bres	_EXTI_CR1,#6
2746                     ; 50 	EXTI_CR1 = EXTI_CR1|(1<<7);
2748  0085 721e50a0      	bset	_EXTI_CR1,#7
2749                     ; 51 	EXTI_CR1 = EXTI_CR1&~(1<<4);
2751  0089 721950a0      	bres	_EXTI_CR1,#4
2752                     ; 52 	EXTI_CR1 = EXTI_CR1|(1<<5);
2754  008d 721a50a0      	bset	_EXTI_CR1,#5
2755                     ; 53 	EXTI_CR2 = EXTI_CR2&~(1<<0);
2757  0091 721150a1      	bres	_EXTI_CR2,#0
2758                     ; 54 	EXTI_CR2 = EXTI_CR2|(1<<1);
2760  0095 721250a1      	bset	_EXTI_CR2,#1
2761                     ; 55 }
2764  0099 81            	ret
2790                     ; 57 void init_LED(void)
2790                     ; 58 {
2791                     	switch	.text
2792  009a               _init_LED:
2796                     ; 59 	PB_DDR = PB_DDR |0b00000111;
2798  009a c65007        	ld	a,_PB_DDR
2799  009d aa07          	or	a,#7
2800  009f c75007        	ld	_PB_DDR,a
2801                     ; 60 	PB_CR1 = PB_CR1 |0b00000111;
2803  00a2 c65008        	ld	a,_PB_CR1
2804  00a5 aa07          	or	a,#7
2805  00a7 c75008        	ld	_PB_CR1,a
2806                     ; 61 	PB_CR2 = PB_CR2 |0b00000111;
2808  00aa c65009        	ld	a,_PB_CR2
2809  00ad aa07          	or	a,#7
2810  00af c75009        	ld	_PB_CR2,a
2811                     ; 62 }
2814  00b2 81            	ret
2877                     ; 64 void affiche_mot(uint8_t *mot, uint8_t col, uint8_t ligne)
2877                     ; 65 {
2878                     	switch	.text
2879  00b3               _affiche_mot:
2881  00b3 89            	pushw	x
2882  00b4 88            	push	a
2883       00000001      OFST:	set	1
2886                     ; 66 	uint8_t i=0;
2888  00b5 0f01          	clr	(OFST+0,sp)
2890  00b7 202e          	jra	L7271
2891  00b9               L3271:
2892                     ; 70 		displayChar_TFT(col+11*i, ligne, mot[i], ST7735_RED, ST7735_BLACK, 2);
2894  00b9 4b02          	push	#2
2895  00bb 5f            	clrw	x
2896  00bc 89            	pushw	x
2897  00bd aef800        	ldw	x,#63488
2898  00c0 89            	pushw	x
2899  00c1 7b07          	ld	a,(OFST+6,sp)
2900  00c3 97            	ld	xl,a
2901  00c4 7b08          	ld	a,(OFST+7,sp)
2902  00c6 1b06          	add	a,(OFST+5,sp)
2903  00c8 2401          	jrnc	L61
2904  00ca 5c            	incw	x
2905  00cb               L61:
2906  00cb 02            	rlwa	x,a
2907  00cc f6            	ld	a,(x)
2908  00cd 88            	push	a
2909  00ce 7b0d          	ld	a,(OFST+12,sp)
2910  00d0 5f            	clrw	x
2911  00d1 97            	ld	xl,a
2912  00d2 89            	pushw	x
2913  00d3 7b09          	ld	a,(OFST+8,sp)
2914  00d5 97            	ld	xl,a
2915  00d6 a60b          	ld	a,#11
2916  00d8 42            	mul	x,a
2917  00d9 01            	rrwa	x,a
2918  00da 1b0e          	add	a,(OFST+13,sp)
2919  00dc 2401          	jrnc	L02
2920  00de 5c            	incw	x
2921  00df               L02:
2922  00df 02            	rlwa	x,a
2923  00e0 cd0000        	call	_displayChar_TFT
2925  00e3 5b08          	addw	sp,#8
2926                     ; 71 		i++;
2928  00e5 0c01          	inc	(OFST+0,sp)
2929  00e7               L7271:
2930                     ; 68 	while(mot[i]!='\0')
2932  00e7 7b02          	ld	a,(OFST+1,sp)
2933  00e9 97            	ld	xl,a
2934  00ea 7b03          	ld	a,(OFST+2,sp)
2935  00ec 1b01          	add	a,(OFST+0,sp)
2936  00ee 2401          	jrnc	L22
2937  00f0 5c            	incw	x
2938  00f1               L22:
2939  00f1 02            	rlwa	x,a
2940  00f2 7d            	tnz	(x)
2941  00f3 26c4          	jrne	L3271
2942                     ; 73 }
2945  00f5 5b03          	addw	sp,#3
2946  00f7 81            	ret
3026                     ; 75 void affiche_nombre(uint16_t nombre, uint8_t col, uint8_t ligne)
3026                     ; 76 {
3027                     	switch	.text
3028  00f8               _affiche_nombre:
3030  00f8 89            	pushw	x
3031  00f9 5206          	subw	sp,#6
3032       00000006      OFST:	set	6
3035                     ; 78 	CEN = nombre/100;
3037  00fb 90ae0064      	ldw	y,#100
3038  00ff 65            	divw	x,y
3039  0100 1f01          	ldw	(OFST-5,sp),x
3040                     ; 79 	DIZ = (nombre%100)/10;
3042  0102 1e07          	ldw	x,(OFST+1,sp)
3043  0104 90ae0064      	ldw	y,#100
3044  0108 65            	divw	x,y
3045  0109 51            	exgw	x,y
3046  010a 90ae000a      	ldw	y,#10
3047  010e 65            	divw	x,y
3048  010f 1f03          	ldw	(OFST-3,sp),x
3049                     ; 80 	UNI = (nombre%100)%10;
3051  0111 1e07          	ldw	x,(OFST+1,sp)
3052  0113 90ae0064      	ldw	y,#100
3053  0117 65            	divw	x,y
3054  0118 51            	exgw	x,y
3055  0119 90ae000a      	ldw	y,#10
3056  011d 65            	divw	x,y
3057  011e 51            	exgw	x,y
3058  011f 1f05          	ldw	(OFST-1,sp),x
3059                     ; 81 	displayChar_TFT(col, ligne, CEN+0x30, 0xFFE0, 0x0000, 2);
3061  0121 4b02          	push	#2
3062  0123 5f            	clrw	x
3063  0124 89            	pushw	x
3064  0125 aeffe0        	ldw	x,#65504
3065  0128 89            	pushw	x
3066  0129 7b07          	ld	a,(OFST+1,sp)
3067  012b ab30          	add	a,#48
3068  012d 88            	push	a
3069  012e 7b12          	ld	a,(OFST+12,sp)
3070  0130 5f            	clrw	x
3071  0131 97            	ld	xl,a
3072  0132 89            	pushw	x
3073  0133 7b13          	ld	a,(OFST+13,sp)
3074  0135 5f            	clrw	x
3075  0136 97            	ld	xl,a
3076  0137 cd0000        	call	_displayChar_TFT
3078  013a 5b08          	addw	sp,#8
3079                     ; 82 	displayChar_TFT(col+12, ligne, DIZ+0x30, 0xFFE0, 0x0000, 2);
3081  013c 4b02          	push	#2
3082  013e 5f            	clrw	x
3083  013f 89            	pushw	x
3084  0140 aeffe0        	ldw	x,#65504
3085  0143 89            	pushw	x
3086  0144 7b09          	ld	a,(OFST+3,sp)
3087  0146 ab30          	add	a,#48
3088  0148 88            	push	a
3089  0149 7b12          	ld	a,(OFST+12,sp)
3090  014b 5f            	clrw	x
3091  014c 97            	ld	xl,a
3092  014d 89            	pushw	x
3093  014e 7b13          	ld	a,(OFST+13,sp)
3094  0150 5f            	clrw	x
3095  0151 97            	ld	xl,a
3096  0152 1c000c        	addw	x,#12
3097  0155 cd0000        	call	_displayChar_TFT
3099  0158 5b08          	addw	sp,#8
3100                     ; 83 	displayChar_TFT(col+24, ligne, UNI+0x30, 0xFFE0, 0x0000, 2);
3102  015a 4b02          	push	#2
3103  015c 5f            	clrw	x
3104  015d 89            	pushw	x
3105  015e aeffe0        	ldw	x,#65504
3106  0161 89            	pushw	x
3107  0162 7b0b          	ld	a,(OFST+5,sp)
3108  0164 ab30          	add	a,#48
3109  0166 88            	push	a
3110  0167 7b12          	ld	a,(OFST+12,sp)
3111  0169 5f            	clrw	x
3112  016a 97            	ld	xl,a
3113  016b 89            	pushw	x
3114  016c 7b13          	ld	a,(OFST+13,sp)
3115  016e 5f            	clrw	x
3116  016f 97            	ld	xl,a
3117  0170 1c0018        	addw	x,#24
3118  0173 cd0000        	call	_displayChar_TFT
3120  0176 5b08          	addw	sp,#8
3121                     ; 84 }
3124  0178 5b08          	addw	sp,#8
3125  017a 81            	ret
3138                     	xdef	_affiche_nombre
3139                     	xdef	_affiche_mot
3140                     	xdef	_init_LED
3141                     	xdef	_init_Poussoirs
3142                     	xdef	_init_ADC
3143                     	xdef	_init_SPI
3144                     	xref	_displayChar_TFT
3163                     	end

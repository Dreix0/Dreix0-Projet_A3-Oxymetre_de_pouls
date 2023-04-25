   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2562                     ; 12 void init_SPI(void)
2562                     ; 13 {
2564                     	switch	.text
2565  0000               _init_SPI:
2569                     ; 14 	CLK_PCKENR1 = CLK_PCKENR1 | (1<<1);
2571  0000 721250c7      	bset	_CLK_PCKENR1,#1
2572                     ; 15 	PC_DDR = PC_DDR|(1<<7);
2574  0004 721e500c      	bset	_PC_DDR,#7
2575                     ; 16 	PC_CR1 = PC_CR1|(1<<7);
2577  0008 721e500d      	bset	_PC_CR1,#7
2578                     ; 17 	PC_CR2 = PC_CR2&~(1<<7);
2580  000c 721f500e      	bres	_PC_CR2,#7
2581                     ; 18 	PC_ODR = PC_ODR|(1<<7);
2583  0010 721e500a      	bset	_PC_ODR,#7
2584                     ; 19 	PD_DDR = (PD_DDR|(1<<7))+1;
2586  0014 c65011        	ld	a,_PD_DDR
2587  0017 aa80          	or	a,#128
2588  0019 4c            	inc	a
2589  001a c75011        	ld	_PD_DDR,a
2590                     ; 20 	PD_CR1 = (PD_CR1|(1<<7))+1;
2592  001d c65012        	ld	a,_PD_CR1
2593  0020 aa80          	or	a,#128
2594  0022 4c            	inc	a
2595  0023 c75012        	ld	_PD_CR1,a
2596                     ; 21 	PD_CR2 = (PD_CR2&~(1<<7))+1;
2598  0026 c65013        	ld	a,_PD_CR2
2599  0029 a47f          	and	a,#127
2600  002b 4c            	inc	a
2601  002c c75013        	ld	_PD_CR2,a
2602                     ; 22 	PD_ODR = PD_ODR&~(1<<7);
2604  002f 721f500f      	bres	_PD_ODR,#7
2605                     ; 23 	PD_ODR = PD_ODR&~(1<<0);
2607  0033 7211500f      	bres	_PD_ODR,#0
2608                     ; 24 	SPI_CR1 = 0x14;
2610  0037 35145200      	mov	_SPI_CR1,#20
2611                     ; 25 	SPI_CR2 = 0x03;
2613  003b 35035201      	mov	_SPI_CR2,#3
2614                     ; 26 	SPI_CR1 = SPI_CR1 |(1<<6);
2616  003f 721c5200      	bset	_SPI_CR1,#6
2617                     ; 27 }
2620  0043 81            	ret
2649                     ; 29 void init_ADC(void)
2649                     ; 30 {
2650                     	switch	.text
2651  0044               _init_ADC:
2655                     ; 31 	CLK_PCKENR2= CLK_PCKENR2|(1<<3);
2657  0044 721650ca      	bset	_CLK_PCKENR2,#3
2658                     ; 32 	PF_DDR = PF_DDR&~(1<<4);
2660  0048 7219501b      	bres	_PF_DDR,#4
2661                     ; 33 	PF_CR1 = PF_CR1&~(1<<4);
2663  004c 7219501c      	bres	_PF_CR1,#4
2664                     ; 34 	PF_CR2 = PF_CR2&~(1<<4);
2666  0050 7219501d      	bres	_PF_CR2,#4
2667                     ; 35 	ADC_CSR = 0x0C;
2669  0054 350c5400      	mov	_ADC_CSR,#12
2670                     ; 36 	ADC_CR1 |= 0x01;
2672  0058 72105401      	bset	_ADC_CR1,#0
2673                     ; 37 }
2676  005c 81            	ret
2710                     ; 39 void init_Poussoirs(void)
2710                     ; 40 {
2711                     	switch	.text
2712  005d               _init_Poussoirs:
2716                     ; 41 	PE_DDR = PE_DDR&~(1<<5);
2718  005d 721b5016      	bres	_PE_DDR,#5
2719                     ; 42 	PE_CR1 = PE_CR1&~(1<<5);
2721  0061 721b5017      	bres	_PE_CR1,#5
2722                     ; 43 	PE_CR2 = PE_CR2|(1<<5);
2724  0065 721a5018      	bset	_PE_CR2,#5
2725                     ; 44 	PD_DDR = PD_DDR&~(1<<3);
2727  0069 72175011      	bres	_PD_DDR,#3
2728                     ; 45 	PD_CR1 = PD_CR1&~(1<<3);
2730  006d 72175012      	bres	_PD_CR1,#3
2731                     ; 46 	PD_CR2 = PD_CR2|(1<<3);
2733  0071 72165013      	bset	_PD_CR2,#3
2734                     ; 47 	PC_DDR = PC_DDR&~(1<<4);
2736  0075 7219500c      	bres	_PC_DDR,#4
2737                     ; 48 	PC_CR1 = PC_CR1&~(1<<4);
2739  0079 7219500d      	bres	_PC_CR1,#4
2740                     ; 49 	PC_CR2 = PC_CR2|(1<<4);
2742  007d 7218500e      	bset	_PC_CR2,#4
2743                     ; 51 	EXTI_CR1 = EXTI_CR1&~(1<<6);
2745  0081 721d50a0      	bres	_EXTI_CR1,#6
2746                     ; 52 	EXTI_CR1 = EXTI_CR1|(1<<7);
2748  0085 721e50a0      	bset	_EXTI_CR1,#7
2749                     ; 53 	EXTI_CR1 = EXTI_CR1&~(1<<4);
2751  0089 721950a0      	bres	_EXTI_CR1,#4
2752                     ; 54 	EXTI_CR1 = EXTI_CR1|(1<<5);
2754  008d 721a50a0      	bset	_EXTI_CR1,#5
2755                     ; 55 	EXTI_CR2 = EXTI_CR2&~(1<<0);
2757  0091 721150a1      	bres	_EXTI_CR2,#0
2758                     ; 56 	EXTI_CR2 = EXTI_CR2|(1<<1);
2760  0095 721250a1      	bset	_EXTI_CR2,#1
2761                     ; 57 }
2764  0099 81            	ret
2790                     ; 59 void init_LED(void)
2790                     ; 60 {
2791                     	switch	.text
2792  009a               _init_LED:
2796                     ; 61 	PB_DDR = PB_DDR |0b00000111;
2798  009a c65007        	ld	a,_PB_DDR
2799  009d aa07          	or	a,#7
2800  009f c75007        	ld	_PB_DDR,a
2801                     ; 62 	PB_CR1 = PB_CR1 |0b00000111;
2803  00a2 c65008        	ld	a,_PB_CR1
2804  00a5 aa07          	or	a,#7
2805  00a7 c75008        	ld	_PB_CR1,a
2806                     ; 63 	PB_CR2 = PB_CR2 |0b00000111;
2808  00aa c65009        	ld	a,_PB_CR2
2809  00ad aa07          	or	a,#7
2810  00af c75009        	ld	_PB_CR2,a
2811                     ; 64 }
2814  00b2 81            	ret
2877                     ; 66 void affiche_mot(uint8_t *mot, uint8_t col, uint8_t ligne)
2877                     ; 67 {
2878                     	switch	.text
2879  00b3               _affiche_mot:
2881  00b3 89            	pushw	x
2882  00b4 88            	push	a
2883       00000001      OFST:	set	1
2886                     ; 68 	uint8_t i=0;
2888  00b5 0f01          	clr	(OFST+0,sp)
2890  00b7 202e          	jra	L7271
2891  00b9               L3271:
2892                     ; 72 		displayChar_TFT(col+11*i, ligne, mot[i], ST7735_RED, ST7735_BLACK, 2);
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
2926                     ; 73 		i++;
2928  00e5 0c01          	inc	(OFST+0,sp)
2929  00e7               L7271:
2930                     ; 70 	while(mot[i]!='\0')
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
2942                     ; 75 }
2945  00f5 5b03          	addw	sp,#3
2946  00f7 81            	ret
3026                     ; 77 void affiche_nombre(uint16_t nombre, uint8_t col, uint8_t ligne)
3026                     ; 78 {
3027                     	switch	.text
3028  00f8               _affiche_nombre:
3030  00f8 89            	pushw	x
3031  00f9 5206          	subw	sp,#6
3032       00000006      OFST:	set	6
3035                     ; 80 	CEN = nombre/100;
3037  00fb 90ae0064      	ldw	y,#100
3038  00ff 65            	divw	x,y
3039  0100 1f01          	ldw	(OFST-5,sp),x
3040                     ; 81 	DIZ = (nombre%100)/10;
3042  0102 1e07          	ldw	x,(OFST+1,sp)
3043  0104 90ae0064      	ldw	y,#100
3044  0108 65            	divw	x,y
3045  0109 51            	exgw	x,y
3046  010a 90ae000a      	ldw	y,#10
3047  010e 65            	divw	x,y
3048  010f 1f03          	ldw	(OFST-3,sp),x
3049                     ; 82 	UNI = (nombre%100)%10;
3051  0111 1e07          	ldw	x,(OFST+1,sp)
3052  0113 90ae0064      	ldw	y,#100
3053  0117 65            	divw	x,y
3054  0118 51            	exgw	x,y
3055  0119 90ae000a      	ldw	y,#10
3056  011d 65            	divw	x,y
3057  011e 51            	exgw	x,y
3058  011f 1f05          	ldw	(OFST-1,sp),x
3059                     ; 83 	displayChar_TFT(col, ligne, CEN+0x30, 0xFFE0, 0x0000, 2);
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
3079                     ; 84 	displayChar_TFT(col+12, ligne, DIZ+0x30, 0xFFE0, 0x0000, 2);
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
3100                     ; 85 	displayChar_TFT(col+24, ligne, UNI+0x30, 0xFFE0, 0x0000, 2);
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
3121                     ; 86 }
3124  0178 5b08          	addw	sp,#8
3125  017a 81            	ret
3156                     ; 90 void init_timer1_2ms(void)
3156                     ; 91 {
3157                     	switch	.text
3158  017b               _init_timer1_2ms:
3162                     ; 92 	CLK_PCKENR1 = CLK_PCKENR1|(1<<7);
3164  017b 721e50c7      	bset	_CLK_PCKENR1,#7
3165                     ; 93 	TIM1_PSCRH = 79/256;
3167  017f 725f5260      	clr	_TIM1_PSCRH
3168                     ; 94 	TIM1_PSCRL = 79%256;
3170  0183 354f5261      	mov	_TIM1_PSCRL,#79
3171                     ; 95 	TIM1_ARRH = 399/256;
3173  0187 35015262      	mov	_TIM1_ARRH,#1
3174                     ; 96 	TIM1_ARRL = 399%256;
3176  018b 358f5263      	mov	_TIM1_ARRL,#143
3177                     ; 97 	TIM1_CR1 = 0x00;
3179  018f 725f5250      	clr	_TIM1_CR1
3180                     ; 98 	TIM1_IER |= 1;
3182  0193 72105254      	bset	_TIM1_IER,#0
3183                     ; 99 	TIM1_SR1 = 0x00;
3185  0197 725f5255      	clr	_TIM1_SR1
3186                     ; 100 	TIM1_CR1 |= 1;
3188  019b 72105250      	bset	_TIM1_CR1,#0
3189                     ; 101 }
3192  019f 81            	ret
3241                     ; 103 void init_UART2(uint16_t UART_BAUDRATE)
3241                     ; 104 {
3242                     	switch	.text
3243  01a0               _init_UART2:
3245  01a0 5206          	subw	sp,#6
3246       00000006      OFST:	set	6
3249                     ; 105 	int uartdiv = 16000000/UART_BAUDRATE;
3251  01a2 cd0000        	call	c_uitolx
3253  01a5 96            	ldw	x,sp
3254  01a6 1c0001        	addw	x,#OFST-5
3255  01a9 cd0000        	call	c_rtol
3257  01ac ae2400        	ldw	x,#9216
3258  01af bf02          	ldw	c_lreg+2,x
3259  01b1 ae00f4        	ldw	x,#244
3260  01b4 bf00          	ldw	c_lreg,x
3261  01b6 96            	ldw	x,sp
3262  01b7 1c0001        	addw	x,#OFST-5
3263  01ba cd0000        	call	c_ldiv
3265  01bd be02          	ldw	x,c_lreg+2
3266  01bf 1f05          	ldw	(OFST-1,sp),x
3267                     ; 106 	CLK_PCKENR1 |= (1<<3);
3269  01c1 721650c7      	bset	_CLK_PCKENR1,#3
3270                     ; 107 	UART2_BRR1 = (uartdiv >> 4);
3272  01c5 1e05          	ldw	x,(OFST-1,sp)
3273  01c7 57            	sraw	x
3274  01c8 57            	sraw	x
3275  01c9 57            	sraw	x
3276  01ca 57            	sraw	x
3277  01cb 01            	rrwa	x,a
3278  01cc c75242        	ld	_UART2_BRR1,a
3279  01cf 02            	rlwa	x,a
3280                     ; 108 	UART2_BRR2 = ((uartdiv&0xF000)>>8)|(uartdiv&0x000F);
3282  01d0 7b06          	ld	a,(OFST+0,sp)
3283  01d2 a40f          	and	a,#15
3284  01d4 5f            	clrw	x
3285  01d5 4d            	tnz	a
3286  01d6 2a01          	jrpl	L23
3287  01d8 53            	cplw	x
3288  01d9               L23:
3289  01d9 97            	ld	xl,a
3290  01da 1f03          	ldw	(OFST-3,sp),x
3291  01dc 7b05          	ld	a,(OFST-1,sp)
3292  01de 97            	ld	xl,a
3293  01df 7b06          	ld	a,(OFST+0,sp)
3294  01e1 9f            	ld	a,xl
3295  01e2 a4f0          	and	a,#240
3296  01e4 97            	ld	xl,a
3297  01e5 4f            	clr	a
3298  01e6 02            	rlwa	x,a
3299  01e7 4f            	clr	a
3300  01e8 01            	rrwa	x,a
3301  01e9 01            	rrwa	x,a
3302  01ea 1a04          	or	a,(OFST-2,sp)
3303  01ec 01            	rrwa	x,a
3304  01ed 1a03          	or	a,(OFST-3,sp)
3305  01ef 01            	rrwa	x,a
3306  01f0 01            	rrwa	x,a
3307  01f1 c75243        	ld	_UART2_BRR2,a
3308  01f4 02            	rlwa	x,a
3309                     ; 109 	UART2_CR1 = 0;
3311  01f5 725f5244      	clr	_UART2_CR1
3312                     ; 110 	UART2_CR2 = 0b00001100;
3314  01f9 350c5245      	mov	_UART2_CR2,#12
3315                     ; 111 	UART2_CR3 = (UART2_CR3 & 0b10000000);
3317  01fd c65246        	ld	a,_UART2_CR3
3318  0200 a480          	and	a,#128
3319  0202 c75246        	ld	_UART2_CR3,a
3320                     ; 112 }
3323  0205 5b06          	addw	sp,#6
3324  0207 81            	ret
3360                     ; 114 void write_byte_UART2(uint8_t data)
3360                     ; 115 {
3361                     	switch	.text
3362  0208               _write_byte_UART2:
3366                     ; 116 	UART2_DR = data;
3368  0208 c75241        	ld	_UART2_DR,a
3370  020b               L1502:
3371                     ; 117 	while((UART2_SR&0b10000000)==0);
3373  020b c65240        	ld	a,_UART2_SR
3374  020e a580          	bcp	a,#128
3375  0210 27f9          	jreq	L1502
3376                     ; 118 }
3379  0212 81            	ret
3412                     ; 120 void init_timer2_pwm(void)
3412                     ; 121 {
3413                     	switch	.text
3414  0213               _init_timer2_pwm:
3418                     ; 122 	CLK_PCKENR1 = CLK_PCKENR1|(1<<5);
3420  0213 721a50c7      	bset	_CLK_PCKENR1,#5
3421                     ; 123 	TIM2_PSCR = 0x4;
3423  0217 3504530c      	mov	_TIM2_PSCR,#4
3424                     ; 124 	TIM2_ARRH = 99/256;
3426  021b 725f530d      	clr	_TIM2_ARRH
3427                     ; 125 	TIM2_ARRL = 99%256;
3429  021f 3563530e      	mov	_TIM2_ARRL,#99
3430                     ; 126 	TIM2_CCMR1 = 0x68;
3432  0223 35685305      	mov	_TIM2_CCMR1,#104
3433                     ; 127 	TIM2_CCER1 = 1;
3435  0227 35015308      	mov	_TIM2_CCER1,#1
3436                     ; 128 	TIM2_CR1 = 0x81;
3438  022b 35815300      	mov	_TIM2_CR1,#129
3439                     ; 129 	PD_DDR = PD_DDR|(1<<4);
3441  022f 72185011      	bset	_PD_DDR,#4
3442                     ; 130 	PD_CR1 = PD_CR1|(1<<4);
3444  0233 72185012      	bset	_PD_CR1,#4
3445                     ; 131 	PD_CR2 = PD_CR2&~(1<<4);
3447  0237 72195013      	bres	_PD_CR2,#4
3448                     ; 132 }
3451  023b 81            	ret
3464                     	xdef	_init_timer2_pwm
3465                     	xdef	_write_byte_UART2
3466                     	xdef	_init_UART2
3467                     	xdef	_init_timer1_2ms
3468                     	xdef	_affiche_nombre
3469                     	xdef	_affiche_mot
3470                     	xdef	_init_LED
3471                     	xdef	_init_Poussoirs
3472                     	xdef	_init_ADC
3473                     	xdef	_init_SPI
3474                     	xref	_displayChar_TFT
3475                     	xref.b	c_lreg
3476                     	xref.b	c_x
3495                     	xref	c_ldiv
3496                     	xref	c_rtol
3497                     	xref	c_uitolx
3498                     	end

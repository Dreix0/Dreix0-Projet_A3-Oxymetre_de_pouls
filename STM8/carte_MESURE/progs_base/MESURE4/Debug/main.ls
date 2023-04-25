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
2695                     	switch	.const
2696  0052               _tab_ech:
2697  0052 0000          	dc.w	0
2698  0054 ffff          	dc.w	-1
2699  0056 ffff          	dc.w	-1
2700  0058 ffff          	dc.w	-1
2701  005a fffe          	dc.w	-2
2702  005c fffe          	dc.w	-2
2703  005e fffe          	dc.w	-2
2704  0060 fffe          	dc.w	-2
2705  0062 fffd          	dc.w	-3
2706  0064 fffd          	dc.w	-3
2707  0066 fffd          	dc.w	-3
2708  0068 fffd          	dc.w	-3
2709  006a fffc          	dc.w	-4
2710  006c fffc          	dc.w	-4
2711  006e fffc          	dc.w	-4
2712  0070 fffc          	dc.w	-4
2713  0072 fffb          	dc.w	-5
2714  0074 fffb          	dc.w	-5
2715  0076 fffb          	dc.w	-5
2716  0078 fffb          	dc.w	-5
2717  007a fffa          	dc.w	-6
2718  007c fffa          	dc.w	-6
2719  007e fffa          	dc.w	-6
2720  0080 fffa          	dc.w	-6
2721  0082 fff9          	dc.w	-7
2722  0084 fff9          	dc.w	-7
2723  0086 fff9          	dc.w	-7
2724  0088 fff9          	dc.w	-7
2725  008a fff9          	dc.w	-7
2726  008c fff8          	dc.w	-8
2727  008e fff8          	dc.w	-8
2728  0090 fff8          	dc.w	-8
2729  0092 fff8          	dc.w	-8
2730  0094 fff7          	dc.w	-9
2731  0096 fff7          	dc.w	-9
2732  0098 fff7          	dc.w	-9
2733  009a fff7          	dc.w	-9
2734  009c fff7          	dc.w	-9
2735  009e fff6          	dc.w	-10
2736  00a0 fff6          	dc.w	-10
2737  00a2 fff6          	dc.w	-10
2738  00a4 fff6          	dc.w	-10
2739  00a6 fff6          	dc.w	-10
2740  00a8 fff6          	dc.w	-10
2741  00aa fff5          	dc.w	-11
2742  00ac fff5          	dc.w	-11
2743  00ae fff5          	dc.w	-11
2744  00b0 fff5          	dc.w	-11
2745  00b2 fff5          	dc.w	-11
2746  00b4 fff5          	dc.w	-11
2747  00b6 fff4          	dc.w	-12
2748  00b8 fff4          	dc.w	-12
2749  00ba fff4          	dc.w	-12
2750  00bc fff4          	dc.w	-12
2751  00be fff4          	dc.w	-12
2752  00c0 fff4          	dc.w	-12
2753  00c2 fff4          	dc.w	-12
2754  00c4 fff4          	dc.w	-12
2755  00c6 fff4          	dc.w	-12
2756  00c8 fff3          	dc.w	-13
2757  00ca fff3          	dc.w	-13
2758  00cc fff3          	dc.w	-13
2759  00ce fff3          	dc.w	-13
2760  00d0 fff3          	dc.w	-13
2761  00d2 fff3          	dc.w	-13
2762  00d4 fff3          	dc.w	-13
2763  00d6 fff3          	dc.w	-13
2764  00d8 fff3          	dc.w	-13
2765  00da fff3          	dc.w	-13
2766  00dc fff3          	dc.w	-13
2767  00de fff3          	dc.w	-13
2768  00e0 fff3          	dc.w	-13
2769  00e2 fff3          	dc.w	-13
2770  00e4 fff3          	dc.w	-13
2771  00e6 fff3          	dc.w	-13
2772  00e8 fff3          	dc.w	-13
2773  00ea fff3          	dc.w	-13
2774  00ec fff3          	dc.w	-13
2775  00ee fff3          	dc.w	-13
2776  00f0 fff3          	dc.w	-13
2777  00f2 fff3          	dc.w	-13
2778  00f4 fff3          	dc.w	-13
2779  00f6 fff3          	dc.w	-13
2780  00f8 fff3          	dc.w	-13
2781  00fa fff3          	dc.w	-13
2782  00fc fff3          	dc.w	-13
2783  00fe fff3          	dc.w	-13
2784  0100 fff3          	dc.w	-13
2785  0102 fff3          	dc.w	-13
2786  0104 fff3          	dc.w	-13
2787  0106 fff4          	dc.w	-12
2788  0108 fff4          	dc.w	-12
2789  010a fff4          	dc.w	-12
2790  010c fff4          	dc.w	-12
2791  010e fff4          	dc.w	-12
2792  0110 fff4          	dc.w	-12
2793  0112 fff4          	dc.w	-12
2794  0114 fff4          	dc.w	-12
2795  0116 fff5          	dc.w	-11
2796  0118 fff5          	dc.w	-11
2797  011a fff5          	dc.w	-11
2798  011c fff5          	dc.w	-11
2799  011e fff5          	dc.w	-11
2800  0120 fff6          	dc.w	-10
2801  0122 fff6          	dc.w	-10
2802  0124 fff6          	dc.w	-10
2803  0126 fff6          	dc.w	-10
2804  0128 fff6          	dc.w	-10
2805  012a fff7          	dc.w	-9
2806  012c fff7          	dc.w	-9
2807  012e fff7          	dc.w	-9
2808  0130 fff7          	dc.w	-9
2809  0132 fff8          	dc.w	-8
2810  0134 fff8          	dc.w	-8
2811  0136 fff8          	dc.w	-8
2812  0138 fff9          	dc.w	-7
2813  013a fff9          	dc.w	-7
2814  013c fff9          	dc.w	-7
2815  013e fffa          	dc.w	-6
2816  0140 fffa          	dc.w	-6
2817  0142 fffa          	dc.w	-6
2818  0144 fffa          	dc.w	-6
2819  0146 fffb          	dc.w	-5
2820  0148 fffb          	dc.w	-5
2821  014a fffc          	dc.w	-4
2822  014c fffc          	dc.w	-4
2823  014e fffc          	dc.w	-4
2824  0150 fffd          	dc.w	-3
2825  0152 fffd          	dc.w	-3
2826  0154 fffd          	dc.w	-3
2827  0156 fffe          	dc.w	-2
2828  0158 fffe          	dc.w	-2
2829  015a ffff          	dc.w	-1
2830  015c ffff          	dc.w	-1
2831  015e 0000          	dc.w	0
2832  0160 0000          	dc.w	0
2833  0162 0000          	dc.w	0
2834  0164 0001          	dc.w	1
2835  0166 0001          	dc.w	1
2836  0168 0002          	dc.w	2
2837  016a 0002          	dc.w	2
2838  016c 0003          	dc.w	3
2839  016e 0003          	dc.w	3
2840  0170 0004          	dc.w	4
2841  0172 0004          	dc.w	4
2842  0174 0005          	dc.w	5
2843  0176 0005          	dc.w	5
2844  0178 0006          	dc.w	6
2845  017a 0006          	dc.w	6
2846  017c 0007          	dc.w	7
2847  017e 0008          	dc.w	8
2848  0180 0008          	dc.w	8
2849  0182 0009          	dc.w	9
2850  0184 0009          	dc.w	9
2851  0186 000a          	dc.w	10
2852  0188 000a          	dc.w	10
2853  018a 000b          	dc.w	11
2854  018c 000c          	dc.w	12
2855  018e 000c          	dc.w	12
2856  0190 000d          	dc.w	13
2857  0192 000d          	dc.w	13
2858  0194 000e          	dc.w	14
2859  0196 000f          	dc.w	15
2860  0198 000f          	dc.w	15
2861  019a 0010          	dc.w	16
2862  019c 0011          	dc.w	17
2863  019e 0011          	dc.w	17
2864  01a0 0012          	dc.w	18
2865  01a2 0012          	dc.w	18
2866  01a4 0013          	dc.w	19
2867  01a6 0014          	dc.w	20
2868  01a8 0014          	dc.w	20
2869  01aa 0015          	dc.w	21
2870  01ac 0016          	dc.w	22
2871  01ae 0017          	dc.w	23
2872  01b0 0017          	dc.w	23
2873  01b2 0018          	dc.w	24
2874  01b4 0019          	dc.w	25
2875  01b6 0019          	dc.w	25
2876  01b8 001a          	dc.w	26
2877  01ba 001b          	dc.w	27
2878  01bc 001c          	dc.w	28
2879  01be 001c          	dc.w	28
2880  01c0 001d          	dc.w	29
2881  01c2 001e          	dc.w	30
2882  01c4 001f          	dc.w	31
2883  01c6 001f          	dc.w	31
2884  01c8 0020          	dc.w	32
2885  01ca 0021          	dc.w	33
2886  01cc 0022          	dc.w	34
2887  01ce 0022          	dc.w	34
2888  01d0 0023          	dc.w	35
2889  01d2 0024          	dc.w	36
2890  01d4 0025          	dc.w	37
2891  01d6 0025          	dc.w	37
2892  01d8 0026          	dc.w	38
2893  01da 0027          	dc.w	39
2894  01dc 0028          	dc.w	40
2895  01de 0029          	dc.w	41
2896  01e0 0029          	dc.w	41
2897  01e2 002a          	dc.w	42
2898  01e4 002b          	dc.w	43
2899  01e6 002c          	dc.w	44
2900  01e8 002d          	dc.w	45
2901  01ea 002d          	dc.w	45
2902  01ec 002e          	dc.w	46
2903  01ee 002f          	dc.w	47
2904  01f0 0030          	dc.w	48
2905  01f2 0031          	dc.w	49
2906  01f4 0031          	dc.w	49
2907  01f6 0032          	dc.w	50
2908  01f8 0033          	dc.w	51
2909  01fa 0034          	dc.w	52
2910  01fc 0035          	dc.w	53
2911  01fe 0036          	dc.w	54
2912  0200 0036          	dc.w	54
2913  0202 0037          	dc.w	55
2914  0204 0038          	dc.w	56
2915  0206 0039          	dc.w	57
2916  0208 003a          	dc.w	58
2917  020a 003b          	dc.w	59
2918  020c 003b          	dc.w	59
2919  020e 003c          	dc.w	60
2920  0210 003d          	dc.w	61
2921  0212 003e          	dc.w	62
2922  0214 003f          	dc.w	63
2923  0216 0040          	dc.w	64
2924  0218 0040          	dc.w	64
2925  021a 0041          	dc.w	65
2926  021c 0042          	dc.w	66
2927  021e 0043          	dc.w	67
2928  0220 0044          	dc.w	68
2929  0222 0045          	dc.w	69
2930  0224 0045          	dc.w	69
2931  0226 0046          	dc.w	70
2932  0228 0047          	dc.w	71
2933  022a 0048          	dc.w	72
2934  022c 0049          	dc.w	73
2935  022e 0049          	dc.w	73
2936  0230 004a          	dc.w	74
2937  0232 004b          	dc.w	75
2938  0234 004c          	dc.w	76
2939  0236 004d          	dc.w	77
2940  0238 004e          	dc.w	78
2941  023a 004e          	dc.w	78
2942  023c 004f          	dc.w	79
2943  023e 0050          	dc.w	80
2944  0240 0051          	dc.w	81
2945  0242 0052          	dc.w	82
2946  0244 0052          	dc.w	82
2947  0246 0053          	dc.w	83
2948  0248 0054          	dc.w	84
2949  024a 0055          	dc.w	85
2950  024c 0055          	dc.w	85
2951  024e 0056          	dc.w	86
2952  0250 0057          	dc.w	87
2953  0252 0058          	dc.w	88
2954  0254 0059          	dc.w	89
2955  0256 0059          	dc.w	89
2956  0258 005a          	dc.w	90
2957  025a 005b          	dc.w	91
2958  025c 005c          	dc.w	92
2959  025e 005c          	dc.w	92
2960  0260 005d          	dc.w	93
2961  0262 005e          	dc.w	94
2962  0264 005e          	dc.w	94
2963  0266 005f          	dc.w	95
2964  0268 0060          	dc.w	96
2965  026a 0061          	dc.w	97
2966  026c 0061          	dc.w	97
2967  026e 0062          	dc.w	98
2968  0270 0063          	dc.w	99
2969  0272 0063          	dc.w	99
2970  0274 0064          	dc.w	100
2971  0276 0065          	dc.w	101
2972  0278 0065          	dc.w	101
2973  027a 0066          	dc.w	102
2974  027c 0067          	dc.w	103
2975  027e 0067          	dc.w	103
2976  0280 0068          	dc.w	104
2977  0282 0069          	dc.w	105
2978  0284 0069          	dc.w	105
2979  0286 006a          	dc.w	106
2980  0288 006b          	dc.w	107
2981  028a 006b          	dc.w	107
2982  028c 006c          	dc.w	108
2983  028e 006c          	dc.w	108
2984  0290 006d          	dc.w	109
2985  0292 006e          	dc.w	110
2986  0294 006e          	dc.w	110
2987  0296 006f          	dc.w	111
2988  0298 006f          	dc.w	111
2989  029a 0070          	dc.w	112
2990  029c 0070          	dc.w	112
2991  029e 0071          	dc.w	113
2992  02a0 0071          	dc.w	113
2993  02a2 0072          	dc.w	114
2994  02a4 0072          	dc.w	114
2995  02a6 0073          	dc.w	115
2996  02a8 0073          	dc.w	115
2997  02aa 0074          	dc.w	116
2998  02ac 0074          	dc.w	116
2999  02ae 0075          	dc.w	117
3000  02b0 0075          	dc.w	117
3001  02b2 0076          	dc.w	118
3002  02b4 0076          	dc.w	118
3003  02b6 0077          	dc.w	119
3004  02b8 0077          	dc.w	119
3005  02ba 0077          	dc.w	119
3006  02bc 0078          	dc.w	120
3007  02be 0078          	dc.w	120
3008  02c0 0079          	dc.w	121
3009  02c2 0079          	dc.w	121
3010  02c4 0079          	dc.w	121
3011  02c6 007a          	dc.w	122
3012  02c8 007a          	dc.w	122
3013  02ca 007a          	dc.w	122
3014  02cc 007b          	dc.w	123
3015  02ce 007b          	dc.w	123
3016  02d0 007b          	dc.w	123
3017  02d2 007b          	dc.w	123
3018  02d4 007c          	dc.w	124
3019  02d6 007c          	dc.w	124
3020  02d8 007c          	dc.w	124
3021  02da 007c          	dc.w	124
3022  02dc 007d          	dc.w	125
3023  02de 007d          	dc.w	125
3024  02e0 007d          	dc.w	125
3025  02e2 007d          	dc.w	125
3026  02e4 007e          	dc.w	126
3027  02e6 007e          	dc.w	126
3028  02e8 007e          	dc.w	126
3029  02ea 007e          	dc.w	126
3030  02ec 007e          	dc.w	126
3031  02ee 007e          	dc.w	126
3032  02f0 007e          	dc.w	126
3033  02f2 007f          	dc.w	127
3034  02f4 007f          	dc.w	127
3035  02f6 007f          	dc.w	127
3036  02f8 007f          	dc.w	127
3037  02fa 007f          	dc.w	127
3038  02fc 007f          	dc.w	127
3039  02fe 007f          	dc.w	127
3040  0300 007f          	dc.w	127
3041  0302 007f          	dc.w	127
3042  0304 007f          	dc.w	127
3043  0306 007f          	dc.w	127
3044  0308 007f          	dc.w	127
3045  030a 007f          	dc.w	127
3046  030c 007f          	dc.w	127
3047  030e 007f          	dc.w	127
3048  0310 007f          	dc.w	127
3049  0312 007f          	dc.w	127
3050  0314 007f          	dc.w	127
3051  0316 007e          	dc.w	126
3052  0318 007e          	dc.w	126
3053  031a 007e          	dc.w	126
3054  031c 007e          	dc.w	126
3055  031e 007e          	dc.w	126
3056  0320 007e          	dc.w	126
3057  0322 007e          	dc.w	126
3058  0324 007d          	dc.w	125
3059  0326 007d          	dc.w	125
3060  0328 007d          	dc.w	125
3061  032a 007d          	dc.w	125
3062  032c 007c          	dc.w	124
3063  032e 007c          	dc.w	124
3064  0330 007c          	dc.w	124
3065  0332 007c          	dc.w	124
3066  0334 007b          	dc.w	123
3067  0336 007b          	dc.w	123
3068  0338 007b          	dc.w	123
3069  033a 007a          	dc.w	122
3070  033c 007a          	dc.w	122
3071  033e 007a          	dc.w	122
3072  0340 0079          	dc.w	121
3073  0342 0079          	dc.w	121
3074  0344 0079          	dc.w	121
3075  0346 0078          	dc.w	120
3076  0348 0078          	dc.w	120
3077  034a 0077          	dc.w	119
3078  034c 0077          	dc.w	119
3079  034e 0076          	dc.w	118
3080  0350 0076          	dc.w	118
3081  0352 0075          	dc.w	117
3082  0354 0075          	dc.w	117
3083  0356 0074          	dc.w	116
3084  0358 0074          	dc.w	116
3085  035a 0073          	dc.w	115
3086  035c 0073          	dc.w	115
3087  035e 0072          	dc.w	114
3088  0360 0072          	dc.w	114
3089  0362 0071          	dc.w	113
3090  0364 0071          	dc.w	113
3091  0366 0070          	dc.w	112
3092  0368 006f          	dc.w	111
3093  036a 006f          	dc.w	111
3094  036c 006e          	dc.w	110
3095  036e 006e          	dc.w	110
3096  0370 006d          	dc.w	109
3097  0372 006c          	dc.w	108
3098  0374 006c          	dc.w	108
3099  0376 006b          	dc.w	107
3100  0378 006a          	dc.w	106
3101  037a 006a          	dc.w	106
3102  037c 0069          	dc.w	105
3103  037e 0068          	dc.w	104
3104  0380 0067          	dc.w	103
3105  0382 0067          	dc.w	103
3106  0384 0066          	dc.w	102
3107  0386 0065          	dc.w	101
3108  0388 0064          	dc.w	100
3109  038a 0063          	dc.w	99
3110  038c 0063          	dc.w	99
3111  038e 0062          	dc.w	98
3112  0390 0061          	dc.w	97
3113  0392 0060          	dc.w	96
3114  0394 005f          	dc.w	95
3115  0396 005e          	dc.w	94
3116  0398 005e          	dc.w	94
3117  039a 005d          	dc.w	93
3118  039c 005c          	dc.w	92
3119  039e 005b          	dc.w	91
3120  03a0 005a          	dc.w	90
3121  03a2 0059          	dc.w	89
3122  03a4 0058          	dc.w	88
3123  03a6 0057          	dc.w	87
3124  03a8 0056          	dc.w	86
3125  03aa 0055          	dc.w	85
3126  03ac 0054          	dc.w	84
3127  03ae 0053          	dc.w	83
3128  03b0 0052          	dc.w	82
3129  03b2 0051          	dc.w	81
3130  03b4 0050          	dc.w	80
3131  03b6 004f          	dc.w	79
3132  03b8 004e          	dc.w	78
3133  03ba 004d          	dc.w	77
3134  03bc 004c          	dc.w	76
3135  03be 004b          	dc.w	75
3136  03c0 004a          	dc.w	74
3137  03c2 0049          	dc.w	73
3138  03c4 0048          	dc.w	72
3139  03c6 0047          	dc.w	71
3140  03c8 0046          	dc.w	70
3141  03ca 0045          	dc.w	69
3142  03cc 0044          	dc.w	68
3143  03ce 0043          	dc.w	67
3144  03d0 0042          	dc.w	66
3145  03d2 0040          	dc.w	64
3146  03d4 003f          	dc.w	63
3147  03d6 003e          	dc.w	62
3148  03d8 003d          	dc.w	61
3149  03da 003c          	dc.w	60
3150  03dc 003b          	dc.w	59
3151  03de 003a          	dc.w	58
3152  03e0 0038          	dc.w	56
3153  03e2 0037          	dc.w	55
3154  03e4 0036          	dc.w	54
3155  03e6 0035          	dc.w	53
3156  03e8 0034          	dc.w	52
3157  03ea 0032          	dc.w	50
3158  03ec 0031          	dc.w	49
3159  03ee 0030          	dc.w	48
3160  03f0 002f          	dc.w	47
3161  03f2 002e          	dc.w	46
3162  03f4 002c          	dc.w	44
3163  03f6 002b          	dc.w	43
3164  03f8 002a          	dc.w	42
3165  03fa 0029          	dc.w	41
3166  03fc 0027          	dc.w	39
3167  03fe 0026          	dc.w	38
3168  0400 0025          	dc.w	37
3169  0402 0024          	dc.w	36
3170  0404 0022          	dc.w	34
3171  0406 0021          	dc.w	33
3172  0408 0020          	dc.w	32
3173  040a 001f          	dc.w	31
3174  040c 001d          	dc.w	29
3175  040e 001c          	dc.w	28
3176  0410 001b          	dc.w	27
3177  0412 001a          	dc.w	26
3178  0414 0018          	dc.w	24
3179  0416 0017          	dc.w	23
3180  0418 0016          	dc.w	22
3181  041a 0014          	dc.w	20
3182  041c 0013          	dc.w	19
3183  041e 0012          	dc.w	18
3184  0420 0011          	dc.w	17
3185  0422 000f          	dc.w	15
3186  0424 000e          	dc.w	14
3187  0426 000d          	dc.w	13
3188  0428 000b          	dc.w	11
3189  042a 000a          	dc.w	10
3190  042c 0009          	dc.w	9
3191  042e 0007          	dc.w	7
3192  0430 0006          	dc.w	6
3193  0432 0005          	dc.w	5
3194  0434 0003          	dc.w	3
3195  0436 0002          	dc.w	2
3196  0438 0001          	dc.w	1
3197  043a 0000          	dc.w	0
3198  043c fffe          	dc.w	-2
3199  043e fffd          	dc.w	-3
3200  0440 fffc          	dc.w	-4
3201  0442 fffa          	dc.w	-6
3202  0444 fff9          	dc.w	-7
3203  0446 fff8          	dc.w	-8
3204  0448 fff6          	dc.w	-10
3205  044a fff5          	dc.w	-11
3206  044c fff4          	dc.w	-12
3207  044e fff2          	dc.w	-14
3208  0450 fff1          	dc.w	-15
3209  0452 fff0          	dc.w	-16
3210  0454 ffee          	dc.w	-18
3211  0456 ffed          	dc.w	-19
3212  0458 ffec          	dc.w	-20
3213  045a ffeb          	dc.w	-21
3214  045c ffe9          	dc.w	-23
3215  045e ffe8          	dc.w	-24
3216  0460 ffe7          	dc.w	-25
3217  0462 ffe5          	dc.w	-27
3218  0464 ffe4          	dc.w	-28
3219  0466 ffe3          	dc.w	-29
3220  0468 ffe2          	dc.w	-30
3221  046a ffe0          	dc.w	-32
3222  046c ffdf          	dc.w	-33
3223  046e ffde          	dc.w	-34
3224  0470 ffdd          	dc.w	-35
3225  0472 ffdb          	dc.w	-37
3226  0474 ffda          	dc.w	-38
3227  0476 ffd9          	dc.w	-39
3228  0478 ffd8          	dc.w	-40
3229  047a ffd6          	dc.w	-42
3230  047c ffd5          	dc.w	-43
3231  047e ffd4          	dc.w	-44
3232  0480 ffd3          	dc.w	-45
3233  0482 ffd1          	dc.w	-47
3234  0484 ffd0          	dc.w	-48
3235  0486 ffcf          	dc.w	-49
3236  0488 ffce          	dc.w	-50
3237  048a ffcd          	dc.w	-51
3238  048c ffcb          	dc.w	-53
3239  048e ffca          	dc.w	-54
3240  0490 ffc9          	dc.w	-55
3241  0492 ffc8          	dc.w	-56
3242  0494 ffc7          	dc.w	-57
3243  0496 ffc5          	dc.w	-59
3244  0498 ffc4          	dc.w	-60
3245  049a ffc3          	dc.w	-61
3246  049c ffc2          	dc.w	-62
3247  049e ffc1          	dc.w	-63
3248  04a0 ffc0          	dc.w	-64
3249  04a2 ffbf          	dc.w	-65
3250  04a4 ffbd          	dc.w	-67
3251  04a6 ffbc          	dc.w	-68
3252  04a8 ffbb          	dc.w	-69
3253  04aa ffba          	dc.w	-70
3254  04ac ffb9          	dc.w	-71
3255  04ae ffb8          	dc.w	-72
3256  04b0 ffb7          	dc.w	-73
3257  04b2 ffb6          	dc.w	-74
3258  04b4 ffb5          	dc.w	-75
3259  04b6 ffb4          	dc.w	-76
3260  04b8 ffb3          	dc.w	-77
3261  04ba ffb2          	dc.w	-78
3262  04bc ffb1          	dc.w	-79
3263  04be ffb0          	dc.w	-80
3264  04c0 ffaf          	dc.w	-81
3265  04c2 ffae          	dc.w	-82
3266  04c4 ffad          	dc.w	-83
3267  04c6 ffac          	dc.w	-84
3268  04c8 ffab          	dc.w	-85
3269  04ca ffaa          	dc.w	-86
3270  04cc ffa9          	dc.w	-87
3271  04ce ffa8          	dc.w	-88
3272  04d0 ffa7          	dc.w	-89
3273  04d2 ffa6          	dc.w	-90
3274  04d4 ffa5          	dc.w	-91
3275  04d6 ffa4          	dc.w	-92
3276  04d8 ffa3          	dc.w	-93
3277  04da ffa2          	dc.w	-94
3278  04dc ffa1          	dc.w	-95
3279  04de ffa1          	dc.w	-95
3280  04e0 ffa0          	dc.w	-96
3281  04e2 ff9f          	dc.w	-97
3282  04e4 ff9e          	dc.w	-98
3283  04e6 ff9d          	dc.w	-99
3284  04e8 ff9c          	dc.w	-100
3285  04ea ff9c          	dc.w	-100
3286  04ec ff9b          	dc.w	-101
3287  04ee ff9a          	dc.w	-102
3288  04f0 ff99          	dc.w	-103
3289  04f2 ff98          	dc.w	-104
3290  04f4 ff98          	dc.w	-104
3291  04f6 ff97          	dc.w	-105
3292  04f8 ff96          	dc.w	-106
3293  04fa ff95          	dc.w	-107
3294  04fc ff95          	dc.w	-107
3295  04fe ff94          	dc.w	-108
3296  0500 ff93          	dc.w	-109
3297  0502 ff93          	dc.w	-109
3298  0504 ff92          	dc.w	-110
3299  0506 ff91          	dc.w	-111
3300  0508 ff91          	dc.w	-111
3301  050a ff90          	dc.w	-112
3302  050c ff90          	dc.w	-112
3303  050e ff8f          	dc.w	-113
3304  0510 ff8e          	dc.w	-114
3305  0512 ff8e          	dc.w	-114
3306  0514 ff8d          	dc.w	-115
3307  0516 ff8d          	dc.w	-115
3308  0518 ff8c          	dc.w	-116
3309  051a ff8c          	dc.w	-116
3310  051c ff8b          	dc.w	-117
3311  051e ff8b          	dc.w	-117
3312  0520 ff8a          	dc.w	-118
3313  0522 ff8a          	dc.w	-118
3314  0524 ff89          	dc.w	-119
3315  0526 ff89          	dc.w	-119
3316  0528 ff88          	dc.w	-120
3317  052a ff88          	dc.w	-120
3318  052c ff87          	dc.w	-121
3319  052e ff87          	dc.w	-121
3320  0530 ff86          	dc.w	-122
3321  0532 ff86          	dc.w	-122
3322  0534 ff86          	dc.w	-122
3323  0536 ff85          	dc.w	-123
3324  0538 ff85          	dc.w	-123
3325  053a ff85          	dc.w	-123
3326  053c ff84          	dc.w	-124
3327  053e ff84          	dc.w	-124
3328  0540 ff84          	dc.w	-124
3329  0542 ff83          	dc.w	-125
3330  0544 ff83          	dc.w	-125
3331  0546 ff83          	dc.w	-125
3332  0548 ff83          	dc.w	-125
3333  054a ff82          	dc.w	-126
3334  054c ff82          	dc.w	-126
3335  054e ff82          	dc.w	-126
3336  0550 ff82          	dc.w	-126
3337  0552 ff81          	dc.w	-127
3338  0554 ff81          	dc.w	-127
3339  0556 ff81          	dc.w	-127
3340  0558 ff81          	dc.w	-127
3341  055a ff81          	dc.w	-127
3342  055c ff81          	dc.w	-127
3343  055e ff81          	dc.w	-127
3344  0560 ff80          	dc.w	-128
3345  0562 ff80          	dc.w	-128
3346  0564 ff80          	dc.w	-128
3347  0566 ff80          	dc.w	-128
3348  0568 ff80          	dc.w	-128
3349  056a ff80          	dc.w	-128
3350  056c ff80          	dc.w	-128
3351  056e ff80          	dc.w	-128
3352  0570 ff80          	dc.w	-128
3353  0572 ff80          	dc.w	-128
3354  0574 ff80          	dc.w	-128
3355  0576 ff80          	dc.w	-128
3356  0578 ff80          	dc.w	-128
3357  057a ff80          	dc.w	-128
3358  057c ff80          	dc.w	-128
3359  057e ff80          	dc.w	-128
3360  0580 ff80          	dc.w	-128
3361  0582 ff80          	dc.w	-128
3362  0584 ff81          	dc.w	-127
3363  0586 ff81          	dc.w	-127
3364  0588 ff81          	dc.w	-127
3365  058a ff81          	dc.w	-127
3366  058c ff81          	dc.w	-127
3367  058e ff81          	dc.w	-127
3368  0590 ff81          	dc.w	-127
3369  0592 ff82          	dc.w	-126
3370  0594 ff82          	dc.w	-126
3371  0596 ff82          	dc.w	-126
3372  0598 ff82          	dc.w	-126
3373  059a ff83          	dc.w	-125
3374  059c ff83          	dc.w	-125
3375  059e ff83          	dc.w	-125
3376  05a0 ff83          	dc.w	-125
3377  05a2 ff84          	dc.w	-124
3378  05a4 ff84          	dc.w	-124
3379  05a6 ff84          	dc.w	-124
3380  05a8 ff84          	dc.w	-124
3381  05aa ff85          	dc.w	-123
3382  05ac ff85          	dc.w	-123
3383  05ae ff85          	dc.w	-123
3384  05b0 ff86          	dc.w	-122
3385  05b2 ff86          	dc.w	-122
3386  05b4 ff86          	dc.w	-122
3387  05b6 ff87          	dc.w	-121
3388  05b8 ff87          	dc.w	-121
3389  05ba ff88          	dc.w	-120
3390  05bc ff88          	dc.w	-120
3391  05be ff88          	dc.w	-120
3392  05c0 ff89          	dc.w	-119
3393  05c2 ff89          	dc.w	-119
3394  05c4 ff8a          	dc.w	-118
3395  05c6 ff8a          	dc.w	-118
3396  05c8 ff8b          	dc.w	-117
3397  05ca ff8b          	dc.w	-117
3398  05cc ff8c          	dc.w	-116
3399  05ce ff8c          	dc.w	-116
3400  05d0 ff8d          	dc.w	-115
3401  05d2 ff8d          	dc.w	-115
3402  05d4 ff8e          	dc.w	-114
3403  05d6 ff8e          	dc.w	-114
3404  05d8 ff8f          	dc.w	-113
3405  05da ff8f          	dc.w	-113
3406  05dc ff90          	dc.w	-112
3407  05de ff90          	dc.w	-112
3408  05e0 ff91          	dc.w	-111
3409  05e2 ff91          	dc.w	-111
3410  05e4 ff92          	dc.w	-110
3411  05e6 ff93          	dc.w	-109
3412  05e8 ff93          	dc.w	-109
3413  05ea ff94          	dc.w	-108
3414  05ec ff94          	dc.w	-108
3415  05ee ff95          	dc.w	-107
3416  05f0 ff96          	dc.w	-106
3417  05f2 ff96          	dc.w	-106
3418  05f4 ff97          	dc.w	-105
3419  05f6 ff98          	dc.w	-104
3420  05f8 ff98          	dc.w	-104
3421  05fa ff99          	dc.w	-103
3422  05fc ff9a          	dc.w	-102
3423  05fe ff9a          	dc.w	-102
3424  0600 ff9b          	dc.w	-101
3425  0602 ff9c          	dc.w	-100
3426  0604 ff9c          	dc.w	-100
3427  0606 ff9d          	dc.w	-99
3428  0608 ff9e          	dc.w	-98
3429  060a ff9e          	dc.w	-98
3430  060c ff9f          	dc.w	-97
3431  060e ffa0          	dc.w	-96
3432  0610 ffa1          	dc.w	-95
3433  0612 ffa1          	dc.w	-95
3434  0614 ffa2          	dc.w	-94
3435  0616 ffa3          	dc.w	-93
3436  0618 ffa3          	dc.w	-93
3437  061a ffa4          	dc.w	-92
3438  061c ffa5          	dc.w	-91
3439  061e ffa6          	dc.w	-90
3440  0620 ffa6          	dc.w	-90
3441  0622 ffa7          	dc.w	-89
3442  0624 ffa8          	dc.w	-88
3443  0626 ffa9          	dc.w	-87
3444  0628 ffaa          	dc.w	-86
3445  062a ffaa          	dc.w	-86
3446  062c ffab          	dc.w	-85
3447  062e ffac          	dc.w	-84
3448  0630 ffad          	dc.w	-83
3449  0632 ffad          	dc.w	-83
3450  0634 ffae          	dc.w	-82
3451  0636 ffaf          	dc.w	-81
3452  0638 ffb0          	dc.w	-80
3453  063a ffb1          	dc.w	-79
3454  063c ffb1          	dc.w	-79
3455  063e ffb2          	dc.w	-78
3456  0640 ffb3          	dc.w	-77
3457  0642 ffb4          	dc.w	-76
3458  0644 ffb5          	dc.w	-75
3459  0646 ffb6          	dc.w	-74
3460  0648 ffb6          	dc.w	-74
3461  064a ffb7          	dc.w	-73
3462  064c ffb8          	dc.w	-72
3463  064e ffb9          	dc.w	-71
3464  0650 ffba          	dc.w	-70
3465  0652 ffba          	dc.w	-70
3466  0654 ffbb          	dc.w	-69
3467  0656 ffbc          	dc.w	-68
3468  0658 ffbd          	dc.w	-67
3469  065a ffbe          	dc.w	-66
3470  065c ffbf          	dc.w	-65
3471  065e ffbf          	dc.w	-65
3472  0660 ffc0          	dc.w	-64
3473  0662 ffc1          	dc.w	-63
3474  0664 ffc2          	dc.w	-62
3475  0666 ffc3          	dc.w	-61
3476  0668 ffc4          	dc.w	-60
3477  066a ffc4          	dc.w	-60
3478  066c ffc5          	dc.w	-59
3479  066e ffc6          	dc.w	-58
3480  0670 ffc7          	dc.w	-57
3481  0672 ffc8          	dc.w	-56
3482  0674 ffc9          	dc.w	-55
3483  0676 ffc9          	dc.w	-55
3484  0678 ffca          	dc.w	-54
3485  067a ffcb          	dc.w	-53
3486  067c ffcc          	dc.w	-52
3487  067e ffcd          	dc.w	-51
3488  0680 ffce          	dc.w	-50
3489  0682 ffce          	dc.w	-50
3490  0684 ffcf          	dc.w	-49
3491  0686 ffd0          	dc.w	-48
3492  0688 ffd1          	dc.w	-47
3493  068a ffd2          	dc.w	-46
3494  068c ffd2          	dc.w	-46
3495  068e ffd3          	dc.w	-45
3496  0690 ffd4          	dc.w	-44
3497  0692 ffd5          	dc.w	-43
3498  0694 ffd6          	dc.w	-42
3499  0696 ffd6          	dc.w	-42
3500  0698 ffd7          	dc.w	-41
3501  069a ffd8          	dc.w	-40
3502  069c ffd9          	dc.w	-39
3503  069e ffda          	dc.w	-38
3504  06a0 ffda          	dc.w	-38
3505  06a2 ffdb          	dc.w	-37
3506  06a4 ffdc          	dc.w	-36
3507  06a6 ffdd          	dc.w	-35
3508  06a8 ffdd          	dc.w	-35
3509  06aa ffde          	dc.w	-34
3510  06ac ffdf          	dc.w	-33
3511  06ae ffe0          	dc.w	-32
3512  06b0 ffe0          	dc.w	-32
3513  06b2 ffe1          	dc.w	-31
3514  06b4 ffe2          	dc.w	-30
3515  06b6 ffe3          	dc.w	-29
3516  06b8 ffe3          	dc.w	-29
3517  06ba ffe4          	dc.w	-28
3518  06bc ffe5          	dc.w	-27
3519  06be ffe6          	dc.w	-26
3520  06c0 ffe6          	dc.w	-26
3521  06c2 ffe7          	dc.w	-25
3522  06c4 ffe8          	dc.w	-24
3523  06c6 ffe8          	dc.w	-24
3524  06c8 ffe9          	dc.w	-23
3525  06ca ffea          	dc.w	-22
3526  06cc ffeb          	dc.w	-21
3527  06ce ffeb          	dc.w	-21
3528  06d0 ffec          	dc.w	-20
3529  06d2 ffed          	dc.w	-19
3530  06d4 ffed          	dc.w	-19
3531  06d6 ffee          	dc.w	-18
3532  06d8 ffee          	dc.w	-18
3533  06da ffef          	dc.w	-17
3534  06dc fff0          	dc.w	-16
3535  06de fff0          	dc.w	-16
3536  06e0 fff1          	dc.w	-15
3537  06e2 fff2          	dc.w	-14
3538  06e4 fff2          	dc.w	-14
3539  06e6 fff3          	dc.w	-13
3540  06e8 fff3          	dc.w	-13
3541  06ea fff4          	dc.w	-12
3542  06ec fff5          	dc.w	-11
3543  06ee fff5          	dc.w	-11
3544  06f0 fff6          	dc.w	-10
3545  06f2 fff6          	dc.w	-10
3546  06f4 fff7          	dc.w	-9
3547  06f6 fff7          	dc.w	-9
3548  06f8 fff8          	dc.w	-8
3549  06fa fff9          	dc.w	-7
3550  06fc fff9          	dc.w	-7
3551  06fe fffa          	dc.w	-6
3552  0700 fffa          	dc.w	-6
3553  0702 fffb          	dc.w	-5
3554  0704 fffb          	dc.w	-5
3555  0706 fffc          	dc.w	-4
3556  0708 fffc          	dc.w	-4
3557  070a fffd          	dc.w	-3
3558  070c fffd          	dc.w	-3
3559  070e fffe          	dc.w	-2
3560  0710 fffe          	dc.w	-2
3561  0712 ffff          	dc.w	-1
3562  0714 ffff          	dc.w	-1
3563  0716 ffff          	dc.w	-1
3564  0718 0000          	dc.w	0
3565  071a 0000          	dc.w	0
3566  071c 0001          	dc.w	1
3567  071e 0001          	dc.w	1
3568  0720 0002          	dc.w	2
3569  0722 0002          	dc.w	2
3570  0724 0002          	dc.w	2
3571  0726 0003          	dc.w	3
3572  0728 0003          	dc.w	3
3573  072a 0003          	dc.w	3
3574  072c 0004          	dc.w	4
3575  072e 0004          	dc.w	4
3576  0730 0005          	dc.w	5
3577  0732 0005          	dc.w	5
3578  0734 0005          	dc.w	5
3579  0736 0005          	dc.w	5
3580  0738 0006          	dc.w	6
3581  073a 0006          	dc.w	6
3582  073c 0006          	dc.w	6
3583  073e 0007          	dc.w	7
3584  0740 0007          	dc.w	7
3585  0742 0007          	dc.w	7
3586  0744 0008          	dc.w	8
3587  0746 0008          	dc.w	8
3588  0748 0008          	dc.w	8
3589  074a 0008          	dc.w	8
3590  074c 0009          	dc.w	9
3591  074e 0009          	dc.w	9
3592  0750 0009          	dc.w	9
3593  0752 0009          	dc.w	9
3594  0754 0009          	dc.w	9
3595  0756 000a          	dc.w	10
3596  0758 000a          	dc.w	10
3597  075a 000a          	dc.w	10
3598  075c 000a          	dc.w	10
3599  075e 000a          	dc.w	10
3600  0760 000b          	dc.w	11
3601  0762 000b          	dc.w	11
3602  0764 000b          	dc.w	11
3603  0766 000b          	dc.w	11
3604  0768 000b          	dc.w	11
3605  076a 000b          	dc.w	11
3606  076c 000b          	dc.w	11
3607  076e 000b          	dc.w	11
3608  0770 000c          	dc.w	12
3609  0772 000c          	dc.w	12
3610  0774 000c          	dc.w	12
3611  0776 000c          	dc.w	12
3612  0778 000c          	dc.w	12
3613  077a 000c          	dc.w	12
3614  077c 000c          	dc.w	12
3615  077e 000c          	dc.w	12
3616  0780 000c          	dc.w	12
3617  0782 000c          	dc.w	12
3618  0784 000c          	dc.w	12
3619  0786 000c          	dc.w	12
3620  0788 000c          	dc.w	12
3621  078a 000c          	dc.w	12
3622  078c 000c          	dc.w	12
3623  078e 000c          	dc.w	12
3624  0790 000c          	dc.w	12
3625  0792 000c          	dc.w	12
3626  0794 000c          	dc.w	12
3627  0796 000c          	dc.w	12
3628  0798 000c          	dc.w	12
3629  079a 000c          	dc.w	12
3630  079c 000c          	dc.w	12
3631  079e 000c          	dc.w	12
3632  07a0 000c          	dc.w	12
3633  07a2 000c          	dc.w	12
3634  07a4 000c          	dc.w	12
3635  07a6 000c          	dc.w	12
3636  07a8 000c          	dc.w	12
3637  07aa 000c          	dc.w	12
3638  07ac 000c          	dc.w	12
3639  07ae 000b          	dc.w	11
3640  07b0 000b          	dc.w	11
3641  07b2 000b          	dc.w	11
3642  07b4 000b          	dc.w	11
3643  07b6 000b          	dc.w	11
3644  07b8 000b          	dc.w	11
3645  07ba 000b          	dc.w	11
3646  07bc 000b          	dc.w	11
3647  07be 000b          	dc.w	11
3648  07c0 000a          	dc.w	10
3649  07c2 000a          	dc.w	10
3650  07c4 000a          	dc.w	10
3651  07c6 000a          	dc.w	10
3652  07c8 000a          	dc.w	10
3653  07ca 000a          	dc.w	10
3654  07cc 0009          	dc.w	9
3655  07ce 0009          	dc.w	9
3656  07d0 0009          	dc.w	9
3657  07d2 0009          	dc.w	9
3658  07d4 0009          	dc.w	9
3659  07d6 0009          	dc.w	9
3660  07d8 0008          	dc.w	8
3661  07da 0008          	dc.w	8
3662  07dc 0008          	dc.w	8
3663  07de 0008          	dc.w	8
3664  07e0 0008          	dc.w	8
3665  07e2 0007          	dc.w	7
3666  07e4 0007          	dc.w	7
3667  07e6 0007          	dc.w	7
3668  07e8 0007          	dc.w	7
3669  07ea 0006          	dc.w	6
3670  07ec 0006          	dc.w	6
3671  07ee 0006          	dc.w	6
3672  07f0 0006          	dc.w	6
3673  07f2 0006          	dc.w	6
3674  07f4 0005          	dc.w	5
3675  07f6 0005          	dc.w	5
3676  07f8 0005          	dc.w	5
3677  07fa 0005          	dc.w	5
3678  07fc 0004          	dc.w	4
3679  07fe 0004          	dc.w	4
3680  0800 0004          	dc.w	4
3681  0802 0004          	dc.w	4
3682  0804 0003          	dc.w	3
3683  0806 0003          	dc.w	3
3684  0808 0003          	dc.w	3
3685  080a 0003          	dc.w	3
3686  080c 0002          	dc.w	2
3687  080e 0002          	dc.w	2
3688  0810 0002          	dc.w	2
3689  0812 0002          	dc.w	2
3690  0814 0001          	dc.w	1
3691  0816 0001          	dc.w	1
3692  0818 0001          	dc.w	1
3693  081a 0001          	dc.w	1
3694  081c 0000          	dc.w	0
3695  081e 0000          	dc.w	0
3696  0820 0000          	dc.w	0
3697                     	bsct
3698  0016               _j:
3699  0016 00            	dc.b	0
3767                     ; 46 main()
3767                     ; 47 {	
3769                     	switch	.text
3770  0000               _main:
3774                     ; 48 	CLK_CKDIVR &= ~(0b11111);
3776  0000 c650c6        	ld	a,_CLK_CKDIVR
3777  0003 a4e0          	and	a,#224
3778  0005 c750c6        	ld	_CLK_CKDIVR,a
3779                     ; 49 	k = 4;
3781  0008 3504000a      	mov	_k,#4
3782                     ; 50 	cpt_moy = (tab_cpt_moy[0]+tab_cpt_moy[1]+tab_cpt_moy[2]+tab_cpt_moy[3]+tab_cpt_moy[4]+tab_cpt_moy[5]+tab_cpt_moy[6]+tab_cpt_moy[7])/8;  
3784  000c be06          	ldw	x,_tab_cpt_moy
3785  000e 72bb0008      	addw	x,_tab_cpt_moy+2
3786  0012 72bb000a      	addw	x,_tab_cpt_moy+4
3787  0016 72bb000c      	addw	x,_tab_cpt_moy+6
3788  001a 72bb000e      	addw	x,_tab_cpt_moy+8
3789  001e 72bb0010      	addw	x,_tab_cpt_moy+10
3790  0022 72bb0012      	addw	x,_tab_cpt_moy+12
3791  0026 72bb0014      	addw	x,_tab_cpt_moy+14
3792  002a 54            	srlw	x
3793  002b 54            	srlw	x
3794  002c 54            	srlw	x
3795  002d bf04          	ldw	_cpt_moy,x
3796                     ; 52 	etat=1; // etat mise à 1 au reset
3798  002f 35010001      	mov	_etat,#1
3799                     ; 55 	init_SPI();
3801  0033 cd0000        	call	_init_SPI
3803                     ; 56 	init_TFT();
3805  0036 cd0000        	call	_init_TFT
3807                     ; 57 	init_Poussoirs();
3809  0039 cd0000        	call	_init_Poussoirs
3811                     ; 58 	init_LED();
3813  003c cd0000        	call	_init_LED
3815                     ; 59 	init_ADC();
3817  003f cd0000        	call	_init_ADC
3819                     ; 61 	init_timer1_2ms();
3821  0042 cd0000        	call	_init_timer1_2ms
3823                     ; 62 	init_timer2_pwm();
3825  0045 cd0000        	call	_init_timer2_pwm
3827                     ; 63 	init_UART2(57600);
3829  0048 aee100        	ldw	x,#57600
3830  004b cd0000        	call	_init_UART2
3832                     ; 65 	Init_I2C_Master();
3834  004e cd0000        	call	_Init_I2C_Master
3836                     ; 68 	affiche_mot(Mesure, 28.5, 10);
3838  0051 4b0a          	push	#10
3839  0053 4b1c          	push	#28
3840  0055 ae0000        	ldw	x,#L3261_Mesure
3841  0058 cd0000        	call	_affiche_mot
3843  005b 85            	popw	x
3844                     ; 69 	affiche_mot(Bpm, 1.4, 50);
3846  005c 4b32          	push	#50
3847  005e 4b01          	push	#1
3848  0060 ae000c        	ldw	x,#L7261_Bpm
3849  0063 cd0000        	call	_affiche_mot
3851  0066 85            	popw	x
3852                     ; 70 	affiche_mot(Seuil_bas, 1.7, 70);
3854  0067 4b46          	push	#70
3855  0069 4b01          	push	#1
3856  006b ae0011        	ldw	x,#L1361_Seuil_bas
3857  006e cd0000        	call	_affiche_mot
3859  0071 85            	popw	x
3860                     ; 71 	affiche_mot(Seuil_haut, 1.1, 90);
3862  0072 4b5a          	push	#90
3863  0074 4b01          	push	#1
3864  0076 ae0019        	ldw	x,#L3361_Seuil_haut
3865  0079 cd0000        	call	_affiche_mot
3867  007c 85            	popw	x
3868                     ; 72 	affiche_mot(Puis,1.13, 110);
3870  007d 4b6e          	push	#110
3871  007f 4b01          	push	#1
3872  0081 ae0022        	ldw	x,#L5361_Puis
3873  0084 cd0000        	call	_affiche_mot
3875  0087 85            	popw	x
3876                     ; 74 	affiche_nombre(sal_bas, 80, 70);
3878  0088 4b46          	push	#70
3879  008a 4b50          	push	#80
3880  008c b600          	ld	a,_sal_bas
3881  008e 5f            	clrw	x
3882  008f 97            	ld	xl,a
3883  0090 cd0000        	call	_affiche_nombre
3885  0093 85            	popw	x
3886                     ; 75 	affiche_nombre(sal_haut, 90, 90);
3888  0094 4b5a          	push	#90
3889  0096 4b5a          	push	#90
3890  0098 b601          	ld	a,_sal_haut
3891  009a 5f            	clrw	x
3892  009b 97            	ld	xl,a
3893  009c cd0000        	call	_affiche_nombre
3895  009f 85            	popw	x
3896                     ; 76 	affiche_nombre(30000/cpt_moy, (sizeof(Bpm)-1)*11+1.4, 50);
3898  00a0 4b32          	push	#50
3899  00a2 4b2d          	push	#45
3900  00a4 ae7530        	ldw	x,#30000
3901  00a7 90be04        	ldw	y,_cpt_moy
3902  00aa 65            	divw	x,y
3903  00ab cd0000        	call	_affiche_nombre
3905  00ae 85            	popw	x
3906                     ; 78 	EnableGeneralInterrupt(); 
3909  00af 9a            RIM
3911                     ; 79 	ADC_CR1 |= 0x01;
3913  00b0 72105401      	bset	_ADC_CR1,#0
3914  00b4               L5671:
3915                     ; 85 	if(int_2ms_ok == 1)
3917  00b4 b603          	ld	a,_int_2ms_ok
3918  00b6 a101          	cp	a,#1
3919  00b8 2703          	jreq	L6
3920  00ba cc01a9        	jp	L1771
3921  00bd               L6:
3922                     ; 88 	ac_cap = read_AD7991(0b00011000);
3924  00bd a618          	ld	a,#24
3925  00bf cd0000        	call	_read_AD7991
3927  00c2 bf02          	ldw	_ac_cap,x
3928                     ; 89 	dc_cap = read_AD7991(0b00101000);
3930  00c4 a628          	ld	a,#40
3931  00c6 cd0000        	call	_read_AD7991
3933  00c9 bf04          	ldw	_dc_cap,x
3934                     ; 92 	write_byte_UART2(ac_cap>>8);
3936  00cb b602          	ld	a,_ac_cap
3937  00cd cd0000        	call	_write_byte_UART2
3939                     ; 93 	write_byte_UART2(0b10000|(ac_cap&0x0F0)>>4);
3941  00d0 b603          	ld	a,_ac_cap+1
3942  00d2 a4f0          	and	a,#240
3943  00d4 4e            	swap	a
3944  00d5 a40f          	and	a,#15
3945  00d7 aa10          	or	a,#16
3946  00d9 cd0000        	call	_write_byte_UART2
3948                     ; 94 	write_byte_UART2(0b100000|(ac_cap&0x00F));
3950  00dc b603          	ld	a,_ac_cap+1
3951  00de a40f          	and	a,#15
3952  00e0 aa20          	or	a,#32
3953  00e2 cd0000        	call	_write_byte_UART2
3955                     ; 95 	write_byte_UART2((dc_cap>>8)|(1<<7));
3957  00e5 b604          	ld	a,_dc_cap
3958  00e7 aa80          	or	a,#128
3959  00e9 cd0000        	call	_write_byte_UART2
3961                     ; 96 	write_byte_UART2(0b10010000|(dc_cap&0x0F0)>>4);
3963  00ec b605          	ld	a,_dc_cap+1
3964  00ee a4f0          	and	a,#240
3965  00f0 4e            	swap	a
3966  00f1 a40f          	and	a,#15
3967  00f3 aa90          	or	a,#144
3968  00f5 cd0000        	call	_write_byte_UART2
3970                     ; 97 	write_byte_UART2(0b10100000|(dc_cap&0x00F));
3972  00f8 b605          	ld	a,_dc_cap+1
3973  00fa a40f          	and	a,#15
3974  00fc aaa0          	or	a,#160
3975  00fe cd0000        	call	_write_byte_UART2
3977                     ; 99 	int_2ms_ok = 0;
3979  0101 3f03          	clr	_int_2ms_ok
3980                     ; 102 	switch (etat) {
3982  0103 b601          	ld	a,_etat
3984                     ; 137 	default: break;
3985  0105 4a            	dec	a
3986  0106 270c          	jreq	L5371
3987  0108 4a            	dec	a
3988  0109 2717          	jreq	L7371
3989  010b 4a            	dec	a
3990  010c 272a          	jreq	L1471
3991  010e 4a            	dec	a
3992  010f 273e          	jreq	L3471
3993  0111 cc01a9        	jra	L1771
3994  0114               L5371:
3995                     ; 103 	case 1:
3995                     ; 104 		if (ac_cap>2148)
3997  0114 be02          	ldw	x,_ac_cap
3998  0116 a30865        	cpw	x,#2149
3999  0119 25f6          	jrult	L1771
4000                     ; 105 			etat=2;
4002  011b 35020001      	mov	_etat,#2
4003  011f cc01a9        	jra	L1771
4004  0122               L7371:
4005                     ; 107 	case 2:
4005                     ; 108 		if (ac_cap<1948)
4007  0122 be02          	ldw	x,_ac_cap
4008  0124 a3079c        	cpw	x,#1948
4009  0127 24f6          	jruge	L1771
4010                     ; 110 		etat=3;
4012  0129 35030001      	mov	_etat,#3
4013                     ; 111 		cpt_ech=0;
4015  012d 5f            	clrw	x
4016  012e bf06          	ldw	_cpt_ech,x
4017                     ; 112 		PB_ODR = PB_ODR|(1<<0);
4019  0130 72105005      	bset	_PB_ODR,#0
4020                     ; 113 		j = 0;
4022  0134 3f16          	clr	_j
4023  0136 2071          	jra	L1771
4024  0138               L1471:
4025                     ; 116 	case 3:
4025                     ; 117 		if(j==50)
4027  0138 b616          	ld	a,_j
4028  013a a132          	cp	a,#50
4029  013c 2604          	jrne	L3002
4030                     ; 118 			PB_ODR = PB_ODR&~(1<<0);
4032  013e 72115005      	bres	_PB_ODR,#0
4033  0142               L3002:
4034                     ; 119 		if	(ac_cap>2148)
4036  0142 be02          	ldw	x,_ac_cap
4037  0144 a30865        	cpw	x,#2149
4038  0147 2560          	jrult	L1771
4039                     ; 120 			etat=4;
4041  0149 35040001      	mov	_etat,#4
4042  014d 205a          	jra	L1771
4043  014f               L3471:
4044                     ; 122 	case 4:
4044                     ; 123 		if(ac_cap<1948)
4046  014f be02          	ldw	x,_ac_cap
4047  0151 a3079c        	cpw	x,#1948
4048  0154 2453          	jruge	L1771
4049                     ; 125 		etat=3;
4051  0156 35030001      	mov	_etat,#3
4052                     ; 126 		PB_ODR = PB_ODR|(1<<0);
4054  015a 72105005      	bset	_PB_ODR,#0
4055                     ; 127 		j = 0;
4057  015e 3f16          	clr	_j
4058                     ; 128 		tab_cpt_moy[i] = cpt_ech;
4060  0160 b600          	ld	a,_i
4061  0162 5f            	clrw	x
4062  0163 97            	ld	xl,a
4063  0164 58            	sllw	x
4064  0165 90be06        	ldw	y,_cpt_ech
4065  0168 ef06          	ldw	(_tab_cpt_moy,x),y
4066                     ; 129 		cpt_ech=0;
4068  016a 5f            	clrw	x
4069  016b bf06          	ldw	_cpt_ech,x
4070                     ; 130 		i ++;
4072  016d 3c00          	inc	_i
4073                     ; 131 		if(i==8)
4075  016f b600          	ld	a,_i
4076  0171 a108          	cp	a,#8
4077  0173 2602          	jrne	L1102
4078                     ; 132 			i = 0;
4080  0175 3f00          	clr	_i
4081  0177               L1102:
4082                     ; 133 		cpt_moy = (tab_cpt_moy[0]+tab_cpt_moy[1]+tab_cpt_moy[2]+tab_cpt_moy[3]+tab_cpt_moy[4]+tab_cpt_moy[5]+tab_cpt_moy[6]+tab_cpt_moy[7])/8;  
4084  0177 be06          	ldw	x,_tab_cpt_moy
4085  0179 72bb0008      	addw	x,_tab_cpt_moy+2
4086  017d 72bb000a      	addw	x,_tab_cpt_moy+4
4087  0181 72bb000c      	addw	x,_tab_cpt_moy+6
4088  0185 72bb000e      	addw	x,_tab_cpt_moy+8
4089  0189 72bb0010      	addw	x,_tab_cpt_moy+10
4090  018d 72bb0012      	addw	x,_tab_cpt_moy+12
4091  0191 72bb0014      	addw	x,_tab_cpt_moy+14
4092  0195 54            	srlw	x
4093  0196 54            	srlw	x
4094  0197 54            	srlw	x
4095  0198 bf04          	ldw	_cpt_moy,x
4096                     ; 134 		affiche_nombre(30000/cpt_moy, (sizeof(Bpm)-1)*11+1.4, 50);
4098  019a 4b32          	push	#50
4099  019c 4b2d          	push	#45
4100  019e ae7530        	ldw	x,#30000
4101  01a1 90be04        	ldw	y,_cpt_moy
4102  01a4 65            	divw	x,y
4103  01a5 cd0000        	call	_affiche_nombre
4105  01a8 85            	popw	x
4106  01a9               L5471:
4107                     ; 137 	default: break;
4109  01a9               L5771:
4110  01a9               L1771:
4111                     ; 143 	if(cpt_ech > 1000)
4113  01a9 be06          	ldw	x,_cpt_ech
4114  01ab a303e9        	cpw	x,#1001
4115  01ae 250f          	jrult	L3102
4116                     ; 145 		affiche_nombre(888, (sizeof(Bpm)-1)*11+1.4, 50);
4118  01b0 4b32          	push	#50
4119  01b2 4b2d          	push	#45
4120  01b4 ae0378        	ldw	x,#888
4121  01b7 cd0000        	call	_affiche_nombre
4123  01ba 85            	popw	x
4124                     ; 146 		etat = 2;
4126  01bb 35020001      	mov	_etat,#2
4127  01bf               L3102:
4128                     ; 152 	if((30000/cpt_moy <= sal_bas)||(30000/cpt_moy>=sal_haut))
4130  01bf ae7530        	ldw	x,#30000
4131  01c2 90be04        	ldw	y,_cpt_moy
4132  01c5 65            	divw	x,y
4133  01c6 b600          	ld	a,_sal_bas
4134  01c8 905f          	clrw	y
4135  01ca 9097          	ld	yl,a
4136  01cc 90bf00        	ldw	c_y,y
4137  01cf b300          	cpw	x,c_y
4138  01d1 2314          	jrule	L7102
4140  01d3 ae7530        	ldw	x,#30000
4141  01d6 90be04        	ldw	y,_cpt_moy
4142  01d9 65            	divw	x,y
4143  01da b601          	ld	a,_sal_haut
4144  01dc 905f          	clrw	y
4145  01de 9097          	ld	yl,a
4146  01e0 90bf00        	ldw	c_y,y
4147  01e3 b300          	cpw	x,c_y
4148  01e5 2541          	jrult	L5102
4149  01e7               L7102:
4150                     ; 153 		PB_ODR = PB_ODR|(1<<1);
4152  01e7 72125005      	bset	_PB_ODR,#1
4154  01eb               L1202:
4155                     ; 158 	if((ADC_CSR&(1<<7))==128)
4157  01eb c65400        	ld	a,_ADC_CSR
4158  01ee a480          	and	a,#128
4159  01f0 a180          	cp	a,#128
4160  01f2 2703          	jreq	L01
4161  01f4 cc00b4        	jp	L5671
4162  01f7               L01:
4163                     ; 160 			if(OLD_ADC_DRH != ADC_DRH)
4165  01f7 b602          	ld	a,_OLD_ADC_DRH
4166  01f9 c15404        	cp	a,_ADC_DRH
4167  01fc 2730          	jreq	L5202
4168                     ; 162 				PUIS = (ADC_DRH*100)/255;
4170  01fe c65404        	ld	a,_ADC_DRH
4171  0201 97            	ld	xl,a
4172  0202 a664          	ld	a,#100
4173  0204 42            	mul	x,a
4174  0205 90ae00ff      	ldw	y,#255
4175  0209 cd0000        	call	c_idiv
4177  020c 01            	rrwa	x,a
4178  020d b70b          	ld	_PUIS,a
4179  020f 02            	rlwa	x,a
4180                     ; 163 				TIM2_CCR1L = PUIS;
4182  0210 55000b5310    	mov	_TIM2_CCR1L,_PUIS
4183                     ; 164 				affiche_nombre(PUIS,(sizeof(Puis)-1)*11+1.13, 110);
4185  0215 4b6e          	push	#110
4186  0217 4b38          	push	#56
4187  0219 b60b          	ld	a,_PUIS
4188  021b 5f            	clrw	x
4189  021c 97            	ld	xl,a
4190  021d cd0000        	call	_affiche_nombre
4192  0220 85            	popw	x
4193                     ; 165 				OLD_ADC_DRH = ADC_DRH;
4195  0221 5554040002    	mov	_OLD_ADC_DRH,_ADC_DRH
4196  0226 2006          	jra	L5202
4197  0228               L5102:
4198                     ; 155 		PB_ODR = PB_ODR&~(1<<1);
4200  0228 72135005      	bres	_PB_ODR,#1
4201  022c 20bd          	jra	L1202
4202  022e               L5202:
4203                     ; 168 			ADC_CSR = ADC_CSR&~(1<<7);
4205  022e 721f5400      	bres	_ADC_CSR,#7
4206                     ; 169 			ADC_CR1 |= 0x01;
4208  0232 72105401      	bset	_ADC_CR1,#0
4209  0236 acb400b4      	jpf	L5671
4370                     	xdef	_main
4371                     	xdef	_j
4372                     	switch	.ubsct
4373  0000               _i:
4374  0000 00            	ds.b	1
4375                     	xdef	_i
4376  0001               _etat:
4377  0001 00            	ds.b	1
4378                     	xdef	_etat
4379                     	xdef	_tab_ech
4380  0002               _OLD_ADC_DRH:
4381  0002 00            	ds.b	1
4382                     	xdef	_OLD_ADC_DRH
4383  0003               _int_2ms_ok:
4384  0003 00            	ds.b	1
4385                     	xdef	_int_2ms_ok
4386                     	xdef	_tab_cpt_moy
4387  0004               _cpt_moy:
4388  0004 0000          	ds.b	2
4389                     	xdef	_cpt_moy
4390  0006               _cpt_ech:
4391  0006 0000          	ds.b	2
4392                     	xdef	_cpt_ech
4393                     	xdef	_dc_cap
4394                     	xdef	_ac_cap
4395  0008               _BPM:
4396  0008 0000          	ds.b	2
4397                     	xdef	_BPM
4398  000a               _k:
4399  000a 00            	ds.b	1
4400                     	xdef	_k
4401  000b               _PUIS:
4402  000b 00            	ds.b	1
4403                     	xdef	_PUIS
4404                     	xdef	_sal_haut
4405                     	xdef	_sal_bas
4406                     	xref	_Init_I2C_Master
4407                     	xref	_init_TFT
4408                     	xref	_read_AD7991
4409                     	xref	_init_timer2_pwm
4410                     	xref	_write_byte_UART2
4411                     	xref	_init_UART2
4412                     	xref	_init_timer1_2ms
4413                     	xref	_affiche_nombre
4414                     	xref	_affiche_mot
4415                     	xref	_init_LED
4416                     	xref	_init_Poussoirs
4417                     	xref	_init_ADC
4418                     	xref	_init_SPI
4419                     	xref.b	c_y
4439                     	xref	c_idiv
4440                     	end

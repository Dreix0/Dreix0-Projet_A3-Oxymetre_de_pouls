   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2558                     ; 23 void Init_I2C_Master(void)
2558                     ; 24 {
2560                     	switch	.text
2561  0000               _Init_I2C_Master:
2565                     ; 37 	CLK_PCKENR1 |= 0b00000001;	//	CLK_PCKEN1 bit 0 = enable clock peripheral I2C
2567  0000 721050c7      	bset	_CLK_PCKENR1,#0
2568                     ; 40 	I2C_FREQR = (I2C_FREQR & 0b11000000)| 0b00010000; 
2570  0004 c65212        	ld	a,_I2C_FREQR
2571  0007 a4c0          	and	a,#192
2572  0009 aa10          	or	a,#16
2573  000b c75212        	ld	_I2C_FREQR,a
2574                     ; 45 	I2C_CCRL = 0x0A;	// CCR = 10 -> FI2C = 100kHz avec FMASTER = 2MHz
2576  000e 350a521b      	mov	_I2C_CCRL,#10
2577                     ; 48 	I2C_CCRH = (I2C_CCRH & 0b00110000)| 0x00;	// standard mode 
2579  0012 c6521c        	ld	a,_I2C_CCRH
2580  0015 a430          	and	a,#48
2581  0017 c7521c        	ld	_I2C_CCRH,a
2582                     ; 53 	I2C_TRISER = (I2C_TRISER & 0b11000000)| 0b00000011;	// TRISE = 3 -> TRISE = 1us avec FMASTER = 2MHz 
2584  001a c6521d        	ld	a,_I2C_TRISER
2585  001d a4c0          	and	a,#192
2586  001f aa03          	or	a,#3
2587  0021 c7521d        	ld	_I2C_TRISER,a
2588                     ; 57  	I2C_CR1 = (I2C_CR1 & 0b00111110)| 0b00000001;	// clock stretching disable
2590  0024 c65210        	ld	a,_I2C_CR1
2591  0027 a43e          	and	a,#62
2592  0029 aa01          	or	a,#1
2593  002b c75210        	ld	_I2C_CR1,a
2594                     ; 60 	I2C_CR2=0; //rajouté								
2596  002e 725f5211      	clr	_I2C_CR2
2597                     ; 63 }
2600  0032 81            	ret
2625                     ; 71 void Start_I2C(void)
2625                     ; 72 {
2626                     	switch	.text
2627  0033               _Start_I2C:
2631                     ; 75 	I2C_CR2 = (I2C_CR2 & 0b01110000);
2633  0033 c65211        	ld	a,_I2C_CR2
2634  0036 a470          	and	a,#112
2635  0038 c75211        	ld	_I2C_CR2,a
2636                     ; 76 	I2C_CR2|= 0b00000001;	// start
2638  003b 72105211      	bset	_I2C_CR2,#0
2640  003f               L3561:
2641                     ; 81 	while ( ( I2C_SR1 & 0b00000001) == 0);  // wait for SB = Start Bit = 1 
2643  003f c65217        	ld	a,_I2C_SR1
2644  0042 a501          	bcp	a,#1
2645  0044 27f9          	jreq	L3561
2646                     ; 83 }
2649  0046 81            	ret
2685                     ; 92 void Stop_I2C(void)
2685                     ; 93 {
2686                     	switch	.text
2687  0047               _Stop_I2C:
2689  0047 88            	push	a
2690       00000001      OFST:	set	1
2693                     ; 95 	I2C_CR2 = (I2C_CR2 & 0b01110000) | 0b00000010;	// stop after receive NOACK
2695  0048 c65211        	ld	a,_I2C_CR2
2696  004b a470          	and	a,#112
2697  004d aa02          	or	a,#2
2698  004f c75211        	ld	_I2C_CR2,a
2699                     ; 101 	dummy=I2C_SR1;
2701  0052 c65217        	ld	a,_I2C_SR1
2702                     ; 103 }
2705  0055 84            	pop	a
2706  0056 81            	ret
2752                     ; 112 void Write_I2C(char data)
2752                     ; 113 {
2753                     	switch	.text
2754  0057               _Write_I2C:
2756  0057 5203          	subw	sp,#3
2757       00000003      OFST:	set	3
2760                     ; 115 I2C_DR = data;
2762  0059 c75216        	ld	_I2C_DR,a
2764  005c               L3271:
2765                     ; 120 	while ( (( I2C_SR1 & 0b00000010) == 0)&(( I2C_SR1 & 0b10000000) == 0)); // wait for ADDR =1,  Ack ou wait for TXE=1 ( paré à envoyer un autre byte)
2767  005c c65217        	ld	a,_I2C_SR1
2768  005f a580          	bcp	a,#128
2769  0061 2605          	jrne	L41
2770  0063 ae0001        	ldw	x,#1
2771  0066 2001          	jra	L61
2772  0068               L41:
2773  0068 5f            	clrw	x
2774  0069               L61:
2775  0069 1f01          	ldw	(OFST-2,sp),x
2776  006b c65217        	ld	a,_I2C_SR1
2777  006e a502          	bcp	a,#2
2778  0070 2605          	jrne	L02
2779  0072 ae0001        	ldw	x,#1
2780  0075 2001          	jra	L22
2781  0077               L02:
2782  0077 5f            	clrw	x
2783  0078               L22:
2784  0078 01            	rrwa	x,a
2785  0079 1402          	and	a,(OFST-1,sp)
2786  007b 01            	rrwa	x,a
2787  007c 1401          	and	a,(OFST-2,sp)
2788  007e 01            	rrwa	x,a
2789  007f a30000        	cpw	x,#0
2790  0082 26d8          	jrne	L3271
2791                     ; 121 	dummy=I2C_SR3;
2793  0084 c65219        	ld	a,_I2C_SR3
2794                     ; 122 }
2797  0087 5b03          	addw	sp,#3
2798  0089 81            	ret
2823                     ; 131 char Read_I2C(void)
2823                     ; 132 { 
2824                     	switch	.text
2825  008a               _Read_I2C:
2829  008a               L1471:
2830                     ; 133 	while ( ( I2C_SR1 & 0b01000000) == 0); // wait for RXNE = 1 
2832  008a c65217        	ld	a,_I2C_SR1
2833  008d a540          	bcp	a,#64
2834  008f 27f9          	jreq	L1471
2835                     ; 134 	return I2C_DR;
2837  0091 c65216        	ld	a,_I2C_DR
2840  0094 81            	ret
2864                     ; 145 void Ack_I2C(void)
2864                     ; 146 {
2865                     	switch	.text
2866  0095               _Ack_I2C:
2870                     ; 147 	I2C_CR2 =(I2C_CR2 & 0b01110000)| 0b00000100;	//ACK
2872  0095 c65211        	ld	a,_I2C_CR2
2873  0098 a470          	and	a,#112
2874  009a aa04          	or	a,#4
2875  009c c75211        	ld	_I2C_CR2,a
2876                     ; 149 }
2879  009f 81            	ret
2903                     ; 158 void NoAck_I2C(void)
2903                     ; 159 {
2904                     	switch	.text
2905  00a0               _NoAck_I2C:
2909                     ; 160 	I2C_CR2 =(I2C_CR2 & 0b01110000);// bit ACK laissé à 0, 
2911  00a0 c65211        	ld	a,_I2C_CR2
2912  00a3 a470          	and	a,#112
2913  00a5 c75211        	ld	_I2C_CR2,a
2914                     ; 161 }
2917  00a8 81            	ret
2930                     	xdef	_NoAck_I2C
2931                     	xdef	_Ack_I2C
2932                     	xdef	_Read_I2C
2933                     	xdef	_Write_I2C
2934                     	xdef	_Stop_I2C
2935                     	xdef	_Start_I2C
2936                     	xdef	_Init_I2C_Master
2955                     	end

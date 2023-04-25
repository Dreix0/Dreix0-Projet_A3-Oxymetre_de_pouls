/*******************************************************************************
* Noms binome  : Mathys LE MANACH    
								 Quentin DENOLLE
* Description    : fonctions diverses projet numérique année 3 (carte MESURE)  
*******************************************************************************/

#include "iostm8s105.h"
#include "fonc_tft.h"


// control_1
void init_SPI(void)
{
	CLK_PCKENR1 = CLK_PCKENR1 | (1<<1);
	PC_DDR = PC_DDR|(1<<7);
	PC_CR1 = PC_CR1|(1<<7);
	PC_CR2 = PC_CR2&~(1<<7);
	PC_ODR = PC_ODR|(1<<7);
	PD_DDR = (PD_DDR|(1<<7))+1;
	PD_CR1 = (PD_CR1|(1<<7))+1;
	PD_CR2 = (PD_CR2&~(1<<7))+1;
	PD_ODR = PD_ODR&~(1<<7);
	PD_ODR = PD_ODR&~(1<<0);
	SPI_CR1 = 0x14;
	SPI_CR2 = 0x03;
	SPI_CR1 = SPI_CR1 |(1<<6);
}

void init_ADC(void)
{
	CLK_PCKENR2= CLK_PCKENR2|(1<<3);
	PF_DDR = PF_DDR&~(1<<4);
	PF_CR1 = PF_CR1&~(1<<4);
	PF_CR2 = PF_CR2&~(1<<4);
	ADC_CSR = 0x0C;
	ADC_CR1 |= 0x01;
}

void init_Poussoirs(void)
{
	PE_DDR = PE_DDR&~(1<<5);
	PE_CR1 = PE_CR1&~(1<<5);
	PE_CR2 = PE_CR2|(1<<5);
	PD_DDR = PD_DDR&~(1<<3);
	PD_CR1 = PD_CR1&~(1<<3);
	PD_CR2 = PD_CR2|(1<<3);
	PC_DDR = PC_DDR&~(1<<4);
	PC_CR1 = PC_CR1&~(1<<4);
	PC_CR2 = PC_CR2|(1<<4);
	
	EXTI_CR1 = EXTI_CR1&~(1<<6);
	EXTI_CR1 = EXTI_CR1|(1<<7);
	EXTI_CR1 = EXTI_CR1&~(1<<4);
	EXTI_CR1 = EXTI_CR1|(1<<5);
	EXTI_CR2 = EXTI_CR2&~(1<<0);
	EXTI_CR2 = EXTI_CR2|(1<<1);
}

void init_LED(void)
{
	PB_DDR = PB_DDR |0b00000111;
	PB_CR1 = PB_CR1 |0b00000111;
	PB_CR2 = PB_CR2 |0b00000111;
}

void affiche_mot(uint8_t *mot, uint8_t col, uint8_t ligne)
{
	uint8_t i=0;
	
	while(mot[i]!='\0')
	{
		displayChar_TFT(col+11*i, ligne, mot[i], ST7735_RED, ST7735_BLACK, 2);
		i++;
	}
}

void affiche_nombre(uint16_t nombre, uint8_t col, uint8_t ligne)
{
	int CEN, DIZ, UNI;
	CEN = nombre/100;
	DIZ = (nombre%100)/10;
	UNI = (nombre%100)%10;
	displayChar_TFT(col, ligne, CEN+0x30, 0xFFE0, 0x0000, 2);
	displayChar_TFT(col+12, ligne, DIZ+0x30, 0xFFE0, 0x0000, 2);
	displayChar_TFT(col+24, ligne, UNI+0x30, 0xFFE0, 0x0000, 2);
}


// control_2
void init_timer1_2ms(void)
{
	CLK_PCKENR1 = CLK_PCKENR1|(1<<7);
	TIM1_PSCRH = 79/256;
	TIM1_PSCRL = 79%256;
	TIM1_ARRH = 399/256;
	TIM1_ARRL = 399%256;
	TIM1_CR1 = 0x00;
	TIM1_IER |= 1;
	TIM1_SR1 = 0x00;
	TIM1_CR1 |= 1;
}

void init_UART2(uint16_t UART_BAUDRATE)
{
	int uartdiv = 16000000/UART_BAUDRATE;
	CLK_PCKENR1 |= (1<<3);
	UART2_BRR1 = (uartdiv >> 4);
	UART2_BRR2 = ((uartdiv&0xF000)>>8)|(uartdiv&0x000F);
	UART2_CR1 = 0;
	UART2_CR2 = 0b00001100;
	UART2_CR3 = (UART2_CR3 & 0b10000000);
}

void write_byte_UART2(uint8_t data)
{
	UART2_DR = data;
	while((UART2_SR&0b10000000)==0);
}

void init_timer2_pwm(void)
{
	CLK_PCKENR1 = CLK_PCKENR1|(1<<5);
	TIM2_PSCR = 0x4;
	TIM2_ARRH = 99/256;
	TIM2_ARRL = 99%256;
	TIM2_CCMR1 = 0x68;
	TIM2_CCER1 = 1;
	TIM2_CR1 = 0x81;
	PD_DDR = PD_DDR|(1<<4);
	PD_CR1 = PD_CR1|(1<<4);
	PD_CR2 = PD_CR2&~(1<<4);
}
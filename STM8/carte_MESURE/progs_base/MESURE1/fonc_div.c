/*******************************************************************************
* Noms binome  : Mathys LE MANACH    
								 Quentin DENOLLE
* Description    : fonctions diverses projet numérique année 3 (carte MESURE)  
*******************************************************************************/

#include "iostm8s105.h"
#include "fonc_tft.h"

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

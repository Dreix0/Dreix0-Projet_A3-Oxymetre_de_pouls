/*******************************************************************************
* Noms binome  : Mathys LE MANACH    
								 Quentin DENOLLE
* Description    : fonctions diverses projet numérique année 3 (carte MESURE)  
*******************************************************************************/

#include "iostm8s105.h"
#include "fonc_tft.h"
#include "fonc_i2c.h"
#include "defs.h"


extern volatile uint8_t int_PC4;
extern volatile uint8_t choix_couleur;
extern volatile uint8_t couleur_ok;

extern volatile uint8_t bg_color;
extern volatile uint8_t txt_color;
extern volatile uint8_t val_color;

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
	uint16_t couleur[8]={ST7735_BLACK,ST7735_BLUE,ST7735_RED,ST7735_GREEN,ST7735_CYAN,ST7735_MAGENTA,ST7735_YELLOW,ST7735_WHITE};
	
	while(mot[i]!='\0')
	{
		displayChar_TFT(col+11*i, ligne, mot[i], couleur[txt_color], couleur[bg_color], 2);
		i++;
	}
}

void affiche_nombre(uint16_t nombre, uint8_t col, uint8_t ligne)
{
	int CEN, DIZ, UNI;
	uint16_t couleur[8]={ST7735_BLACK,ST7735_BLUE,ST7735_RED,ST7735_GREEN,ST7735_CYAN,ST7735_MAGENTA,ST7735_YELLOW,ST7735_WHITE};
	
	CEN = nombre/100;
	DIZ = (nombre%100)/10;
	UNI = (nombre%100)%10;
	displayChar_TFT(col, ligne, CEN+0x30, couleur[val_color], couleur[bg_color], 2);
	displayChar_TFT(col+12, ligne, DIZ+0x30, couleur[val_color], couleur[bg_color], 2);
	displayChar_TFT(col+24, ligne, UNI+0x30, couleur[val_color], couleur[bg_color], 2);
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

//controle 4
uint16_t read_AD7991(uint8_t octet_conf)
{
	uint8_t adc_MSB, adc_LSB;
	uint16_t adc_temp;
	
	Start_I2C();
	Write_I2C(0b01010000);
	Write_I2C(octet_conf);
	Stop_I2C();
	Start_I2C();
	Write_I2C(0b01010001);
	Ack_I2C();
	adc_MSB = Read_I2C();
	NoAck_I2C();
	adc_LSB = Read_I2C();
	Stop_I2C();
	adc_temp = ((adc_MSB&0b00001111)<<8)+ adc_LSB;
	return adc_temp;
}

// controle finale
void lettre_couleur(void)
{
	uint16_t couleur[8]={ST7735_BLACK,ST7735_BLUE,ST7735_RED,ST7735_GREEN,ST7735_CYAN,ST7735_MAGENTA,ST7735_YELLOW,ST7735_WHITE};
	char init_couleur[8] = {'N','B','R','V','C','M','J','W'};
	
	switch (couleur_ok){
	case 0:
		displayChar_TFT((sizeof(Fond)-1)*11+1.1, 20, init_couleur[choix_couleur], couleur[val_color], couleur[bg_color], 2);
		break;
	case 1:
		displayChar_TFT((sizeof(Texte)-1)*11+1.4, 40, init_couleur[choix_couleur], couleur[val_color], couleur[bg_color], 2);
		break;
	case 2:
		displayChar_TFT((sizeof(Valeurs)-1)*11+1.7, 60, init_couleur[choix_couleur], couleur[val_color], couleur[bg_color], 2);	
		break;
	}
	
}

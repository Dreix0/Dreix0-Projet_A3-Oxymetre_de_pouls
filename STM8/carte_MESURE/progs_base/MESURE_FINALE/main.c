/* MAIN.C file
 
 Projet STM8 03/2022
 Mathys LE MANACH
 Quentin DENOLLE
 
 Carte MESURE
 
 */

/* INCLUDE ************************************************/
#include "iostm8s105.h"
#include "fonc_div.h"
#include "fonc_tft.h"
#include "fonc_i2c.h"
#include "fonc_delay.h"
#include "defs.h"
		
/* DEFINE *************************************************/
volatile uint8_t sal_bas=40; // seuil alarme bas
volatile uint8_t sal_haut=200;// seuil alarme haut
volatile uint8_t PUIS; // puissance du signal PWM
uint8_t k; // rapport BPM/30
uint16_t BPM; // le pouls en BPM

uint16_t ac_cap=2000;
uint16_t dc_cap=1000;
volatile uint16_t cpt_ech; // variable du compteur échantillon
uint16_t cpt_moy; // variable de la moyenne des 8 derniers compteurs
uint16_t tab_cpt_moy[8] = {428,428,428,428,428,428,428,428}; // tableau des 8 derniers compteurs

volatile uint8_t int_2ms_ok; // mise à 1 toutes les 2 millisecondes

uint8_t OLD_ADC_DRH;

uint8_t etat;
uint8_t i;
volatile uint8_t j=0;

volatile uint8_t int_PC4 = 0;
volatile uint8_t choix_couleur;
volatile uint8_t couleur_ok;

volatile uint8_t bg_color = 0;
volatile uint8_t txt_color = 2;
volatile uint8_t val_color = 6;

/* VARIABLE ***********************************************/

/* FUNCTION ***********************************************/

/* MAIN ***************************************************/
main()
{	
	CLK_CKDIVR &= ~(0b11111);
	k = 4;
	cpt_moy = (tab_cpt_moy[0]+tab_cpt_moy[1]+tab_cpt_moy[2]+tab_cpt_moy[3]+tab_cpt_moy[4]+tab_cpt_moy[5]+tab_cpt_moy[6]+tab_cpt_moy[7])/8;  
	
	etat=1; // etat mise à 1 au reset
	
	// Initialisation
	init_SPI();
	init_TFT();
	init_Poussoirs();
	init_LED();
	init_ADC();
	
	init_timer1_2ms();
	init_timer2_pwm();
	init_UART2(57600);
	
	Init_I2C_Master();
	
	EnableGeneralInterrupt(); 
	ADC_CR1 |= 0x01;

	
	while (1)
	{
		// Toutes les 2ms	
		if(int_2ms_ok == 1)
		{
		
		ac_cap = read_AD7991(0b00011000);
		dc_cap = read_AD7991(0b00101000);
	
		
		write_byte_UART2(ac_cap>>8);
		write_byte_UART2(0b10000|(ac_cap&0x0F0)>>4);
		write_byte_UART2(0b100000|(ac_cap&0x00F));
		write_byte_UART2((dc_cap>>8)|(1<<7));
		write_byte_UART2(0b10010000|(dc_cap&0x0F0)>>4);
		write_byte_UART2(0b10100000|(dc_cap&0x00F));
	
		int_2ms_ok = 0;
		
			// Cas
		switch (etat) {
			case 1:
				if (ac_cap>2148)
					etat=2;
				break;
			case 2:
				if (ac_cap<1948)
				{
				etat=3;
				cpt_ech=0;
				PB_ODR = PB_ODR|(1<<0);
				j = 0;
				}
				break;
			case 3:
				if(j==50)
					PB_ODR = PB_ODR&~(1<<0);
				if	(ac_cap>2148)
					etat=4;
				break;
			case 4:
				if(ac_cap<1948)
				{
				etat=3;
				PB_ODR = PB_ODR|(1<<0);
				j = 0;
				tab_cpt_moy[i] = cpt_ech;
				cpt_ech=0;
				i ++;
				if(i==8)
					i = 0;
				cpt_moy = (tab_cpt_moy[0]+tab_cpt_moy[1]+tab_cpt_moy[2]+tab_cpt_moy[3]+tab_cpt_moy[4]+tab_cpt_moy[5]+tab_cpt_moy[6]+tab_cpt_moy[7])/8;  
				affiche_nombre(30000/cpt_moy, (sizeof(Bpm)-1)*11+1.4, 50);
				}
				break;
			default: break;
		}
		
	
		}
		
		if(cpt_ech > 1000)
		{
			affiche_nombre(888, (sizeof(Bpm)-1)*11+1.4, 50);
			etat = 2;
		}
		
		
		
		// Alarme
		if((30000/cpt_moy <= sal_bas)||(30000/cpt_moy>=sal_haut))
			PB_ODR = PB_ODR|(1<<1);
		else
			PB_ODR = PB_ODR&~(1<<1);
			
		// Potentiomètre
		if((ADC_CSR&(1<<7))==128)
			{
				if(OLD_ADC_DRH != ADC_DRH)
				{
					PUIS = (ADC_DRH*100)/255;
					TIM2_CCR1L = PUIS;
					affiche_nombre(PUIS,(sizeof(Puis)-1)*11+1.13, 110);
					OLD_ADC_DRH = ADC_DRH;
				}
				
				ADC_CSR = ADC_CSR&~(1<<7);
				ADC_CR1 |= 0x01;
			}	
	}
}

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
uint8_t PUIS; // puissance du signal PWM
uint8_t k; // rapport BPM/30
uint16_t BPM; // le pouls en BPM

uint16_t ac_cap=2000;
uint16_t dc_cap=1000;
uint16_t cpt_ech; // variable du compteur échantillon
uint16_t cpt_moy; // variable de la moyenne des 8 derniers compteurs
uint16_t tab_cpt_moy[8]; // tableau des 8 derniers compteurs

uint8_t int_2ms_ok; // mise à 1 toutes les 2 millisecondes
uint8_t OLD_ADC_DRH;
/* VARIABLE ***********************************************/

/* FUNCTION ***********************************************/

/* MAIN ***************************************************/
main()
{	
	BPM = 50;
	CLK_CKDIVR = 0;
	
	// Initialisation
	init_SPI();
	init_TFT();
	init_Poussoirs();
	init_LED();
	init_ADC();
	
	// Affichage
	affiche_mot(Mesure, 28.5, 10);
	affiche_mot(Bpm, 1.4, 50);
	affiche_mot(Seuil_bas, 1.7, 70);
	affiche_mot(Seuil_haut, 1.1, 90);
	affiche_mot(Puis,1.13, 110);
	
	affiche_nombre(BPM, (sizeof(Bpm)-1)*11+1.4, 50);
	affiche_nombre(sal_bas, 80, 70);
	affiche_nombre(sal_haut, 90, 90);
	
	EnableGeneralInterrupt(); 
	ADC_CR1 |= 0x01;
	
	while (1)
	{
	if((BPM <= sal_bas)||(BPM>=sal_haut))
		PB_ODR = PB_ODR|(1<<1);
	else
		PB_ODR = PB_ODR&~(1<<1);
	
	if((ADC_CSR&(1<<7))==128)
		{
			if(OLD_ADC_DRH != ADC_DRH)
			{
				PUIS = (ADC_DRH*100)/255;
				affiche_nombre(PUIS,70, 110);
				OLD_ADC_DRH = ADC_DRH;
			}
			
			ADC_CSR = ADC_CSR&~(1<<7);
			ADC_CR1 |= 0x01;
		}
	
	}
}

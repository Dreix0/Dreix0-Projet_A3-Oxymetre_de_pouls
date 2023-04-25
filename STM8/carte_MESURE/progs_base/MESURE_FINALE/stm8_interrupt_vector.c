/*	BASIC INTERRUPT VECTOR TABLE FOR STM8 devices
 *	Copyright (c) 2007 STMicroelectronics
 */
#include <iostm8s105.h>
#include "fonc_div.h"
#include "fonc_tft.h"
#include "defs.h"

extern volatile uint8_t sal_bas;
extern volatile uint8_t sal_haut;
extern volatile uint8_t int_2ms_ok;
extern volatile uint16_t cpt_ech;
extern volatile uint8_t j;
extern volatile uint8_t int_PC4;
extern volatile uint8_t choix_couleur;
extern volatile uint8_t couleur_ok;

extern volatile uint8_t bg_color;
extern volatile uint8_t txt_color;
extern volatile uint8_t val_color;

uint16_t couleur[8]={ST7735_BLACK,ST7735_BLUE,ST7735_RED,ST7735_GREEN,ST7735_CYAN,ST7735_MAGENTA,ST7735_YELLOW,ST7735_WHITE};

typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	unsigned char interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

@far @interrupt void NonHandledInterrupt (void)
{
	/* in order to detect unexpected events during development, 
	   it is recommended to set a breakpoint on the following instruction
	*/
	return;
}

/* ------------------------------------------------------------------------*/

@far @interrupt void int_PE5 (void)
{
	if(int_PC4 == 0)
	{
		sal_bas += 2;
		if(sal_bas > 60)
			sal_bas = 40;
		affiche_nombre(sal_bas, 80, 70); 
	}
	else
	{
		choix_couleur ++;
		if(choix_couleur == 8)
			choix_couleur = 0;
	
		switch (couleur_ok){
		case 0:
			bg_color = choix_couleur;
			break;
		case 1:
			txt_color = choix_couleur;
			break;
		case 2:
			val_color = choix_couleur;
			break;
		}
	}
	
	return;
}

@far @interrupt void int_PD3 (void)
{
	if(int_PC4 == 0)
	{
		sal_haut -= 10;
		if(sal_haut < 100)
			sal_haut = 240;
		affiche_nombre(sal_haut, 90, 90); 
	}
	else
	{
		couleur_ok ++;
		if(couleur_ok == 3)
			couleur_ok = 0;
	}
	return;
}

@far @interrupt void int_timer1_2ms(void)
{
	int_2ms_ok = 1;
	cpt_ech += 1;
	j ++;
	TIM1_SR1 = TIM1_SR1 &~(1<<0);
	return;
}

@far @interrupt void PC4(void)
{
	int_PC4 ++;
	if(int_PC4 ==2)
		int_PC4 = 0;
	if(int_PC4 == 0)
	{
		affiche_mot(Mesure, 28.5, 10);
		affiche_mot(Bpm, 1.4, 50);
		affiche_mot(Seuil_bas, 1.7, 70);
		affiche_mot(Seuil_haut, 1.1, 90);
		affiche_mot(Puis,1.13, 110);
	}
	
	if(int_PC4 == 1)
	{
		affiche_mot(Fond, 1.1, 20);
		affiche_mot(Texte, 1.4, 40);
		affiche_mot(Valeurs, 1.7, 60);
		
		lettre_couleur();
	}
	fillScreen_TFT(couleur[bg_color]);
	return;
}

extern void _stext();     /* startup routine */

struct interrupt_vector const _vectab[] = {
	{0x82, (interrupt_handler_t)_stext}, /* reset */
	{0x82, NonHandledInterrupt}, /* trap  */
	{0x82, NonHandledInterrupt}, /* irq0  */
	{0x82, NonHandledInterrupt}, /* irq1  */
	{0x82, NonHandledInterrupt}, /* irq2  */
	{0x82, NonHandledInterrupt}, /* irq3  */
	{0x82, NonHandledInterrupt}, /* irq4  */
	{0x82, PC4}, /* irq5  */
	{0x82, int_PD3}, /* irq6  */
	{0x82, int_PE5}, /* irq7  */
	{0x82, NonHandledInterrupt}, /* irq8  */
	{0x82, NonHandledInterrupt}, /* irq9  */
	{0x82, NonHandledInterrupt}, /* irq10 */
	{0x82, int_timer1_2ms}, /* irq11 */
	{0x82, NonHandledInterrupt}, /* irq12 */
	{0x82, NonHandledInterrupt}, /* irq13 */
	{0x82, NonHandledInterrupt}, /* irq14 */
	{0x82, NonHandledInterrupt}, /* irq15 */
	{0x82, NonHandledInterrupt}, /* irq16 */
	{0x82, NonHandledInterrupt}, /* irq17 */
	{0x82, NonHandledInterrupt}, /* irq18 */
	{0x82, NonHandledInterrupt}, /* irq19 */
	{0x82, NonHandledInterrupt}, /* irq20 */
	{0x82, NonHandledInterrupt}, /* irq21 */
	{0x82, NonHandledInterrupt}, /* irq22 */
	{0x82, NonHandledInterrupt}, /* irq23 */
	{0x82, NonHandledInterrupt}, /* irq24 */
	{0x82, NonHandledInterrupt}, /* irq25 */
	{0x82, NonHandledInterrupt}, /* irq26 */
	{0x82, NonHandledInterrupt}, /* irq27 */
	{0x82, NonHandledInterrupt}, /* irq28 */
	{0x82, NonHandledInterrupt}, /* irq29 */
};

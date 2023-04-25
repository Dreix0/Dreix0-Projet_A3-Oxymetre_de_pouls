/*
Projet Oxymétrie -- Année 2022
LE MANACH Mathys & DENOLLE Quentin
Intégration
*/

//Importation des bibliothèques
#include "mesure.h"
#include "affichage.h"
#include "fichiers.h"
#include "fir.h"
#include "iir.h"
#include "define.h"
#include "integration.h"


//Fonctions
void integrationTest(char* filename)
{

	// Paramètres de la fonction fir
	
	float FIR_TAPS[51]={1.4774946e-019,1.6465231e-004,3.8503956e-004,7.0848037e-004,1.1840522e-003, 1.8598621e-003,2.7802151e-003,3.9828263e-003,5.4962252e-003,7.3374938e-003,9.5104679e-003,1.2004510e-002,1.4793934e-002,1.7838135e-002,2.1082435e-002,2.4459630e-002,2.7892178e-002,3.1294938e-002,3.4578348e-002,3.7651889e-002,4.0427695e-002,4.2824111e-002,4.4769071e-002,4.6203098e-002,4.7081811e-002,4.7377805e-002,4.7081811e-002,4.6203098e-002,4.4769071e-002,4.2824111e-002,4.0427695e-002,3.7651889e-002,3.4578348e-002,3.1294938e-002,2.7892178e-002,2.4459630e-002,2.1082435e-002,1.7838135e-002,1.4793934e-002,1.2004510e-002,9.5104679e-003,7.3374938e-003,5.4962252e-003,3.9828263e-003,2.7802151e-003,1.8598621e-003,1.1840522e-003,7.0848037e-004,3.8503956e-004,1.6465231e-004,1.4774946e-019}; 
	//Le tableau des constantes h//déclaration d'un tableau de flottants de 51 echantillons de valeurs précédentes
	
	float tab_fir_acr[51] = {0}; //on crée le bloc mémoire acr qui mémorisera xn/xn-1/yn-1
	float tab_fir_acir[51] = {0}; //on crée le bloc mémoire acr qui mémorisera xn/xn-1/yn-1
	
	
	// Paramètres de la fonction iir
	
	float tab_iir_acr[3] = {0}; //on crée le bloc mémoire acr qui mémorisera xn/xn-1/yn-1
	float tab_iir_acir[3] = {0}; //on crée le bloc mémoire acr qui mémorisera xn/xn-1/yn-1
	
	// Paramètres de la fonction mesure

	absorp memo_absorp = {0}; //on crée memo_absorp qui stocke les dernières valeurs de myAbsorp
	int passage_0=1; //on initialise le passage_0 à 1
	int cpt=0; //on initialise le compteur cpt a 0

	int etat=0; //on met l'état pour lire le fichier à 0
	absorp myAbsorp = {0}; //on crée myAbsorp
	oxy myOxy = {0}; //on crée myOxy

	//Initialisation et ouverture des fichiers
	FILE* INTE=initFichier(filename);

	while( etat != EOF ){
	myAbsorp = lireFichier(INTE,&etat); //on lit le fichier INTE (filename)
	myAbsorp = Calculfir(myAbsorp, tab_fir_acr, tab_fir_acir, FIR_TAPS); //on passe par le filtre fir
	myAbsorp = CalculIIR(myAbsorp, tab_iir_acr, tab_iir_acir); //on passe par le filtre iir
	myOxy = CalculMesure(myAbsorp,myOxy, memo_absorp.acr, &passage_0, &cpt); //on calcul le pouls et le spo2
	memo_absorp = myAbsorp; //on mémorise les dernières valeurs de myAbsorp dans memo_absorp
	affichage(myOxy);//on affiche le pouls et le spo2
	}
	
	fclose(INTE); // fermeture du fichier
}
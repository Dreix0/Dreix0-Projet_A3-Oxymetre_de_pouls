#include "mesure.h"
#include "affichage.h"
#include "fichiers.h"
#include "fir.h"
#include "iir.h"
#include "define.h"
#include "integration.h"


void integrationTest(char* filename)
{	
	// Initialisation des structure myAbsorp et myOxy définit dans define.h
	absorp myAbsorp;
	oxy myOxy; 

	//Initialisation de nos paramètres pour notre fonction fir
	float acr[51];
	float acir[51];
	
	//initialisation de nos paramètres pour notre fonction iir
	float liste[3]={0,0,0};//liste acr
	float listei[3]={0,0,0};//liste acir
	
	//Initialisation de nos paramètres de nos fonctions mesure.spo2 et mesure.pouls
	oxy entree;
	int compteur_acr=0;
	float acr2[2]={0,0}; // acr[0]=max_acr et acr[1]=min_acr
	float acir2[2]={0,0}; // acir[0]=max_acir et acir[1]=min_acir
	int indice_acr=0;
	
	//Initialisation de l'état du fichier
	int etat=0;
	
	//Initialisation et ouverture des fichiers
	FILE* pf=initFichier(filename);
	myAbsorp=lireFichier(pf,&etat); // lecture du fichier 
	
	do{ 
	
		myAbsorp=fir(myAbsorp,acr,acir); //on commence par le filtre fir
		myAbsorp=iircalcul(myAbsorp,liste,listei); // ensuite on filtre avec le filtre iir
		
		myOxy.spo2=mesurespo2(myAbsorp,entree,acr,acir); // Après filtrage on appelle notre fonction pour mesurer spo2 
        myOxy.pouls=mesurefreq(entree, compteur_acr); // Après filtrage on appelle notre fonction pour mesurer les BPM du patient 
		
		affichage(myOxy); //on affiche nos valeurs dans notre Data.txt
		
		myAbsorp=lireFichier(pf,&etat); // on recommence tant qu'on est pas arrivé à la fin du fichier
	}while(etat!=EOF);
	fclose(pf); // fermeture du fichier
	
}

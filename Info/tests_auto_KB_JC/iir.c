#include "iir.h"
#include "define.h"
#include "fichiers.h"
#include <stdio.h>
#include <string.h>

absorp iirTest(char* filename){
	FILE* pf;
	pf=initFichier(filename);
	int etat;
	absorp myAbsorp;
	absorp yn; //On crée une structure absorp pour yn (la sortie)
	float liste[3]={0,0,0};//liste acr pour y stocker 3 valeurs (x(n), x(n-1) et y(n-1))
	float listei[3]={0,0,0};//liste acir pour y stocker 3 valeurs (x(n), x(n-1) et y(n-1))

	myAbsorp= lireFichier(pf,&etat);//pourcentage etat pour avoir la position du pointeur dans le doc txt

	while (etat!=EOF){ //Tant qu'on est pas arrivé à la dernière ligne du fichier
		yn=iircalcul(myAbsorp,liste,listei); // On appelle le programme iircalcul en l'assignant à une variable y(n)
		myAbsorp= lireFichier(pf,&etat);//pourcentage etat pour avoir la position du pointeur dans le doc txt
	}
	fclose(pf); // On ferme le fichier
	return yn; // On retourne le résultat final y(n)
}

absorp iircalcul(absorp myAbsorp, float* liste, float* listei){


	liste[0]=myAbsorp.acr; //nouveau x(n) acr
	myAbsorp.acr=liste[0]-liste[1]+0.992*liste[2]; //nouveau y(n) acr
	liste[1]=liste[0]; //nouveau x(n-1) acr
	liste[2]=myAbsorp.acr; //nouveau y(n-1) acr

	listei[0]=myAbsorp.acir; //nouveau x(n) acir
	myAbsorp.acir=listei[0]-listei[1]+0.992*listei[2]; //nouveau y(n) acir
	listei[1]=listei[0]; //nouveau x(n-1) acir
	listei[2]=myAbsorp.acir; //nouveau y(n-1) acir

	return myAbsorp;
}
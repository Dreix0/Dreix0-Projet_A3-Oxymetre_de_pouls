#include "mesure.h"
#include "define.h"
#include "fichiers.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

oxy mesureTest(char* filename){
	oxy myOxy;
	oxy entree;
	absorp myAbsorp;
	FILE* pf;
	pf=initFichier(filename);
	int etat;
	int test;
	int indice_acr=0; // Compteur de fois où la courbe passe à 0
	int compteur_acr=0; // Compteur de points d'échantillons utilisé pour une période 
	float acr[2]={0,0}; // acr[0]=max_acr et acr[1]=min_acr
	float acir[2]={0,0}; // acir[0]=max_acir et acir[1]=min_acir
	float memo; // On initialise memo comme float, il prendra la valeur de myAbsorp.acr-1

	myAbsorp=lireFichier(pf,&etat);//pourcentage etat pour avoir la position du pointeur dans le doc txt

	while (etat!=EOF){// jusqu'a fin du fichier
		while (indice_acr<3 && etat!=EOF){// On affiche le nombre 0 trois fois pour isoler une periode
			compteur_acr++; // On incrémente le compteur_acr
			myOxy.spo2=mesurespo2(myAbsorp,entree,acr,acir); // On lance le programme qui mesure la saturation dans l'oxygène (spo2)
			if (memo<0 & myAbsorp.acr>0){ // condition du  premier cas pour avoir un passage à 0
				indice_acr++; // On incrémente le indice_acr
			}
			if (memo>0 & myAbsorp.acr<0){ // condition du  deuxième cas pour avoir un passage à 0
				indice_acr++;
			}
			if (myAbsorp.acr==0){ // condition du troisième cas pour avoir un passage à 0
				indice_acr++;
			}
			if (indice_acr==3){// On fixe l'indice à 3 pour enlever la derniere de valeur, car le nombre totale de periode est pas entier
				myOxy.pouls=mesurefreq(entree, compteur_acr); // On lance le programme qui mesure les battements par minute chez le patient 
			}
			memo=myAbsorp.acr; // donne la valeur myAbsorp.acr à memo pour garder la valeur en mémoire pour le cas 1 et 2 du passage à 0
			myAbsorp=lireFichier(pf,&etat);//pourcentage etat pour avoir la position du pointeur dans le doc txt
		}
		indice_acr=1; // A la sortie de la période on réinitialise à 1 car nous sommes sur un 0 actuellement
		compteur_acr=0; // A la sortie de la période on réinitialise à 0
		acr[0]=0;// On met max_acr à 0
		acr[1]=0;// On met min_acr à 0
		acir[0]=0;// On met max_acir à 0
		acir[1]=0;// On met min_acir à 0
	}
	fclose(pf); // On ferme le fichier
	return myOxy;

}

int mesurefreq (oxy entree,int compteur_acr){ // Fonction mesure de BPM

	entree.pouls=60/(compteur_acr*0.00198); // Relation calculée et prise de valeur adaptée aux résultat


	return entree.pouls;
}

int mesurespo2 (absorp myAbsorp,oxy entree,float* acr,float* acir){ // Fonction mesure de saturation (spo2)

	float max_acr; // On initialise un max_acr pour le calcul du max d'acr
	float min_acr; // On initialise un min_acr pour le calcul du min d'acr
	float ptp_acr; // On initialise ptp_acr qui est la valeur pic à pic de acr qui nous permettra de calculer RSIR


	float max_acir; // On effectue les mêmes actions pour acir 
	float min_acir;
	float ptp_acir;

	float RSIR; // Ratio qui nous permettra de calculer la spo2

	max_acr=acr[0]; //on initialise la valeur max
	min_acr=acr[1];//on initialise la valeur min

	max_acir=acir[0];// pareil pour acir
	min_acir=acir[1];

		if (myAbsorp.acr>max_acr){ // Trouver la valeur max de la courbe de acr
			max_acr=myAbsorp.acr; // On met la valeur max dans variable crée pour 
		}
		if (myAbsorp.acr<min_acr){ // Trouver la valeur min de la courbe de acr
			min_acr=myAbsorp.acr;
		}
		if (myAbsorp.acir>max_acir){ // Trouver la valeur max de la courbe de acir
			max_acir=myAbsorp.acir;
		}
		if (myAbsorp.acir<min_acir){ // Trouver la valeur min de la courbe de acir
			min_acir=myAbsorp.acir;
		}

	ptp_acr=max_acr-min_acr; // Calcul du pic à pic d'acr
	ptp_acir=max_acir-min_acir; // Calcul du pic à pic d'acir

	RSIR=(ptp_acr/myAbsorp.dcr)/(ptp_acir/myAbsorp.dcir); // Calcul de RSIR via la formule donnée 

	if((RSIR<=1)&&(RSIR>=0.4)){ // Condition pour déterminer quelle équation de droite est la plus adéquate

		entree.spo2=-25*RSIR+110;// équation de la droite pour rsir appartenant à (0.4;1)
	}
	else{
		entree.spo2=-35*RSIR+113;// équation de la droite pour rsir appartenant à (0.4;1)
	}

	return entree.spo2;
}
#include "affichage.h" // Lien affichage.h 
#include <stdio.h>
#include <stdlib.h>
#include "define.h"

void affichage(oxy myOxy){ //Ouverture de la fonction affichage
	FILE* verrou=NULL;
	FILE* data=NULL;

	if(access(".verrouData",F_OK)!=-1){ // Boucle d'ouverture du fichier Data, condition de lecture des valeurs
		printf("le fichier est verrouillé\n"); // Si boucle égale à 1 on verrouille le fichier
	}
	else {
		verrou= fopen(".verrouData","w"); //On associe à verrou l'ouverture du fichier .verrouData en mode lecture et écriture
		data=fopen("Data.txt","w+"); //On associe à data l'ouverture du fichier Data.txt en mode lecture et écriture avec suppression du contenu au préalable
		fprintf(data,"%d\n%d",myOxy.spo2,myOxy.pouls);// On écrit les valeurs prisent dans fichiers
		fclose(verrou); //On ferme le fichier verrou
		fclose(data); // On ferme le fichier data
		remove(".verrouData"); //On supprime le fichier ".verrouData"
		}
	}
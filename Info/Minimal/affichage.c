/*
Projet Oxymétrie -- Année 2022
LE MANACH Mathys & DENOLLE Quentin
Affichage
*/


// Importation des bibliothèques
#include "affichage.h"

void affichage(oxy myOxy)
{
	FILE* data=NULL;
	FILE* verroudata=NULL;
	int BPM, SPO2, securite;
	if( access( ".verrouData", F_OK ) != -1 )
	{
		   securite=1; // le fichier existe
	}
	else
	{
		securite=0; 	// le fichier n'existe pas
		verroudata=fopen(".verrouData","w"); // on crée le fichier verrouData
		data=fopen("Data.txt", "w+"); // on ouvre le fichier Data.txt en mode lecture et écriture
		fprintf(data, "%d\n%d", myOxy.spo2, myOxy.pouls); // on écrit dans le fichier data.txt sur la ligne 1 : le SPO2 et la ligne 2 : le pouls
		fclose(verroudata); // on ferme le fchier verrouData
		fclose(data); // on ferme le fichier data
		remove(".verrouData"); // on supprime le fichier verrouData
	}
}
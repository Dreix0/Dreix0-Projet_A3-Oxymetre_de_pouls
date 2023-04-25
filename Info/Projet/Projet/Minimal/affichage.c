#include <unistd.h>
#include "affichage.h"

void affichage(oxy myOxy){
	FILE* data=NULL;
	FILE* verroudata=NULL;
	int BPM;
	int SPO2;
	int verif;
	if( access( ".verrouData", F_OK ) != -1 )
	{
		   verif=1;// Fichier existe
	}else{
		verif=0; 	// Fichier n'existe pas
		verroudata=fopen(".verrouData","w"); //création du fichier verrouData
		data=fopen("Data.txt", "w+"); //ouverture du fichier Data.txt en mode lecture et écriture
		fprintf(data, "%d\n%d", myOxy.spo2, myOxy.pouls); // on écrit dans data.txt à L1 : le SPO2 et L2 : le pouls
		fclose(verroudata); // fermeture de verrouData
		fclose(data); //fermeture de data
		remove(".verrouData"); //suppression de .verrouData

	}

}


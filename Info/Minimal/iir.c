#include "iir.h"
#include "fichiers.h"


absorp iirTest(char* filename)
{
	absorp myAbsorp;
	absorp	resultat;
	
	FILE* IIR = initFichier(filename);

	int statut=0;

	float tab_acr[3] = {0,0,0}; //liste acr pour y stocker 3 valeurs (x(n), x(n-1) et y(n-1))
	float tab_acir[3] = {0,0,0}; //liste acir pour y stocker 3 valeurs (x(n), x(n-1) et y(n-1))

	myAbsorp = lireFichier(IIR,&statut); //on lit le fichier d'entrée

	while (statut!=EOF) // on parcourt la boucle jusqu'a la fin du fichier
	{ 
		resultat = CalculIIR(myAbsorp,tab_acr,tab_acir); // On appelle le programme CalculIIR en l'assignant à une variable y(n)
		myAbsorp = lireFichier(IIR,&statut); 
	}
	
	fclose(IIR); // On ferme le fichier
	return resultat; // On retourne le résultat final y(n)
}




absorp CalculIIR(absorp myAbsorp, float* tab_acr, float* tab_acir)
{
	tab_acr[0] = myAbsorp.acr; //nouveau x(n) acr
	myAbsorp.acr = tab_acr[0] - tab_acr[1] + 0.992*tab_acr[2]; //nouveau y(n) acr
	tab_acr[1] = tab_acr[0]; //nouveau x(n-1) acr
	tab_acr[2] = myAbsorp.acr; //nouveau y(n-1) acr

	tab_acir[0] = myAbsorp.acir; //nouveau x(n) acir
	myAbsorp.acir = tab_acir[0] - tab_acir[1] + 0.992*tab_acir[2]; //nouveau y(n) acir
	tab_acir[1] = tab_acir[0]; //nouveau x(n-1) acir
	tab_acir[2] = myAbsorp.acir; //nouveau y(n-1) acir

	return myAbsorp;
}
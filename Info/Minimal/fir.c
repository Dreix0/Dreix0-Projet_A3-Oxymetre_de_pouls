#include "fir.h"
#include "fichiers.h"
#include "define.h"


float FIR_TAPS[51]={1.4774946e-019,1.6465231e-004,3.8503956e-004,7.0848037e-004,1.1840522e-003, 1.8598621e-003,2.7802151e-003,3.9828263e-003,5.4962252e-003,7.3374938e-003,9.5104679e-003,1.2004510e-002,1.4793934e-002,1.7838135e-002,2.1082435e-002,2.4459630e-002,2.7892178e-002,3.1294938e-002,3.4578348e-002,3.7651889e-002,4.0427695e-002,4.2824111e-002,4.4769071e-002,4.6203098e-002,4.7081811e-002,4.7377805e-002,4.7081811e-002,4.6203098e-002,4.4769071e-002,4.2824111e-002,4.0427695e-002,3.7651889e-002,3.4578348e-002,3.1294938e-002,2.7892178e-002,2.4459630e-002,2.1082435e-002,1.7838135e-002,1.4793934e-002,1.2004510e-002,9.5104679e-003,7.3374938e-003,5.4962252e-003,3.9828263e-003,2.7802151e-003,1.8598621e-003,1.1840522e-003,7.0848037e-004,3.8503956e-004,1.6465231e-004,1.4774946e-019}; //Le tableau des constantes h//déclaration d'un tableau de flottants de 51 echantillons de valeurs précédentes


absorp firTest(char* filename)
{
	int statut=0;
	
	absorp	myAbsorp;
	absorp	new_myAbsorp;
	
	float tab_acr[51]; //on crée le bloc mémoire acr qui mémorisera xn/xn-1/yn-1
	float tab_acir[51]; //on crée le bloc mémoire acr qui mémorisera xn/xn-1/yn-1

	FILE* FIR=initFichier(filename); //on apelle la fonction init fichier pour initialiser notre fichier 
	
	new_myAbsorp=lireFichier(FIR,&statut); //on lit le fichier d'entrée

	while(statut!=EOF) // on parcourt la boucle jusqu'a la fin du fichier
	{
		//on filtre la ligne courante
		myAbsorp=Calculfir(new_myAbsorp, tab_acr, tab_acir, FIR_TAPS); // on appelle la fonction Calculfir qui permet de faire le filtrage
		new_myAbsorp=lireFichier(FIR,&statut);
	}
	fclose(FIR); //à la fin de la lecture du fichier on ferme celui-ci
	return myAbsorp; // on retourne un tableau de type absorp ayant subis le filtre fir
}

absorp Calculfir(absorp new_myAbsorp,float *tab_acr,float *tab_acir,float *FIR_TAPS)
{
	absorp calcul;
	int j=0;

	for(j=0; j<51; j++)
	{
		new_myAbsorp.acr = new_myAbsorp.acr + FIR_TAPS[j]*tab_acr[51-j];
		calcul.acr = new_myAbsorp.acr;
		
		new_myAbsorp.acir = new_myAbsorp.acir + FIR_TAPS[j]*tab_acir[51-j];
		calcul.acir = new_myAbsorp.acir;
	}
	return calcul;
}

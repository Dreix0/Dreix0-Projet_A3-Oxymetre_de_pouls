#include "fir.h"
#include "define.h"
#include "fichiers.h"

float FIR_TAPS[51]={1.4774946e-019,1.6465231e-004,3.8503956e-004,7.0848037e-004,1.1840522e-003, 1.8598621e-003,2.7802151e-003,3.9828263e-003,5.4962252e-003,7.3374938e-003,9.5104679e-003,1.2004510e-002,1.4793934e-002,1.7838135e-002,2.1082435e-002,2.4459630e-002,2.7892178e-002,3.1294938e-002,3.4578348e-002,3.7651889e-002,4.0427695e-002,4.2824111e-002,4.4769071e-002,4.6203098e-002,4.7081811e-002,4.7377805e-002,4.7081811e-002,4.6203098e-002,4.4769071e-002,4.2824111e-002,4.0427695e-002,3.7651889e-002,3.4578348e-002,3.1294938e-002,2.7892178e-002,2.4459630e-002,2.1082435e-002,1.7838135e-002,1.4793934e-002,1.2004510e-002,9.5104679e-003,7.3374938e-003,5.4962252e-003,3.9828263e-003,2.7802151e-003,1.8598621e-003,1.1840522e-003,7.0848037e-004,3.8503956e-004,1.6465231e-004,1.4774946e-019}; //Le tableau des constantes h
//On initialise le tableau avec 51 valeurs
absorp firTest(char* filename){
	FILE* pf;
	pf=initFichier(filename);
	int etat;
	absorp myAbsorp;
	absorp yn; // On initialise une structure absorp définit dans define.h pour yn (la sortie)
	float acr[51]; // On initialise une liste acr de 51 valeurs flottantes
	float acir[51]; // On initialise une liste acir de 51 valeurs flottantes

	myAbsorp=lireFichier(pf,&etat); //pourcentage etat pour avoir la position du pointeur dans le doc txt

	while (etat!=EOF){
		myAbsorp=lireFichier(pf,&etat); //pourcentage etat pour avoir la position du pointeur dans le doc txt
	yn=fir(myAbsorp,acr,acir); //On appelle le programme iircalcul en l'assignant à une variable
	fclose(pf); //On ferme le fichier
	return yn;
	}

}


	absorp fir(absorp myAbsorp, float* acr, float* acir){

	int n=0;
	int k=0;

	while(n<51){
		acr[n]=acr[n+1]; // On décale les valeurs vers la droite pour les lumières rouges
		myAbsorp.acr=acr[50]; // On remonte la valeur au tout début du tableau acr
		acir[k]=acir[n+1]; // On décale les valeurs vers la droite pour les infrarouges
		myAbsorp.acir=acir[50]; // On remonte la valeur au tout début du tableau acir
		n++; // On incrémente n 
	}

	while (k<51){
		myAbsorp.acr+=FIR_TAPS[k]*acr[50-k]; // On associe une valeur à acr grâce à la formule fournie
		myAbsorp.acir+=FIR_TAPS[k]*acr[50-k]; // On associe une valeur à acir grâce à la formule fournie
		k++; // On incrémente k
	}

	return myAbsorp;
	}
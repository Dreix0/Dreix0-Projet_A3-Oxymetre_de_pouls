#include "fir.h"
#include "fichiers.h"
#include "define.h"
float FIR_TAPS[51]={
	    1.4774946e-019,
	    1.6465231e-004,
	    3.8503956e-004,
	    7.0848037e-004,
	    1.1840522e-003,
	    1.8598621e-003,
	    2.7802151e-003,
	    3.9828263e-003,
	    5.4962252e-003,
	    7.3374938e-003,
	    9.5104679e-003,
	    1.2004510e-002,
	    1.4793934e-002,
	    1.7838135e-002,
	    2.1082435e-002,
	    2.4459630e-002,
	    2.7892178e-002,
	    3.1294938e-002,
	    3.4578348e-002,
	    3.7651889e-002,
	    4.0427695e-002,
	    4.2824111e-002,
	    4.4769071e-002,
	    4.6203098e-002,
	    4.7081811e-002,
	    4.7377805e-002,
	    4.7081811e-002,
	    4.6203098e-002,
	    4.4769071e-002,
	    4.2824111e-002,
	    4.0427695e-002,
	    3.7651889e-002,
	    3.4578348e-002,
	    3.1294938e-002,
	    2.7892178e-002,
	    2.4459630e-002,
	    2.1082435e-002,
	    1.7838135e-002,
	    1.4793934e-002,
	    1.2004510e-002,
	    9.5104679e-003,
	    7.3374938e-003,
	    5.4962252e-003,
	    3.9828263e-003,
	    2.7802151e-003,
	    1.8598621e-003,
	    1.1840522e-003,
	    7.0848037e-004,
	    3.8503956e-004,
	    1.6465231e-004,
	    1.4774946e-019
	};
absorp firTest(char* filename){
	absorp	myAbsorp;

	absorp	myAbsorpdonnee;

	int etat=0;
	FILE* pfFIR=initFichier(filename); //on utilisera le fichier "record1_fir.dat" qui est l'entrée du bloc iir
	float memoire_fir_acr[51]; //on crée le bloc mémoire acr qui mémorisera xn/xn-1/yn-1
	float memoire_fir_acir[51];//on crée le bloc mémoire acr qui mémorisera xn/xn-1/yn-1

	//lecture du fichier ligne à ligne

	myAbsorpdonnee=lireFichier(pfFIR,&etat); //on lit le fichier d'entrée


	while(etat!=EOF) // on parcourt la boucle jusqu'a la fin du fichier
	{
		//on filtre la ligne courante
		myAbsorp=Calculfir(myAbsorpdonnee,memoire_fir_acr,memoire_fir_acir, FIR_TAPS); //on va lancer le calcul qui permettra de filtrer
		myAbsorpdonnee=lireFichier(pfFIR,&etat);

	}
	fclose(pfFIR); //on ferme le fichier précedement ouvert
	return myAbsorp;


}

absorp Calculfir(absorp myAbsorpdonnee,float *memoire_fir_acr,float *memoire_fir_acir,float *FIR_TAPS){
	int k=0;

	absorp somme;
	for(k=0;k<51;k++){
		myAbsorpdonnee.acr+=FIR_TAPS[k]*memoire_fir_acr[51-k];
		somme.acr=myAbsorpdonnee.acr;
		myAbsorpdonnee.acir+=FIR_TAPS[k]*memoire_fir_acir[51-k];
		somme.acir=myAbsorpdonnee.acir;
	}
	
	return somme;

}

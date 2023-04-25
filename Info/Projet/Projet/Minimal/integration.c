#include "define.h"
#include "iir.h"
#include "fir.h"
#include "mesure.h"
#include "fichiers.h"
#include "integration.h"
#include "affichage.h"

void integrationTest(char* filename)
{
	float memoire_fir_acr[51]; //on crée le bloc mémoire acr qui mémorisera xn/xn-1/yn-1
	float memoire_fir_acir[51];//on crée le bloc mémoire acr qui mémorisera xn/xn-1/yn-1
	float memoire_iir_acr[3]; //on crée le bloc mémoire acr qui mémorisera xn/xn-1/yn-1
	float memoire_iir_acir[3];//on crée le bloc mémoire acr qui mémorisera xn/xn-1/yn-1

	//lecture du fichier ligne à ligne
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
	oxy myOxy;

	nbp nb;
	absorp	myAbsorp;
	float vpp_acir=0;
	float vpp_acr=0;
	float RSIR=0;
	int spo2;
	float memo_acr=0;
	int psg0=1;
	float cpt=0;
	int etat=0;
	float periode_finale;
	float pouls=0;
	FILE* INTE=initFichier(filename);
	myAbsorp=lireFichier(INTE,&etat);

	while(etat!=EOF){
		myAbsorp=lireFichier(INTE,&etat);

		//myAbsorp=Calculfir(myAbsorp,memoire_fir_acr,memoire_fir_acir, FIR_TAPS);
		//myAbsorp=Calculiir(myAbsorp,memoire_iir_acr,memoire_iir_acir);
		myOxy=CalculMesure(myAbsorp, myOxy,nb, &memo_acr, &psg0,&cpt);
		printf("spo2: %d \npouls: %d\n", myOxy.spo2, myOxy.pouls);

		affichage(myOxy);
		}

	fclose(INTE);
}


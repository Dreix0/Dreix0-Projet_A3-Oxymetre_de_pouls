#include "iir.h"
#include "fichiers.h"
#include "define.h"

absorp iirTest(char* filename){
	absorp	myAbsorp;
	absorp	myAbsorpdonne;

	int etat=0;
	FILE* pf=initFichier(filename); //on utilisera le fichier "record1_fir.dat" qui est l'entrée du bloc iir
	float memoire_iir_acr[3]; //on crée le bloc mémoire acr qui mémorisera xn/xn-1/yn-1
	float memoire_iir_acir[3];//on crée le bloc mémoire acr qui mémorisera xn/xn-1/yn-1

	//lecture du fichier ligne à ligne

	myAbsorpdonne=lireFichier(pf,&etat); //on lit le fichier d'entrée


	while(etat!=EOF) // on parcourt la boucle jusqu'a la fin du fichier
	{
		//on filtre la ligne courante
		myAbsorp=Calculiir(myAbsorpdonne,memoire_iir_acr,memoire_iir_acir); //on va lancer le calcul qui permettra de filtrer
		myAbsorpdonne=lireFichier(pf,&etat);

	}
	fclose(pf); //on ferme le fichier précedement ouvert
	return myAbsorp;


}

absorp Calculiir(absorp myAbsorpdonne,float *memoire_iir_acr,float *memoire_iir_acir)
{

	float alpha=0.992;

	memoire_iir_acr[0]=myAbsorpdonne.acr; //on donne à xn les valeurs acr du fichier "record1_fir.dat"
	myAbsorpdonne.acr=memoire_iir_acr[0]-memoire_iir_acr[1]+alpha*memoire_iir_acr[2]; //on effectue le calcul de iir et on le sauvergarde dans notre fichier pour acr
	memoire_iir_acr[1]=memoire_iir_acr[0]; //xn-1 prend la valeur de xn
	memoire_iir_acr[2]=myAbsorpdonne.acr; //yn-1 prend la valeur de yn




	memoire_iir_acir[0]=myAbsorpdonne.acir; //on donne à xn les valeurs acir du fichier "record1_fir.dat"
	myAbsorpdonne.acir=memoire_iir_acir[0]-memoire_iir_acir[1]+alpha*memoire_iir_acir[2]; //on effectue le calcul de iir et on le sauvergarde dans notre fichier pour acir

	memoire_iir_acir[1]=memoire_iir_acir[0]; //xn-1 prend la valeur de xn
	memoire_iir_acir[2]=myAbsorpdonne.acir; //yn-1 prend la valeur de yn


	return myAbsorpdonne; //on retrouve les valeurs de acr et acir filtrées par iir cohérentes avec les données dans "record1_iir.dat"


}

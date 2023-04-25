#include "mesure.h"
#include "fichiers.h"
#include "define.h"
oxy mesureTest(char* filename){
	//initialisation des variables
	oxy myOxy;
	//absorp	myAbsorp;
	nbp nb;
	absorp	donneevpp;
	float vpp_acir=0;
	float vpp_acr=0;
	float RSIR=0;

	int spo2;
	float memo_acr;
	int psg0=1;
	float cpt=0;
	int etat=0;
	FILE* VPP=initFichier(filename); //on utilisera le fichier "record1_iir.dat" qui est l'entrée du bloc mesure

	donneevpp=lireFichier(VPP,&etat); //on stocke les données acr, acir, dcr, dcir dans une struct donneevpp

	while(etat!=EOF){ //tant qu'il reste des données dans le fichiers on assigne des valeurs et on le lit
		donneevpp=lireFichier(VPP,&etat);
		myOxy=CalculMesure(donneevpp, myOxy,nb, &memo_acr, &psg0,&cpt); //on appelle le sous-programme pour calculer les spo2 et pouls
	}
	fclose(VPP); // fermeture du fichier
	return myOxy;

}

oxy CalculMesure(absorp donneevpp, oxy myOxy,nbp nb, float* memo_acr, int* psg0,float *cpt){
	//initialisation des variables
	float vpp_acir=0;
	int spo2;
	float RSIR=0;
	float periode_finale;
	float pouls=0;
	float vpp_acr=0;

	if(nb.nbP_acir<donneevpp.acir){ //comparaison de la valeur Positive de acir stockée avec la nouvelle valeur
		nb.nbP_acir=donneevpp.acir; //si elle est plus grande on stocke la nouvelle valeur dans nbP_acir
	}
	if(nb.nbN_acir>donneevpp.acir){ //comparaison de la valeur Negative de acir stockée avec la nouvelle valeur
		nb.nbN_acir=donneevpp.acir;//si elle est plus petite on stocke la nouvelle valeur dans nbN_acir
	}
	if(nb.nbP_acr<donneevpp.acr){//comparaison de la valeur Positive de acr stockée avec la nouvelle valeur
		nb.nbP_acr=donneevpp.acr;//si elle est plus grande on stocke la nouvelle valeur dans nbP_acr
	}
	if(nb.nbN_acr>donneevpp.acr){//comparaison de la valeur Negative de acr stockée avec la nouvelle valeur
		nb.nbN_acr=donneevpp.acr;//si elle est plus petite on stocke la nouvelle valeur dans nbN_acr
	}
	if(*psg0<3){  //on regarde combien de passages à 0 il y a eu
		if(donneevpp.acr>0 && *memo_acr<0){ //si la nouvelle valeur de acr est >0 mais que l'ancienne était <0 alors on augmente la variable psg0 car il y a eu un dépassement
			*psg0+=1;
		}
		 if(donneevpp.acr<0 && *memo_acr>0){ //si la nouvelle valeur de acr est <0 mais que l'ancienne était >0 alors on augmente la variable psg0 car il a y eu un dépassement
			  *psg0+=1;

		 }
		if(*psg0>0){
			*cpt+=1; //on augmente le compteur à chaque tour de boucle
		}
	}
	else{ //si on a dépassé 3 fois 0 on effectue les calculs pour les spo2 et pouls
		vpp_acir=nb.nbP_acir-nb.nbN_acir; //calcul de la valeur peak to peak de acir
		vpp_acr=nb.nbP_acr-nb.nbN_acr; //calcul de la valeur peak to peak de acr
		//if(donneevpp.dcr!=0 && donneevpp.dcir!=0){
			RSIR=(vpp_acr/donneevpp.dcr)/(vpp_acir/donneevpp.dcir); //calcul de la valeur de RSIR

		//}

		//en fonction de la valeur de RSIR calculera spo2 d'une manière différente
		if(RSIR>=0.4 && RSIR<=1){
			spo2=-25*RSIR+110;

		}else if (RSIR>=1 && RSIR<=3.4){
			spo2=-35*RSIR+130;
		}
		myOxy.spo2=spo2; //on stocke la valeur de spo2 dans la struc myOxy
		periode_finale= *cpt/500; // on calcul la période de acr
		pouls=(1/periode_finale)*60; //enfin on calcul le pouls
		myOxy.pouls=pouls; //on stocke le pouls dans myOxy
		//on réinitialise nos variables de struct et nos compteurs
		nb.nbP_acir=0;
		nb.nbN_acir=0;
		nb.nbP_acr=0;
		nb.nbN_acr=0;
		*psg0=1;
		spo2=0;
		*cpt=0;
	}
	//myOxy.spo2=(100/(-3))*RSIR+(100/3)*0.4+100;

	*memo_acr=donneevpp.acr; //on met en mémo la valeur de acr pour pouvoir la comparer à la suite
	return myOxy;
}

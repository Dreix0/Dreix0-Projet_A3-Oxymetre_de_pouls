/*
Projet Oxymétrie -- Année 2022
LE MANACH Mathys & DENOLLE Quentin
Mesure
*/

//Importation des bibliothèques
#include "mesure.h"
#include "define.h"
#include "fichiers.h"

//Fonctions
oxy mesureTest(char* filename){
	//initialisation des variables
	oxy myOxy; //création de myOxy
	absorp	myAbsorp; //création de myAbsorp

	int passage_0=1; //on initialise le compteur passage_0 à 1
	int cpt=0; //on initialise le compteur cpt à 0

	float memo_acr; //on créé memo_acr qui stocke la dernière valeur de acr
	int etat=0; //on initialise l'état à 0
	FILE* mesure_file=initFichier(filename); //on utilisera le fichier "record1_iir.dat" qui est l'entrée du bloc mesure

	myAbsorp=lireFichier(mesure_file,&etat); //on lit les données acr, acir, dcr, dcir

	while(etat!=EOF){ //tant qu'il reste des données dans le fichiers on assigne des valeurs et on le lit
		memo_acr = myAbsorp.acr; //on stocke la valeur acr dans memo_acr
		myAbsorp=lireFichier(mesure_file,&etat); //on lit les données acr, acir, dcr, dcir
		myOxy=CalculMesure(myAbsorp, myOxy, memo_acr, &passage_0,&cpt); //on appelle la fonction CalculMesure pour calculer les spo2 et pouls

	}
	fclose(mesure_file); //on ferme du fichier
	return myOxy; //on retourne myOxy
}

oxy CalculMesure(absorp myAbsorp, oxy myOxy, float memo_acr, int* passage_0,int *cpt){
	//initialisation des variables
	int spo2 = 0;
	float RSIR=0;
	float periode;
	float pouls=0;
	float vpp_acr=0, vpp_acir=0;
	int acir_max = 0, acir_min = 0, acr_max = 0, acr_min = 0;
	
	// On cherche le minimum et le maximum de acir et acr
	
	if(acir_max<myAbsorp.acir){ //si acir_max est plus petit que la nouvelle valeur de acir
		acir_max=myAbsorp.acir; //on remplace acir_max par la valeur acir
	}
	if(acir_min>myAbsorp.acir){ //si acir_min est plus grande que la nouvelle valeur de acir
		acir_min=myAbsorp.acir; //on remplace acir_min par la valeur acir
	}
	if(acr_max<myAbsorp.acr){ //si acr_max est plus petit que la nouvelle valeur de acr
		acr_max=myAbsorp.acr; //on remplace acr_max par la valeur acr
	}
	if(acr_min>myAbsorp.acr){ //si acr_min est plus grande que la nouvelle valeur de acr
		acr_min=myAbsorp.acr; //on remplace acr_min par la valeur acr
	}
	
	//On regarde qu'il y est entre 0 et 2 passage à 0 (une période)
	if(*passage_0<3){  
		if((myAbsorp.acr>0 && memo_acr<0)||(myAbsorp.acr<0 && memo_acr>0)){ //si il y a un passage à 0
			*passage_0+=1;
		}
		if(*passage_0>0){
			*cpt+=1; //on augmente le compteur à chaque tour de boucle
		}
	}
	
	//si on a dépassé 3 fois 0 on effectue les calculs pour les spo2 et pouls
	else{
		vpp_acir=acir_max-acir_min; //calcul de la valeur peak to peak de acir
		vpp_acr=acr_max-acr_min; //calcul de la valeur peak to peak de acr
		RSIR=(vpp_acr/myAbsorp.dcr)/(vpp_acir/myAbsorp.dcir); //calcul de la valeur de RSIR

		//en fonction de la valeur de RSIR calculera spo2 d'une manière différente
		if(RSIR>=0.4 && RSIR<=1){
			spo2=-25*RSIR+110;
		}else if (RSIR>=1 && RSIR<=3.4){
			spo2=-35*RSIR+120;
		}else if(RSIR<0.4){
			spo2=100;
		}else{
			spo2 = 0;
		}
		
		//on calcul la periode et le pouls
		periode= *cpt*0.002;
		pouls=(1/periode)*60;
		printf("Pouls : %f\n",pouls);
		myOxy.pouls=pouls; //on stocke le pouls dans myOxy
		
		//on calcul spo2
		myOxy.spo2=spo2; //on stocke spo2 dans myOxy
		printf("Spo2 : %d\n",spo2);
		
		// Reinitialisation des valeurs passage_0 et cpt
		*passage_0=1;
		*cpt=0;
	}
	return myOxy; //on retourne myOxy
}

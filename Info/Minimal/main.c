/*
Projet Oxymétrie -- Année 2022
LE MANACH Mathys & DENOLLE Quentin
Main
*/

//Importation des bibliothèques
#include <stdio.h>
#include "affichage.h"
#include "define.h"
#include "fichiers.h"
#include "fir.h"
#include "iir.h"
#include "integration.h"
#include "mesure.h"

//Main
int main(){
	oxy myOxy;
	integrationTest("record1.dat");
	printf("\n---\n");
	myOxy = mesureTest("record1_iir.dat");
	return 0;
}
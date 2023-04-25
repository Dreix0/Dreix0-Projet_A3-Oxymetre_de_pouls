#include <string.h>
#include <stdio.h>
#include "affichage.h"
#include "fichiers.h"
#include "mesure.h"
#include "integration.h"
#include "define.h"
#include "iir.h"
#include "fir.h"

int main(){
	integrationTest("record1_iir.dat");
	//printf("%d\n%d\n", myOxy.spo2, myOxy.pouls);


	return EXIT_SUCCESS;
}

#include "define.h"
#include "integration.h"
#include "iir.h"
#include "fir.h"
#include "mesure.h"
#include "fichiers.h" 
#include "affichage.h"

#include <unistd.h>


int main()
{
    int etat_fichier = 1;
    absorp myAbsorp;
    oxy myOxy;
    myOxy.pouls = 0;
    myOxy.spo2 = 0;

    mesureValues mesureValeurs;
    mesureValeurs.min_acr = 0;
    mesureValeurs.max_acr = 0;
    mesureValeurs.min_acir = 0;
    mesureValeurs.max_acir = 0;

    mesureValeurs.compt = 0;
    mesureValeurs.passage_abs = 1;
    mesureValeurs.val_nouv = 0.002;
    mesureValeurs.dernierSignal = 0;
    mesureValeurs.periode = 0;

    /* initialisation de la memoire */
    float **memoire_iir = NULL;
    float **buffer = NULL;
    memoire_iir = initMemoire(2, 2);
    buffer = initMemoire(51, 2);

    /* initialisation et lecture du fichier */
    FILE *pf = fopen("data/record1_bin.dat", "r");
    if (pf == NULL)
    {
        printf("Erreur lors de l'ouverture du fichier.\n");
    }
    
    myAbsorp = lireFichier(pf, &etat_fichier);

    /* boucle jusqu'a la fin du fichier */
    while (etat_fichier != EOF)
    {
        /* lecture() */
        myAbsorp = lireFichier(pf, &etat_fichier);
        /* calcul fir */
        myAbsorp = fir(myAbsorp, buffer);
        /* calcul iir */
        myAbsorp = iir(myAbsorp, memoire_iir);
        /* mesure() */
        myOxy = mesure(myAbsorp, &mesureValeurs, myOxy);
        
        printf("myOxy Final: SpO2 = %d / pouls = %d\n", myOxy.spo2, myOxy.pouls);
        /*printf("myAbsorp FINAL : %f / %f / %f / %f\n", myAbsorp.acr, myAbsorp.dcr,myAbsorp.acir,myAbsorp.dcir);*/
        /*usleep(2000);*/

        /* affichage() */
        affichage(myOxy);
    }
    /* fin de la boucle */

    /* fermeture fichier */
    finFichier(pf);

    /* liberer la memoire */
    memoireLibre(memoire_iir, 2);
    memoireLibre(buffer, 2);

    return EXIT_SUCCESS;
} 


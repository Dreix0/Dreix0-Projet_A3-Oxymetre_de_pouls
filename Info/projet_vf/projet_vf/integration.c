/*----------------------------------------------------------------------------
Projet Info  A3 : Thomas LAVIOLLE et Arthur LE DURAND
------------------------------------------------------------------------------*/

#include "define.h"
#include "iir.h"
#include "fir.h"
#include "mesure.h"
#include "integration.h"
#include "fichiers.h"
#include "affichage.h"


/*---------------------------------------------
* fonction testIntegration()
*
* entrée : fichier à lire
* return : rien
*
* obj : tester toutes les fonctions
*----------------------------------------------*/
void testIntegration(char *filename)
{
    /* déclaration des variables */
    int etat_fichier = 1;
    absorp myAbsorp;

    oxy myOxy;
    myOxy.pouls = 0;
    myOxy.spo2 = 0;

    /* initialisation des valeurs pour la fonction mesures */
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

    /* initialisation des memoires */
    float **memoire_iir = NULL;
    float **buffer = NULL;
    memoire_iir = initMemoire(2, 2);
    buffer = initMemoire(51, 2);

    /* initialisation et lecture du fichier */
    FILE *pf = fopen(filename, "r");
    if (pf == NULL)
    {
        printf("Erreur lors de l'ouverture du fichier.\n");
    }
    myAbsorp = lireFichier(pf, &etat_fichier);

    /* boucle jusqu'a la fin du fichier */
    while (etat_fichier != EOF)
    {
        /* lecture d'une ligne du fichier */
        myAbsorp = lireFichier(pf, &etat_fichier);
        /* calcul fir */
        myAbsorp = fir(myAbsorp, buffer);
        /* calcul iir */
        myAbsorp = iir(myAbsorp, memoire_iir);
        /* fonction mesure() */
        myOxy = mesure(myAbsorp, &mesureValeurs, myOxy);

        printf("myOxy Final: SpO2 = %d / pouls = %d\n", myOxy.spo2, myOxy.pouls);

        /* affichage() */
        affichage(myOxy);
    }


    
    /* fermeture du fichier */
    finFichier(pf);

    /* vider les memoires */
    memoireLibre(memoire_iir, 2);
    memoireLibre(buffer, 2);

}

/*---------------------------------------------
* fonction memoireLibre()
*
* entrée : taille de la  memoire
* sortie : rien
*
* obj : fonction pour liberer la memoire
*----------------------------------------------*/
void memoireLibre(float **tab, int x)
{
    int i = 0;

    for (i = 0; i < x; i++)
    {
        free(tab[i]);
    }

    free(tab);
    tab = NULL;
}



/*----------------------------------------------------------------------------
Projet Info  A3 : Thomas LAVIOLLE et Arthur LE DURAND
------------------------------------------------------------------------------*/

/* INCLUDES */
#include "iir.h"
#include "fichiers.h"
#include "fir.h"


/*---------------------------------------------
* fonction iirTest()
*
* entrée : fichier à lire
* sortie : structure absorp
*
* obj : test de la fonction irr
*----------------------------------------------*/

absorp iirTest(char* filename)
{
	/* déclaration des variables */
    absorp myAbsorp;
    absorp outData;
    FILE *pf = initFichier(filename);

    int etat_fichier = 1;
    float **memoire_iir = NULL;

    /* initialisation de la memoire */
    memoire_iir = initMemoire(2, 2);
    
    /* boucle jusqu'a la fin du fichier */
    while (etat_fichier != EOF)
    {
        /* recuperer la data du fichier */
        myAbsorp = lireFichier(pf, &etat_fichier);
        /* trier la bonne valeur */
        if (etat_fichier == 6)
        {
            outData.acr = myAbsorp.acr;
            outData.dcr = myAbsorp.dcr;
            outData.acir = myAbsorp.acir;
            outData.dcir = myAbsorp.dcir;
            /* filtre iir */
            outData = iir(outData, memoire_iir);
        }
    }
    /* fermeture du fichier */
    finFichier(pf);

    /* retourne la data */
    return outData;
} 

/*---------------------------------------------
* function iir()
*
* entrée : structure absorp et memoire pour les calcules
* sortie : structure absorp
*
* obj : appliquer le filtre iir
*----------------------------------------------*/
absorp iir(absorp myAbsorp, float **memoire_iir)
{
    /* y(n) = x[n] − x[n − 1] + 0.992 * y[n − 1] */
    memoire_iir[0][1] = myAbsorp.acr - memoire_iir[0][0] + 0.992 * memoire_iir[0][1];
    memoire_iir[1][1] = myAbsorp.acir - memoire_iir[1][0] + 0.992 * memoire_iir[1][1];

    /* mettre le x[n] actuel en memoire */
    memoire_iir[0][0] = myAbsorp.acr;
    memoire_iir[1][0] = myAbsorp.acir;

    /* envoie du nouveau y[n] */
    myAbsorp.acr = memoire_iir[0][1];
    myAbsorp.acir = memoire_iir[1][1];

    return myAbsorp;
}

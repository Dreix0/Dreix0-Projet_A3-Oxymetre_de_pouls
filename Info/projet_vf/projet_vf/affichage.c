/*----------------------------------------------------------------------------
Projet Info  A3 : Thomas LAVIOLLE et Arthur LE DURAND
------------------------------------------------------------------------------*/

#include "affichage.h"
#include "fichiers.h"

/*---------------------------------------------
 * fonction affichage()
 *
 * entrée : data à afficher : structure oxy
 * sortie : fichier Data.txt
 *
 * objectif : écrire 'bpm' et 'spo2' dans le fichier
 *----------------------------------------------*/

void affichage(oxy myOxy)
{
    /* déclaration des variables */
    FILE *verrou = NULL;
    FILE *data = NULL;

    /* ouverture du fichier .verrouData */
    verrou = fopen(".verrouData", "w");

    /* Si .verrouData éxiste */
    if (access(".verrouData", F_OK) != -1)
    {
        /* printf("le fichier existe"); */
    }
       
    /* Si .verrouData est crée */
    if (verrou != NULL)
    {
        /* ouverture fichier Data.txt */
        data = fopen("Data.txt", "w");
        /* ecriture de 'spo2' and 'pouls' dans le fichier */
        fprintf(data, "%d\n%d", myOxy.spo2, myOxy.pouls);
        /* fermeture de Data.txt */
        finFichier(data);
        /* fermeture et suppression de .verrouData */
        finFichier(verrou);
        remove(".verrouData");
    }
    
}
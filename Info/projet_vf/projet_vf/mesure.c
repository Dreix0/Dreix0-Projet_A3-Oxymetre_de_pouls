/*----------------------------------------------------------------------------
Projet Info  A3 : Thomas LAVIOLLE et Arthur LE DURAND
------------------------------------------------------------------------------*/

/* INCLUDES */
#include "mesure.h"
#include "fichiers.h"

/*---------------------------------------------
* fonction mesureTest()
*
* entrée : fichier à lire 
* sortie : structure oxy
*
* obj : test mesure, retourne spo2 et pouls
*----------------------------------------------*/
oxy mesureTest(char *filename)
{
    /* déclaration des variables */
    oxy myOxy;
    myOxy.pouls = 0;
    myOxy.spo2 = 0;

    absorp myAbsorp;
    int etat_fichier = 1;
    
    /* initialisation des valeurs pour la fonction mesure */
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

    /* initialisation du fichier */
    FILE *data = initFichier(filename);

    /* boucle jusqu'a la fin du fichier */
    while (etat_fichier != EOF)
    {
        /* recupérer la data du fichier */
        myAbsorp = lireFichier(data, &etat_fichier);

        /* Si c'est la bonne ligne */
        if (etat_fichier == 6)
        {
            /* on fait le calcul mesure */
            myOxy = mesure(myAbsorp, &mesureValeurs, myOxy);
        }
    }
    /* fermeture du fichier */
    finFichier(data);

    /* retourne spo2 et pouls */
    return myOxy;
}

/*---------------------------------------------
* fonction mesure()
*
* entrée : structure absorp , structure mesureValues et structure oxy 
* sortie : structure oxy
*
* obj : mesure, renvoie spo2 et pouls dans la structure oxy
*----------------------------------------------*/
oxy mesure(absorp myAbsorp, mesureValues* mesureValeurs, oxy myOxy)
{
    /* déclaration des variables */
    float ptp_acr, ptp_acir, rsir, spo2, pouls;

    /* obtenir le min et le max du signal */
    if (myAbsorp.acr > mesureValeurs->max_acr)
    {
        mesureValeurs->max_acr = myAbsorp.acr;
    }
    if (myAbsorp.acr < mesureValeurs->min_acr)
    {
        mesureValeurs->min_acr = myAbsorp.acr;
    }
    if (myAbsorp.acir > mesureValeurs->max_acir)
    {
        mesureValeurs->max_acir = myAbsorp.acir;
    }
    if (myAbsorp.acir < mesureValeurs->min_acir)
    {
        mesureValeurs->min_acir = myAbsorp.acir;
    }

    /* scan la position du signal pour calculer la période */
    if (mesureValeurs->passage_abs < 3)
    {
        if (myAbsorp.acr < 0 && mesureValeurs->dernierSignal > 0)
        {
            mesureValeurs->passage_abs = mesureValeurs->passage_abs + 1;
        }
        else if (myAbsorp.acr > 0 && mesureValeurs->dernierSignal < 0)
        {
            mesureValeurs->passage_abs = mesureValeurs->passage_abs + 1;
        }
        if (mesureValeurs->passage_abs > 0)
        {
            mesureValeurs->compt = mesureValeurs->compt + 1;
        }
    }
    else
    {
        /* calcule la valeur peak to peak */
        ptp_acr = mesureValeurs->max_acr - mesureValeurs->min_acr;
        ptp_acir = mesureValeurs->max_acir - mesureValeurs->min_acir;

        /* calcule rsir */
        if (myAbsorp.dcr != 0 && myAbsorp.dcir != 0)
        {
            rsir = (ptp_acr / myAbsorp.dcr) / (ptp_acir / myAbsorp.dcir);
        }
        /* calcule 'spo2' */
        if (rsir > 0.4 && rsir < 1)
        {
            spo2 = -25 * rsir + 110;
        }
        else if (rsir > 1 && rsir < 3.4)
        {
            spo2 = -35 * rsir + 120;
        }
        /* sauvegarde de 'spo2' */
        myOxy.spo2 = (int)spo2;

        /* calcule de la periode 'T' */
        mesureValeurs->periode = mesureValeurs->compt * mesureValeurs->val_nouv;
        /* calcule du 'pouls' */
        pouls = 60 / mesureValeurs->periode;
        /* sauvegarde de 'pouls' */
        myOxy.pouls = (int)pouls;

        /* re-initialisation des variables */
        mesureValeurs->min_acr = 0;
        mesureValeurs->max_acr = 0;
        mesureValeurs->min_acir = 0;
        mesureValeurs->max_acir = 0;

        mesureValeurs->compt = 0;
        mesureValeurs->passage_abs = 1;
    }
    /* stock last signal */
    mesureValeurs->dernierSignal = myAbsorp.acr;

    /* return 'pouls' and 'spo2' */
    return myOxy;
}


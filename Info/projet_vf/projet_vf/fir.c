/*----------------------------------------------------------------------------
Projet Info  A3 : Thomas LAVIOLLE et Arthur LE DURAND
------------------------------------------------------------------------------*/

/* INCLUDES */
#include "fir.h"
#include "fichiers.h"

/*---------------------------------------------
* fonction initMemory()
*
* entrée : taille de la memoire : int x,y
* retour : table
*
* objectif : attribuer la memoire et retourner une table
*----------------------------------------------*/
float **initMemoire(int x, int y)
{
    /* déclaration des variables */
    int i, j;
    float **table = NULL;

    table = malloc(y * sizeof(*table));
    /* Si l'attribution de la memoire est correcte */
    if (table != NULL)
    {
        for (i = 0; i < y; i++)
        {
            table[i] = malloc(x * sizeof(**table));
            /* Si l'attribution n'est pas correcte */
            if (table[i] == NULL)
            {
                /* affichage erreure */
                printf("Erreur d'attribution de la memoire.\n");
                /* free table memory */
                for (i = i - 1; i >= 0; i--)
                {
                    free(table[i]);
                }
                free(table);
                exit(-2);
            }
        }
        /* if all is alright, fill table of '0' */
        for (i = 0; i < y; i++)
        {
            for (j = 0; j < x; j++)
            {
                table[i][j] = 0;
            }
        }
    }
    else
    {
        /* if allocation are not ok : show error */
        printf("Erreur d'allocation de la memoire.\n");
        exit(-1);
    }

    return table;
}

/*---------------------------------------------
* fonction firTest()
*
* entrée : fichier à lire
* retour : structure absorp
*
* obj : test de la fonction fir
*----------------------------------------------*/

absorp firTest(char* filename)
{
	/* déclaration des variables */
	absorp	myAbsorp;
	absorp outData;
	FILE *pf = initFichier(filename);

    int etat_fichier = 1;
    float** buffer = NULL;
	
    /* initialisation de la memoire */
	buffer = initMemoire(51,2);

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
            /* filtre fir */
            outData = fir(outData, buffer);
        }
    }
    /* fermeture du fichier */
    finFichier(pf);

    /* retourne la data */
    return outData;
} 

absorp fir(absorp myAbsorp, float** buffer)
{
	/* déclaration des variables*/
	const float FIR_TAPS[51] = {1.4774946e-019,1.6465231e-004,3.8503956e-004,7.0848037e-004,1.1840522e-003,1.8598621e-003,2.7802151e-003,3.9828263e-003,5.4962252e-003,7.3374938e-003,9.5104679e-003,1.2004510e-002,1.4793934e-002,1.7838135e-002,2.1082435e-002,2.4459630e-002,2.7892178e-002,3.1294938e-002,3.4578348e-002,3.7651889e-002,4.0427695e-002,4.2824111e-002,4.4769071e-002,4.6203098e-002,4.7081811e-002,4.7377805e-002,4.7081811e-002,4.6203098e-002,4.4769071e-002,4.2824111e-002,4.0427695e-002,3.7651889e-002,3.4578348e-002,3.1294938e-002,2.7892178e-002,2.4459630e-002,2.1082435e-002,1.7838135e-002,1.4793934e-002,1.2004510e-002,9.5104679e-003,7.3374938e-003,5.4962252e-003,3.9828263e-003,2.7802151e-003,1.8598621e-003,1.1840522e-003,7.0848037e-004,3.8503956e-004,1.6465231e-004,1.4774946e-019};
	int k, i = 0;
	float memoire_fir[2] = {0};
	
	/* décalage à gauche */
	for (i = 1; i <= 50; i++)
	{			
		buffer[0][i - 1] = buffer[0][i];
		buffer[1][i - 1] = buffer[1][i];
	}
	/* sauvegarde de la valeur */
	buffer[0][50] = myAbsorp.acr;
	buffer[1][50] = myAbsorp.acir;

	/* y[n] = somme(h[k] * x[n - k]) */
	for (k = 0; k <= 50; k++)
	{
		memoire_fir[0] += FIR_TAPS[k] * buffer[0][50 - k];
		memoire_fir[1] += FIR_TAPS[k] * buffer[1][50 - k];

		/* valeur à envoyer */
		myAbsorp.acr = memoire_fir[0];
		myAbsorp.acir = memoire_fir[1];
	}
	return myAbsorp;

}
#ifndef DEFINE_H
#define DEFINE_H

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

/*! ------------------------------------------------------------
  
  \struct absorp
 
  \brief measures
  
  ------------------------------------------------------------*/

typedef struct{
		float acr;  /*!< AC R */
		float dcr;  /*!< DC R */
		float acir;  /*!< AC IR */
		float dcir;  /*!< DC IR */
	} absorp;

/*! ------------------------------------------------------------
  
  \struct oxy
 
  \brief   
  
  ------------------------------------------------------------*/

typedef struct{
		int spo2;  /*!< SPO2 */
		int pouls;  /*!< Pouls */
	} oxy;

typedef struct{
		float nbP_acir; // Valeur Positive de acir
		float nbN_acir; // Valeur Negative de acir
		float nbP_acr; // Valeur Positive de acr
		float nbN_acr; // Valeur Negative de acr
	} nbp;


#endif // DEFINE_H

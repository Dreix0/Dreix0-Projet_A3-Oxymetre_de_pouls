/*----------------------------------------------------------------------------
Projet Info  A3 : Thomas LAVIOLLE et Arthur LE DURAND
------------------------------------------------------------------------------*/

#ifndef DEFINE_H
#define DEFINE_H

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct{
		float acr;  /*!< AC R */
		float dcr;  /*!< DC R */
		float acir;  /*!< AC IR */
		float dcir;  /*!< DC IR */
	} absorp;

typedef struct{
		int spo2;  /*!< SPO2 */
		int pouls;  /*!< Pouls */
	} oxy;

#endif 

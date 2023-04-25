/*----------------------------------------------------------------------------
Projet Info  A3 : Thomas LAVIOLLE et Arthur LE DURAND
------------------------------------------------------------------------------*/

#ifndef MESURE_H
#define MESURE_H

#include "define.h"

/* Struct mesureValues : to stock all values for mesure function */
typedef struct
{
  /* min and max of ACR and ACIR */
  float min_acr;
  float max_acr;
  float min_acir;
  float max_acir;
  
  int compt, passage_abs;
  float val_nouv;
  float periode;
  float dernierSignal;
} mesureValues;

oxy mesureTest(char *filename);
oxy mesure(absorp myAbsorp, mesureValues* mesureVals, oxy myOxy);

#endif

	

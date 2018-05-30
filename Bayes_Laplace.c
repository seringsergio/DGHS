/*
 * Copyright (c) 2010, Swedish Institute of Computer Science.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the Institute nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE INSTITUTE AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE INSTITUTE OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 * This file is part of the Contiki operating system.
 *
 */

#include "Bayes_Laplace.h"


/////////////////////////////////////////////////////////////////////////////
/////////////////////// ARRAY ///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////



float likelihood[ROWS_T][COLUMNS_T];

const uint8_t frequency_table[ROWS_T][COLUMNS_T] =
{
  {3, 0},
  {1, 1},
  {0, 3}
};

 /////////////////////////////////////////////////////////////////////////////
 ///////////////////////FUNCTIONS/////////////////////////////////////////////
 /////////////////////////////////////////////////////////////////////////////

void calculate_likelihood(const uint8_t frequency_table[ROWS_T][COLUMNS_T], float likelihood[ROWS_T][COLUMNS_T])
{
  uint8_t i,j;

  uint8_t N_array[COLUMNS_T] = {0,0}  ;



  //The likelihood is equal to

  // P = ( Count_Xi + k ) /  ( N + k * |Count_Xi| )

  //REF https://classes.soe.ucsc.edu/cmps140/Winter17/slides/3.pdf



  for(j = 0; j < COLUMNS_T ; j = j + 1 )
  {
    for(i = 0; i < ROWS_T; i = i + 1 )
    {
      N_array[j] =  N_array[j] + frequency_table[i][j];

    }
  }

  for(j = 0; j < COLUMNS_T ; j = j + 1 )
  {
     DGHS_DBG_2("%d ", N_array[j]);
  }

  DGHS_DBG_2("\n");

  /*for(i = 0; i < ROWS_T; i = i + 1 )
  {
    for(j = 0; j < COLUMNS_T ; j = j + 1 )
    {
      DGHS_DBG_2("%d ", frequency_table[i][j] );
    }
    DGHS_DBG_2("\n");
  }*/

}

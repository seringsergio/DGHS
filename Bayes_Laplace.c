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
  char res[20]; //to print the float variable

  uint8_t N_array[COLUMNS_T] = {0,0}  ;

  //
  calculate_N(frequency_table,N_array);

  //The likelihood is equal to

  // likelihood = ( frequency_table + K_laplace ) /  ( N_array + k * ROWS_T )

  //REF https://classes.soe.ucsc.edu/cmps140/Winter17/slides/3.pdf

  for(i = 0; i < ROWS_T; i = i + 1 )
  {
    for(j = 0; j < COLUMNS_T ; j = j + 1 )
    {
      //Make the cast to have a correct calculation
      likelihood[i][j] = ( (float) frequency_table[i][j] + (float) K_laplace ) /
                         ( (float) N_array[j] + ( (float) K_laplace * (float) ROWS_T )  );

      ftoa(likelihood[i][j], res, 4);
      DGHS_DBG_2("%s ", res);
    }
    DGHS_DBG_2("\n");
  }

}


void calculate_N(const uint8_t frequency_table[ROWS_T][COLUMNS_T], uint8_t N_array[COLUMNS_T])
{

  uint8_t i,j;

  for(j = 0; j < COLUMNS_T ; j = j + 1 )
  {
    for(i = 0; i < ROWS_T; i = i + 1 )
    {
      N_array[j] =  N_array[j] + frequency_table[i][j];

    }
  }

  //print
  /*for(j = 0; j < COLUMNS_T ; j = j + 1 )
  {
     DGHS_DBG_2("%d ", N_array[j]);
  }
  DGHS_DBG_2("\n");*/
}




//-----------------------------------------------------------------------------
//------------------FUNCTIONS TO PRINT FLOAT-----------------------------------
//-----------------------------------------------------------------------------
// reverse(), intToStr(), ftoa(), ipow()
//REF https://www.geeksforgeeks.org/convert-floating-point-number-string/
//REF https://stackoverflow.com/questions/101439/the-most-efficient-way-to-implement-an-integer-based-power-function-powint-int
/*
ftoa(n, res, afterpoint)
n          --> Input Number
res[]      --> Array where output string to be stored
afterpoint --> Number of digits to be considered after point.

For example ftoa(1.555, str, 2) should store "1.55" in res and
ftoa(1.555, str, 0) should store "1" in res.*/


// reverses a string 'str' of length 'len'
void reverse(char *str, int len)
{
    int i=0, j=len-1, temp;
    while (i<j)
    {
        temp = str[i];
        str[i] = str[j];
        str[j] = temp;
        i++; j--;
    }
}

 // Converts a given integer x to string str[].  d is the number
 // of digits required in output. If d is more than the number
 // of digits in x, then 0s are added at the beginning.
int intToStr(int x, char str[], int d)
{
    int i = 0;
    while (x)
    {
        str[i++] = (x%10) + '0';
        x = x/10;
    }

    // If number of digits required is more, then
    // add 0s at the beginning
    while (i < d)
        str[i++] = '0';

    reverse(str, i);
    str[i] = '\0';
    return i;
}

// Converts a floating point number to string.
void ftoa(float n, char *res, int afterpoint)
{
    // Extract integer part
    int ipart = (int)n;

    // Extract floating part
    float fpart = n - (float)ipart;

    // convert integer part to string
    int i = intToStr(ipart, res, 0);

    // check for display option after point
    if (afterpoint != 0)
    {
        res[i] = '.';  // add dot

        // Get the value of fraction part upto given no.
        // of points after dot. The third parameter is needed
        // to handle cases like 233.007

        //fpart = fpart * pow(10, afterpoint);
        fpart = fpart * ipow(10, afterpoint);

        intToStr((int)fpart, res + i + 1, afterpoint);
    }
}


int ipow(int base, int exp)
{
    int result = 1;
    for (;;)
    {
        if (exp & 1)
            result *= base;
        exp >>= 1;
        if (!exp)
            break;
        base *= base;
    }

    return result;
}

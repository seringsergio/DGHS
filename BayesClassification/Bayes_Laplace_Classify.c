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

#include "Bayes_Laplace_Classify.h"


/////////////////////////////////////////////////////////////////////////////
/////////////////////// ARRAY ///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////



float likelihood[ROWS_T][COLUMNS_T];

const uint8_t frequency_table_btp[ROWS_T][COLUMNS_T] =
{
        /*0*/   /*1*/  /*2*/  /*3*/  /*4*/  /*5*/  /*6*/  /*7*/  /*8*/  /*9*/  /*10*/
/*0*/   {174  ,  11  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0},
/*1*/   {  0  ,  86  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0},
/*2*/   {  0  ,  74  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0},
/*3*/   {  0  ,   3  ,  42  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0},
/*4*/   {  0  ,   0  ,  60  ,  10  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0},
/*5*/   {  0  ,   0  ,  39  ,  24  ,   1  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0},
/*6*/   {  0  ,   0  ,  29  ,  38  ,   5  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0},
/*7*/   {  0  ,   0  ,   4  ,  60  ,  20  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0},
/*8*/   {  0  ,   0  ,   0  ,  29  ,  16  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0},
/*9*/   {  0  ,   0  ,   0  ,   9  ,  37  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0},
/*10*/  {  0  ,   0  ,   0  ,   4  ,  57  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0},
/*11*/  {  0  ,   0  ,   0  ,   0  ,  31  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0},
/*12*/  {  0  ,   0  ,   0  ,   0  ,   6  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0},
/*13*/  {  0  ,   0  ,   0  ,   0  ,   1  ,   5  ,   0  ,   0  ,   0  ,   0  ,   0},
/*14*/  {  0  ,   0  ,   0  ,   0  ,   0  ,  14  ,   0  ,   0  ,   0  ,   0  ,   0},
/*15*/  {  0  ,   0  ,   0  ,   0  ,   0  ,  26  ,   0  ,   0  ,   0  ,   0  ,   0},
/*16*/  {  0  ,   0  ,   0  ,   0  ,   0  ,  36  ,   0  ,   0  ,   0  ,   0  ,   0},
/*17*/  {  0  ,   0  ,   0  ,   0  ,   0  ,  32  ,   0  ,   0  ,   0  ,   0  ,   0},
/*18*/  {  0  ,   0  ,   0  ,   0  ,   0  ,  23  ,   1  ,   0  ,   0  ,   0  ,   0},
/*19*/  {  0  ,   0  ,   0  ,   0  ,   0  ,  21  ,  17  ,   0  ,   0  ,   0  ,   0},
/*20*/  {  0  ,   0  ,   0  ,   0  ,   0  ,  13  ,  27  ,   0  ,   0  ,   0  ,   0},
/*21*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   4  ,  20  ,   0  ,   0  ,   0  ,   0},
/*22*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  30  ,   0  ,   0  ,   0  ,   0},
/*23*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  23  ,   0  ,   0  ,   0  ,   0},
/*24*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  12  ,   0  ,   0  ,   0  ,   0},
/*25*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  26  ,   0  ,   0  ,   0  ,   0},
/*26*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   5  ,   0  ,   0  ,   0  ,   0},
/*27*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   7  ,   4  ,   0  ,   0  ,   0},
/*28*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   1  ,   7  ,   0  ,   0  ,   0},
/*29*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   5  ,  17  ,   2  ,   0  ,   0},
/*30*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  25  ,   2  ,   2  ,   0},
/*31*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  45  ,  17  ,   9  ,   0},
/*32*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  42  ,  25  ,  10  ,   9},
/*33*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  21  ,  52  ,  18  ,  25},
/*34*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  13  ,  46  ,  23  ,  38},
/*35*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  23  ,  37  ,  45},
/*36*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   4  ,  43  ,  22},
/*37*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   3  ,  27  ,  21},
/*38*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   5  ,  13},
/*39*/  {  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   1}

};


const uint8_t frequency_table_ppl[ROWS_T][COLUMNS_T] =
{
          /*0*/   /*1*/  /*2*/  /*3*/  /*4*/  /*5*/  /*6*/  /*7*/  /*8*/  /*9*/  /*10*/
/*0*/  {  174  , 174  , 174  , 174  , 174  , 150  ,  92  ,   0  ,   0  ,   0  ,   0},
/*1*/  {    0  ,   0  ,   0  ,   0  ,   0  ,  13  ,  47  ,   0  ,   0  ,   0  ,   0},
/*2*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   8  ,  27  ,   6  ,   0  ,   0  ,   0},
/*3*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   2  ,   4  ,   2  ,   0  ,   0  ,   0},
/*4*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   1  ,   4  ,   7  ,   0  ,   0  ,   0},
/*5*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   7  ,   0  ,   0  ,   0},
/*6*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  23  ,   0  ,   0  ,   0},
/*7*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  16  ,   0  ,   0  ,   0},
/*8*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  34  ,   0  ,   0  ,   0},
/*9*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  14  ,   0  ,   0  ,   0},
/*10*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  23  ,   0  ,   0  ,   0},
/*11*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  16  ,   0  ,   0  ,   0},
/*12*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  15  ,   0  ,   0  ,   0},
/*13*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  10  ,   1  ,   0  ,   0},
/*14*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0},
/*15*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   1  ,   3  ,   0  ,   0},
/*16*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   8  ,   0  ,   0},
/*17*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  12  ,   0  ,   0},
/*18*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  11  ,   0  ,   0},
/*19*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  20  ,   0  ,   0},
/*20*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  21  ,   0  ,   0},
/*21*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  17  ,   0  ,   0},
/*22*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  13  ,   0  ,   0},
/*23*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   6  ,   0  ,   0},
/*24*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  10  ,   0  ,   0},
/*25*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  20  ,   3  ,   0},
/*26*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  11  ,   3  ,   0},
/*27*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  11  ,   5  ,   0},
/*28*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   2  ,   7  ,   0},
/*29*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   1  ,  20  ,   0},
/*30*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   4  ,  34  ,   0},
/*31*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   1  ,   6  ,   0},
/*32*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   2  ,   6  ,   0},
/*33*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   3  ,   0},
/*34*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  20  ,   0},
/*35*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  51  ,   0},
/*36*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,  10  ,   0},
/*37*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   6  ,   3},
/*38*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   7},
/*39*/  {    0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  , 164}

};

//{
//  {3, 0},
//  {1, 1},
//  {0, 3}
//};

 /////////////////////////////////////////////////////////////////////////////
 ///////////////////////FUNCTIONS/////////////////////////////////////////////
 /////////////////////////////////////////////////////////////////////////////



void calculate_likelihood(const uint8_t frequency_table[ROWS_T][COLUMNS_T], float likelihood[ROWS_T][COLUMNS_T])
{
  uint8_t i,j;
  //char res[20]; //to print the float variable

  uint8_t N_array[COLUMNS_T] = {0,0,0,0,0,0,0,0,0,0,0};

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

      //ftoa(likelihood[i][j], res, 4);
      //printf("%s ", res);
    }
    //printf("\n");
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
     printf("%d ", N_array[j]);
  }
  printf("\n");*/
}

float calculate_probability_of_event(const uint8_t frequency_table[ROWS_T][COLUMNS_T], struct event event )
{
  static float class_prob[COLUMNS_T]; //CAN'T remove static: it would not work
  static float likelihood[ROWS_T][COLUMNS_T]; //CAN'T remove static: it would not work
  static float probability_of_event; //CAN'T remove static: it would not work

  //char res1[20]; //to print the float variable
  //char res2[20]; //to print the float variable
  //char res3[20]; //to print the float variable

  //calculate the prob of the class
  calculate_class_prob(frequency_table, class_prob);

  //Calculate the likelihood
  calculate_likelihood(frequency_table, likelihood);

  probability_of_event = class_prob[event.column] * likelihood[event.row][event.column];

  //ftoa(probability_of_event, res1, 4);
  //ftoa(class_prob[event.column], res2, 4);
  //ftoa(likelihood[event.row][event.column], res3, 4);
  //printf("%s = %s * %s \n", res1, res2, res3);

  return probability_of_event;

}

void calculate_class_prob(const uint8_t frequency_table[ROWS_T][COLUMNS_T], float class_prob[COLUMNS_T])
{
  uint8_t j;
  uint8_t N_array[COLUMNS_T] = {0,0,0,0,0,0,0,0,0,0,0};
  //char res[20]; //to print the float variable

  calculate_N(frequency_table,N_array);

  for(j = 0; j < COLUMNS_T; j = j + 1 )
  {
    class_prob[j] = ( (float) N_array[j] + (float) K_laplace ) /
                    ( (float) calculate_N_class(frequency_table) + ( (float) K_laplace * (float) COLUMNS_T  ) );

    /*printf("%d + %d / %d + %d*%d     ", N_array[j], K_laplace, calculate_N_class(frequency_table)
                                        ,K_laplace, COLUMNS_T );*/

    //ftoa(class_prob[j], res, 4);
    //printf("%s ", res);
  }
  //printf("\n");

}

uint8_t calculate_N_class(const uint8_t frequency_table[ROWS_T][COLUMNS_T] )
{
  uint8_t N_class = 0;
  uint8_t i,j;

  for(i = 0; i < ROWS_T; i = i + 1 )
  {
    for(j = 0; j < COLUMNS_T ; j = j + 1 )
    {
      N_class = N_class + frequency_table[i][j];
    }
  }

  return N_class;

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

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

#ifndef BAYES_LAPLACE_H
#define BAYES_LAPLACE_H

#include "example-DGHS.h"

// for printing float numbers
#include <math.h>
#include <stdlib.h>

/////////////////////////////////////////////////////////////////////////////
///////////////////////DEFINE////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

#define ROWS_T       3  //Rows of the table
#define COLUMNS_T    2  //Columns of the table

//Defines for the Naive Bayesian Classifier with Laplace Smoothing

#define K_laplace 1


typedef enum
{
    DEC1 = 10,
    DEC2 = 100,
    DEC3 = 1000,
    DEC4 = 10000,
    DEC5 = 100000,
    DEC6 = 1000000,

} tPrecision ;



/////////////////////////////////////////////////////////////////////////////
/////////////////////// ARRAY ///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

extern float likelihood[ROWS_T][COLUMNS_T];

extern const uint8_t frequency_table[ROWS_T][COLUMNS_T];

/////////////////////////////////////////////////////////////////////////////
///////////////////////STRUCTS///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

struct event
{
  uint8_t row;
  uint8_t column;
};

/////////////////////////////////////////////////////////////////////////////
///////////////////////FUNCTIONS/////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

void calculate_likelihood(const uint8_t frequency_table[ROWS_T][COLUMNS_T], float likelihood[ROWS_T][COLUMNS_T]);
void calculate_N(const uint8_t frequency_table[ROWS_T][COLUMNS_T], uint8_t N_array[COLUMNS_T]);
uint8_t calculate_N_class(const uint8_t frequency_table[ROWS_T][COLUMNS_T] );
void calculate_class_prob(const uint8_t frequency_table[ROWS_T][COLUMNS_T], float class_prob[COLUMNS_T]);
float calculate_probability_of_event(const uint8_t frequency_table[ROWS_T][COLUMNS_T], struct event event ); 


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

void reverse(char *str, int len);
int intToStr(int x, char str[], int d);
void ftoa(float n, char *res, int afterpoint);
int ipow(int base, int exp); //Instead of pow that is not included in math.h









#endif /* BAYES_LAPLACE_H */

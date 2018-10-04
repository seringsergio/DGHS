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

//contiki libraries
#include "lib/list.h"
#include "contiki.h"
#include "lib/memb.h"
#include "lib/random.h"
#include "net/rime/rime.h"
#include <stdio.h>

// for printing float numbers
#include <math.h>
#include <stdlib.h>

/////////////////////////////////////////////////////////////////////////////
///////////////////////DEFINE////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

#define ROWS_T       40  //Rows of the table
#define COLUMNS_T    11  //Columns of the table

//matlab
#define range_EWMA_btp_01   1050.4f
#define range_ppl           1.0f
#define num_divisions_ppl   ROWS_T
#define num_divisions_btp   ROWS_T
//////////////////////////

// Exponential weighted moving average (EWMA)
#define WINDOW_NUM_PACKETS 5
#define EWMA_ALPHA_01 0.10f //The f indicates it is a float value
#define EWMA_ALPHA_02 0.20f //The f indicates it is a float value
#define EWMA_ALPHA_03 0.30f //The f indicates it is a float value
#define EWMA_ALPHA_04 0.40f //The f indicates it is a float value
#define EWMA_ALPHA_05 0.50f //The f indicates it is a float value
#define EWMA_ALPHA_06 0.60f //The f indicates it is a float value
#define EWMA_ALPHA_07 0.70f //The f indicates it is a float value
#define EWMA_ALPHA_08 0.80f //The f indicates it is a float value
#define EWMA_ALPHA_09 0.90f //The f indicates it is a float value

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
///////////////////////STRUCTS///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

//Stores the stats comming from csma.c
struct csma_stats
{
 uint16_t packets_dropped; //We can count up to 65535 message lost
 uint16_t delay;
};

struct csma_results
{
  float ppl; // ppl (Percentage of Packet Loss)
  float btp; // btp (Backoff Time per packet)
  float EWMA_btp_01;
  float EWMA_ppl_01;
};



/////////////////////////////////////////////////////////////////////////////
/////////////////////// ARRAY ///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

extern float likelihood[ROWS_T][COLUMNS_T];

extern const uint8_t frequency_table_btp[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl[ROWS_T][COLUMNS_T];

/////////////////////////////////////////////////////////////////////////////
///////////////////////STRUCTS///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

struct event
{
  uint8_t row;
  uint8_t column;
};

struct detected_event
{
  uint8_t event_btp;
  uint8_t event_ppl;
};
/////////////////////////////////////////////////////////////////////////////
///////////////////////FUNCTIONS/////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

void calculate_likelihood(const uint8_t frequency_table[ROWS_T][COLUMNS_T], float likelihood[ROWS_T][COLUMNS_T]);
void calculate_N(const uint8_t frequency_table[ROWS_T][COLUMNS_T], uint8_t N_array[COLUMNS_T]);
uint8_t calculate_N_class(const uint8_t frequency_table[ROWS_T][COLUMNS_T] );
void calculate_class_prob(const uint8_t frequency_table[ROWS_T][COLUMNS_T], float class_prob[COLUMNS_T]);
float calculate_probability_of_event(const uint8_t frequency_table[ROWS_T][COLUMNS_T], struct event event );







#endif /* BAYES_LAPLACE_H */

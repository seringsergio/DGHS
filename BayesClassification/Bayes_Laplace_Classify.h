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

//////////////////////////////
/////POWERTRACE///////////////
//To set the Transmission Power
#include "net/netstack.h"
#include "powertrace.h"

#define REMOTE            1 // Indico que estoy usando el remote
#define MY_TX_POWER_DBM   0 //This number is in dBm e.g., "0" "7"  "-24"
#define POWERTRACE_PERIOD 10 //Number of seconds between executions of the powertrace measurements

//////////////////////////////

#define ROWS_T       40  //Rows of the table
#define COLUMNS_T    11  //Columns of the table

//matlab
#define range_EWMA_btp_01_wind_5    1125.9f
#define range_EWMA_btp_01_wind_10   1050.4f
#define range_EWMA_btp_01_wind_15   1015.8f
#define range_EWMA_btp_01_wind_20   1025.8f
#define range_EWMA_btp_01_wind_25   1107.3f
#define range_EWMA_btp_01_wind_30    971.0f
#define range_EWMA_btp_01_wind_35    976.9f

#define range_EWMA_btp_02_wind_10   1137.5f
#define range_EWMA_btp_03_wind_10   1180.0f
#define range_EWMA_btp_04_wind_10   1205.4f
#define range_EWMA_btp_05_wind_10   1264.4f
#define range_EWMA_btp_06_wind_10   1311.4f
#define range_EWMA_btp_07_wind_10   1347.8f
#define range_EWMA_btp_08_wind_10   1377.2f
#define range_EWMA_btp_09_wind_10   1403.0f



#define range_ppl           1.0f
#define num_divisions_ppl   ROWS_T
#define num_divisions_btp   ROWS_T
//////////////////////////

// Exponential weighted moving average (EWMA)
#define WINDOW_NUM_PACKETS 25
#define PACKET_FREQUENCY   1  //La frecuencia del paquete esta dada en segundos

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
  float EWMA_btp_02;
  float EWMA_ppl_02;
  float EWMA_btp_03;
  float EWMA_ppl_03;
  float EWMA_btp_04;
  float EWMA_ppl_04;
  float EWMA_btp_05;
  float EWMA_ppl_05;
  float EWMA_btp_06;
  float EWMA_ppl_06;
  float EWMA_btp_07;
  float EWMA_ppl_07;
  float EWMA_btp_08;
  float EWMA_ppl_08;
  float EWMA_btp_09;
  float EWMA_ppl_09;
};



/////////////////////////////////////////////////////////////////////////////
/////////////////////// ARRAY ///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

extern float likelihood[ROWS_T][COLUMNS_T];

//Varying the EWMA_ALPHA_0X
extern const uint8_t frequency_table_btp_01[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_01[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_btp_02[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_02[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_btp_03[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_03[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_btp_04[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_04[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_btp_05[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_05[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_btp_06[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_06[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_btp_07[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_07[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_btp_08[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_08[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_btp_09[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_09[ROWS_T][COLUMNS_T];

//Varying the window: WINDOW_NUM_PACKETS
extern const uint8_t frequency_table_btp_wind_5[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_wind_5[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_btp_wind_10[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_wind_10[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_btp_wind_15[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_wind_15[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_btp_wind_20[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_wind_20[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_btp_wind_25[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_wind_25[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_btp_wind_30[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_wind_30[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_btp_wind_35[ROWS_T][COLUMNS_T];
extern const uint8_t frequency_table_ppl_wind_35[ROWS_T][COLUMNS_T];

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

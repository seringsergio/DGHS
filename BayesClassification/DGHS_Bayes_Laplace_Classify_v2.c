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

//We implement a Naive Bayes classifier with Laplace smoothing
//REF: Laplace Smoothing
// https://www.youtube.com/watch?v=gCI-ZC7irbY&t=287s
// https://classes.soe.ucsc.edu/cmps140/Winter17/slides/3.pdf
//REF: Naive Bayes classifier
// https://ebiquity.umbc.edu/blogger/2010/12/07/naive-bayes-classifier-in-50-lines/
// http://www.saedsayad.com/naive_bayesian.htm
// https://www.analyticsvidhya.com/blog/2017/09/naive-bayes-explained/

#include "Bayes_Laplace_Classify.h"

struct csma_stats csma_stats;

PROCESS(test_Bayes_laplace,"test_Bayes_laplace");

AUTOSTART_PROCESSES(&test_Bayes_laplace);


PROCESS_THREAD(test_Bayes_laplace, ev, data)
{

  static struct event event;
  static float prob_btp[COLUMNS_T];
  static float prob_btp_N[COLUMNS_T]; //The N means normalized
  static float prob_ppl[COLUMNS_T];
  static float prob_ppl_N[COLUMNS_T]; //The N means normalized
  static float prob_btp_ppl[COLUMNS_T]; //This is the combined prob. Assuming that the events are independent
  static char res1[20];
  static uint8_t i;
  static float total_prob, total_prob_N;
  static float max_prob;
  static uint8_t index;

  PROCESS_BEGIN();

  //////////////////////////////////////////////
  //prob_btp
  //////////////////////////////////////////////

  //Define event
  event.row = 35;

  //Compute prob_btp
  total_prob = 0;
  for(i=0; i < COLUMNS_T; i++)
  {
    event.column = i;
    prob_btp[i] = calculate_probability_of_event( frequency_table_btp,   event );
    total_prob += prob_btp[i];
    PROCESS_PAUSE(); // Temporarily yield the process. Hace que calculate_probability_of_event funcione dentro del for
  }

  //Normalize and print
  total_prob_N = 0;
  for(i=0; i < COLUMNS_T; i++)
  {
    prob_btp_N[i] = prob_btp[i] / total_prob; //Normalize
    ftoa(prob_btp_N[i], res1, 4);
    printf("prob_btp(%d) = %s \n", i, res1);
    total_prob_N += prob_btp_N[i];
  }
  ftoa(total_prob_N, res1, 4);
  printf("SUM(prob_btp) = %s \n", res1);


  //////////////////////////////////////////////
  //prob_ppl
  //////////////////////////////////////////////

 //Define event
 event.row = 35;

 //Compute prob_ppl
 total_prob = 0;
 for(i=0; i < COLUMNS_T; i++)
 {
   event.column = i;
   prob_ppl[i] = calculate_probability_of_event( frequency_table_ppl,   event );
   total_prob += prob_ppl[i];
   PROCESS_PAUSE(); // Temporarily yield the process. Hace que calculate_probability_of_event funcione dentro del for
 }

 //Normalize and print
 total_prob_N = 0;
 for(i=0; i < COLUMNS_T; i++)
 {
   prob_ppl_N[i] = prob_ppl[i] / total_prob; //Normalize
   ftoa(prob_ppl_N[i], res1, 4);
   printf("prob_ppl(%d) = %s \n", i, res1);
   total_prob_N += prob_ppl_N[i];
 }
 ftoa(total_prob_N, res1, 4);
 printf("SUM(prob_ppl) = %s \n", res1);


 //////////////////////////////////////////////
 //prob_btp and prob_ppl
 //////////////////////////////////////////////


  //Combined probability AND max probability
  max_prob = 0;
  index    = 0;
  for(i=0; i < COLUMNS_T; i++)
  {
    prob_btp_ppl[i] = prob_btp_N[i] * prob_ppl_N[i];
    ftoa(prob_btp_ppl[i], res1, 4);
    printf("prob_btp_ppl(%d) = %s \n", i, res1);

    if(prob_btp_ppl[i] > max_prob)
    {
      index = i;
    }
  }

  //Print max_probability
  for(i=0; i < COLUMNS_T; i++)
  {
    if(index == i)
    {
      printf("Detected interference = %d %%", i*10 );
      break;
    }
  }

  PROCESS_END();
}

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

  struct event event;
  float prob_0_btp,
        prob_10_btp,
        prob_20_btp,
        prob_30_btp,
        prob_40_btp,
        prob_50_btp,
        prob_60_btp,
        prob_70_btp,
        prob_80_btp,
        prob_90_btp,
        prob_100_btp,
        prob_0_btp_N, //N means normalizado
        prob_10_btp_N,
        prob_20_btp_N,
        prob_30_btp_N,
        prob_40_btp_N,
        prob_50_btp_N,
        prob_60_btp_N,
        prob_70_btp_N,
        prob_80_btp_N,
        prob_90_btp_N,
        prob_100_btp_N;

      float prob_0_ppl,
            prob_10_ppl,
            prob_20_ppl,
            prob_30_ppl,
            prob_40_ppl,
            prob_50_ppl,
            prob_60_ppl,
            prob_70_ppl,
            prob_80_ppl,
            prob_90_ppl,
            prob_100_ppl,
            prob_0_ppl_N, //N means normalizado
            prob_10_ppl_N,
            prob_20_ppl_N,
            prob_30_ppl_N,
            prob_40_ppl_N,
            prob_50_ppl_N,
            prob_60_ppl_N,
            prob_70_ppl_N,
            prob_80_ppl_N,
            prob_90_ppl_N,
            prob_100_ppl_N;

  char res1[20],
       res2[20],
       res3[20],
       res4[20],
       res5[20],
       res6[20],
       res7[20],
       res8[20],
       res9[20],
       res10[20],
       res11[20],
       res12[20],
       res13[20],
       res14[20],
       res15[20],
       res16[20],
       res17[20],
       res18[20],
       res19[20],
       res20[20],
       res21[20],
       res22[20],
       res23[20],
       res24[20]; //to print the float variable

  //char res2[20]; //to print the float variable

  PROCESS_BEGIN();

  //calculate_likelihood(frequency_table, likelihood);
  //printf("%d \n", calculate_N_class(frequency_table) );
  //calculate_class_prob(  frequency_table, class_prob);
  event.column = 0;
  event.row = 35;
  prob_0_btp = calculate_probability_of_event( frequency_table_btp,   event );
  event.column = 1;
  event.row = 35;
  prob_10_btp = calculate_probability_of_event( frequency_table_btp,   event );
  event.column = 2;
  event.row = 35;
  prob_20_btp = calculate_probability_of_event( frequency_table_btp,   event );
  event.column = 3;
  event.row = 35;
  prob_30_btp = calculate_probability_of_event( frequency_table_btp,   event );
  event.column = 4;
  event.row = 35;
  prob_40_btp = calculate_probability_of_event( frequency_table_btp,   event );
  event.column = 5;
  event.row = 35;
  prob_50_btp = calculate_probability_of_event( frequency_table_btp,   event );
  event.column = 6;
  event.row = 35;
  prob_60_btp = calculate_probability_of_event( frequency_table_btp,   event );
  event.column = 7;
  event.row = 35;
  prob_70_btp = calculate_probability_of_event( frequency_table_btp,   event );
  event.column = 8;
  event.row = 35;
  prob_80_btp = calculate_probability_of_event( frequency_table_btp,   event );
  event.column = 9;
  event.row = 35;
  prob_90_btp = calculate_probability_of_event( frequency_table_btp,   event );
  event.column = 10;
  event.row = 35;
  prob_100_btp = calculate_probability_of_event( frequency_table_btp,   event );

  //normalizar
  prob_0_btp_N    = prob_0_btp / (prob_0_btp + prob_10_btp + prob_20_btp + prob_30_btp + prob_40_btp + prob_50_btp + prob_60_btp + prob_70_btp + prob_80_btp + prob_90_btp + prob_100_btp );
  prob_10_btp_N   = prob_10_btp / (prob_0_btp + prob_10_btp + prob_20_btp + prob_30_btp + prob_40_btp + prob_50_btp + prob_60_btp + prob_70_btp + prob_80_btp + prob_90_btp + prob_100_btp );
  prob_20_btp_N   = prob_20_btp / (prob_0_btp + prob_10_btp + prob_20_btp + prob_30_btp + prob_40_btp + prob_50_btp + prob_60_btp + prob_70_btp + prob_80_btp + prob_90_btp + prob_100_btp );
  prob_30_btp_N   = prob_30_btp / (prob_0_btp + prob_10_btp + prob_20_btp + prob_30_btp + prob_40_btp + prob_50_btp + prob_60_btp + prob_70_btp + prob_80_btp + prob_90_btp + prob_100_btp );
  prob_40_btp_N   = prob_40_btp / (prob_0_btp + prob_10_btp + prob_20_btp + prob_30_btp + prob_40_btp + prob_50_btp + prob_60_btp + prob_70_btp + prob_80_btp + prob_90_btp + prob_100_btp );
  prob_50_btp_N   = prob_50_btp / (prob_0_btp + prob_10_btp + prob_20_btp + prob_30_btp + prob_40_btp + prob_50_btp + prob_60_btp + prob_70_btp + prob_80_btp + prob_90_btp + prob_100_btp );
  prob_60_btp_N   = prob_60_btp / (prob_0_btp + prob_10_btp + prob_20_btp + prob_30_btp + prob_40_btp + prob_50_btp + prob_60_btp + prob_70_btp + prob_80_btp + prob_90_btp + prob_100_btp );
  prob_70_btp_N   = prob_70_btp / (prob_0_btp + prob_10_btp + prob_20_btp + prob_30_btp + prob_40_btp + prob_50_btp + prob_60_btp + prob_70_btp + prob_80_btp + prob_90_btp + prob_100_btp );
  prob_80_btp_N   = prob_80_btp / (prob_0_btp + prob_10_btp + prob_20_btp + prob_30_btp + prob_40_btp + prob_50_btp + prob_60_btp + prob_70_btp + prob_80_btp + prob_90_btp + prob_100_btp );
  prob_90_btp_N   = prob_90_btp / (prob_0_btp + prob_10_btp + prob_20_btp + prob_30_btp + prob_40_btp + prob_50_btp + prob_60_btp + prob_70_btp + prob_80_btp + prob_90_btp + prob_100_btp );
  prob_100_btp_N  = prob_100_btp / (prob_0_btp + prob_10_btp + prob_20_btp + prob_30_btp + prob_40_btp + prob_50_btp + prob_60_btp + prob_70_btp + prob_80_btp + prob_90_btp + prob_100_btp );


  ftoa(prob_0_btp_N, res1, 4);
  ftoa(prob_10_btp_N, res2, 4);
  ftoa(prob_20_btp_N, res3, 4);
  ftoa(prob_30_btp_N, res4, 4);
  ftoa(prob_40_btp_N, res5, 4);
  ftoa(prob_50_btp_N, res6, 4);
  ftoa(prob_60_btp_N, res7, 4);
  ftoa(prob_70_btp_N, res8, 4);
  ftoa(prob_80_btp_N, res9, 4);
  ftoa(prob_90_btp_N, res10, 4);
  ftoa(prob_100_btp_N, res11, 4);
  ftoa(prob_0_btp_N + prob_10_btp_N + prob_20_btp_N + prob_30_btp_N
       + prob_40_btp_N + prob_50_btp_N + prob_60_btp_N + prob_70_btp_N
        + prob_80_btp_N + prob_90_btp_N + prob_100_btp_N , res12, 4);

  printf("prob_0_btp %s \n", res1);
  printf("prob_10_btp %s \n", res2);
  printf("prob_20_btp %s \n", res3);
  printf("prob_30_btp %s \n", res4);
  printf("prob_40_btp %s \n", res5);
  printf("prob_50_btp %s \n", res6);
  printf("prob_60_btp %s \n", res7);
  printf("prob_70_btp %s \n", res8);
  printf("prob_80_btp %s \n", res9);
  printf("prob_90_btp %s \n", res10);
  printf("prob_10_btp0 %s \n", res11);
  printf("SUM btp %s \n", res12);

 //////////////////////////////////////////////

   //calculate_likelihood(frequency_table, likelihood);
  //printf("%d \n", calculate_N_class(frequency_table) );
  //calculate_class_prob(  frequency_table, class_prob);
  event.column = 0;
  event.row = 35;
  prob_0_ppl = calculate_probability_of_event( frequency_table_ppl,   event );
  event.column = 1;
  event.row = 35;
  prob_10_ppl = calculate_probability_of_event( frequency_table_ppl,   event );
  event.column = 2;
  event.row = 35;
  prob_20_ppl = calculate_probability_of_event( frequency_table_ppl,   event );
  event.column = 3;
  event.row = 35;
  prob_30_ppl = calculate_probability_of_event( frequency_table_ppl,   event );
  event.column = 4;
  event.row = 35;
  prob_40_ppl = calculate_probability_of_event( frequency_table_ppl,   event );
  event.column = 5;
  event.row = 35;
  prob_50_ppl = calculate_probability_of_event( frequency_table_ppl,   event );
  event.column = 6;
  event.row = 35;
  prob_60_ppl = calculate_probability_of_event( frequency_table_ppl,   event );
  event.column = 7;
  event.row = 35;
  prob_70_ppl = calculate_probability_of_event( frequency_table_ppl,   event );
  event.column = 8;
  event.row = 35;
  prob_80_ppl = calculate_probability_of_event( frequency_table_ppl,   event );
  event.column = 9;
  event.row = 35;
  prob_90_ppl = calculate_probability_of_event( frequency_table_ppl,   event );
  event.column = 10;
  event.row = 35;
  prob_100_ppl = calculate_probability_of_event( frequency_table_ppl,   event );

  //normalizar
  prob_0_ppl_N    = prob_0_ppl / (prob_0_ppl + prob_10_ppl + prob_20_ppl + prob_30_ppl + prob_40_ppl + prob_50_ppl + prob_60_ppl + prob_70_ppl + prob_80_ppl + prob_90_ppl + prob_100_ppl );
  prob_10_ppl_N   = prob_10_ppl / (prob_0_ppl + prob_10_ppl + prob_20_ppl + prob_30_ppl + prob_40_ppl + prob_50_ppl + prob_60_ppl + prob_70_ppl + prob_80_ppl + prob_90_ppl + prob_100_ppl );
  prob_20_ppl_N   = prob_20_ppl / (prob_0_ppl + prob_10_ppl + prob_20_ppl + prob_30_ppl + prob_40_ppl + prob_50_ppl + prob_60_ppl + prob_70_ppl + prob_80_ppl + prob_90_ppl + prob_100_ppl );
  prob_30_ppl_N   = prob_30_ppl / (prob_0_ppl + prob_10_ppl + prob_20_ppl + prob_30_ppl + prob_40_ppl + prob_50_ppl + prob_60_ppl + prob_70_ppl + prob_80_ppl + prob_90_ppl + prob_100_ppl );
  prob_40_ppl_N   = prob_40_ppl / (prob_0_ppl + prob_10_ppl + prob_20_ppl + prob_30_ppl + prob_40_ppl + prob_50_ppl + prob_60_ppl + prob_70_ppl + prob_80_ppl + prob_90_ppl + prob_100_ppl );
  prob_50_ppl_N   = prob_50_ppl / (prob_0_ppl + prob_10_ppl + prob_20_ppl + prob_30_ppl + prob_40_ppl + prob_50_ppl + prob_60_ppl + prob_70_ppl + prob_80_ppl + prob_90_ppl + prob_100_ppl );
  prob_60_ppl_N   = prob_60_ppl / (prob_0_ppl + prob_10_ppl + prob_20_ppl + prob_30_ppl + prob_40_ppl + prob_50_ppl + prob_60_ppl + prob_70_ppl + prob_80_ppl + prob_90_ppl + prob_100_ppl );
  prob_70_ppl_N   = prob_70_ppl / (prob_0_ppl + prob_10_ppl + prob_20_ppl + prob_30_ppl + prob_40_ppl + prob_50_ppl + prob_60_ppl + prob_70_ppl + prob_80_ppl + prob_90_ppl + prob_100_ppl );
  prob_80_ppl_N   = prob_80_ppl / (prob_0_ppl + prob_10_ppl + prob_20_ppl + prob_30_ppl + prob_40_ppl + prob_50_ppl + prob_60_ppl + prob_70_ppl + prob_80_ppl + prob_90_ppl + prob_100_ppl );
  prob_90_ppl_N   = prob_90_ppl / (prob_0_ppl + prob_10_ppl + prob_20_ppl + prob_30_ppl + prob_40_ppl + prob_50_ppl + prob_60_ppl + prob_70_ppl + prob_80_ppl + prob_90_ppl + prob_100_ppl );
  prob_100_ppl_N  = prob_100_ppl / (prob_0_ppl + prob_10_ppl + prob_20_ppl + prob_30_ppl + prob_40_ppl + prob_50_ppl + prob_60_ppl + prob_70_ppl + prob_80_ppl + prob_90_ppl + prob_100_ppl );


  ftoa(prob_0_ppl_N, res13, 4);
  ftoa(prob_10_ppl_N, res14, 4);
  ftoa(prob_20_ppl_N, res15, 4);
  ftoa(prob_30_ppl_N, res16, 4);
  ftoa(prob_40_ppl_N, res17, 4);
  ftoa(prob_50_ppl_N, res18, 4);
  ftoa(prob_60_ppl_N, res19, 4);
  ftoa(prob_70_ppl_N, res20, 4);
  ftoa(prob_80_ppl_N, res21, 4);
  ftoa(prob_90_ppl_N, res22, 4);
  ftoa(prob_100_ppl_N, res23, 4);
  ftoa(prob_0_ppl_N + prob_10_ppl_N + prob_20_ppl_N + prob_30_ppl_N
       + prob_40_ppl_N + prob_50_ppl_N + prob_60_ppl_N + prob_70_ppl_N
        + prob_80_ppl_N + prob_90_ppl_N + prob_100_ppl_N , res24, 4);

  printf("prob_0_ppl %s \n", res13);
  printf("prob_10_ppl %s \n", res14);
  printf("prob_20_ppl %s \n", res15);
  printf("prob_30_ppl %s \n", res16);
  printf("prob_40_ppl %s \n", res17);
  printf("prob_50_ppl %s \n", res18);
  printf("prob_60_ppl %s \n", res19);
  printf("prob_70_ppl %s \n", res20);
  printf("prob_80_ppl %s \n", res21);
  printf("prob_90_ppl %s \n", res22);
  printf("prob_10_ppl0 %s \n", res23);
  printf("SUM ppl %s \n", res24);

///////////////////////////////////////////////////////////////////////////////////////

  ftoa(prob_0_btp_N   * prob_0_ppl_N, res13, 4);
  ftoa(prob_10_btp_N  * prob_10_ppl_N, res14, 4);
  ftoa(prob_20_btp_N  * prob_20_ppl_N, res15, 4);
  ftoa(prob_30_btp_N  * prob_30_ppl_N, res16, 4);
  ftoa(prob_40_btp_N  * prob_40_ppl_N, res17, 4);
  ftoa(prob_50_btp_N  * prob_50_ppl_N, res18, 4);
  ftoa(prob_60_btp_N  * prob_60_ppl_N, res19, 4);
  ftoa(prob_70_btp_N  * prob_70_ppl_N, res20, 4);
  ftoa(prob_80_btp_N  * prob_80_ppl_N, res21, 4);
  ftoa(prob_90_btp_N  * prob_90_ppl_N, res22, 4);
  ftoa(prob_100_btp_N * prob_100_ppl_N, res23, 4);

  printf("prob_0_btp_N   * prob_0_ppl_N %s \n", res13);
  printf("prob_10_btp_N  * prob_10_ppl_N %s \n", res14);
  printf("prob_20_btp_N  * prob_20_ppl_N %s \n", res15);
  printf("prob_30_btp_N  * prob_30_ppl_N %s \n", res16);
  printf("prob_40_btp_N  * prob_40_ppl_N %s \n", res17);
  printf("prob_50_btp_N  * prob_50_ppl_N %s \n", res18);
  printf("prob_60_btp_N  * prob_60_ppl_N %s \n", res19);
  printf("prob_70_btp_N  * prob_70_ppl_N %s \n", res20);
  printf("prob_80_btp_N  * prob_80_ppl_N %s \n", res21);
  printf("prob_90_btp_N  * prob_90_ppl_N %s \n", res22);
  printf("prob_100_btp_N  * prob_100_ppl_N %s \n", res23);



  printf("end\n");
  PROCESS_END();

}

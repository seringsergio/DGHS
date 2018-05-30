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

#include "Bayes_Laplace.h"


PROCESS(test_Bayes_laplace,"test_Bayes_laplace");

AUTOSTART_PROCESSES(&test_Bayes_laplace);


PROCESS_THREAD(test_Bayes_laplace, ev, data)
{

  //static struct etimer et;

  PROCESS_BEGIN();

  /*while(1)
  {

    //execute periodically
    etimer_set(&et, CLOCK_SECOND * 1);
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));*/

    calculate_likelihood(frequency_table, likelihood);

  //}

  PROCESS_END();

}

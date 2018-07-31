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

PROCESS(detect_interference,"detect_interference");
PROCESS(compute_csma_stats,"compute_csma_stats");
PROCESS(analyze_csma_results,"analyze_csma_results");

void reset_csma_stats()
{
  csma_stats.packets_dropped = 0;
  csma_stats.delay = 0;
}


/*---------------------------------------------------------------------------*/
static void
recv_uc(struct unicast_conn *c, const linkaddr_t *from)
{
  printf("unicast message / received from %d.%d\n",
	 from->u8[0], from->u8[1]);
}
/*---------------------------------------------------------------------------*/
static void
sent_uc(struct unicast_conn *c, int status, int num_tx)
{
  const linkaddr_t *dest = packetbuf_addr(PACKETBUF_ADDR_RECEIVER);
  if(linkaddr_cmp(dest, &linkaddr_null)) {
    return;
  }
  printf("unicast message sent / to %d.%d: status %d num_tx %d\n",
    dest->u8[0], dest->u8[1], status, num_tx);
}
/*---------------------------------------------------------------------------*/
static const struct unicast_callbacks unicast_callbacks = {recv_uc, sent_uc};
static struct unicast_conn uc;

AUTOSTART_PROCESSES(&detect_interference,&compute_csma_stats,&analyze_csma_results);


/////////////////////////////////////////////////////////////////////////////
///////////////////////STATUS////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

// In file mac.h
// Generic MAC return values.
// 0. MAC_TX_OK:         The MAC layer transmission was OK.
// 1. MAC_TX_COLLISION:  The MAC layer transmission could not be performed due to a collision.
// 2. MAC_TX_NOACK:      The MAC layer did not get an acknowledgement for the packet.
// 3. MAC_TX_DEFERRED:   The MAC layer deferred (aplazo) the transmission for a later time.
// 4. MAC_TX_ERR:        The MAC layer transmission could not be performed because of an error.
//                       The upper layer may try again later.
// 5.MAC_TX_ERR_FATAL:   The MAC layer transmission could not be performed because of a
//                       fatal error. The upper layer does not need to try again, as the
//                       error will be fatal then as well.



PROCESS_THREAD(compute_csma_stats, ev, data)
{
  static struct etimer et;
  static linkaddr_t addr;
  static uint16_t num_packets;
  static float ppl; // ppl (Percentage of Packet Loss)
  static float btp; // btp (Backoff Time per packet)
  static float EWMA_btp_08;
  static float EWMA_ppl_08;
  static struct csma_results csma_results;
  static char res1[20], res2[20];

  PROCESS_BEGIN();

  unicast_open(&uc, 146, &unicast_callbacks);

  printf("EWMA_ALPHA_08\n"); 

  num_packets = 0;
  reset_csma_stats();

  while(1)
  {
    etimer_set(&et,  random_rand() % (CLOCK_SECOND * 2) ); // Configure timer et to a random time between 0 and 2
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));

    packetbuf_copyfrom("Hello", 5);
    addr.u8[0] = 1;
    addr.u8[1] = 0;
    if(!linkaddr_cmp(&addr, &linkaddr_node_addr))
    {
      unicast_send(&uc, &addr);
      num_packets++;

      //modulo para hacerlo ciclico
      if(num_packets % WINDOW_NUM_PACKETS == 0)
      {
        btp = (float) 1000 * (float) csma_stats.delay  / (float) CLOCK_SECOND / (float) WINDOW_NUM_PACKETS;
        ppl = (float) csma_stats.packets_dropped / (float) WINDOW_NUM_PACKETS;

        //Exponential weighted moving average (EWMA)
        //REF: https://en.wikipedia.org/wiki/Moving_average
        //REF: Also, see the example of contiki called example-neighbors.c It implements a EWMA
        if(num_packets == WINDOW_NUM_PACKETS) //It is the first calculation of EWMA_btp. We do not have previous data, so we use the first data
        {
          EWMA_btp_08 = btp;
          EWMA_ppl_08 = ppl;
        }else
        {
          EWMA_btp_08 = ( (float) EWMA_ALPHA_08 * (float) btp) + (( (float) 1 - (float) EWMA_ALPHA_08) * (float) EWMA_btp_08);
          EWMA_ppl_08 = ( (float) EWMA_ALPHA_08 * (float) ppl) + (( (float) 1 - (float) EWMA_ALPHA_08) * (float) EWMA_ppl_08);
        }

        //csma_results
        csma_results.btp = btp;
        csma_results.ppl = ppl;
        csma_results.EWMA_btp_08 = EWMA_btp_08;
        csma_results.EWMA_ppl_08 = EWMA_ppl_08;

        //print
        ftoa( btp, res1, 2); //Uses the library print_float.h
        ftoa( EWMA_btp_08, res2, 2); //Uses the library print_float.h
        printf("BTP/%d/%s/%s/\n",num_packets,  res1 , res2);

        ftoa( ppl, res1, 2); //Uses the library print_float.h
        ftoa( EWMA_ppl_08, res2, 2); //Uses the library print_float.h
        printf("PPL/%d/%s/%s/\n",num_packets,  res1 , res2);

        process_post(&analyze_csma_results, PROCESS_EVENT_CONTINUE, &csma_results);

        reset_csma_stats();
      }

    }


  }

  PROCESS_END();


}


PROCESS_THREAD(analyze_csma_results, ev, data)
{
  static struct csma_results csma_results;
  static uint8_t i;
  static float upper_interval, lower_interval;
  static char res1[20], res2[20], res3[20];
  static struct detected_event detected_event;
  PROCESS_BEGIN();

  while(1)
  {
    PROCESS_YIELD();
    if(ev == PROCESS_EVENT_CONTINUE)
    {
        csma_results = * ( (struct csma_results *) data );

        //see for in matlab count_EWMA_btp_08
        for(i=1; i <= num_divisions_btp; i++ )
        {
          lower_interval = (float) (i-1) * (float) range_EWMA_btp_08 / (float) num_divisions_btp;
          upper_interval = (float) (i)   * (float) range_EWMA_btp_08 / (float) num_divisions_btp;
          ftoa(lower_interval, res1, 2);
          ftoa(csma_results.EWMA_btp_08, res2, 2);
          ftoa(upper_interval, res3, 2);

          if(  csma_results.EWMA_btp_08 >= lower_interval &&
               csma_results.EWMA_btp_08 <  upper_interval   )
            {
                detected_event.event_btp = i - 1; //Resto 1 porq aca es de 0-39...en matlab es de 1-40
                printf(" %s < /%s/ < %s \n", res1,res2,res3);
                printf("event_btp =/ %d\n", detected_event.event_btp);
                break;
            }
        }

        //see for in matlab count_EWMA_ppl_08
        for(i=1; i <= num_divisions_ppl; i++ )
        {
          lower_interval = (float) (i-1) * (float) range_ppl / (float) num_divisions_ppl;
          upper_interval = (float) (i)   * (float) range_ppl / (float) num_divisions_ppl;
          ftoa(lower_interval, res1, 2);
          ftoa(csma_results.EWMA_ppl_08, res2, 2);
          ftoa(upper_interval, res3, 2);

          if(  csma_results.EWMA_ppl_08 >= lower_interval &&
               csma_results.EWMA_ppl_08 <  upper_interval   )
            {
                detected_event.event_ppl = i - 1; //Resto 1 porq aca es de 0-39...en matlab es de 1-40
                printf(" %s < /%s/ < %s \n", res1,res2,res3);
                printf("event_ppl =/ %d\n", detected_event.event_ppl);
                break;
            }
        }

        process_post(&detect_interference, PROCESS_EVENT_CONTINUE, &detected_event);

    }else
    {
      printf("ERROR: unknown event in analyze_csma_results\n");
    }
  }

  PROCESS_END();

}


PROCESS_THREAD(detect_interference, ev, data)
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
  static struct detected_event detected_event;

  PROCESS_BEGIN();

  while(1)
  {
    PROCESS_YIELD();
    if(ev == PROCESS_EVENT_CONTINUE)
    {
        detected_event = *( (struct detected_event*) data );
        //////////////////////////////////////////////
        //prob_btp
        //////////////////////////////////////////////

        //Define event
        //event.row = 35;
        event.row = detected_event.event_btp;

        //Compute prob_btp
        total_prob = 0;
        for(i=0; i < COLUMNS_T; i++)
        {
          event.column = i;
          prob_btp[i] = calculate_probability_of_event( frequency_table_btp,   event );
          total_prob += prob_btp[i];
          PROCESS_PAUSE(); //La funcion calculate_probability_of_event() llama muchas subfunciones. Por eso espero.
        }

        //Normalize and print
        total_prob_N = 0;
        for(i=0; i < COLUMNS_T; i++)
        {
          prob_btp_N[i] = prob_btp[i] / total_prob; //Normalize
          ftoa(prob_btp_N[i], res1, 4);
          printf("prob_btp(%d) =/ %s \n", i, res1);
          total_prob_N += prob_btp_N[i];
        }
        ftoa(total_prob_N, res1, 4);
        printf("SUM(prob_btp) =/ %s \n", res1);


        //////////////////////////////////////////////
        //prob_ppl
        //////////////////////////////////////////////

       //Define event
       //event.row = 35;
       event.row = detected_event.event_ppl;

       //Compute prob_ppl
       total_prob = 0;
       for(i=0; i < COLUMNS_T; i++)
       {
         event.column = i;
         prob_ppl[i] = calculate_probability_of_event( frequency_table_ppl,   event );
         total_prob += prob_ppl[i];
         PROCESS_PAUSE(); //La funcion calculate_probability_of_event() llama muchas subfunciones. Por eso espero.
       }

       //Normalize and print
       total_prob_N = 0;
       for(i=0; i < COLUMNS_T; i++)
       {
         prob_ppl_N[i] = prob_ppl[i] / total_prob; //Normalize
         ftoa(prob_ppl_N[i], res1, 4);
         printf("prob_ppl(%d) =/ %s \n", i, res1);
         total_prob_N += prob_ppl_N[i];
       }
       ftoa(total_prob_N, res1, 4);
       printf("SUM(prob_ppl) =/ %s \n", res1);


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
          printf("prob_btp_ppl(%d) =/ %s\n", i, res1);

          if(prob_btp_ppl[i] > max_prob)
          {
            max_prob = prob_btp_ppl[i];
            index = i;
          }
        }

        //Print max_probability
        for(i=0; i < COLUMNS_T; i++)
        {
          if(index == i)
          {
            //Det_int = detected_interference
            //format DET_INT detected_interference
            printf("DET_INT/%d/\n", i*10 );
            break;
          }
        }

   }else
   {
      printf("ERROR: unknown event in detect_interference\n");
   }

  } //END while(1)

  PROCESS_END();
}

/*
 * Copyright (c) 2007, Swedish Institute of Computer Science.
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

/**
 * \file
 *         Best-effort single-hop unicast example
 * \author
 *         Adam Dunkels <adam@sics.se>
 */

#include "contiki.h"
#include "net/rime/rime.h"
#include <stdio.h>

#include "tx_rx.h"
#include "print_float.h"
#include "lib/random.h"


struct csma_stats csma_stats;

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

/*---------------------------------------------------------------------------*/
PROCESS(example_unicast_process, "TX");
AUTOSTART_PROCESSES(&example_unicast_process);
/*---------------------------------------------------------------------------*/
static void
recv_uc(struct unicast_conn *c, const linkaddr_t *from)
{
  printf("unicast message received from %d.%d\n",
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
/*---------------------------------------------------------------------------*/
void reset_csma_stats()
{
  csma_stats.packets_dropped = 0;
  //csma_stats.packets_transmitted = 0;
  //csma_stats.total_packets = 0;
  csma_stats.delay = 0;
  //csma_stats.num_retx = 0;
  //csma_stats.num_collision = 0;

}
/*---------------------------------------------------------------------------*/
PROCESS_THREAD(example_unicast_process, ev, data)
{
  PROCESS_EXITHANDLER(unicast_close(&uc);)

  static uint16_t num_packets;
  static char res1[20],//to print the float variable
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
              res20[20];

  static float ppl; // ppl is Percentage of Packet Loss
  static float btp; // btp (Backoff Time per packet)
  //static float EWMA_ppl;
  static float EWMA_btp_01,
               EWMA_btp_02,
               EWMA_btp_03,
               EWMA_btp_04,
               EWMA_btp_05,
               EWMA_btp_06,
               EWMA_btp_07,
               EWMA_btp_08,
               EWMA_btp_09;

  static float EWMA_ppl_01,
               EWMA_ppl_02,
               EWMA_ppl_03,
               EWMA_ppl_04,
               EWMA_ppl_05,
               EWMA_ppl_06,
               EWMA_ppl_07,
               EWMA_ppl_08,
               EWMA_ppl_09;

  PROCESS_BEGIN();

  num_packets = 0;
  reset_csma_stats();

  unicast_open(&uc, 146, &unicast_callbacks);
  printf("%d.%d\n", linkaddr_node_addr.u8[0], linkaddr_node_addr.u8[1] );

//  printf("RF_CHANNEL %d\n", RF_CHANNEL );
//  printf("CC2538_RF_CONF_CHANNEL %d\n", CC2538_RF_CONF_CHANNEL );


  while(1) {
    static struct etimer et;
    linkaddr_t addr;

    //etimer_set(&et,  CLOCK_SECOND ); // Configure timer et to a random time between 0 and 2
    etimer_set(&et,  random_rand() % (CLOCK_SECOND * 2) ); // Configure timer et to a random time between 0 and 2

    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));

    packetbuf_copyfrom("Hello", 5);
    addr.u8[0] = 1;
    addr.u8[1] = 0;
    if(!linkaddr_cmp(&addr, &linkaddr_node_addr))
    {
      unicast_send(&uc, &addr);
      num_packets++;

      // 1. Para saber el porcentaje de interferencia utilizo EWMA_btp a largo plazo (EWMA_btp_01 ó EWMA_btp_02)...con muchas muestras
      // 2. Para saber si cambio de padre o no rapidamente utilizo btp. Me demoro WINDOW_NUM_PACKETS paquetes.

      if(num_packets % WINDOW_NUM_PACKETS == 0)
      {
        // btp (Backoff Time per packet): tiempo_de_backoff_por_paquete (miliseconds)
        btp = (float) 1000L * (float) csma_stats.delay  / (float) CLOCK_SECOND / (float) WINDOW_NUM_PACKETS;
        //
        ppl = (float) csma_stats.packets_dropped / (float) WINDOW_NUM_PACKETS;
        //Exponential weighted moving average (EWMA)
        //REF: https://en.wikipedia.org/wiki/Moving_average
        //REF: Also, see the example of contiki called example-neighbors.c It implements a EWMA
        if(num_packets == WINDOW_NUM_PACKETS) //It is the first calculation of EWMA_btp. We do not have previous data, so we use the first data
        {
          EWMA_btp_01 = btp;
          EWMA_btp_02 = btp;
          EWMA_btp_03 = btp;
          EWMA_btp_04 = btp;
          EWMA_btp_05 = btp;
          EWMA_btp_06 = btp;
          EWMA_btp_07 = btp;
          EWMA_btp_08 = btp;
          EWMA_btp_09 = btp;

          EWMA_ppl_01 = ppl;
          EWMA_ppl_02 = ppl;
          EWMA_ppl_03 = ppl;
          EWMA_ppl_04 = ppl;
          EWMA_ppl_05 = ppl;
          EWMA_ppl_06 = ppl;
          EWMA_ppl_07 = ppl;
          EWMA_ppl_08 = ppl;
          EWMA_ppl_09 = ppl;

        }else
        {
          EWMA_btp_01 = ( (float) EWMA_ALPHA_01 * (float) btp) + (( (float) 1 - (float) EWMA_ALPHA_01) * (float) EWMA_btp_01);
          EWMA_btp_02 = ( (float) EWMA_ALPHA_02 * (float) btp) + (( (float) 1 - (float) EWMA_ALPHA_02) * (float) EWMA_btp_02);
          EWMA_btp_03 = ( (float) EWMA_ALPHA_03 * (float) btp) + (( (float) 1 - (float) EWMA_ALPHA_03) * (float) EWMA_btp_03);
          EWMA_btp_04 = ( (float) EWMA_ALPHA_04 * (float) btp) + (( (float) 1 - (float) EWMA_ALPHA_04) * (float) EWMA_btp_04);
          EWMA_btp_05 = ( (float) EWMA_ALPHA_05 * (float) btp) + (( (float) 1 - (float) EWMA_ALPHA_05) * (float) EWMA_btp_05);
          EWMA_btp_06 = ( (float) EWMA_ALPHA_06 * (float) btp) + (( (float) 1 - (float) EWMA_ALPHA_06) * (float) EWMA_btp_06);
          EWMA_btp_07 = ( (float) EWMA_ALPHA_07 * (float) btp) + (( (float) 1 - (float) EWMA_ALPHA_07) * (float) EWMA_btp_07);
          EWMA_btp_08 = ( (float) EWMA_ALPHA_08 * (float) btp) + (( (float) 1 - (float) EWMA_ALPHA_08) * (float) EWMA_btp_08);
          EWMA_btp_09 = ( (float) EWMA_ALPHA_09 * (float) btp) + (( (float) 1 - (float) EWMA_ALPHA_09) * (float) EWMA_btp_09);

          EWMA_ppl_01 = ( (float) EWMA_ALPHA_01 * (float) ppl) + (( (float) 1 - (float) EWMA_ALPHA_01) * (float) EWMA_ppl_01);
          EWMA_ppl_02 = ( (float) EWMA_ALPHA_02 * (float) ppl) + (( (float) 1 - (float) EWMA_ALPHA_02) * (float) EWMA_ppl_02);
          EWMA_ppl_03 = ( (float) EWMA_ALPHA_03 * (float) ppl) + (( (float) 1 - (float) EWMA_ALPHA_03) * (float) EWMA_ppl_03);
          EWMA_ppl_04 = ( (float) EWMA_ALPHA_04 * (float) ppl) + (( (float) 1 - (float) EWMA_ALPHA_04) * (float) EWMA_ppl_04);
          EWMA_ppl_05 = ( (float) EWMA_ALPHA_05 * (float) ppl) + (( (float) 1 - (float) EWMA_ALPHA_05) * (float) EWMA_ppl_05);
          EWMA_ppl_06 = ( (float) EWMA_ALPHA_06 * (float) ppl) + (( (float) 1 - (float) EWMA_ALPHA_06) * (float) EWMA_ppl_06);
          EWMA_ppl_07 = ( (float) EWMA_ALPHA_07 * (float) ppl) + (( (float) 1 - (float) EWMA_ALPHA_07) * (float) EWMA_ppl_07);
          EWMA_ppl_08 = ( (float) EWMA_ALPHA_08 * (float) ppl) + (( (float) 1 - (float) EWMA_ALPHA_08) * (float) EWMA_ppl_08);
          EWMA_ppl_09 = ( (float) EWMA_ALPHA_09 * (float) ppl) + (( (float) 1 - (float) EWMA_ALPHA_09) * (float) EWMA_ppl_09);

        }

        //print a float in Contiki
        ftoa( btp, res1, 2); //Uses the library print_float.h
        ftoa( EWMA_btp_09, res2, 2); //Uses the library print_float.h
        ftoa( EWMA_btp_08, res3, 2); //Uses the library print_float.h
        ftoa( EWMA_btp_07, res4, 2); //Uses the library print_float.h
        ftoa( EWMA_btp_06, res5, 2); //Uses the library print_float.h
        ftoa( EWMA_btp_05, res6, 2); //Uses the library print_float.h
        ftoa( EWMA_btp_04, res7, 2); //Uses the library print_float.h
        ftoa( EWMA_btp_03, res8, 2); //Uses the library print_float.h
        ftoa( EWMA_btp_02, res9, 2); //Uses the library print_float.h
        ftoa( EWMA_btp_01, res10, 2); //Uses the library print_float.h

        //print a float in Contiki
        ftoa( ppl, res11, 2); //Uses the library print_float.h
        ftoa( EWMA_ppl_09, res12, 2); //Uses the library print_float.h
        ftoa( EWMA_ppl_08, res13, 2); //Uses the library print_float.h
        ftoa( EWMA_ppl_07, res14, 2); //Uses the library print_float.h
        ftoa( EWMA_ppl_06, res15, 2); //Uses the library print_float.h
        ftoa( EWMA_ppl_05, res16, 2); //Uses the library print_float.h
        ftoa( EWMA_ppl_04, res17, 2); //Uses the library print_float.h
        ftoa( EWMA_ppl_03, res18, 2); //Uses the library print_float.h
        ftoa( EWMA_ppl_02, res19, 2); //Uses the library print_float.h
        ftoa( EWMA_ppl_01, res20, 2); //Uses the library print_float.h

        //format BTP btp EWMA_btp_09 EWMA_btp_08 EWMA_btp_07 EWMA_btp_06 EWMA_btp_05 EWMA_btp_04 EWMA_btp_03 EWMA_btp_02 EWMA_btp_01
        printf("BTP/%d/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s\n",
        num_packets,  res1 , res2, res3, res4, res5, res6, res7, res8, res9, res10 );

        //format PPL ppl EWMA_ppl_09 EWMA_ppl_08 EWMA_ppl_07 EWMA_ppl_06 EWMA_ppl_05 EWMA_ppl_04 EWMA_ppl_03 EWMA_ppl_02 EWMA_ppl_01
        printf("PPL/%d/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s\n",
        num_packets,  res11 , res12, res13, res14, res15, res16, res17, res18, res19, res20 );

        //format CSMA BTP btp EWMA_btp_09 EWMA_btp_08 EWMA_btp_07 EWMA_btp_06 EWMA_btp_05 EWMA_btp_04 EWMA_btp_03 EWMA_btp_02 EWMA_btp_01
        //       ppl EWMA_ppl_09 EWMA_ppl_08 EWMA_ppl_07 EWMA_ppl_06 EWMA_ppl_05 EWMA_ppl_04 EWMA_ppl_03 EWMA_ppl_02 EWMA_ppl_01
        //printf("CSMA/%d/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s\n",
        //num_packets,  res1 , res2,  res3,  res4,  res5,  res6,  res7,  res8,  res9,  res10,
        //              res11, res12, res13, res14, res15, res16, res17, res18, res19, res20 );

        printf("CSMA/%d/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/\n",
        num_packets,  res1 , res2,  res3,  res4,  res5,  res6,  res7,  res8,  res9,  res10,
                      res11, res12, res13, res14, res15, res16, res17, res18, res19, res20 );

        reset_csma_stats();
      }

      //Exponential weighted moving average (EWMA)
      //REF: https://en.wikipedia.org/wiki/Moving_average
      //REF: Also, see the example of contiki called example-neighbors.c It implements a EWMA
      /*if(num_packets == 1)
      {
        // btp (Backoff Time per packet): tiempo_de_backoff_por_paquete (miliseconds)
        btp = (float) 1000L * (float) csma_stats.delay  / (float) CLOCK_SECOND / (float) 1;
        EWMA_btp = btp;
      }else
      {
        EWMA_btp = ( (float) EWMA_ALPHA * (float) btp) + (( (float) 1 - (float) EWMA_ALPHA) * (float) EWMA_btp);
      }*/

      //print a float in Contiki
      //ftoa( btp, res2, 2); //Uses the library print_float.h
      //ftoa( EWMA_btp, res3, 2); //Uses the library print_float.h

      //format CSMA total_packets packets_dropped EWMA_ppl btp(ventana) EWMA_btp
      //printf("CSMA/%d/%d/%s/%s/%s\n",
      //num_packets, csma_stats.packets_dropped, res1 , res2, res3 );

      /*// ppl is Percentage of Packet Loss
      ppl = (float) csma_stats.packets_dropped  / (float) num_packets;

      // btp (Backoff Time per packet): tiempo_de_backoff_por_paquete (miliseconds)
      btp = (float) 1000L * (float) csma_stats.delay  / (float) CLOCK_SECOND / (float) num_packets;

      //Exponential weighted moving average (EWMA)
      //REF: https://en.wikipedia.org/wiki/Moving_average
      //REF: Also, see the example of contiki called example-neighbors.c It implements a EWMA
      if(num_packets == 1)
      {
        EWMA_ppl = ppl;
        EWMA_btp = btp;
      }else
      {
        EWMA_ppl = ( (float) EWMA_ALPHA * (float) ppl) + (( (float) 1 - (float) EWMA_ALPHA) * (float) EWMA_ppl);
        EWMA_btp = ( (float) EWMA_ALPHA * (float) btp) + (( (float) 1 - (float) EWMA_ALPHA) * (float) EWMA_btp);

      }
      //////////////////////////////////////////////////////////////////////////////////
      ftoa( EWMA_ppl, res1, 2); //Uses the library print_float.h
      ftoa( EWMA_btp, res2, 2); //Uses the library print_float.h

      //format CSMA total_packets packets_dropped EWMA_ppl EWMA_btp
      printf("CSMA/%d/%d/%s/%s\n",
      num_packets, csma_stats.packets_dropped, res1 , res2 );*/

      /*if(csma_stats.total_packets >= WINDOW_NUM_PACKETS)
      {
        //format CSMA packets_dropped packets_transmitted total_packets delay(ms) num_retx num_collision global_total
        printf("CSMA/%d/%d/%d/%lu/%d/%d/%d\n",
        csma_stats.packets_dropped, csma_stats.packets_transmitted,
        csma_stats.total_packets, (1000L *  csma_stats.delay ) / CLOCK_SECOND,
        csma_stats.num_retx, csma_stats.num_collision, num_packets );  //delay in miliseconds
        reset_csma_stats();
      }*/
    }

  }

  PROCESS_END();
}
/*---------------------------------------------------------------------------*/

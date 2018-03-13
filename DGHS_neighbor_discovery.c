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

#include "neighbor_discovery.h"

MEMB(neighbors_memb, struct neighbor, MAX_NEIGHBORS); // This MEMB() definition defines a memory pool from which we allocate neighbor entries.
LIST(neighbors_list); // The neighbors_list is a Contiki list that holds the neighbors we have seen thus far.
static struct broadcast_conn broadcast;

/* This function is called whenever a broadcast message is received. */
static void broadcast_recv(struct broadcast_conn *c, const linkaddr_t *from)
{
  struct neighbor *n;
  struct broadcast_message *m;
  uint8_t seqno_gap;

  /* The packetbuf_dataptr() returns a pointer to the first data byte
     in the received packet. */
  m = packetbuf_dataptr();

  /* Check if we already know this neighbor. */
  for(n = list_head(neighbors_list); n != NULL; n = list_item_next(n)) {

    /* We break out of the loop if the address of the neighbor matches
       the address of the neighbor from which we received this
       broadcast message. */
    if(linkaddr_cmp(&n->addr, from)) {
      break;
    }
  }

  /* If n is NULL, this neighbor was not found in our list, and we
     allocate a new struct neighbor from the neighbors_memb memory
     pool. */
  if(n == NULL) {
    n = memb_alloc(&neighbors_memb);

    /* If we could not allocate a new neighbor entry, we give up. We
       could have reused an old neighbor entry, but we do not do this
       for now. */
    if(n == NULL) {
      return;
    }

    /* Initialize the fields. */
    linkaddr_copy(&n->addr, from);
    n->last_seqno = m->seqno - 1;
    n->avg_seqno_gap = SEQNO_EWMA_UNITY;

    /* Place the neighbor on the neighbor list. */
    list_add(neighbors_list, n);
  }

  /* We can now fill in the fields in our neighbor entry. */
  n->last_rssi = packetbuf_attr(PACKETBUF_ATTR_RSSI);
  n->last_lqi = packetbuf_attr(PACKETBUF_ATTR_LINK_QUALITY);

  /* Compute the average sequence number gap we have seen from this neighbor. */
  seqno_gap = m->seqno - n->last_seqno;
  n->avg_seqno_gap = (((uint32_t)seqno_gap * SEQNO_EWMA_UNITY) *
                      SEQNO_EWMA_ALPHA) / SEQNO_EWMA_UNITY +
                      ((uint32_t)n->avg_seqno_gap * (SEQNO_EWMA_UNITY -
                                                     SEQNO_EWMA_ALPHA)) /
    SEQNO_EWMA_UNITY;

  /* Remember last seqno we heard. */
  n->last_seqno = m->seqno;

  /* Print out a message. */
  printf("broadcast message received from %d.%d with seqno %d, RSSI %u, LQI %u, avg seqno gap %d.%02d\n",
         from->u8[0], from->u8[1],
         m->seqno,
         packetbuf_attr(PACKETBUF_ATTR_RSSI),
         packetbuf_attr(PACKETBUF_ATTR_LINK_QUALITY),
         (int)(n->avg_seqno_gap / SEQNO_EWMA_UNITY),
         (int)(((100UL * n->avg_seqno_gap) / SEQNO_EWMA_UNITY) % 100));
}
static const struct broadcast_callbacks broadcast_call = {broadcast_recv};


PROCESS(master_neighbor_discovery, "master_neighbor_discovery");
PROCESS(send_neighbor_discovery, "send_neighbor_discovery");

PROCESS_THREAD(master_neighbor_discovery, ev, data)
{
    static uint8_t broadcast_num;
    static struct s_wait sw;
    PROCESS_BEGIN();

    while(1)
    {
        PROCESS_WAIT_EVENT();
        if(ev == e_execute)
        {
            if(broadcast_num <= NUM_BROADCAST_NEIGHBOR_DISCOVERY)
            {
                fill_wait_struct(&sw, BROADCAST_INTERVAL_PRE, PROCESS_CURRENT() );
                process_post(&wait, e_execute , &sw );
                PROCESS_WAIT_EVENT_UNTIL(ev == e_end_wait);

                process_post(&send_neighbor_discovery, e_send_broadcast, &broadcast_num);
                broadcast_num++;
            }else
            if(broadcast_num > NUM_BROADCAST_NEIGHBOR_DISCOVERY)
            {
                fill_wait_struct(&sw, BROADCAST_INTERVAL_POST, PROCESS_CURRENT() );
                process_post(&wait, e_execute , &sw );
                PROCESS_WAIT_EVENT_UNTIL(ev == e_end_wait);

                process_post(&send_neighbor_discovery, e_send_broadcast, &broadcast_num);
                broadcast_num++;
            }

        }
    }

    PROCESS_END();
}


PROCESS_THREAD(send_neighbor_discovery, ev, data)
{
    static uint8_t broadcast_num;
    static uint8_t seqno;
    struct broadcast_message msg;

    PROCESS_EXITHANDLER(broadcast_close(&broadcast);)

    PROCESS_BEGIN();

    broadcast_open(&broadcast, 129, &broadcast_call);


    e_send_broadcast = process_alloc_event();
    e_send_runicast  = process_alloc_event();

    while(1)
    {
        PROCESS_WAIT_EVENT();
        if(ev == e_send_broadcast)
        {
            broadcast_num = *((uint8_t *) data);

            msg.seqno = seqno;
                if(broadcast_num <= NUM_BROADCAST_NEIGHBOR_DISCOVERY)
                {
                    msg.flags &= ~FLAG_BROADCAST_INTERVAL_POST;
                }
                else
                if(broadcast_num > NUM_BROADCAST_NEIGHBOR_DISCOVERY)
                {
                    msg.flags |= FLAG_BROADCAST_INTERVAL_POST;
                }
            packetbuf_copyfrom(&msg, sizeof(struct broadcast_message));
            broadcast_send(&broadcast);
            seqno++;

            process_post(&master_neighbor_discovery,e_execute,NULL);
        }else
        if(ev == e_send_runicast)
        {

        }
    }

    PROCESS_END();
}

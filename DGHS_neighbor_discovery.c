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

LIST(neighbors_list); // The neighbors_list is a Contiki list that holds the neighbors we have seen thus far.
MEMB(neighbors_memb, struct neighbor, NUM_MAX_NEIGHBORS); // This MEMB() definition defines a memory pool from which we allocate neighbor entries.

//struct neighbor *neighbors_list_p;
LIST(history_table_1);
MEMB(history_mem_1, struct history_entry, NUM_HISTORY_ENTRIES);

LIST(runicast_agreement_list); //List of runicast_1 messages
MEMB(runicast_agreement_memb, struct runicast_list, NUM_MAX_NEIGHBORS);// This MEMB() definition defines a memory pool from which we allocate runicast_1 messages.


static void recv_runicast(struct runicast_conn *c, const linkaddr_t *from, uint8_t seqno)
{
  static struct runicast_message *ru_msg;
  struct neighbor *n;
  /* The packetbuf_dataptr() returns a pointer to the first data byte
     in the received packet. */
  ru_msg = packetbuf_dataptr();

  /* OPTIONAL: Sender history */
  struct history_entry *e = NULL;
  for(e = list_head(history_table_1); e != NULL; e = e->next) {
    if(linkaddr_cmp(&e->addr, from)) {
      break;
    }
  }
  if(e == NULL) {
    /* Create new history entry */
    e = memb_alloc(&history_mem_1);
    if(e == NULL) {
      e = list_chop(history_table_1); /* Remove oldest at full history */
    }
    linkaddr_copy(&e->addr, from);
    e->seq = seqno;
    list_push(history_table_1, e);
  } else {
    /* Detect duplicate callback */
    if(e->seq == seqno) {
      DGHS_DBG_2("runicast_1 message received from %d.%d, seqno %d (DUPLICATE)\n",
	     from->u8[0], from->u8[1], seqno);
      return;
    }
    /* Update existing history entry */
    e->seq = seqno;
  }

  DGHS_DBG_2("runicast_1 (neighbor discovery) message received from %d.%d, seqno %d\n",
	 from->u8[0], from->u8[1], seqno);

  for(n = list_head(neighbors_list); n != NULL; n = list_item_next(n))
  {
    if(linkaddr_cmp(&n->addr, from))
    {
      n->avg_seqno_gap_other_direction = ru_msg->avg_seqno_gap;
      n->flags |= AVG_SEQNO_GAP_OTHER_DIRECTION;
      //printf("Guardo el n->avg_seqno_gap_other_DIRECCCION de nodo %d.%d\n",from->u8[0],from->u8[1]);
      break;
    }
  }

  if(n == NULL)
  {
      DGHS_DBG_1("ERROR: An agreement from an unknown neighbor has arrived\n");
  }

}
static void sent_runicast(struct runicast_conn *c, const linkaddr_t *to, uint8_t retransmissions)
{
  DGHS_DBG_2("runicast (neighbor discovery) message sent to %d.%d, retransmissions %d\n",
	 to->u8[0], to->u8[1], retransmissions);
}
static void timedout_runicast(struct runicast_conn *c, const linkaddr_t *to, uint8_t retransmissions)
{
  DGHS_DBG_1("ERROR: runicast_1 message timed out when sending to %d.%d, retransmissions %d\n",
	 to->u8[0], to->u8[1], retransmissions);
}

static const struct runicast_callbacks runicast_callbacks = {recv_runicast,
							     sent_runicast,
							     timedout_runicast};
static struct runicast_conn runicast_1;

static void broadcast_recv(struct broadcast_conn *c, const linkaddr_t *from)
{
  struct neighbor *n;
  struct broadcast_message *m;
  static struct runicast_message ru_msg;
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
      DGHS_DBG_1("ERROR: we could not allocate a new neighbor entry - neighbor broadcast\n");
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

  //update de avg_seqno_gap when we are in the ~FLAG_BROADCAST_END phase
  if( !(m->flags & FLAG_BROADCAST_END) )
  {
    n->avg_seqno_gap = (((uint32_t)seqno_gap * SEQNO_EWMA_UNITY) *
                        SEQNO_EWMA_ALPHA) / SEQNO_EWMA_UNITY +
                        ((uint32_t)n->avg_seqno_gap * (SEQNO_EWMA_UNITY -
                                                        SEQNO_EWMA_ALPHA)) /
                                                        SEQNO_EWMA_UNITY;
  }

  /* Remember last seqno we heard. */
  n->last_seqno = m->seqno;

  //The neighbor says he is done AND we have not send the agreement
  if( (m->flags & FLAG_BROADCAST_END) && (!(n->flags & NEIGHBOR_HAS_ENDED_BROADCAST)) )
  {
      //Since the neighbor has finished the BROADCAST, I must send the agreement
      n->flags |= NEIGHBOR_HAS_ENDED_BROADCAST;
      fill_runicast_msg(&ru_msg, n->addr, n->avg_seqno_gap);
      process_post(&master_neighbor_discovery,e_runicast_add_to_list,&ru_msg);
      /*printf("Deseo enviar agreement a %d.%d con avg seqno gap %d.%02d\n",
      ru_msg.addr.u8[0], ru_msg.addr.u8[1],
      (int)(ru_msg.avg_seqno_gap / SEQNO_EWMA_UNITY),
      (int)(((100UL * ru_msg.avg_seqno_gap) / SEQNO_EWMA_UNITY) % 100)
       );*/
  }
  /* Print out a message. */
  /*printf("broadcast message received from %d.%d with seqno %d, RSSI %u, LQI %u, avg seqno gap %d.%02d flags = %04X\n",
         from->u8[0], from->u8[1],
         m->seqno,
         packetbuf_attr(PACKETBUF_ATTR_RSSI),
         packetbuf_attr(PACKETBUF_ATTR_LINK_QUALITY),
         (int)(n->avg_seqno_gap / SEQNO_EWMA_UNITY),
         (int)(((100UL * n->avg_seqno_gap) / SEQNO_EWMA_UNITY) % 100),
         m->flags);*/
}
static const struct broadcast_callbacks broadcast_call = {broadcast_recv};
static struct broadcast_conn broadcast;

PROCESS(master_neighbor_discovery, "master_neighbor_discovery");
PROCESS(send_neighbor_discovery, "send_neighbor_discovery");
PROCESS(broadcast_control, "broadcast_control");
PROCESS(runicast_control, "runicast_control");
PROCESS(analyze_agreement, "analyze_agreement");

PROCESS_THREAD(master_neighbor_discovery, ev, data) //It can not have PROCESS_WAIT_EVENT_UNTIL()
{
    static uint8_t seqno;
    static struct runicast_list *ru_list;
    PROCESS_BEGIN();

    e_broadcast_evaluation = process_alloc_event();
    e_runicast_add_to_list  = process_alloc_event();

    list_init(neighbors_list);
    memb_init(&neighbors_memb);

    while(1)
    {
        PROCESS_WAIT_EVENT(); //Always must return to this wait. It can not use PROCESS_WAIT_EVENT_UNTIL()
        if(ev == e_initialize)
        {
            seqno = 0;

            //Exit the processes
            process_exit(&broadcast_control);
            process_exit(&runicast_control);
            process_exit(&send_neighbor_discovery);
            process_exit(&analyze_agreement);

            //Start the processes
            process_start(&broadcast_control,NULL);
            process_start(&runicast_control,NULL);
            process_start(&send_neighbor_discovery,NULL);
            process_start(&analyze_agreement,NULL);

            process_post(&broadcast_control, e_execute, &seqno);
            DGHS_DBG_2("master_neighbor_discovery initialized\n");
        }else
        if(ev == e_broadcast_evaluation)
        {

            seqno++;
            process_post(&broadcast_control, e_execute, &seqno);
        }else
        if(ev == e_runicast_add_to_list)
        {

            //ADD to the list
            ru_list = memb_alloc(&runicast_agreement_memb);
            if(ru_list == NULL) {            // If we could not allocate a new entry, we give up.
              DGHS_DBG_1("ERROR: we could not allocate a new entry for runicast_list\n");
            }else
            {
                ru_list->msg = *((struct runicast_message*)data);
                list_push(runicast_agreement_list,ru_list); // Add an item to the start of the list.

                /*printf("GUARDO %d.%d con avg seqno gap %d.%02d\n",
                ru_list->msg.addr.u8[0], ru_list->msg.addr.u8[1],
                (int)(ru_list->msg.avg_seqno_gap / SEQNO_EWMA_UNITY),
                (int)(((100UL * ru_list->msg.avg_seqno_gap) / SEQNO_EWMA_UNITY) % 100)
                 );*/
            }
        } //END if
    }
    PROCESS_END();
}

PROCESS_THREAD(broadcast_control, ev, data)
{
    static uint8_t seqno;
    static struct broadcast_message msg;
    static struct etimer et;

    PROCESS_BEGIN();

    while(1)
    {
        PROCESS_WAIT_EVENT();
        if(ev == e_execute)
        {
            seqno = *((uint8_t *) data);
            if(seqno < NUM_BROADCAST_NEIGHBOR_DISCOVERY)
            {
                etimer_set(&et, CLOCK_SECOND * TIME_BROADCAST_INTERVAL_DISCOVERY
                     + random_rand() % (CLOCK_SECOND * TIME_BROADCAST_INTERVAL_DISCOVERY));
                PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));

                fill_broadcast_msg(&msg, seqno, ~FLAG_BROADCAST_END);
                process_post(&send_neighbor_discovery, e_send_broadcast, &msg);
                DGHS_DBG_2("Broadcast - Discover the neighbors\n");
            }else
            if((seqno >= NUM_BROADCAST_NEIGHBOR_DISCOVERY) && (!(every_neighbor_agrees(list_head(neighbors_list))))  )
            {
                etimer_set(&et, CLOCK_SECOND * TIME_BROADCAST_INTERVAL_END
                     + random_rand() % (CLOCK_SECOND * TIME_BROADCAST_INTERVAL_END));
                PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));

                fill_broadcast_msg(&msg, seqno, FLAG_BROADCAST_END);
                process_post(&send_neighbor_discovery, e_send_broadcast, &msg);
                DGHS_DBG_2("Broadcast - End the neighbor discovery\n");
            }
        }
    }

    PROCESS_END();
}

PROCESS_THREAD(analyze_agreement, ev, data)
{
    static struct neighbor *n;
    static struct etimer et;
    PROCESS_BEGIN();

    while(1)
    {
        //execute periodically
        if(TIME_PREVIOUS_RU_MSG < TIME_BROADCAST_INTERVAL_END)
        {
          etimer_set(&et, CLOCK_SECOND * TIME_PREVIOUS_RU_MSG);
        }else
        {
          etimer_set(&et, CLOCK_SECOND * TIME_BROADCAST_INTERVAL_END);
        }

        PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));

            //printf("2 X Quiero ANALIZAR mi perro\n");

            for(n = list_head(neighbors_list); n != NULL; n = list_item_next(n))
            {
                //The node is sure that both values are definitive (avg_seqno_gap AND avg_seqno_gap_other_direction)
                if( (n->flags & AVG_SEQNO_GAP_OTHER_DIRECTION) && (n->flags & NEIGHBOR_HAS_ENDED_BROADCAST)
                    && (!(n->flags & WEIGHT_HAS_BEEN_ASSIGNED))                                            )

                {
                    if( n->avg_seqno_gap > n->avg_seqno_gap_other_direction )
                    {
                        n->weight = n->avg_seqno_gap;

                    }else
                    {
                        n->weight = n->avg_seqno_gap_other_direction;
                    }

                    n->flags |= WEIGHT_HAS_BEEN_ASSIGNED;

                    /*printf("nodo %d.%d tiene weight= %d.%02d\n", n->addr.u8[0],n->addr.u8[1],
                    (int)(n->weight / SEQNO_EWMA_UNITY),
                    (int)(((100UL * n->weight) / SEQNO_EWMA_UNITY) % 100)
                );*/
                }
            }

    }

    PROCESS_END();
}

PROCESS_THREAD(runicast_control, ev, data)
{
    static struct etimer et1, et2;
    static struct runicast_list *ru_list;

    PROCESS_BEGIN();

    while(1)
    {
        //REMOVE from the list
        //execute periodically
        etimer_set(&et1, CLOCK_SECOND * TIME_BROADCAST_INTERVAL_END);
        PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et1));

        while(list_length(runicast_agreement_list))
        {
                //Give enough time to transmit the previous ru_msg
                etimer_set(&et2, CLOCK_SECOND * TIME_PREVIOUS_RU_MSG
                    + random_rand() % (CLOCK_SECOND * TIME_PREVIOUS_RU_MSG));
                PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et2));

                if(!runicast_is_transmitting(&runicast_1))
                {
                    //remove from list
                    ru_list = list_chop(runicast_agreement_list); // Remove the last object on the list.
                    process_post(&send_neighbor_discovery, e_send_runicast, &ru_list->msg);
                    memb_free(&runicast_agreement_memb,ru_list);
                }else
                {
                    //DGHS_DBG_2("WARNING: break from runicast_control\n"); //"Enough" time is not enough!!
                    break;
                }
        } //While(There are elements in the list)

    } //END while(1)

    PROCESS_END();
}




PROCESS_THREAD(send_neighbor_discovery, ev, data)
{

    static struct runicast_message ru_msg;

    PROCESS_EXITHANDLER(broadcast_close(&broadcast);runicast_close(&runicast_1);)
    PROCESS_BEGIN();

    broadcast_open(&broadcast, 129, &broadcast_call);
    runicast_open(&runicast_1, RUNICAST_CHANNEL_1, &runicast_callbacks);

    /* OPTIONAL: Sender history */
    list_init(history_table_1);
    memb_init(&history_mem_1);

    e_send_broadcast = process_alloc_event();
    e_send_runicast  = process_alloc_event();

    while(1)
    {
        PROCESS_WAIT_EVENT();
        if(ev == e_send_broadcast)
        {

            packetbuf_copyfrom((struct broadcast_message *)data, sizeof(struct broadcast_message));
            broadcast_send(&broadcast);

            process_post(&master_neighbor_discovery,e_broadcast_evaluation,NULL);
        }else
        if(ev == e_send_runicast)
        {
            ru_msg = *((struct runicast_message *)data);
            packetbuf_copyfrom(&ru_msg, sizeof(struct runicast_message));

            /*printf("ENVIO Runicast %d.%d con avg seqno gap %d.%02d\n",
            ru_msg.addr.u8[0], ru_msg.addr.u8[1],
            (int)(ru_msg.avg_seqno_gap / SEQNO_EWMA_UNITY),
            (int)(((100UL * ru_msg.avg_seqno_gap) / SEQNO_EWMA_UNITY) % 100)
            );*/

            runicast_send(&runicast_1, &ru_msg.addr, NUM_MAX_RETRANSMISSIONS);
        }
    }

    PROCESS_END();
}

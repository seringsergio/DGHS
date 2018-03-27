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
#include "Gallager_Humblet_Spira.h"


LIST(history_table_2);
MEMB(history_mem_2, struct history_entry, NUM_HISTORY_ENTRIES);

LIST(out_union_list);
MEMB(out_union_mem, struct out_list, QUEUE_SIZE_GHS);

PROCESS(procedure_wakeup, "procedure_wakeup");
PROCESS(send_Gallager_Humblet_Spira, "send_Gallager_Humblet_Spira");
PROCESS(out_union_evaluation, "out_union_evaluation");


static void recv_runicast(struct runicast_conn *c, const linkaddr_t *from, uint8_t seqno)
{
  /* OPTIONAL: Sender history */
  struct history_entry *e = NULL;
  for(e = list_head(history_table_2); e != NULL; e = e->next) {
    if(linkaddr_cmp(&e->addr, from)) {
      break;
    }
  }
  if(e == NULL) {
    /* Create new history entry */
    e = memb_alloc(&history_mem_2);
    if(e == NULL) {
      e = list_chop(history_table_2); /* Remove oldest at full history */
    }
    linkaddr_copy(&e->addr, from);
    e->seq = seqno;
    list_push(history_table_2, e);
  } else {
    /* Detect duplicate callback */
    if(e->seq == seqno) {
      printf("runicast message received from %d.%d, seqno %d (DUPLICATE)\n",
	     from->u8[0], from->u8[1], seqno);
      return;
    }
    /* Update existing history entry */
    e->seq = seqno;
  }

  printf("runicast message received from %d.%d, seqno %d\n",
	 from->u8[0], from->u8[1], seqno);
}
static void sent_runicast(struct runicast_conn *c, const linkaddr_t *to, uint8_t retransmissions)
{
  printf("runicast message sent to %d.%d, retransmissions %d\n",
	 to->u8[0], to->u8[1], retransmissions);
}
static void timedout_runicast(struct runicast_conn *c, const linkaddr_t *to, uint8_t retransmissions)
{
  printf("runicast message timed out when sending to %d.%d, retransmissions %d\n",
	 to->u8[0], to->u8[1], retransmissions);
}
static const struct runicast_callbacks runicast_callbacks = {recv_runicast,
							     sent_runicast,
							     timedout_runicast};
static struct runicast_conn runicast;

PROCESS_THREAD(procedure_wakeup, ev, data) //It can not have PROCESS_WAIT_EVENT_UNTIL()
{
    static struct connect_msg co_msg;
    static struct out_list *out_l;

    PROCESS_BEGIN();

    e_send_connect = process_alloc_event();

    while(1)
    {
        PROCESS_WAIT_EVENT();
        if(ev == e_execute)
        {
          DGHS_DBG_2("procedure_wakeup\n");

          init_SE();
          sort_neighbor_list();
          become_branch(neighbors_list_p); //Become branch the edge with minimum weight. We have just sorted the list
          node.LE = 0;
          node.SN = FOUND;
          node.find_count = 0;

          fill_connect_msg(&co_msg, &neighbors_list_p->addr, node.LE);

          //ADD to the list
          out_l = memb_alloc(&out_union_mem);
          if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
            DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>>\n");
          }else
          {
              out_l->type_msg.co_msg     = co_msg;
              out_l->uniontype           = CONNECT_MSG;
              list_push(out_union_list,out_l); // Add an item to the start of the list.
          }

          DGHS_DBG_2("Added to out_union_list\n");


          //process_post(&send_Gallager_Humblet_Spira,e_send_connect,&co_msg);
          //print_neighbor_list_debug(neighbors_list_p);
          //Since the list is ordered the first element becomes branch
          //become_branch(neighbors_list_p);
          //lowest_edge = find_edge_of_minimum_weight(neighbors_list_p);
          //print_neighbor_list(neighbors_list_p);

        }
    }

    PROCESS_END();

}

PROCESS_THREAD(out_union_evaluation, ev, data)
{
  static struct etimer et1, et2;
  static struct out_list *out_l;

  PROCESS_BEGIN();


  while(1)
  {

    //REMOVE from the list
    //execute periodically
    etimer_set(&et1, CLOCK_SECOND * TIME_OUT_UNION);
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et1));

    while(list_length(out_union_list))
    {
        DGHS_DBG_2("List out_union_list has at least 1 element\n");

        //Give enough time to transmit the previous msg
        etimer_set(&et2, CLOCK_SECOND * TIME_PREVIOUS_MSG_OUT_UNION
            + random_rand() % (CLOCK_SECOND * TIME_PREVIOUS_MSG_OUT_UNION));
        PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et2));

        if(!runicast_is_transmitting(&runicast))
        {
            //remove from list
            out_l = list_chop(out_union_list); // Remove the last object on the list.
            if(out_l->uniontype == CONNECT_MSG)
            {
                process_post(&send_Gallager_Humblet_Spira, e_send_connect, &out_l->type_msg.co_msg);
                DGHS_DBG_2("Post e_send_connect\n");
            }
            memb_free(&out_union_mem,out_l);

        }else
        {
            //DGHS_DBG_2("WARNING: break from runicast_control\n"); //"Enough" time is not enough!!
            break;
        }

    } //END while

  }

  PROCESS_END();

}

PROCESS_THREAD(send_Gallager_Humblet_Spira, ev, data) //It can not have PROCESS_WAIT_EVENT_UNTIL()
{
  static struct connect_msg co_msg;

  PROCESS_EXITHANDLER(runicast_close(&runicast);)

  PROCESS_BEGIN();

  runicast_open(&runicast, RUNICAST_CHANNEL_2, &runicast_callbacks);
  /* OPTIONAL: Sender history */
  list_init(history_table_2);
  memb_init(&history_mem_2);

  while(1)
  {
    PROCESS_WAIT_EVENT();
    if(ev == e_send_connect)
    {
      co_msg = *( (struct connect_msg*) data );

      packetbuf_copyfrom(&co_msg, sizeof(struct connect_msg));
      runicast_send(&runicast, &co_msg.addr, NUM_MAX_RETRANSMISSIONS);

      DGHS_DBG_2("Send e_send_connect to %d.%d with level %d\n" , co_msg.addr.u8[0], co_msg.addr.u8[1], co_msg.LE );
    }
  }

  PROCESS_END();


}

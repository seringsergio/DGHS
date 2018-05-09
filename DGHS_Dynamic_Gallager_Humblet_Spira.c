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

#include "Dynamic_Gallager_Humblet_Spira.h"

LIST(history_table_3);
MEMB(history_mem_3, struct history_entry, NUM_HISTORY_ENTRIES);

LIST(out_union_list);
MEMB(out_union_mem, struct in_out_list_dghs, QUEUE_SIZE_GHS);

LIST(in_union_list);
MEMB(in_union_mem, struct in_out_list_dghs, QUEUE_SIZE_GHS);

// Reliable unicast that receives the GHS messages: Connect, initiate, test, accept, reject, report, change_root
static void recv_runicast(struct runicast_conn *c, const linkaddr_t *from, uint8_t seqno)
{
  static packetbuf_attr_t msg_type;
  static struct in_out_list_dghs *in_l;

  void *msg = packetbuf_dataptr();

  /* OPTIONAL: Sender history */
  struct history_entry *e = NULL;
  for(e = list_head(history_table_3); e != NULL; e = e->next) {
    if(linkaddr_cmp(&e->addr, from)) {
      break;
    }
  }
  if(e == NULL) {
    /* Create new history entry */
    e = memb_alloc(&history_mem_3);
    if(e == NULL) {
      e = list_chop(history_table_3); /* Remove oldest at full history */
    }
    linkaddr_copy(&e->addr, from);
    e->seq = seqno;
    list_push(history_table_3, e);
  } else {
    /* Detect duplicate callback */
    if(e->seq == seqno) {
      DGHS_DBG_2("runicast message received from %d.%d, seqno %d (DUPLICATE)\n",
	     from->u8[0], from->u8[1], seqno);
      return;
    }
    /* Update existing history entry */
    e->seq = seqno;
  }

  msg_type = packetbuf_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG);

  //Adds the message to the list in_union_list according the type of message
  if(msg_type == END_GHS_MSG)
  {

    //ADD to the list
    in_l = memb_alloc(&in_union_mem);
    if(in_l == NULL) {            // If we could not allocate a new entry, we give up.
      DGHS_DBG_1("ERROR: we could not allocate a new entry for <<in_union_list>>\n");
    }else
    {
        in_l->type_msg.end_ghs     = *((struct end_ghs*) msg);
        in_l->uniontype            = END_GHS_MSG;
        list_push(in_union_list,in_l); // Add an item to the start of the list.
        DGHS_DBG_2("runicast message received END_GHS_MSG from %d.%d \n",
        in_l->type_msg.end_ghs.from.u8[0], in_l->type_msg.end_ghs.from.u8[1] );
    }

  }else
  if(msg_type == POINT_TO_SINK_MSG)
  {

    //ADD to the list
    in_l = memb_alloc(&in_union_mem);
    if(in_l == NULL) {            // If we could not allocate a new entry, we give up.
      DGHS_DBG_1("ERROR: we could not allocate a new entry for <<in_union_list>>\n");
    }else
    {
        in_l->type_msg.point_to_sink   = *((struct point_to_sink*) msg);
        in_l->uniontype                = POINT_TO_SINK_MSG;
        list_push(in_union_list,in_l); // Add an item to the start of the list.
        DGHS_DBG_2("runicast message received POINT_TO_SINK_MSG from %d.%d \n",
        in_l->type_msg.point_to_sink.from.u8[0], in_l->type_msg.point_to_sink.from.u8[1]);
    }
  }
  else
  {
    DGHS_DBG_1("ERROR: The type of the message ( msg_type ) is unkown in dghs \n");
  }

  //process_post_synch(&in_union_evaluation, e_execute, NULL);


}

static void sent_runicast(struct runicast_conn *c, const linkaddr_t *to, uint8_t retransmissions)
{
  DGHS_DBG_2("runicast (DGHS) message sent to %d.%d, retransmissions %d\n",
	 to->u8[0], to->u8[1], retransmissions);
}
static void timedout_runicast(struct runicast_conn *c, const linkaddr_t *to, uint8_t retransmissions)
{
  DGHS_DBG_1("ERROR: runicast message timed out (DGHS) when sending to %d.%d, retransmissions %d\n",
	 to->u8[0], to->u8[1], retransmissions);
}
static const struct runicast_callbacks runicast_callbacks = {recv_runicast,
							                                               sent_runicast,
							                                               timedout_runicast};
static struct runicast_conn runicast_3;

PROCESS(start_dynamic_ghs,"start_dynamic_ghs");
PROCESS(send_Dynamic_Gallager_Humblet_Spira,"send_Dynamic_Gallager_Humblet_Spira");
PROCESS(procedure_retransmit, "procedure_retransmit");
PROCESS(out_evaluation_dghs, "out_evaluation_dghs");
PROCESS(in_evaluation_dghs, "in_evaluation_dghs");
PROCESS(response_to_end_ghs,"response_to_end_ghs");
PROCESS(response_to_point_to_sink,"response_to_point_to_sink");

PROCESS_THREAD(start_dynamic_ghs, ev, data) //It can not have PROCESS_WAIT_EVENT_UNTIL()
{
  static uint8_t flags;

  PROCESS_BEGIN();

  e_send_end_ghs        = process_alloc_event();
  e_send_point_to_sink  = process_alloc_event();

  runicast_open(&runicast_3, RUNICAST_CHANNEL_3, &runicast_callbacks);
  /* OPTIONAL: Sender history */
  list_init(history_table_3);
  memb_init(&history_mem_3);

  list_init(out_union_list);
  memb_init(&out_union_mem);

  list_init(in_union_list);
  memb_init(&in_union_mem);

  while(1)
  {
    PROCESS_YIELD();
    if(ev == e_execute)
    {
        DGHS_DBG_2("start_dynamic_ghs\n");

        if( I_am_the_sink() )
        {
             DGHS_DBG_1("#L %d 0\n", node.in_branch.u8[0]); // 0: old parent
             flags |= INCLUDING_PARENT;
             flags |= POINT_TO_SINK_MSG;
             process_post(&procedure_retransmit, e_execute, &flags);

             DGHS_interface_control_flags(DATA_COLLECTION);

        }else
        {
             flags &= ~INCLUDING_PARENT;
             flags |= END_GHS_MSG;
             process_post(&procedure_retransmit, e_execute, &flags);
        }
    }


  }

  PROCESS_END();

}

PROCESS_THREAD(procedure_retransmit, ev, data) //It can not have PROCESS_WAIT_EVENT_UNTIL()
{
  static uint8_t flags;
  static struct neighbor *n;
  static struct in_out_list_dghs *out_l;
  static struct end_ghs end_ghs;
  static struct point_to_sink point_to_sink;

  PROCESS_BEGIN();

  while(1)
  {
    PROCESS_YIELD();
    if(ev == e_execute)
    {
       flags = *( (uint8_t *) data );

       if( flags & INCLUDING_PARENT )
       {
           for(n = neighbors_list_p; n != NULL; n = list_item_next(n))
           {
               if(is_branch(&n->addr))
               {
                   if(flags & END_GHS_MSG)
                   {
                     fill_end_ghs_msg(&end_ghs,&n->addr,&linkaddr_node_addr);
                     //ADD to the list a runicast message END_GHS_MSG
                     out_l = memb_alloc(&out_union_mem);
                     if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
                       DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>> in DGHS\n");
                     }else
                     {
                         out_l->type_msg.end_ghs     = end_ghs;
                         out_l->uniontype            = END_GHS_MSG;
                         list_push(out_union_list,out_l); // Add an item to the start of the list.
                     }
                   }else if(flags & POINT_TO_SINK_MSG)
                         {
                             //ADD to the list a runicast message POINT_TO_SINK_MSG
                             fill_point_to_sink_msg(&point_to_sink,&n->addr,&linkaddr_node_addr);
                             //ADD to the list a runicast message END_GHS
                             out_l = memb_alloc(&out_union_mem);
                             if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
                               DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>> in DGHS\n");
                             }else
                             {
                                 out_l->type_msg.point_to_sink  = point_to_sink;
                                 out_l->uniontype               = POINT_TO_SINK_MSG;
                                 list_push(out_union_list,out_l); // Add an item to the start of the list.
                             }
                         }else
                         {
                           DGHS_DBG_2("ERROR: The type of message is unkown. It must be END_GHS or POINT_TO_SINK\n");
                         }
               }
           }
       }else
       {
           for(n = neighbors_list_p; n != NULL; n = list_item_next(n))
           {
               if( (is_branch(&n->addr)) && (!(linkaddr_cmp(&n->addr,&node.in_branch))) )
               {
                   if(flags & END_GHS_MSG)
                   {
                     fill_end_ghs_msg(&end_ghs,&n->addr,&linkaddr_node_addr);
                     //ADD to the list a runicast message END_GHS_MSG
                     out_l = memb_alloc(&out_union_mem);
                     if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
                       DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>> in DGHS\n");
                     }else
                     {
                         out_l->type_msg.end_ghs     = end_ghs;
                         out_l->uniontype            = END_GHS_MSG;
                         list_push(out_union_list,out_l); // Add an item to the start of the list.
                     }
                   }else if(flags & POINT_TO_SINK_MSG)
                         {
                           //ADD to the list a runicast message POINT_TO_SINK_MSG
                           fill_point_to_sink_msg(&point_to_sink,&n->addr,&linkaddr_node_addr);
                           //ADD to the list a runicast message END_GHS
                           out_l = memb_alloc(&out_union_mem);
                           if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
                             DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>> in DGHS\n");
                           }else
                           {
                               out_l->type_msg.point_to_sink  = point_to_sink;
                               out_l->uniontype               = POINT_TO_SINK_MSG;
                               list_push(out_union_list,out_l); // Add an item to the start of the list.
                           }
                         }else
                         {
                           DGHS_DBG_2("ERROR: The type of message is unkown. It must be END_GHS or POINT_TO_SINK\n");
                         }
               }
           }
       }
    }
  } //while(1)

  PROCESS_END();
}


PROCESS_THREAD(response_to_end_ghs, ev, data)
{
  //static struct end_ghs end_ghs;
  static uint8_t flags;

  PROCESS_BEGIN();

  while(1)
  {
      PROCESS_YIELD();
      if(ev == e_execute)
      {
          //end_ghs = *( (struct end_ghs *) data);
          if(I_am_the_sink())
          {
            DGHS_DBG_1("#L %d 0\n", node.in_branch.u8[0]); // 0: old parent
            flags |= INCLUDING_PARENT;
            flags |= POINT_TO_SINK_MSG;
            process_post(&procedure_retransmit, e_execute, &flags);

            DGHS_interface_control_flags(DATA_COLLECTION);

          }else
          {
            flags &= ~INCLUDING_PARENT;
            flags |= END_GHS_MSG;
            process_post(&procedure_retransmit, e_execute, &flags);
          }
      }
  }
  PROCESS_END();
}

PROCESS_THREAD(response_to_point_to_sink, ev, data)
{
  static struct point_to_sink point_to_sink;
  static uint8_t flags;

  PROCESS_BEGIN();
  while(1)
  {
      PROCESS_YIELD();
      if(ev == e_execute)
      {
          point_to_sink = *( (struct point_to_sink *) data);
          DGHS_DBG_1("#L %d 0\n", node.in_branch.u8[0]); // 0: old parent
          linkaddr_copy(&node.in_branch, &point_to_sink.from);
          DGHS_DBG_1("#L %d 1\n", node.in_branch.u8[0]); //: 1: new parent

          flags &= ~INCLUDING_PARENT;
          flags |= POINT_TO_SINK_MSG;
          process_post(&procedure_retransmit, e_execute, &flags);

          //Since I am pointing to sink, I can collect data and send it to the sink
          DGHS_interface_control_flags(DATA_COLLECTION);

      }
  }
  PROCESS_END();
}

// take out an element from the list out_union_list
PROCESS_THREAD(out_evaluation_dghs, ev, data)
{
  static struct etimer et1, et2;
  static struct in_out_list_dghs *out_l;

  PROCESS_BEGIN();

  while(1)
  {
    //REMOVE from the list
    //execute periodically
    etimer_set(&et1, CLOCK_SECOND * TIME_UNION_IN_OUT);
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et1));

        //We start to analize outgoing messages when the GHS_HAS_ENDED
        //if(node.control_flags_neighbor_discovery & GHS_HAS_ENDED)
        //{
          while(list_length(out_union_list))
          {
              //DGHS_DBG_2("while(list_length(out_union_list))\n");
              //Give enough time to transmit the previous msg
              etimer_set(&et2, CLOCK_SECOND * TIME_PREVIOUS_MSG_IN_OUT_UNION);
              PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et2));

              if(!runicast_is_transmitting(&runicast_3))
              {
                  //remove from list
                  out_l = list_chop(out_union_list); // Remove the last object on the list.
                  if(out_l->uniontype == END_GHS_MSG)
                  {
                    process_post(&send_Dynamic_Gallager_Humblet_Spira, e_send_end_ghs, &out_l->type_msg.end_ghs);
                  }else
                  if(out_l->uniontype == POINT_TO_SINK_MSG)
                  {
                    process_post(&send_Dynamic_Gallager_Humblet_Spira, e_send_point_to_sink,&out_l->type_msg.point_to_sink);
                  }else
                  {
                      DGHS_DBG_1("ERROR: The type of msg in out_union_list is unkown (dghs) \n");
                  }
                  memb_free(&out_union_mem,out_l);
              }else
              {
                  //DGHS_DBG_2("WARNING: break from runicast_control\n"); //"Enough" time is not enough!!
                  break;
              }
          } //END while list_length()
        //}
  } //while (1)

  PROCESS_END();
}

// take out an element from the list in_union_list
PROCESS_THREAD(in_evaluation_dghs, ev, data)
{
  static struct etimer et1, et2;
  static struct in_out_list_dghs *in_l;
  PROCESS_BEGIN();
  while(1)
  {
    //REMOVE from the list
    //execute periodically
    etimer_set(&et1, CLOCK_SECOND * TIME_UNION_IN_OUT);
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et1));
        //We start to analize incoming messages when GHS_HAS_ENDED
        //if(node.control_flags_neighbor_discovery & GHS_HAS_ENDED)
        //{
            while(list_length(in_union_list))
            {
              //DGHS_DBG_2("while(list_length(in_union_list))\n");
              //Give enough time to transmit the previous msg
              etimer_set(&et2, CLOCK_SECOND * TIME_PREVIOUS_MSG_IN_OUT_UNION);
              PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et2));
              //remove from list
              in_l = list_chop(in_union_list); // Remove the last object on the list.
              if(in_l->uniontype == END_GHS_MSG)
              {
                  process_post(&response_to_end_ghs, e_execute, &in_l->type_msg.end_ghs);
              }else if(in_l->uniontype == POINT_TO_SINK_MSG)
                {
                  process_post(&response_to_point_to_sink, e_execute, &in_l->type_msg.point_to_sink);
                }else
                {
                  DGHS_DBG_1("ERROR: The type of msg in in_union_list is unkown (dghs) \n");
                }
              memb_free(&in_union_mem,in_l);
            } //while(list_length(in_union_list))
        //}
  }
  PROCESS_END();
}

// Send the msg of GHS: Connect, initiate, test, accept, reject, report, change_root
PROCESS_THREAD(send_Dynamic_Gallager_Humblet_Spira, ev, data) //It can not have PROCESS_WAIT_EVENT_UNTIL()
{
  static struct end_ghs        end_ghs;
  static struct point_to_sink  point_to_sink;

  PROCESS_EXITHANDLER(runicast_close(&runicast_3);)

  PROCESS_BEGIN();

  while(1)
  {
    PROCESS_YIELD();
    if(ev == e_send_end_ghs)
    {
        end_ghs = *( (struct end_ghs*) data );

        packetbuf_copyfrom(&end_ghs, sizeof(struct end_ghs));
        packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, END_GHS_MSG);
        runicast_send(&runicast_3, &end_ghs.to, NUM_MAX_RETRANSMISSIONS);

        DGHS_DBG_2("Send e_send_end_ghs to %d.%d \n" , end_ghs.to.u8[0], end_ghs.to.u8[1] );
    }else
    if(ev == e_send_point_to_sink)
    {
       point_to_sink = *( (struct point_to_sink*) data );

       packetbuf_copyfrom(&point_to_sink, sizeof(struct point_to_sink));
       packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, POINT_TO_SINK_MSG);
       runicast_send(&runicast_3, &point_to_sink.to, NUM_MAX_RETRANSMISSIONS);

       DGHS_DBG_2("Send e_send_point_to_sink to %d.%d\n" ,
       point_to_sink.to.u8[0], point_to_sink.to.u8[1]);

    }else
    {
      DGHS_DBG_1("ERROR: The type of msg in send_Dynamic_Gallager_Humblet_Spira is unkown \n");
    }
  }

  PROCESS_END();


}

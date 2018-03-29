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
MEMB(out_union_mem, struct in_out_list, QUEUE_SIZE_GHS);

LIST(in_union_list);
MEMB(in_union_mem, struct in_out_list, QUEUE_SIZE_GHS);

PROCESS(procedure_wakeup, "procedure_wakeup");
PROCESS(send_Gallager_Humblet_Spira, "send_Gallager_Humblet_Spira");
PROCESS(out_union_evaluation, "out_union_evaluation");
PROCESS(in_union_evaluation, "in_union_evaluation");
PROCESS(response_to_connect,"response_to_connect");
PROCESS(response_to_initiate, "response_to_initiate");
PROCESS(procedure_test, "procedure_test");
PROCESS(procedure_report, "procedure_report");
PROCESS(response_to_test, "response_to_test");
PROCESS(response_to_accept,"response_to_accept");


static void recv_runicast(struct runicast_conn *c, const linkaddr_t *from, uint8_t seqno)
{
  packetbuf_attr_t msg_type;
  static struct in_out_list *in_l;

  void *msg = packetbuf_dataptr();

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

  msg_type = packetbuf_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG);

  if(msg_type == CONNECT_MSG)
  {

    //ADD to the list
    in_l = memb_alloc(&in_union_mem);
    if(in_l == NULL) {            // If we could not allocate a new entry, we give up.
      DGHS_DBG_1("ERROR: we could not allocate a new entry for <<in_union_list>>\n");
    }else
    {
        in_l->type_msg.co_msg     = *((struct connect_msg*) msg);
        in_l->uniontype           = CONNECT_MSG;
        list_push(in_union_list,in_l); // Add an item to the start of the list.
        DGHS_DBG_2("runicast message received CONNECT from %d.%d L %d\n",
        in_l->type_msg.co_msg.from.u8[0], in_l->type_msg.co_msg.from.u8[1], in_l->type_msg.co_msg.L );
    }

  }else
  if(msg_type == INITIATE_MSG)
  {

    //ADD to the list
    in_l = memb_alloc(&in_union_mem);
    if(in_l == NULL) {            // If we could not allocate a new entry, we give up.
      DGHS_DBG_1("ERROR: we could not allocate a new entry for <<in_union_list>>\n");
    }else
    {
        in_l->type_msg.i_msg      = *((struct initiate_msg*) msg);
        in_l->uniontype           = INITIATE_MSG;
        list_push(in_union_list,in_l); // Add an item to the start of the list.
        DGHS_DBG_2("runicast message received INITIATE from %d.%d with L=%d F=%d.%02d S=%d \n",
        in_l->type_msg.i_msg.from.u8[0], in_l->type_msg.i_msg.from.u8[1],
        in_l->type_msg.i_msg.L,
        (int)(in_l->type_msg.i_msg.F / SEQNO_EWMA_UNITY),
        (int)(((100UL * in_l->type_msg.i_msg.F) / SEQNO_EWMA_UNITY) % 100),
        in_l->type_msg.i_msg.S);
    }

  }else
  if(msg_type == TEST_MSG)
  {
        //ADD to the list
        in_l = memb_alloc(&in_union_mem);
        if(in_l == NULL) {            // If we could not allocate a new entry, we give up.
          DGHS_DBG_1("ERROR: we could not allocate a new entry for <<in_union_list>>\n");
        }else
        {
            in_l->type_msg.t_msg      = *((struct test_msg*) msg);
            in_l->uniontype           = TEST_MSG;
            list_push(in_union_list,in_l); // Add an item to the start of the list.
            DGHS_DBG_2("runicast message received TEST from %d.%d with L=%d F=%d.%02d \n",
            in_l->type_msg.t_msg.from.u8[0], in_l->type_msg.t_msg.from.u8[1],
            in_l->type_msg.t_msg.L,
            (int)(in_l->type_msg.t_msg.F / SEQNO_EWMA_UNITY),
            (int)(((100UL * in_l->type_msg.t_msg.F) / SEQNO_EWMA_UNITY) % 100) );
        }

  }else
  if(msg_type == ACCEPT_MSG)
  {
        //ADD to the list
        in_l = memb_alloc(&in_union_mem);
        if(in_l == NULL) {            // If we could not allocate a new entry, we give up.
          DGHS_DBG_1("ERROR: we could not allocate a new entry for <<in_union_list>>\n");
        }else
        {
            in_l->type_msg.a_msg      = *((struct accept_msg*) msg);
            in_l->uniontype           = ACCEPT_MSG;
            list_push(in_union_list,in_l); // Add an item to the start of the list.
            DGHS_DBG_2("runicast message received ACCEPT_MSG from %d.%d \n",
            in_l->type_msg.a_msg.from.u8[0], in_l->type_msg.a_msg.from.u8[1] );
        }
  }
  else
  {
    DGHS_DBG_1("ERROR: The type of the message ( msg_type ) is unkown \n");
  }

}
static void sent_runicast(struct runicast_conn *c, const linkaddr_t *to, uint8_t retransmissions)
{
  printf("runicast message sent to %d.%d, retransmissions %d\n",
	 to->u8[0], to->u8[1], retransmissions);
}
static void timedout_runicast(struct runicast_conn *c, const linkaddr_t *to, uint8_t retransmissions)
{
  DGHS_DBG_1("ERROR: runicast message timed out when sending to %d.%d, retransmissions %d\n",
	 to->u8[0], to->u8[1], retransmissions);
}
static const struct runicast_callbacks runicast_callbacks = {recv_runicast,
							     sent_runicast,
							     timedout_runicast};
static struct runicast_conn runicast;

PROCESS_THREAD(procedure_wakeup, ev, data) //It can not have PROCESS_WAIT_EVENT_UNTIL()
{
    static struct connect_msg co_msg;
    static struct in_out_list *out_l;

    PROCESS_BEGIN();

    e_send_connect  = process_alloc_event();
    e_send_initiate = process_alloc_event();

    while(1)
    {
        PROCESS_WAIT_EVENT();
        if(ev == e_execute)
        {
          DGHS_DBG_2("procedure_wakeup\n");

          init_SE();
          sort_neighbor_list();
          print_neighbor_list(neighbors_list_p);

          become_branch(&neighbors_list_p->addr); //Become branch the edge with minimum weight. We have just sorted the list
          node.LN = 0; //book: each process starts as a fragment with name and level 0.
            node.FN = 0; //book: each process starts as a fragment with name and level 0.
          node.SN = FOUND;
          node.find_count = 0;

          fill_connect_msg(&co_msg, &neighbors_list_p->addr, &linkaddr_node_addr, node.LN);

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
          //DGHS_DBG_2("Added to out_union_list\n");

        }
    }

    PROCESS_END();

}

PROCESS_THREAD(in_union_evaluation, ev, data)
{
  static struct etimer et1, et2;
  static struct in_out_list *in_l;

  PROCESS_BEGIN();

  while(1)
  {
    //REMOVE from the list
    //execute periodically
    etimer_set(&et1, CLOCK_SECOND * TIME_UNION_IN_OUT);
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et1));

    //We start to analize incoming messages when the NEIGHBOR_DISCOVERY_HAS_ENDED
    if(node.control_flags_neighbor_discovery & NEIGHBOR_DISCOVERY_HAS_ENDED)
    {
        while(list_length(in_union_list))
        {
          //DGHS_DBG_2("List in_union_list has at least 1 element\n");
          //DGHS_DBG_2("list_length(in_union_list) = %d\n", list_length(in_union_list));

          //Give enough time to transmit the previous msg
          etimer_set(&et2, CLOCK_SECOND * TIME_PREVIOUS_MSG_IN_OUT_UNION
              + random_rand() % (CLOCK_SECOND * TIME_PREVIOUS_MSG_IN_OUT_UNION));
          PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et2));

          //remove from list
          in_l = list_chop(in_union_list); // Remove the last object on the list.
          if(in_l->uniontype == CONNECT_MSG)
          {
              process_post_synch(&response_to_connect, e_execute, &in_l->type_msg.co_msg);
          }else
          if(in_l->uniontype == INITIATE_MSG)
          {
            process_post_synch(&response_to_initiate, e_execute, &in_l->type_msg.i_msg);
          }else
          if(in_l->uniontype == TEST_MSG)
          {
            process_post_synch(&response_to_test, e_execute, &in_l->type_msg.t_msg);
          }else
          if(in_l->uniontype == ACCEPT_MSG)
          {
            process_post_synch(&response_to_accept, e_execute, &in_l->type_msg.a_msg);
          }
          memb_free(&in_union_mem,in_l);
          //DGHS_DBG_2("memb_free\n");

        } //while(list_length(in_union_list))

    } //IF NEIGHBOR_DISCOVERY_HAS_ENDED

  }

  PROCESS_END();
}



PROCESS_THREAD(response_to_connect, ev, data)
{

  static struct connect_msg co_msg;
  static struct initiate_msg i_msg;
  static struct in_out_list *out_l, *in_l;

  PROCESS_BEGIN();

  while(1)
  {
    PROCESS_WAIT_EVENT();
    if(ev == e_execute)
    {
        co_msg = *( (struct connect_msg *) data);

        DGHS_DBG_2("response_to_connect from %d.%d level %d\n", co_msg.from.u8[0], co_msg.from.u8[1], co_msg.L );

        if(co_msg.L < node.LN) //OJO: va sin el igual
        {
            become_branch(&co_msg.from); //Become branch the edge with minimum weight. We have just sorted the list

            fill_initiate_msg(&i_msg, &co_msg.from, &linkaddr_node_addr, node.LN, node.FN, node.SN);
            //ADD to the list
            out_l = memb_alloc(&out_union_mem);
            if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
              DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>>\n");
            }else
            {

                out_l->type_msg.i_msg      = i_msg;
                out_l->uniontype           = INITIATE_MSG;
                list_push(out_union_list,out_l); // Add an item to the start of the list.
                //DGHS_DBG_2("Add an INITIATE_MSG to out_union_list\n");
            }

            if(node.SN == FIND)
            {
              node.find_count++;
            }

        }else
        if( is_basic(&co_msg.from) )
        {
              DGHS_DBG_2("is_basic\n");

              //place received message on end of queue
              //ADD to the list
              in_l = memb_alloc(&in_union_mem);
              //DGHS_DBG_2("memb_alloc\n");
              if(in_l == NULL) {            // If we could not allocate a new entry, we give up.
                DGHS_DBG_1("ERROR: we could not allocate a new entry for <<in_union_list>> ---\n");
              }else
              {
                  in_l->type_msg.co_msg     = co_msg;
                  in_l->uniontype           = CONNECT_MSG;
                  list_push(in_union_list,in_l); // Add an item to the start of the list.
              }

              //PROCESS_PAUSE(); // to allow for other processes to get a slice of the processor's time in between.

        }else
        {

          DGHS_DBG_2("is_NOT_basic\n");

          fill_initiate_msg(&i_msg, &co_msg.from, &linkaddr_node_addr, node.LN + 1, weight(&co_msg.from), FIND);
          //ADD to the list
          out_l = memb_alloc(&out_union_mem);
          if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
            DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>>\n");
          }else
          {

              out_l->type_msg.i_msg      = i_msg;
              out_l->uniontype           = INITIATE_MSG;
              list_push(out_union_list,out_l); // Add an item to the start of the list.
              //DGHS_DBG_2("Add an INITIATE_MSG to out_union_list\n");
          }


        }

    } //IF e_execute

  }

  PROCESS_END();
}



PROCESS_THREAD(response_to_initiate, ev, data)
{

  static struct initiate_msg i_msg, i_msg_temp;
  static struct neighbor *n;
  static struct in_out_list *out_l;

  PROCESS_BEGIN();

  while(1)
  {
      PROCESS_WAIT_EVENT();
      if(ev == e_execute)
      {
          i_msg = *( (struct initiate_msg *) data);

          node.LN = i_msg.L;
          node.FN = i_msg.F;
          node.SN = i_msg.S;
          linkaddr_copy(&node.in_branch, &i_msg.from);
          linkaddr_copy(&node.best_edge, &linkaddr_null); //linkaddr_null: The null Rime address.
          node.best_wt = INFINITE;


          for(n = neighbors_list_p; n != NULL; n = list_item_next(n))
          {
            if(  ( !(linkaddr_cmp(&n->addr,&i_msg.from))  ) && (is_branch(&n->addr))    )
            {

              fill_initiate_msg(&i_msg_temp, &n->addr, &linkaddr_node_addr, i_msg.L, i_msg.F, i_msg.S);
              //ADD to the list
              out_l = memb_alloc(&out_union_mem);
              if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
                DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>>\n");
              }else
              {

                  out_l->type_msg.i_msg      = i_msg_temp;
                  out_l->uniontype           = INITIATE_MSG;
                  list_push(out_union_list,out_l); // Add an item to the start of the list.
              }

              if(i_msg.S == FIND)
              {
                  node.find_count++;
              }

            }
          } //END for

          if(i_msg.S == FIND)
          {
              process_post_synch(&procedure_test, e_execute, NULL);
          }
      }
  }

  PROCESS_END();
}


PROCESS_THREAD(response_to_test, ev, data)
{
  static struct test_msg t_msg;
  static struct in_out_list *in_l;
  static struct accept_msg a_msg;
  static struct reject_msg rej_msg;
  static struct in_out_list *out_l;

  PROCESS_BEGIN();

  while(1)
  {
      PROCESS_WAIT_EVENT();
      if(ev == e_execute)
      {
          t_msg = *( (struct test_msg *) data);

          if(t_msg.L > node.LN)
          {
              //place received message on end of queue
              //ADD to the list
              in_l = memb_alloc(&in_union_mem);
              //DGHS_DBG_2("memb_alloc\n");
              if(in_l == NULL) {            // If we could not allocate a new entry, we give up.
                DGHS_DBG_1("ERROR: we could not allocate a new entry for <<in_union_list>> ---\n");
              }else
              {
                  in_l->type_msg.t_msg      = t_msg;
                  in_l->uniontype           = TEST_MSG;
                  list_push(in_union_list,in_l); // Add an item to the start of the list.
              }

          }else
          if(t_msg.F != node.FN) //OJO: no estoy garantizando que los fragmentos sean diferentes
          {
             //Send Accept on edge j
             fill_accept_msg(&a_msg, &t_msg.from, &linkaddr_node_addr);
             //ADD to the list
             out_l = memb_alloc(&out_union_mem);
             if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
               DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>>\n");
             }else
             {

                 out_l->type_msg.a_msg      = a_msg;
                 out_l->uniontype           = ACCEPT_MSG;
                 list_push(out_union_list,out_l); // Add an item to the start of the list.
             }

          }else
          {
              if(is_basic(&t_msg.from))
              {
                  become_rejected(&t_msg.from);
              }

              if( ! (linkaddr_cmp(&node.test_edge,&t_msg.from)) )
              {
                //Send Rejected on edge j
                fill_reject_msg(&rej_msg, &t_msg.from, &linkaddr_node_addr);
                //ADD to the list
                out_l = memb_alloc(&out_union_mem);
                if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
                  DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>>\n");
                }else
                {

                    out_l->type_msg.rej_msg      = rej_msg;
                    out_l->uniontype             = REJECT_MSG;
                    list_push(out_union_list,out_l); // Add an item to the start of the list.
                }

              }else
              {
                  process_post_synch(&procedure_test, e_execute, NULL);
              }
          }

      }

  }

  PROCESS_END();

}



PROCESS_THREAD(response_to_accept, ev, data)
{

  static struct accept_msg a_msg;

  PROCESS_BEGIN();


  while(1)
  {
      PROCESS_WAIT_EVENT();
      if(ev == e_execute)
      {
          a_msg = *( (struct accept_msg *) data);

          linkaddr_copy(&node.test_edge, &linkaddr_null);

          if(  weight(&a_msg.from) < node.best_wt)
          {
              linkaddr_copy(&node.best_edge, &a_msg.from);
              node.best_wt = weight(&a_msg.from);
          }

          process_post_synch(&procedure_report, e_execute, NULL);

      }
  }

  PROCESS_END();

}

PROCESS_THREAD(procedure_report, ev, data)
{
  static struct report_msg rep_msg;
  static struct in_out_list *out_l;

  PROCESS_BEGIN();


  while(1)
  {
      PROCESS_WAIT_EVENT();
      if(ev == e_execute)
      {
          if( (node.find_count == 0)  &&  (linkaddr_cmp(&node.test_edge,&linkaddr_null ) )  )
          {
              node.SN = FOUND;

              //Send report
              fill_report_msg(&rep_msg, &node.in_branch, &linkaddr_node_addr, node.best_wt);
              //ADD to the list
              out_l = memb_alloc(&out_union_mem);
              if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
                DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>>\n");
              }else
              {

                  out_l->type_msg.rep_msg      = rep_msg;
                  out_l->uniontype             = REPORT_MSG;
                  list_push(out_union_list,out_l); // Add an item to the start of the list.
              }

          }
      }
  }

  PROCESS_END();
}

PROCESS_THREAD(procedure_test, ev, data)
{
  static struct in_out_list *out_l;
  static struct test_msg t_msg;
  static struct neighbor *n;

  PROCESS_BEGIN();

  while(1)
  {
      PROCESS_WAIT_EVENT();
      if(ev == e_execute)
      {
          //If there are adjacent edges in the state BASIC
          //Take into account that the list is sorted
          for(n = neighbors_list_p; n != NULL; n = list_item_next(n))
          {
              if(is_basic(&n->addr))
              {
                  linkaddr_copy(&node.test_edge, &n->addr);

                  fill_test_msg(&t_msg, &node.test_edge, &linkaddr_node_addr, node.LN, node.FN);

                  //ADD to the list
                  out_l = memb_alloc(&out_union_mem);
                  if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
                    DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>>\n");
                  }else
                  {

                      out_l->type_msg.t_msg      = t_msg;
                      out_l->uniontype           = TEST_MSG;
                      list_push(out_union_list,out_l); // Add an item to the start of the list.
                  }

                  break;
              }
          }

          //There are not adjacent edges in the state BASIC
          if(n == NULL)
          {
              linkaddr_copy(&node.test_edge, &linkaddr_null);
              process_post_synch(&procedure_report, e_execute, NULL);
          }

      }

  }


  PROCESS_END();

}

PROCESS_THREAD(out_union_evaluation, ev, data)
{
  static struct etimer et1, et2;
  static struct in_out_list *out_l;

  PROCESS_BEGIN();


  while(1)
  {

    //REMOVE from the list
    //execute periodically
    etimer_set(&et1, CLOCK_SECOND * TIME_UNION_IN_OUT);
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et1));

    while(list_length(out_union_list))
    {
        //DGHS_DBG_2("List out_union_list has at least 1 element\n");

        //Give enough time to transmit the previous msg
        etimer_set(&et2, CLOCK_SECOND * TIME_PREVIOUS_MSG_IN_OUT_UNION
            + random_rand() % (CLOCK_SECOND * TIME_PREVIOUS_MSG_IN_OUT_UNION));
        PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et2));

        if(!runicast_is_transmitting(&runicast))
        {
            //remove from list
            out_l = list_chop(out_union_list); // Remove the last object on the list.
            if(out_l->uniontype == CONNECT_MSG)
            {
                process_post(&send_Gallager_Humblet_Spira, e_send_connect, &out_l->type_msg.co_msg);
                //DGHS_DBG_2("Post e_send_connect\n");
            }else
            if(out_l->uniontype == INITIATE_MSG)
            {
              process_post(&send_Gallager_Humblet_Spira, e_send_initiate, &out_l->type_msg.i_msg);
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
  static struct connect_msg  co_msg;
  static struct initiate_msg i_msg;

  PROCESS_EXITHANDLER(runicast_close(&runicast);)

  PROCESS_BEGIN();

  runicast_open(&runicast, RUNICAST_CHANNEL_2, &runicast_callbacks);
  /* OPTIONAL: Sender history */
  list_init(history_table_2);
  memb_init(&history_mem_2);

  list_init(out_union_list);
  memb_init(&out_union_mem);

  list_init(in_union_list);
  memb_init(&in_union_mem);

  while(1)
  {
    PROCESS_WAIT_EVENT();
    if(ev == e_send_connect)
    {
        co_msg = *( (struct connect_msg*) data );

        packetbuf_copyfrom(&co_msg, sizeof(struct connect_msg));
        packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, CONNECT_MSG);
        runicast_send(&runicast, &co_msg.to, NUM_MAX_RETRANSMISSIONS);

        DGHS_DBG_2("Send e_send_connect to %d.%d with level %d\n" , co_msg.to.u8[0], co_msg.to.u8[1], co_msg.L );
    }else
    if(ev == e_send_initiate)
    {
       i_msg = *( (struct initiate_msg*) data );

       packetbuf_copyfrom(&i_msg, sizeof(struct initiate_msg));
       packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, INITIATE_MSG);
       runicast_send(&runicast, &i_msg.to, NUM_MAX_RETRANSMISSIONS);

       DGHS_DBG_2("Send e_send_initiate to %d.%d with LN=%d FN=%d.%02d SN=%d\n" , i_msg.to.u8[0], i_msg.to.u8[1],
       i_msg.L,
       (int)(i_msg.F / SEQNO_EWMA_UNITY),
       (int)(((100UL * i_msg.F) / SEQNO_EWMA_UNITY) % 100),
       i_msg.S);

    }
  }

  PROCESS_END();


}

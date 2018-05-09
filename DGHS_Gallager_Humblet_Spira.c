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
PROCESS(response_to_reject,"response_to_reject");
PROCESS(response_to_report,"response_to_report");
PROCESS(procedure_change_root,"procedure_change_root");
PROCESS(response_to_change_root,"response_to_change_root");


// Reliable unicast that receives the GHS messages: Connect, initiate, test, accept, reject, report, change_root
static void recv_runicast(struct runicast_conn *c, const linkaddr_t *from, uint8_t seqno)
{
  static packetbuf_attr_t msg_type;
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
      DGHS_DBG_2("runicast message received from %d.%d, seqno %d (DUPLICATE)\n",
	     from->u8[0], from->u8[1], seqno);
      return;
    }
    /* Update existing history entry */
    e->seq = seqno;
  }

  msg_type = packetbuf_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG);

  //Adds the message to the list in_union_list according the type of message
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
        DGHS_DBG_2("runicast message received CONNECT_MSG from %d.%d L = %d\n",
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
        DGHS_DBG_2("runicast message received INITIATE_MSG from %d.%d with L=%d F=%d.%02d S=%d \n",
        in_l->type_msg.i_msg.from.u8[0], in_l->type_msg.i_msg.from.u8[1],
        in_l->type_msg.i_msg.L,
        (int)(in_l->type_msg.i_msg.F.name / SEQNO_EWMA_UNITY),
        (int)(((100UL * in_l->type_msg.i_msg.F.name) / SEQNO_EWMA_UNITY) % 100),
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
            DGHS_DBG_2("runicast message received TEST_MSG from %d.%d with L=%d F=%d.%02d \n",
            in_l->type_msg.t_msg.from.u8[0], in_l->type_msg.t_msg.from.u8[1],
            in_l->type_msg.t_msg.L,
            (int)(in_l->type_msg.t_msg.F.name / SEQNO_EWMA_UNITY),
            (int)(((100UL * in_l->type_msg.t_msg.F.name) / SEQNO_EWMA_UNITY) % 100) );
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
  }else
  if(msg_type == REJECT_MSG)
  {

    //ADD to the list
    in_l = memb_alloc(&in_union_mem);
    if(in_l == NULL) {            // If we could not allocate a new entry, we give up.
      DGHS_DBG_1("ERROR: we could not allocate a new entry for <<in_union_list>>\n");
    }else
    {
        in_l->type_msg.rej_msg    = *((struct reject_msg*) msg);
        in_l->uniontype           = REJECT_MSG;
        list_push(in_union_list,in_l); // Add an item to the start of the list.
        DGHS_DBG_2("runicast message received REJECT_MSG from %d.%d \n",
        in_l->type_msg.rej_msg.from.u8[0], in_l->type_msg.rej_msg.from.u8[1] );
    }

  }else
  if(msg_type == REPORT_MSG)
  {
        //ADD to the list
        in_l = memb_alloc(&in_union_mem);
        if(in_l == NULL) {            // If we could not allocate a new entry, we give up.
          DGHS_DBG_1("ERROR: we could not allocate a new entry for <<in_union_list>>\n");
        }else
        {
            in_l->type_msg.rep_msg    = *((struct report_msg*) msg);
            in_l->uniontype           = REPORT_MSG;
            list_push(in_union_list,in_l); // Add an item to the start of the list.
            DGHS_DBG_2("runicast message received REPORT_MSG from %d.%d with w = %d.%02d\n",
            in_l->type_msg.rep_msg.from.u8[0], in_l->type_msg.rep_msg.from.u8[1],
            (int)(in_l->type_msg.rep_msg.w / SEQNO_EWMA_UNITY),
            (int)(((100UL * in_l->type_msg.rep_msg.w) / SEQNO_EWMA_UNITY) % 100)
            );
        }
  }else
  if(msg_type == CHANGE_ROOT_MSG)
  {
        //ADD to the list
        in_l = memb_alloc(&in_union_mem);
        if(in_l == NULL) {            // If we could not allocate a new entry, we give up.
          DGHS_DBG_1("ERROR: we could not allocate a new entry for <<in_union_list>>\n");
        }else
        {
            in_l->type_msg.cha_root_msg    = *((struct change_root_msg*) msg);
            in_l->uniontype                = CHANGE_ROOT_MSG;
            list_push(in_union_list,in_l); // Add an item to the start of the list.
            DGHS_DBG_2("runicast message received CHANGE_ROOT_MSG from %d.%d \n",
            in_l->type_msg.cha_root_msg.from.u8[0], in_l->type_msg.cha_root_msg.from.u8[1]);
        }
  }
  else
  {
    DGHS_DBG_1("ERROR: The type of the message ( msg_type ) is unkown \n");
  }

  //process_post(&in_union_evaluation, e_execute, NULL);


}

static void sent_runicast(struct runicast_conn *c, const linkaddr_t *to, uint8_t retransmissions)
{
  DGHS_DBG_2("runicast (GHS) message sent to %d.%d, retransmissions %d\n",
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
static struct runicast_conn runicast_2;


// (2) procedure wakeup
PROCESS_THREAD(procedure_wakeup, ev, data) //It can not have PROCESS_WAIT_EVENT_UNTIL()
{
    static struct connect_msg co_msg;
    static struct in_out_list *out_l;

    PROCESS_BEGIN();

    e_send_connect     = process_alloc_event();
    e_send_initiate    = process_alloc_event();
    e_send_test        = process_alloc_event();
    e_send_accept      = process_alloc_event();
    e_send_reject      = process_alloc_event();
    e_send_report      = process_alloc_event();
    e_send_change_root = process_alloc_event();

    while(1)
    {

        PROCESS_YIELD();
        if(ev == e_execute)
        {
          DGHS_DBG_2("procedure_wakeup: e_execute\n");

          init_SE();
          sort_neighbor_list();
          print_neighbor_list(neighbors_list_p);

          become_branch(&neighbors_list_p->addr); //Become branch the edge with minimum weight. We have just sorted the list
          node.LN = 0; //book: each process starts as a fragment with name and level 0.
            fill_fragment_name(&node.FN,&linkaddr_null, &linkaddr_null,0); //book: each process starts as a fragment with name and level 0.
          node.SN = FOUND;
          node.find_count = 0;

          //Send Connect(0) on edge m
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

          DGHS_interface_control_flags(NODE_IS_AWAKE);

        }else
        {
          DGHS_DBG_1("ERROR: an unkown event has arrived to procedure_wakeup\n");
        }
    }

    PROCESS_END();

}

// (3) Response to receipt of Connect(L) on edge j
PROCESS_THREAD(response_to_connect, ev, data)
{

  static struct connect_msg co_msg;
  static struct initiate_msg i_msg;
  static struct in_out_list *out_l, *in_l;
  static struct fragment_name F;
  PROCESS_BEGIN();

  while(1)
  {
    PROCESS_YIELD();
    if(ev == e_execute)
    {
        co_msg = *( (struct connect_msg *) data);

        DGHS_DBG_2("response_to_connect from %d.%d with L = %d\n", co_msg.from.u8[0], co_msg.from.u8[1], co_msg.L );

        if(co_msg.L < node.LN) //OJO: va sin el igual
        {
            DGHS_DBG_2("co_msg.L(%d) < node.LN(%d)\n", co_msg.L,node.LN);
            become_branch(&co_msg.from); //Become branch the edge with minimum weight. We have just sorted the list

            //Send Initiate(LN,FN,SN) on edge j
            fill_initiate_msg(&i_msg, &co_msg.from, &linkaddr_node_addr, node.LN, node.FN, node.SN);
            //ADD to the list
            out_l = memb_alloc(&out_union_mem);
            if(out_l == NULL) // If we could not allocate a new entry, we give up.
            {
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
              node.find_count = node.find_count + 1;
            }

        }else if( is_basic(&co_msg.from) )
              {
                    DGHS_DBG_2("co_msg.L(%d) >= node.LN(%d) AND is_basic(%d) \n", co_msg.L,node.LN,co_msg.from.u8[0]);

                    //Place received message on end of queue
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

                    DGHS_DBG_2("Place received message CONNECT_MSG from %d.%d on end of queue\n",
                    in_l->type_msg.co_msg.from.u8[0], in_l->type_msg.co_msg.from.u8[1] );
                    //PROCESS_PAUSE(); // to allow for other processes to get a slice of the processor's time in between.

              }else
              {

                DGHS_DBG_2("co_msg.L(%d) >= node.LN(%d) AND is_not_basic(%d) \n", co_msg.L,node.LN,co_msg.from.u8[0]);

                //Send Initiate (LN+1, w(j), FIND) on edge j
                fill_fragment_name(&F, &co_msg.from, &linkaddr_node_addr,weight(&co_msg.from));
                fill_initiate_msg(&i_msg, &co_msg.from, &linkaddr_node_addr, (node.LN + 1) , F , FIND);
                //ADD to the list
                out_l = memb_alloc(&out_union_mem);
                if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
                  DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>>\n");
                }else
                {

                    out_l->type_msg.i_msg      = i_msg;
                    out_l->uniontype           = INITIATE_MSG;
                    list_push(out_union_list,out_l); // Add an item to the start of the list.
                }

              }

    } //IF e_execute

  }

  PROCESS_END();
}


//  (4) Response to receipt of Initiate(L,F,S) on edge j
PROCESS_THREAD(response_to_initiate, ev, data)
{

  static struct initiate_msg i_msg, i_msg_temp;
  static struct neighbor *n;
  static struct in_out_list *out_l;

  PROCESS_BEGIN();

  while(1)
  {
      PROCESS_YIELD();
      if(ev == e_execute)
      {
          i_msg = *( (struct initiate_msg *) data);

          DGHS_DBG_2("response_to_initiate from %d.%d with L = %d F = %d.%02d S = %d\n",
          i_msg.from.u8[0], i_msg.from.u8[1],
          i_msg.L,
          (int)(i_msg.F.name / SEQNO_EWMA_UNITY),
          (int)(((100UL * i_msg.F.name) / SEQNO_EWMA_UNITY) % 100),
          i_msg.S);

          node.LN = i_msg.L;
          node.FN = i_msg.F;
          node.SN = i_msg.S;
            DGHS_DBG_1("#L %d 0\n", node.in_branch.u8[0]); // 0: old parent
          linkaddr_copy(&node.in_branch, &i_msg.from);
            DGHS_DBG_1("#L %d 1\n", node.in_branch.u8[0]); //: 1: new parent
          linkaddr_copy(&node.best_edge, &linkaddr_null); //linkaddr_null: The null Rime address.
          node.best_wt = INFINITE;


          for(n = neighbors_list_p; n != NULL; n = list_item_next(n))
          {
            if(   (!(linkaddr_cmp(&n->addr,&i_msg.from))) && (is_branch(&n->addr))       )
            {
                  DGHS_DBG_2("Resend Initiate: Node %d.%d is Different from %d.%d AND is_branch() \n",
                  n->addr.u8[0],n->addr.u8[1], i_msg.from.u8[0], i_msg.from.u8[1]);

                  //Send initiate(L,F,S) on edge i
                  fill_initiate_msg(&i_msg_temp, &n->addr, &linkaddr_node_addr, i_msg.L, i_msg.F, i_msg.S);
                  DGHS_DBG_2("Resend initiate to %d \n", n->addr.u8[0]);
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
                      node.find_count = node.find_count + 1;
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

// (5) procedure test
PROCESS_THREAD(procedure_test, ev, data)
{
  static struct in_out_list *out_l;
  static struct test_msg t_msg;
  static struct neighbor *n;

  PROCESS_BEGIN();

  while(1)
  {
      PROCESS_YIELD();
      if(ev == e_execute)
      {
          //If there are adjacent edges in the state BASIC
          //Take into account that the list is sorted
          for(n = neighbors_list_p; n != NULL; n = list_item_next(n))
          {
              if(is_basic(&n->addr))
              {
                  DGHS_DBG_2("There are adjacent BASIC edges. The minimum-weight adjacent edge is %d.%d  \n",
                  n->addr.u8[0], n->addr.u8[1]);

                  linkaddr_copy(&node.test_edge, &n->addr);

                  //Send TEST(LN, FN) on test_edge
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
              DGHS_DBG_2("There are not adjacent BASIC edges.\n");

              linkaddr_copy(&node.test_edge, &linkaddr_null);
              process_post_synch(&procedure_report, e_execute, NULL);
          }

      }

  }


  PROCESS_END();

}

// (6) Response to receipt of Test(L,F) on edge j
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
      PROCESS_YIELD();
      if(ev == e_execute)
      {
          t_msg = *( (struct test_msg *) data);

          DGHS_DBG_2("response_to_test from %d.%d with L = %d F = %d.%02d \n",
          t_msg.from.u8[0], t_msg.from.u8[1],
          t_msg.L,
          (int)(t_msg.F.name / SEQNO_EWMA_UNITY),
          (int)(((100UL * t_msg.F.name) / SEQNO_EWMA_UNITY) % 100));

          if(t_msg.L > node.LN)
          {
              DGHS_DBG_2("t_msg.L(%d) > node.LN(%d) \n", t_msg.L,node.LN );

              //Place received message on end of queue
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

              DGHS_DBG_2("Place received message TEST_MSG from %d.%d on end of queue\n",
              t_msg.from.u8[0], t_msg.from.u8[1]);

          }else if(different_fragments(t_msg.F,node.FN))
                //if(t_msg.F != node.FN) //OJO: no estoy garantizando que los fragmentos sean diferentes
                {

                   DGHS_DBG_2("t_msg.L(%d) <= node.LN(%d) AND different_fragments(%d.%02d,%d.%02d)  \n",
                   t_msg.L,node.LN,
                   (int)(t_msg.F.name / SEQNO_EWMA_UNITY),
                   (int)(((100UL * t_msg.F.name) / SEQNO_EWMA_UNITY) % 100),
                   (int)(node.FN.name / SEQNO_EWMA_UNITY),
                   (int)(((100UL * node.FN.name) / SEQNO_EWMA_UNITY) % 100));

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

                    DGHS_DBG_2("t_msg.L(%d) <= node.LN(%d) AND not_different_fragments(%d.%02d,%d.%02d)  \n",
                    t_msg.L,node.LN,
                    (int)(t_msg.F.name / SEQNO_EWMA_UNITY),
                    (int)(((100UL * t_msg.F.name) / SEQNO_EWMA_UNITY) % 100),
                    (int)(node.FN.name / SEQNO_EWMA_UNITY),
                    (int)(((100UL * node.FN.name) / SEQNO_EWMA_UNITY) % 100));

                    if(is_basic(&t_msg.from))
                    {
                        become_rejected(&t_msg.from);
                    }

                    if( ! (linkaddr_cmp(&node.test_edge,&t_msg.from)) )
                    {

                      DGHS_DBG_2("%d.%d is different from %d.%d )  \n",
                      node.test_edge.u8[0], node.test_edge.u8[1],
                      t_msg.from.u8[0], t_msg.from.u8[1]);

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
                        DGHS_DBG_2("%d.%d is equal to %d.%d )  \n",
                        node.test_edge.u8[0], node.test_edge.u8[1],
                        t_msg.from.u8[0], t_msg.from.u8[1]);

                        process_post_synch(&procedure_test, e_execute, NULL);
                    }
                }

      }

  }

  PROCESS_END();

}


// (7) Response to Accept on edge j
PROCESS_THREAD(response_to_accept, ev, data)
{

  static struct accept_msg a_msg;

  PROCESS_BEGIN();


  while(1)
  {
      PROCESS_YIELD();
      if(ev == e_execute)
      {
          a_msg = *( (struct accept_msg *) data);

          DGHS_DBG_2("response_to_accept from %d.%d\n", a_msg.from.u8[0], a_msg.from.u8[1]);

          linkaddr_copy(&node.test_edge, &linkaddr_null);

          if(  weight(&a_msg.from) < node.best_wt)
          {
              DGHS_DBG_2(" weight(%d.%02d) < node.best_wt(%d.%02d)  \n",
              (int)(weight(&a_msg.from) / SEQNO_EWMA_UNITY),
              (int)(((100UL * weight(&a_msg.from)) / SEQNO_EWMA_UNITY) % 100),
              (int)(node.best_wt / SEQNO_EWMA_UNITY),
              (int)(((100UL * node.best_wt) / SEQNO_EWMA_UNITY) % 100));

              linkaddr_copy(&node.best_edge, &a_msg.from);
              node.best_wt = weight(&a_msg.from);
          }

          process_post_synch(&procedure_report, e_execute, NULL);

      }
  }

  PROCESS_END();

}


// (8) Response to receipt of Reject on edge j
PROCESS_THREAD(response_to_reject, ev, data)
{
  static struct reject_msg rej_msg;

  PROCESS_BEGIN();

  while(1)
  {
      PROCESS_YIELD();
      if(ev == e_execute)
      {
          rej_msg = *( (struct reject_msg *) data);

          DGHS_DBG_2("response_to_reject from %d.%d\n", rej_msg.from.u8[0], rej_msg.from.u8[1]);

          if( is_basic(&rej_msg.from) )
          {
            DGHS_DBG_2("%d.%d is_basic() \n", rej_msg.from.u8[0], rej_msg.from.u8[1] );
            become_rejected(&rej_msg.from);
          }

          process_post_synch(&procedure_test, e_execute, NULL);
      }
  }

  PROCESS_END();

}

// (9) procedure report
PROCESS_THREAD(procedure_report, ev, data)
{
  static struct report_msg rep_msg;
  static struct in_out_list *out_l;

  PROCESS_BEGIN();


  while(1)
  {
      PROCESS_YIELD();
      if(ev == e_execute)
      {
          if( (node.find_count == 0)  &&  (linkaddr_cmp(&node.test_edge,&linkaddr_null ) )  )
          {
              DGHS_DBG_2("node.find_count = 0  AND %d.%d is equal to %d.%d \n",
              node.test_edge.u8[0], node.test_edge.u8[1],
              linkaddr_null.u8[0], linkaddr_null.u8[1]);

              node.SN = FOUND;

              //Send Report(best_wt) on in_branch
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

// (10) Response to receipt of Report(w) on edge j
PROCESS_THREAD(response_to_report, ev, data)
{
  static struct report_msg rep_msg;
  static struct in_out_list *in_l;

  PROCESS_BEGIN();

  while(1)
  {
      PROCESS_YIELD();
      if(ev == e_execute)
      {
          rep_msg = *( (struct report_msg *) data);

          DGHS_DBG_2("response_to_report from %d.%d with w = %d.%02d \n", rep_msg.from.u8[0], rep_msg.from.u8[1],
          (int)(rep_msg.w / SEQNO_EWMA_UNITY),
          (int)(((100UL * rep_msg.w) / SEQNO_EWMA_UNITY) % 100));


          if(!(linkaddr_cmp(&rep_msg.from,&node.in_branch)))
          {
              DGHS_DBG_2("%d.%d is different from %d.%d\n", rep_msg.from.u8[0], rep_msg.from.u8[1],
              node.in_branch.u8[0], node.in_branch.u8[1]);

              node.find_count = node.find_count - 1;
              if(rep_msg.w < node.best_wt)
              {
                DGHS_DBG_2("rep_msg.w(%d.%02d) < node.best_wt(%d.%02d)\n",
                (int)(rep_msg.w / SEQNO_EWMA_UNITY),
                (int)(((100UL * rep_msg.w) / SEQNO_EWMA_UNITY) % 100),
                (int)(node.best_wt / SEQNO_EWMA_UNITY),
                (int)(((100UL * node.best_wt) / SEQNO_EWMA_UNITY) % 100));

                node.best_wt = rep_msg.w;
                linkaddr_copy(&node.best_edge, &rep_msg.from);
              }
              process_post_synch(&procedure_report, e_execute,NULL);

          }else if(node.SN == FIND)
                {

                  DGHS_DBG_2("The node is in the FIND state\n");

                  //Place received message on end of queue
                  //ADD to the list
                  in_l = memb_alloc(&in_union_mem);
                  //DGHS_DBG_2("memb_alloc\n");
                  if(in_l == NULL) // If we could not allocate a new entry, we give up.
                  {
                    DGHS_DBG_1("ERROR: we could not allocate a new entry for <<in_union_list>> ---\n");
                  }else
                  {
                      in_l->type_msg.rep_msg    = rep_msg;
                      in_l->uniontype           = REPORT_MSG;
                      list_push(in_union_list,in_l); // Add an item to the start of the list.

                  }

                  DGHS_DBG_2("Place received message REPORT_MSG from %d.%d on end of queue\n",
                  in_l->type_msg.rep_msg.from.u8[0], in_l->type_msg.rep_msg.from.u8[1] );

                }else if( rep_msg.w > node.best_wt )
                      {
                        DGHS_DBG_2("rep_msg.w(%d.%02d) > node.best_wt(%d.%02d)\n",
                        (int)(rep_msg.w / SEQNO_EWMA_UNITY),
                        (int)(((100UL * rep_msg.w) / SEQNO_EWMA_UNITY) % 100),
                        (int)(node.best_wt / SEQNO_EWMA_UNITY),
                        (int)(((100UL * node.best_wt) / SEQNO_EWMA_UNITY) % 100));

                        process_post_synch(&procedure_change_root, e_execute, NULL);

                      }else if(rep_msg.w == node.best_wt)
                            {
                              DGHS_DBG_2("rep_msg.w(%d.%02d) = node.best_wt(%d.%02d) AND %d.%d is equal from %d.%d SN = %d \n",
                              (int)(rep_msg.w / SEQNO_EWMA_UNITY),
                              (int)(((100UL * rep_msg.w) / SEQNO_EWMA_UNITY) % 100),
                              (int)(node.best_wt / SEQNO_EWMA_UNITY),
                              (int)(((100UL * node.best_wt) / SEQNO_EWMA_UNITY) % 100),
                              rep_msg.from.u8[0], rep_msg.from.u8[1],
                              node.in_branch.u8[0], node.in_branch.u8[1], node.SN
                              );

                              if(rep_msg.w == INFINITE || node.best_wt == INFINITE )
                              {
                                DGHS_DBG_2("rep_msg.w(%d.%02d) = node.best_wt(%d.%02d) = INFINITE\n",
                                (int)(rep_msg.w / SEQNO_EWMA_UNITY),
                                (int)(((100UL * rep_msg.w) / SEQNO_EWMA_UNITY) % 100),
                                (int)(node.best_wt / SEQNO_EWMA_UNITY),
                                (int)(((100UL * node.best_wt) / SEQNO_EWMA_UNITY) % 100));

                                DGHS_interface_control_flags(GHS_HAS_ENDED);
                                DGHS_DBG_2("GHS has finished\n");
                              }

                            }

      } //IF e_execute
  }

  PROCESS_END();

}

// (11) procedure change_root
PROCESS_THREAD(procedure_change_root, ev, data)
{
  static struct change_root_msg cha_root_msg;
  static struct connect_msg co_msg;
  static struct in_out_list *out_l;

  PROCESS_BEGIN();

  while(1)
  {
    PROCESS_YIELD();
    if(ev == e_execute)
    {
        if(is_branch(&node.best_edge))
        {

            DGHS_DBG_2("%d.%d is branch \n", node.best_edge.u8[0], node.best_edge.u8[1]);

            //Send Change-root on best_edge
            fill_change_root_msg(&cha_root_msg, &node.best_edge, &linkaddr_node_addr);
            //ADD to the list
            out_l = memb_alloc(&out_union_mem);
            if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
              DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>>\n");
            }else
            {

                out_l->type_msg.cha_root_msg      = cha_root_msg;
                out_l->uniontype                  = CHANGE_ROOT_MSG;
                list_push(out_union_list,out_l); // Add an item to the start of the list.

            }

        }else
        {

            DGHS_DBG_2("%d.%d is not branch \n", node.best_edge.u8[0], node.best_edge.u8[1]);

            //Send Connect(LN)  on best_edge
            fill_connect_msg(&co_msg, &node.best_edge, &linkaddr_node_addr, node.LN);
            //ADD to the list
            out_l = memb_alloc(&out_union_mem);
            if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
              DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>>\n");
            }else
            {

                out_l->type_msg.co_msg      = co_msg;
                out_l->uniontype            = CONNECT_MSG;
                list_push(out_union_list,out_l); // Add an item to the start of the list.

            }

            become_branch(&node.best_edge);

        }


    }

  }

  PROCESS_END();

}

// (12) Response to receipt of change_root
PROCESS_THREAD(response_to_change_root, ev, data)
{

  static struct change_root_msg cha_root_msg;
  PROCESS_BEGIN();

  while(1)
  {
      PROCESS_YIELD();
      if(ev == e_execute)
      {
          cha_root_msg = *( (struct change_root_msg *) data);

          DGHS_DBG_2("response_to_change_root from %d.%d \n", cha_root_msg.from.u8[0], cha_root_msg.from.u8[1]);

          process_post_synch(&procedure_change_root, e_execute, NULL);
      }

  }

  PROCESS_END();
}

// take out an element from the list in_union_list
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

    /*PROCESS_YIELD();
    if(ev == e_execute)
    {*/
        //We start to analize incoming messages when the NODE_IS_AWAKE
        if(node.control_flags_neighbor_discovery & NODE_IS_AWAKE)
        {
            while(list_length(in_union_list))
            {
              //Give enough time to transmit the previous msg
              etimer_set(&et2, CLOCK_SECOND * TIME_PREVIOUS_MSG_IN_OUT_UNION
                  + random_rand() % (CLOCK_SECOND * TIME_PREVIOUS_MSG_IN_OUT_UNION));
              PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et2));

              //remove from list
              in_l = list_chop(in_union_list); // Remove the last object on the list.
              if(in_l->uniontype == CONNECT_MSG)
              {
                  process_post(&response_to_connect, e_execute, &in_l->type_msg.co_msg);
              }else if(in_l->uniontype == INITIATE_MSG)
                {
                  process_post(&response_to_initiate, e_execute, &in_l->type_msg.i_msg);
                }else if(in_l->uniontype == TEST_MSG)
                  {
                    process_post(&response_to_test, e_execute, &in_l->type_msg.t_msg);
                  }else if(in_l->uniontype == ACCEPT_MSG)
                    {
                      process_post(&response_to_accept, e_execute, &in_l->type_msg.a_msg);
                    }else if(in_l->uniontype == REJECT_MSG)
                      {
                        process_post(&response_to_reject, e_execute, &in_l->type_msg.rej_msg);
                      }else if(in_l->uniontype == REPORT_MSG)
                        {
                          process_post(&response_to_report, e_execute, &in_l->type_msg.rep_msg);
                        }else if(in_l->uniontype == CHANGE_ROOT_MSG)
                          {
                            process_post(&response_to_change_root, e_execute, &in_l->type_msg.cha_root_msg);
                          }else
                          {
                            DGHS_DBG_1("ERROR: The type of msg in in_union_list is unkown \n");
                          }
              memb_free(&in_union_mem,in_l);

            } //while(list_length(in_union_list))

        }/*else //IF NODE_IS_AWAKE
        {
          process_post(PROCESS_CURRENT(), e_execute, NULL);
        }*/
     //} //IF e_execute

  }

  PROCESS_END();
}


// take out an element from the list out_union_list
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

   /*PROCESS_YIELD();
   if(ev == e_execute)
   {*/
        //We start to analize incoming messages when the NODE_IS_AWAKE
        if(node.control_flags_neighbor_discovery & NODE_IS_AWAKE)
        {

          while(list_length(out_union_list))
          {
              //Give enough time to transmit the previous msg
              etimer_set(&et2, CLOCK_SECOND * TIME_PREVIOUS_MSG_IN_OUT_UNION
                  + random_rand() % (CLOCK_SECOND * TIME_PREVIOUS_MSG_IN_OUT_UNION));
              PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et2));

              if(!runicast_is_transmitting(&runicast_2))
              {
                  //remove from list
                  out_l = list_chop(out_union_list); // Remove the last object on the list.
                  if(out_l->uniontype == CONNECT_MSG)
                  {
                      process_post_synch(&send_Gallager_Humblet_Spira, e_send_connect, &out_l->type_msg.co_msg);
                      //DGHS_DBG_2("Post e_send_connect\n");
                  }else if(out_l->uniontype == INITIATE_MSG)
                    {
                      process_post_synch(&send_Gallager_Humblet_Spira, e_send_initiate, &out_l->type_msg.i_msg);
                    }else if(out_l->uniontype == TEST_MSG)
                      {
                        process_post_synch(&send_Gallager_Humblet_Spira, e_send_test, &out_l->type_msg.t_msg);
                      }else if(out_l->uniontype == ACCEPT_MSG)
                        {
                          process_post_synch(&send_Gallager_Humblet_Spira, e_send_accept, &out_l->type_msg.a_msg);
                        }else if(out_l->uniontype == REJECT_MSG)
                          {
                            process_post_synch(&send_Gallager_Humblet_Spira, e_send_reject, &out_l->type_msg.rej_msg);
                          }else if(out_l->uniontype == REPORT_MSG)
                            {
                              process_post_synch(&send_Gallager_Humblet_Spira, e_send_report, &out_l->type_msg.rep_msg);
                            }else if(out_l->uniontype == CHANGE_ROOT_MSG)
                              {
                                process_post_synch(&send_Gallager_Humblet_Spira, e_send_change_root, &out_l->type_msg.cha_root_msg);
                              }else
                              {
                                DGHS_DBG_1("ERROR: The type of msg in out_union_list is unkown \n");
                              }
                  memb_free(&out_union_mem,out_l);

              }else
              {
                  //DGHS_DBG_2("WARNING: break from runicast_control\n"); //"Enough" time is not enough!!
                  break;
              }
          } //END while list_length()
        }/*else //IF NODE_IS_AWAKE
        {
          process_post(PROCESS_CURRENT(), e_execute, NULL);
        }*/
     //} //IF e_execute
  } //while (1)

  PROCESS_END();

}

// Send the msg of GHS: Connect, initiate, test, accept, reject, report, change_root
PROCESS_THREAD(send_Gallager_Humblet_Spira, ev, data) //It can not have PROCESS_WAIT_EVENT_UNTIL()
{
  static struct connect_msg co_msg;
  static struct initiate_msg i_msg;
  static struct test_msg t_msg;
  static struct accept_msg a_msg;
  static struct reject_msg rej_msg;
  static struct report_msg rep_msg;
  static struct change_root_msg cha_root_msg;

  PROCESS_EXITHANDLER(runicast_close(&runicast_2);)

  PROCESS_BEGIN();

  runicast_open(&runicast_2, RUNICAST_CHANNEL_2, &runicast_callbacks);
  /* OPTIONAL: Sender history */
  list_init(history_table_2);
  memb_init(&history_mem_2);

  list_init(out_union_list);
  memb_init(&out_union_mem);

  list_init(in_union_list);
  memb_init(&in_union_mem);

  while(1)
  {
    PROCESS_YIELD();
    if(ev == e_send_connect)
    {
        co_msg = *( (struct connect_msg*) data );

        packetbuf_copyfrom(&co_msg, sizeof(struct connect_msg));
        packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, CONNECT_MSG);
        runicast_send(&runicast_2, &co_msg.to, NUM_MAX_RETRANSMISSIONS);

        DGHS_DBG_2("Send e_send_connect to %d.%d with L %d\n" , co_msg.to.u8[0], co_msg.to.u8[1], co_msg.L );
    }else
    if(ev == e_send_initiate)
    {
       i_msg = *( (struct initiate_msg*) data );

       packetbuf_copyfrom(&i_msg, sizeof(struct initiate_msg));
       packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, INITIATE_MSG);
       runicast_send(&runicast_2, &i_msg.to, NUM_MAX_RETRANSMISSIONS);

       DGHS_DBG_2("Send e_send_initiate to %d.%d with L=%d F=%d.%02d S=%d\n" , i_msg.to.u8[0], i_msg.to.u8[1],
       i_msg.L,
       (int)(i_msg.F.name / SEQNO_EWMA_UNITY),
       (int)(((100UL * i_msg.F.name) / SEQNO_EWMA_UNITY) % 100),
       i_msg.S);

    }else
    if(ev == e_send_test)
    {
        t_msg = *( (struct test_msg*) data );

        packetbuf_copyfrom(&t_msg, sizeof(struct test_msg));
        packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, TEST_MSG);
        runicast_send(&runicast_2, &t_msg.to, NUM_MAX_RETRANSMISSIONS);

        DGHS_DBG_2("Send e_send_test to %d.%d with L=%d F=%d.%02d\n" , t_msg.to.u8[0], t_msg.to.u8[1],
        t_msg.L,
        (int)(t_msg.F.name / SEQNO_EWMA_UNITY),
        (int)(((100UL * t_msg.F.name) / SEQNO_EWMA_UNITY) % 100) );

    }else
    if(ev == e_send_accept)
    {
        a_msg = *( (struct accept_msg*) data );

        packetbuf_copyfrom(&a_msg, sizeof(struct accept_msg));
        packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, ACCEPT_MSG);
        runicast_send(&runicast_2, &a_msg.to, NUM_MAX_RETRANSMISSIONS);

        DGHS_DBG_2("Send e_send_accept to %d.%d \n" , a_msg.to.u8[0], a_msg.to.u8[1] );

    }else
    if(ev == e_send_reject)
    {
       rej_msg = *( (struct reject_msg*) data );

       packetbuf_copyfrom(&rej_msg, sizeof(struct reject_msg));
       packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, REJECT_MSG);
       runicast_send(&runicast_2, &rej_msg.to, NUM_MAX_RETRANSMISSIONS);

       DGHS_DBG_2("Send e_send_reject to %d.%d \n" , rej_msg.to.u8[0], rej_msg.to.u8[1] );
    }else
    if(ev == e_send_report)
    {
       rep_msg  = *( (struct report_msg*) data );

       packetbuf_copyfrom(&rep_msg, sizeof(struct report_msg));
       packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, REPORT_MSG);
       runicast_send(&runicast_2, &rep_msg.to, NUM_MAX_RETRANSMISSIONS);

       DGHS_DBG_2("Send e_send_report to %d.%d with w = %d.%02d \n" , rep_msg.to.u8[0], rep_msg.to.u8[1],
       (int)(rep_msg.w / SEQNO_EWMA_UNITY),
       (int)(((100UL * rep_msg.w) / SEQNO_EWMA_UNITY) % 100) );

    }else
    if(ev == e_send_change_root)
    {
       cha_root_msg = *( (struct change_root_msg*) data );

       packetbuf_copyfrom(&cha_root_msg, sizeof(struct change_root_msg));
       packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, CHANGE_ROOT_MSG);
       runicast_send(&runicast_2, &cha_root_msg.to, NUM_MAX_RETRANSMISSIONS);

       DGHS_DBG_2("Send e_send_change_root to %d.%d \n" , cha_root_msg.to.u8[0], cha_root_msg.to.u8[1]);
    }else
    {
      DGHS_DBG_1("ERROR: The type of msg in send_Gallager_Humblet_Spira is unkown \n");
    }
  }

  PROCESS_END();


}

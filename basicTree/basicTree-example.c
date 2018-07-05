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

#include "basicTree.h"

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

struct t_node t_node;
struct csma_stats csma_stats;

/*---------------------------------------------------------------------------*/
PROCESS(prepare_beacon, "prepare_beacon");
PROCESS(update_parent, "update_parent");
PROCESS(out_evaluation_tree, "out_evaluation_tree");
PROCESS(in_evaluation_tree, "in_evaluation_tree");
PROCESS(response_to_t_beacon, "response_to_t_beacon");
PROCESS(send_basicTree, "send_basicTree");
PROCESS(analyze_csma_results, "analyze_csma_results");
PROCESS(detect_interference, "detect_interference");
//Data Collection
PROCESS(prepare_data_col, "prepare_data_col");
PROCESS(response_to_t_data, "response_to_t_data");



AUTOSTART_PROCESSES(&prepare_beacon,&update_parent,&out_evaluation_tree,&in_evaluation_tree,
                    &response_to_t_beacon,&send_basicTree,&analyze_csma_results,&detect_interference
                    ,&prepare_data_col,&response_to_t_data
                    );
/*---------------------------------------------------------------------------*/

//List of neighbors
MEMB(t_neighbors_memb, struct t_neighbor, MAX_NEIGHBORS);
LIST(t_neighbors_list);

//List of outgoing msg
LIST(out_union_list);
MEMB(out_union_mem, struct in_out_list_tree, QUEUE_SIZE_T_BEACONS);

//List of ingoing msg
LIST(in_union_list);
MEMB(in_union_mem, struct in_out_list_tree, QUEUE_SIZE_T_BEACONS);

/*---------------------------------------------------------------------------*/
static void
t_broadcast_recv(struct broadcast_conn *c, const linkaddr_t *from)
{
  struct in_out_list_tree *in_l;
  static packetbuf_attr_t msg_type;
  void *msg = packetbuf_dataptr();

  msg_type = packetbuf_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG);

  //Adds the message to the list in_union_list according the type of message
  if(msg_type == T_BEACON)
  {

    //ADD to the list
    in_l = memb_alloc(&in_union_mem);
    if(in_l == NULL) {            // If we could not allocate a new entry, we give up.
      printf("ERROR: we could not allocate a new entry for <<in_union_list>> in basicTree\n");
    }else
    {
        in_l->type_msg.t_beacon     = *((struct t_beacon*) msg);
        in_l->uniontype             = T_BEACON;
        list_push(in_union_list,in_l); // Add an item to the start of the list.
        printf("runicast message received T_BEACON from %d.%d from %d.%d \n",
        in_l->type_msg.t_beacon.from.u8[0], in_l->type_msg.t_beacon.from.u8[1],from->u8[0],from->u8[1] );
    }

  }else
  if(msg_type ==  T_DATA)
  {
    printf("ERROR: no debo recibir T_DATA por el canal broadcast\n");
  }else
  {
    printf("ERROR: the type of msg in basicTree is unknown\n");
  }

}
static const struct broadcast_callbacks t_broadcast_call = {t_broadcast_recv};
static struct broadcast_conn t_broadcast;


/*---------------------------------------------------------------------------*/
static void t_recv_uc(struct unicast_conn *c, const linkaddr_t *from)
{

  struct in_out_list_tree *in_l;
  static packetbuf_attr_t msg_type;
  void *msg = packetbuf_dataptr();

  msg_type = packetbuf_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG);

  //Adds the message to the list in_union_list according the type of message
  if(msg_type ==  T_DATA)
  {

    //ADD to the list
    in_l = memb_alloc(&in_union_mem);
    if(in_l == NULL) {            // If we could not allocate a new entry, we give up.
      printf("ERROR: we could not allocate a new entry for <<in_union_list>> in basicTree\n");
    }else
    {
        in_l->type_msg.t_data     = *((struct t_data*) msg);
        in_l->uniontype           = T_DATA;
        list_push(in_union_list,in_l); // Add an item to the start of the list.
        printf("unicast message received T_DATA from %d.%d \n",
        in_l->type_msg.t_data.from.u8[0], in_l->type_msg.t_data.from.u8[1] );
    }

  }else
  if(msg_type ==  T_BEACON)
  {
    printf("ERROR: no debo recibir T_BEACON por el canal unicast\n");

  }else
  {
    printf("ERROR: the type of msg in basicTree is unknown\n");
  }


}
/*---------------------------------------------------------------------------*/
static void t_sent_uc(struct unicast_conn *c, int status, int num_tx)
{
  const linkaddr_t *dest = packetbuf_addr(PACKETBUF_ADDR_RECEIVER);
  if(linkaddr_cmp(dest, &linkaddr_null)) {
    return;
  }
  printf("unicast (t_data) message sent to %d.%d: status %d num_tx %d\n",
    dest->u8[0], dest->u8[1], status, num_tx);
}
/*---------------------------------------------------------------------------*/
static const struct unicast_callbacks t_unicast_callbacks = {t_recv_uc, t_sent_uc};
static struct unicast_conn t_uc;

////////////////////////////////////////////////////////////////////////
///////////////////NODE POSITIONS///////////////////////////////////////
////////////////////////////////////////////////////////////////////////

uint8_t x_pos[NUM_NODES] =  {10  ,  20  ,   30  ,   40  ,   50  ,   60  ,   70  ,   80  ,   90  ,   100 };
uint8_t y_pos[NUM_NODES] =  {10  ,  20  ,   30  ,   40  ,   50  ,   60  ,   70  ,   80  ,   90  ,   100 };

PROCESS_THREAD(prepare_data_col, ev, data)
{
  static struct etimer et;
  static struct t_data t_data;
  static uint16_t seqno;
  static struct in_out_list_tree *out_l;


  PROCESS_BEGIN();

  seqno = 0;

  while(1)
  {
    etimer_set(&et,  CLOCK_SECOND   );
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));

    if(!linkaddr_cmp(&linkaddr_node_addr,&t_node.parent) )//si ya tengo un padre. Al inicio yo soy mi mismo padre
    {
        seqno++;
        fill_data(&t_data, seqno, x_pos[linkaddr_node_addr.u8[0]-1], y_pos[linkaddr_node_addr.u8[0]-1],
                  t_node.est_int, &linkaddr_node_addr, &t_node.parent, &t_node.parent);

        //printf("x_pos = %d\n", x_pos[linkaddr_node_addr.u8[0]-1]);
        //printf("y_pos = %d\n", y_pos[linkaddr_node_addr.u8[0]-1]);

        //ADD to the list a runicast message END_GHS_MSG
        out_l = memb_alloc(&out_union_mem);
        if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
          printf("ERROR: we could not allocate a new entry for <<prepare_data_col>> in basicTree\n");
        }else
        {
            out_l->type_msg.t_data    = t_data;
            out_l->uniontype          = T_DATA;
            list_push(out_union_list,out_l); // Add an item to the start of the list.
        }
    }
  }


  PROCESS_END();

}

PROCESS_THREAD(update_parent, ev, data)
{

  static struct t_neighbor *n;
  static float lowest_weight;  //The weight of the parent = lowest_weight
  static linkaddr_t new_parent;
  static char res1[20],res2[20];

  PROCESS_BEGIN();

  while(1)
  {

    PROCESS_YIELD();
    if(ev == e_execute)
    {

        if( ! I_am_the_sink() )
        {
            if(list_length(t_neighbors_list) >= 1)
            {

              //Find the lowest of the list
              for(n = list_head(t_neighbors_list),
                  lowest_weight = n->weight, //Assume that the first one is the lowest
                  linkaddr_copy(&new_parent,&n->neigh) //Assume that the first one is the lowest
                  ; n != NULL; n = list_item_next(n))
              {
                  if(n->weight < lowest_weight)
                  {
                    lowest_weight = n->weight;
                    linkaddr_copy(&new_parent,&n->neigh);
                  }
              }

              //update_parent
              printf("#L %d 0\n", t_node.parent.u8[0]); // 0: old parent
              linkaddr_copy(&t_node.parent, &new_parent);
              printf("#L %d 1\n", t_node.parent.u8[0]); //: 1: new parent

              printf("t_node.flags = %d\n", t_node.flags);
              //if(t_node.flags == DATA_EST_INT_READY) //Only change the weight when I have the FIRST estimation of Interference
              //{
                //update weight
                //The weight of the node is: The estimated interference + the weight of the parent
                t_node.weight = t_node.est_int + lowest_weight;
                ftoa(t_node.weight, res1, 2);
                ftoa(t_node.est_int, res2, 2);
                printf("t_node.weight = %s t_node.est_int = %s t_node.parent = %d.%d\n",
                res1, res2, t_node.parent.u8[0], t_node.parent.u8[1] );
              //}

            }
        }

      }else
      {
        printf("ERROR: The event does not exist in update_parent (basicTree) \n");
      }

  }

  PROCESS_END();

}

PROCESS_THREAD(prepare_beacon, ev, data)
{
  static struct etimer et;
  static struct t_beacon t_beacon;
  static struct in_out_list_tree *out_l;

  //static char res1[20];
  PROCESS_BEGIN();

  initialize_tree();
  broadcast_open(&t_broadcast, 129, &t_broadcast_call);

  while(1)
  {
      //execute periodically
      //etimer_set(&et, TIME_INTERVAL_T_BEACON );
      etimer_set(&et,  random_rand() % (CLOCK_SECOND * 2) ); // Configure timer et to a random time between 0 and 2
      PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));

      if( t_node.weight < INFINITE_T_WEIGHT )
      {
        fill_beacon(&t_beacon, t_node.weight, &linkaddr_node_addr);
        //packetbuf_copyfrom(&t_beacon, sizeof(struct t_beacon));
        //broadcast_send(&t_broadcast);

        //ADD to the list a runicast message END_GHS_MSG
        out_l = memb_alloc(&out_union_mem);
        if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
          printf("ERROR: we could not allocate a new entry for <<out_union_list>> in basicTree\n");
        }else
        {
            out_l->type_msg.t_beacon  = t_beacon;
            out_l->uniontype          = T_BEACON;
            list_push(out_union_list,out_l); // Add an item to the start of the list.
        }

      }


  }

  PROCESS_END();

}

PROCESS_THREAD(response_to_t_beacon, ev, data)
{
  static struct t_beacon t_beacon;
  static struct t_neighbor *n;
  char res1[20];

  PROCESS_BEGIN();

  while(1)
  {
    PROCESS_YIELD();
    if(ev == e_execute)
    {
      t_beacon = *( (struct t_beacon *) data);

      /////////////////////////////////////////////////////////////////////////////
      //////////////////FILL the neighbor list using the beacon ///////////////////
      /////////////////////////////////////////////////////////////////////////////

      /* Check if we already know this neighbor. */
      for(n = list_head(t_neighbors_list); n != NULL; n = list_item_next(n)) {

       /* We break out of the loop if the address of the neighbor matches
          the address of the neighbor from which we received this
          broadcast message. */
       if(linkaddr_cmp(&n->neigh, &t_beacon.from)) {
         break;
       }
      }

      /* If n is NULL, this neighbor was not found in our list, and we
        allocate a new struct neighbor from the neighbors_memb memory
        pool. */
      if(n == NULL) {
       n = memb_alloc(&t_neighbors_memb);

       /* If we could not allocate a new neighbor entry, we give up. We
          could have reused an old neighbor entry, but we do not do this
          for now. */
       if(n == NULL) {
         printf("ERROR: We could not allocate a new neighbor entry in basic_tree\n");
         PROCESS_EXIT(); //Equivalent to return.
         //return;
       }

      /* Initialize the fields. */
      linkaddr_copy(&n->neigh, &t_beacon.from);
      n->weight = t_beacon.weight;

       /* Place the neighbor on the neighbor list. */
       list_add(t_neighbors_list, n);
      }

      //Get the weight of the neighbor
      n->weight = t_beacon.weight;

      ftoa(n->weight, res1, 2);
      printf("t_broadcast message received from %d.%d with weight = %s \n",
             t_beacon.from.u8[0], t_beacon.from.u8[1], res1  );

     /////////////////////////////////////////////////////////////////////////////
     ///////////////////Update the parent///////////////////// ///////////////////
     /////////////////////////////////////////////////////////////////////////////
      process_post(&update_parent, e_execute, NULL );

    }

  }

  PROCESS_END();

}


PROCESS_THREAD(response_to_t_data, ev, data)
{

  static struct t_data t_data;
  static struct t_data t_data_new;
  static struct in_out_list_tree *out_l;
  static char res1[20];
  PROCESS_BEGIN();

  while(1)
  {
    PROCESS_YIELD();
    if(ev == e_execute)
    {
        t_data = *( (struct t_data *) data);

        if(I_am_the_sink())
        {
          //format TREE_PLOT nodeID seqno x y parent_plot estimated_interference
          ftoa(t_data.est_int, res1, 4);
          printf("TREE_PLOT/%d/%d/%d/%d/%d/%s/\n",t_data.from.u8[0], t_data.seqno, t_data.x, t_data.y,
                                                  t_data.parent_plot.u8[0], res1 );

        }else
        {
          //Re Send the t_data to the next hop
          fill_data(&t_data_new, t_data.seqno, t_data.x, t_data.y,
                    t_data.est_int, &t_data.from, &t_node.parent, &t_data.parent_plot);

          //ADD to the list a runicast message END_GHS_MSG
          out_l = memb_alloc(&out_union_mem);
          if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
            printf("ERROR: we could not allocate a new entry for <<prepare_data_col>> in basicTree\n");
          }else
          {
              out_l->type_msg.t_data    = t_data_new;
              out_l->uniontype          = T_DATA;
              list_push(out_union_list,out_l); // Add an item to the start of the list.
          }

        }
    }


  }

  PROCESS_END();

}

// take out an element from the list in_union_list
PROCESS_THREAD(in_evaluation_tree, ev, data)
{
  static struct etimer et1, et2;
  static struct in_out_list_tree *in_l;
  PROCESS_BEGIN();
  while(1)
  {
    //REMOVE from the list
    //execute periodically
    etimer_set(&et1, CLOCK_SECOND * TIME_UNION_IN_OUT);
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et1));
        //We start to analize incoming messages when GHS_HAS_ENDED
        //if(node.control_flags & GHS_HAS_ENDED)
        //{
            while(list_length(in_union_list))
            {
              //printf("while(list_length(in_union_list))\n");
              //Give enough time to transmit the previous msg
              etimer_set(&et2, CLOCK_SECOND * TIME_PREVIOUS_MSG_IN_OUT_UNION);
              PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et2));
              //remove from list
              in_l = list_chop(in_union_list); // Remove the last object on the list.
              if(in_l->uniontype == T_BEACON)
              {
                  process_post(&response_to_t_beacon, e_execute, &in_l->type_msg.t_beacon);
              }else
              if(in_l->uniontype == T_DATA)
              {
                  process_post(&response_to_t_data, e_execute, &in_l->type_msg.t_data);
              }else
              {
                  printf("ERROR: The type of msg in in_evaluation_tree is unkown (basicTree) \n");
              }
              memb_free(&in_union_mem,in_l);
            } //while(list_length(in_union_list))
        //}
  }
  PROCESS_END();
}

// take out an element from the list out_union_list
PROCESS_THREAD(out_evaluation_tree, ev, data)
{
  static struct etimer et1, et2;
  static struct in_out_list_tree *out_l;
  static char res1[20];

  PROCESS_BEGIN();

  while(1)
  {
    //REMOVE from the list
    //execute periodically
    etimer_set(&et1, CLOCK_SECOND * TIME_UNION_IN_OUT);
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et1));

        //We start to analize outgoing messages when the GHS_HAS_ENDED
        //if(node.control_flags & GHS_HAS_ENDED)
        //{
          while(list_length(out_union_list))
          {
              //printf("while(list_length(out_union_list))\n");
              //Give enough time to transmit the previous msg
              etimer_set(&et2, CLOCK_SECOND * TIME_PREVIOUS_MSG_IN_OUT_UNION);
              PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et2));

              //if(!runicast_is_transmitting(&runicast_3))
              //{
                  //remove from list
                  out_l = list_chop(out_union_list); // Remove the last object on the list.
                  if(out_l->uniontype == T_BEACON)
                  {
                    ftoa( out_l->type_msg.t_beacon.weight, res1, 2); //Uses the library print_float.h
                    printf("//Send broadcast with e_send_t_beacon: t_beacon.from = %d t_beacon.weight = %s\n", out_l->type_msg.t_beacon.from.u8[0], res1 );
                    process_post(&send_basicTree, e_send_t_beacon, &out_l->type_msg.t_beacon );
                    //process_post_synch(&send_basicTree, e_send_t_beacon, &out_l->type_msg.t_beacon);
                  }else
                  if(out_l->uniontype == T_DATA)
                  {
                    process_post(&send_basicTree, e_send_t_data, &out_l->type_msg.t_data );
                    //process_post_synch(&send_basicTree, e_send_t_data, &out_l->type_msg.t_data);
                  }else
                  {
                      printf("ERROR: The type of msg in out_union_list is unkown (basicTree) \n");
                  }
                  memb_free(&out_union_mem,out_l);
              //}else
              //{
                  //printf("WARNING: break from runicast_control\n"); //"Enough" time is not enough!!
                  //break;
              //}
          } //END while list_length()
        //}
  } //while (1)

  PROCESS_END();
}

PROCESS_THREAD(send_basicTree, ev, data)
{

  static struct t_beacon t_beacon;
  static struct t_data t_data;
  static uint16_t num_packets;
  static float ppl; // ppl (Percentage of Packet Loss)
  static float btp; // btp (Backoff Time per packet)
  static float EWMA_btp_01;
  static float EWMA_ppl_01;
  static struct csma_results csma_results;
  static char res1[20], res2[20];

  PROCESS_EXITHANDLER(broadcast_close(&t_broadcast);)

  PROCESS_BEGIN();

  e_send_t_beacon  = process_alloc_event();
  e_send_t_data   = process_alloc_event();
  e_execute       = process_alloc_event();
  broadcast_open(&t_broadcast, 129, &t_broadcast_call);
  unicast_open(&t_uc, 146, &t_unicast_callbacks);

  num_packets = 0;
  reset_csma_stats();

  while(1)
  {
    PROCESS_YIELD();
    if(ev == e_send_t_beacon)
    {
      //t_beacon = *( (struct t_beacon*) data );
      t_beacon = *( (struct t_beacon*) data );

      packetbuf_copyfrom(&t_beacon, sizeof(struct t_beacon));
      packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, T_BEACON);
      broadcast_send(&t_broadcast);

      ftoa( t_beacon.weight, res1, 2); //Uses the library print_float.h
      printf("Send broadcast with e_send_t_beacon: t_beacon.from = %d t_beacon.weight = %s\n", t_beacon.from.u8[0], res1 );

    }else
    if(ev == e_send_t_data)
    {

      t_data = *( (struct t_data*) data );

      packetbuf_copyfrom(&t_data, sizeof(struct t_data));
      packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, T_DATA);
      unicast_send(&t_uc, &t_data.to);
      printf("Send e_send_t_data to %d.%d\n", t_data.to.u8[0], t_data.to.u8[1] );

    }else
    {
      printf("ERROR:Unknown msg to send (send_basicTree) in basicTree\n ");
    }

    //////////////////////////////////////////////////////////////////////////////
    /////////////////CSMA STATS COMPUTATION///////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////

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
        EWMA_btp_01 = btp;
        EWMA_ppl_01 = ppl;
      }else
      {
        EWMA_btp_01 = ( (float) EWMA_ALPHA_01 * (float) btp) + (( (float) 1 - (float) EWMA_ALPHA_01) * (float) EWMA_btp_01);
        EWMA_ppl_01 = ( (float) EWMA_ALPHA_01 * (float) ppl) + (( (float) 1 - (float) EWMA_ALPHA_01) * (float) EWMA_ppl_01);
      }

      //csma_results
      csma_results.btp = btp;
      csma_results.ppl = ppl;
      csma_results.EWMA_btp_01 = EWMA_btp_01;
      csma_results.EWMA_ppl_01 = EWMA_ppl_01;

      //print
      ftoa( btp, res1, 2); //Uses the library print_float.h
      ftoa( EWMA_btp_01, res2, 2); //Uses the library print_float.h
      printf("BTP/%d/%s/%s/\n",num_packets,  res1 , res2);

      ftoa( ppl, res1, 2); //Uses the library print_float.h
      ftoa( EWMA_ppl_01, res2, 2); //Uses the library print_float.h
      printf("PPL/%d/%s/%s/\n",num_packets,  res1 , res2);

      process_post(&analyze_csma_results, e_execute, &csma_results);

      reset_csma_stats();
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
    if(ev == e_execute)
    {
        csma_results = * ( (struct csma_results *) data );


        //////////////////////////////////////////////////////////////////////////////
        /////////////////DETERMINE EVENT//////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////

        //see for in matlab count_EWMA_btp_01
        for(i=1; i <= num_divisions_btp; i++ )
        {
          lower_interval = (float) (i-1) * (float) range_EWMA_btp_01 / (float) num_divisions_btp;
          upper_interval = (float) (i)   * (float) range_EWMA_btp_01 / (float) num_divisions_btp;
          ftoa(lower_interval, res1, 2);
          ftoa(csma_results.EWMA_btp_01, res2, 2);
          ftoa(upper_interval, res3, 2);

          if(  csma_results.EWMA_btp_01 >= lower_interval &&
               csma_results.EWMA_btp_01 <  upper_interval   )
            {
                detected_event.event_btp = i - 1; //Resto 1 porq aca es de 0-39...en matlab es de 1-40
                printf(" %s < /%s/ < %s \n", res1,res2,res3);
                printf("event_btp =/ %d\n", detected_event.event_btp);
                break;
            }
        }

        //see for in matlab count_EWMA_ppl_01
        for(i=1; i <= num_divisions_ppl; i++ )
        {
          lower_interval = (float) (i-1) * (float) range_ppl / (float) num_divisions_ppl;
          upper_interval = (float) (i)   * (float) range_ppl / (float) num_divisions_ppl;
          ftoa(lower_interval, res1, 2);
          ftoa(csma_results.EWMA_ppl_01, res2, 2);
          ftoa(upper_interval, res3, 2);

          if(  csma_results.EWMA_ppl_01 >= lower_interval &&
               csma_results.EWMA_ppl_01 <  upper_interval   )
            {
                detected_event.event_ppl = i - 1; //Resto 1 porq aca es de 0-39...en matlab es de 1-40
                printf(" %s < /%s/ < %s \n", res1,res2,res3);
                printf("event_ppl =/ %d\n", detected_event.event_ppl);
                break;
            }
        }

        process_post(&detect_interference, e_execute, &detected_event);

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
  static char res1[20],res2[20],res3[20],res4[20],res5[20],res6[20],res7[20],res8[20],res9[20],res10[20];
  static uint8_t i;
  static float total_prob, total_prob_N;
  static float max_prob;
  static uint8_t index;
  static struct detected_event detected_event;
  static uint16_t count;
  static float est_int; // est_int: Estimared interference
  static float EWMA_est_int_01;
  static float EWMA_est_int_02;
  static float EWMA_est_int_03;
  static float EWMA_est_int_04;
  static float EWMA_est_int_05;
  static float EWMA_est_int_06;
  static float EWMA_est_int_07;
  static float EWMA_est_int_08;
  static float EWMA_est_int_09;

  PROCESS_BEGIN();

  count = 0;

  while(1)
  {
    PROCESS_YIELD();
    if(ev == e_execute)
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
          prob_btp_ppl[i] = prob_btp_N[i] * prob_ppl_N[i]; //MULTIPLY independent probabilities
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
            count++;
            est_int = (float) i * (float) 10;
            ftoa(est_int, res1, 2); //Uses the library print_float.h
            printf("DET_INT/%d/%s/%d\n",count, res1, i*10 );
            //printf("DET_INT/%d/\n", i*10 );
            break;
          }
        }

        //////////////////////////////////////////////////////////
        //////////////EWMA of Interference////////////////////////
        //////////////////////////////////////////////////////////
        //Exponential weighted moving average (EWMA)
        //REF: https://en.wikipedia.org/wiki/Moving_average
        //REF: Also, see the example of contiki called example-neighbors.c It implements a EWMA
        if(count == 1) //It is the first calculation of EWMA_btp. We do not have previous data, so we use the first data
        {
          EWMA_est_int_01 = est_int;
          EWMA_est_int_02 = est_int;
          EWMA_est_int_03 = est_int;
          EWMA_est_int_04 = est_int;
          EWMA_est_int_05 = est_int;
          EWMA_est_int_06 = est_int;
          EWMA_est_int_07 = est_int;
          EWMA_est_int_08 = est_int;
          EWMA_est_int_09 = est_int;

        }else
        {
          EWMA_est_int_01 = ( (float) EWMA_ALPHA_01 * (float) est_int) + (( (float) 1 - (float) EWMA_ALPHA_01) * (float) EWMA_est_int_01);
          EWMA_est_int_02 = ( (float) EWMA_ALPHA_02 * (float) est_int) + (( (float) 1 - (float) EWMA_ALPHA_02) * (float) EWMA_est_int_02);
          EWMA_est_int_03 = ( (float) EWMA_ALPHA_03 * (float) est_int) + (( (float) 1 - (float) EWMA_ALPHA_03) * (float) EWMA_est_int_03);
          EWMA_est_int_04 = ( (float) EWMA_ALPHA_04 * (float) est_int) + (( (float) 1 - (float) EWMA_ALPHA_04) * (float) EWMA_est_int_04);
          EWMA_est_int_05 = ( (float) EWMA_ALPHA_05 * (float) est_int) + (( (float) 1 - (float) EWMA_ALPHA_05) * (float) EWMA_est_int_05);
          EWMA_est_int_06 = ( (float) EWMA_ALPHA_06 * (float) est_int) + (( (float) 1 - (float) EWMA_ALPHA_06) * (float) EWMA_est_int_06);
          EWMA_est_int_07 = ( (float) EWMA_ALPHA_07 * (float) est_int) + (( (float) 1 - (float) EWMA_ALPHA_07) * (float) EWMA_est_int_07);
          EWMA_est_int_08 = ( (float) EWMA_ALPHA_08 * (float) est_int) + (( (float) 1 - (float) EWMA_ALPHA_08) * (float) EWMA_est_int_08);
          EWMA_est_int_09 = ( (float) EWMA_ALPHA_09 * (float) est_int) + (( (float) 1 - (float) EWMA_ALPHA_09) * (float) EWMA_est_int_09);

        }

        ftoa( est_int, res1, 2); //Uses the library print_float.h
        ftoa( EWMA_est_int_09, res2, 2); //Uses the library print_float.h
        ftoa( EWMA_est_int_08, res3, 2); //Uses the library print_float.h
        ftoa( EWMA_est_int_07, res4, 2); //Uses the library print_float.h
        ftoa( EWMA_est_int_06, res5, 2); //Uses the library print_float.h
        ftoa( EWMA_est_int_05, res6, 2); //Uses the library print_float.h
        ftoa( EWMA_est_int_04, res7, 2); //Uses the library print_float.h
        ftoa( EWMA_est_int_03, res8, 2); //Uses the library print_float.h
        ftoa( EWMA_est_int_02, res9, 2); //Uses the library print_float.h
        ftoa( EWMA_est_int_01, res10, 2); //Uses the library print_float.h

        printf("EWMA_est_int/%d/%s/%s/%s/%s/%s/%s/%s/%s/%s/%s/\n",count,res1,res2,res3,res4,res5,res6,res7,res8,res9,res10);

        //t_node.flags   = DATA_EST_INT_READY;
        t_node.est_int = EWMA_est_int_01;

   }else
   {
      printf("ERROR: unknown event in detect_interference\n");
   }

  } //END while(1)

  PROCESS_END();
}

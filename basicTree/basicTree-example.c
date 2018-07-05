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


extern struct t_node t_node;
struct csma_stats csma_stats;

/*---------------------------------------------------------------------------*/
PROCESS(prepare_beacon, "prepare_beacon");
PROCESS(update_parent, "update_parent");
PROCESS(out_evaluation_tree, "out_evaluation_tree");
PROCESS(in_evaluation_tree, "in_evaluation_tree");
PROCESS(response_to_t_beacon, "response_to_t_beacon");
PROCESS(send_basicTree, "send_basicTree");



AUTOSTART_PROCESSES(&prepare_beacon,&update_parent,&out_evaluation_tree,&in_evaluation_tree,&response_to_t_beacon,&send_basicTree);
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
        printf("runicast message received T_BEACON from %d.%d \n",
        in_l->type_msg.t_beacon.from.u8[0], in_l->type_msg.t_beacon.from.u8[1] );
    }

  }else
  {
    printf("ERROR: the type of msg in basicTree is unknown\n");
  }

}
static const struct broadcast_callbacks t_broadcast_call = {t_broadcast_recv};
static struct broadcast_conn t_broadcast;


PROCESS_THREAD(update_parent, ev, data)
{

  static struct t_neighbor *n;
  static float lowest_weight;  //The weight of the parent = lowest_weight
  static linkaddr_t new_parent;
  static char res1[20];

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

              //update weight
              //The weight of the node is: The estimated interference + the weight of the parent
              t_node.weight = t_node.est_int + lowest_weight;
              ftoa(t_node.weight, res1, 2);
              printf("t_node.weight = %s t_node.parent = %d.%d\n", res1, t_node.parent.u8[0], t_node.parent.u8[1] );

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
      etimer_set(&et, TIME_INTERVAL_T_BEACON );
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
                    process_post(&send_basicTree, e_send_bacon, &out_l->type_msg.t_beacon);
                  }else
                  {
                      printf("ERROR: The type of msg in out_union_list is unkown (dghs) \n");
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

  PROCESS_EXITHANDLER(broadcast_close(&t_broadcast);)

  PROCESS_BEGIN();

  e_send_bacon  = process_alloc_event();
  e_execute     = process_alloc_event();
  broadcast_open(&t_broadcast, 129, &t_broadcast_call);

  while(1)
  {
    PROCESS_YIELD();
    if(ev == e_send_bacon)
    {
      t_beacon = *( (struct t_beacon*) data );

      packetbuf_copyfrom(&t_beacon, sizeof(struct t_beacon));
      packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, T_BEACON);
      broadcast_send(&t_broadcast);
      printf("Send broadcast with e_send_bacon\n" );

    }else
    {
      printf("ERROR:Unknown msg to send (send_basicTree) in basicTree\n ");
    }
  }

  PROCESS_END();


}

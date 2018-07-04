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
PROCESS(send_beacon, "send_beacon");
PROCESS(update_parent, "update_parent");

AUTOSTART_PROCESSES(&send_beacon,&update_parent);
/*---------------------------------------------------------------------------*/

//List of neighbors
MEMB(t_neighbors_memb, struct t_neighbor, MAX_NEIGHBORS);
LIST(t_neighbors_list);


/*---------------------------------------------------------------------------*/
static void
t_broadcast_recv(struct broadcast_conn *c, const linkaddr_t *from)
{
  struct t_neighbor *n;
  struct t_beacon *m;
  char res1[20];

  m = packetbuf_dataptr();

  /* Check if we already know this neighbor. */
  for(n = list_head(t_neighbors_list); n != NULL; n = list_item_next(n)) {

   /* We break out of the loop if the address of the neighbor matches
      the address of the neighbor from which we received this
      broadcast message. */
   if(linkaddr_cmp(&n->neigh, from)) {
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
     return;
   }

  /* Initialize the fields. */
  linkaddr_copy(&n->neigh, from);
  n->weight = m->weight;

   /* Place the neighbor on the neighbor list. */
   list_add(t_neighbors_list, n);
  }

  //Get the weight of the neighbor
  n->weight = m->weight;

  //Dado que llego 1 mensaje mi peso ya no es infinito
  /*if(t_node.weight == INFINITE_T_WEIGHT) //It means that it is the first msg the node receives
  {
    t_node.weight = 1;
  }*/

  ftoa(n->weight, res1, 2);
  printf("t_broadcast message received from %d.%d with weight = %s \n",
         from->u8[0], from->u8[1], res1  );
}
static const struct broadcast_callbacks t_broadcast_call = {t_broadcast_recv};
static struct broadcast_conn t_broadcast;


PROCESS_THREAD(update_parent, ev, data)
{

  static struct etimer et;
  static struct t_neighbor *n;
  static float lowest_weight;
  static linkaddr_t new_parent;
  static char res1[20];

  PROCESS_BEGIN();

  while(1)
  {
    //execute periodically
    etimer_set(&et, CLOCK_SECOND);
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));

    if(! I_am_the_sink())
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

          printf("#L %d 0\n", t_node.parent.u8[0]); // 0: old parent
          linkaddr_copy(&t_node.parent, &new_parent);
          printf("#L %d 1\n", t_node.parent.u8[0]); //: 1: new parent

          //update_parent
          t_node.weight = t_node.est_int + lowest_weight;
          ftoa(t_node.weight, res1, 2);

          printf("t_node.weight = %s _node.parent = %d.%d\n", res1, t_node.parent.u8[0], t_node.parent.u8[1] );

        }
    }




  }

  PROCESS_END();

}

PROCESS_THREAD(send_beacon, ev, data)
{
  static struct etimer et;
  static struct t_beacon t_beacon;
  //static char res1[20];
  PROCESS_BEGIN();

  initialize_tree();
  broadcast_open(&t_broadcast, 129, &t_broadcast_call);

  while(1)
  {
      //execute periodically
      etimer_set(&et, CLOCK_SECOND);
      PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));

      if( t_node.weight < INFINITE_T_WEIGHT )
      {
        fill_beacon(&t_beacon, t_node.weight);
        packetbuf_copyfrom(&t_beacon, sizeof(struct t_beacon));
        broadcast_send(&t_broadcast);



      }


  }

  PROCESS_END();

}

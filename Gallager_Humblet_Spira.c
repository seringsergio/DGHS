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

/* Ordena la lista de vecinos: Se para en la primera posicion,
*  luego recorre (for 2) toda la lista para ver si existe un vecino con
*  menor peso, si existe, intercambian las posiciones. Se repite
*  el procedimiento desde el segundo vecino de la lista (for 1).
*/

void fill_connect_msg(struct connect_msg *co_msg, linkaddr_t *to, linkaddr_t *from, uint8_t L)
{
  linkaddr_copy(&co_msg->to,to);
  linkaddr_copy(&co_msg->from,from);
  co_msg->L = L;
}

void fill_initiate_msg(struct initiate_msg *i_msg, linkaddr_t *to, linkaddr_t *from,
                       uint8_t L, struct fragment_name F, uint8_t S)
{
  linkaddr_copy(&i_msg->to,to);
  linkaddr_copy(&i_msg->from,from);
  i_msg->L =      L;
  i_msg->F =      F;
  i_msg->S =      S;
}

void fill_test_msg(struct test_msg *t_msg, linkaddr_t *to, linkaddr_t *from, uint8_t L, struct fragment_name F)
{
  linkaddr_copy(&t_msg->to,to);
  linkaddr_copy(&t_msg->from,from);
  t_msg->L =      L;
  t_msg->F =      F;
}

void fill_report_msg(struct report_msg *rep_msg, linkaddr_t *to, linkaddr_t *from, uint32_t w)
{
  linkaddr_copy(&rep_msg->to,to);
  linkaddr_copy(&rep_msg->from,from);
  rep_msg->w = w;
}

void fill_accept_msg(struct accept_msg *a_msg, linkaddr_t *to, linkaddr_t *from)
{
  linkaddr_copy(&a_msg->to,to);
  linkaddr_copy(&a_msg->from,from);
}

void fill_reject_msg(struct reject_msg *rej_msg, linkaddr_t *to, linkaddr_t *from)
{
  linkaddr_copy(&rej_msg->to,to);
  linkaddr_copy(&rej_msg->from,from);
}

void fill_change_root_msg(struct change_root_msg *cha_root_msg, linkaddr_t *to, linkaddr_t *from)
{
  linkaddr_copy(&cha_root_msg->to,to);
  linkaddr_copy(&cha_root_msg->from,from);
}

void fill_fragment_name(struct fragment_name *F, const linkaddr_t *from, const  linkaddr_t *i_am, uint32_t name)
{
   F->name = name;

   //The lowest address is the node1, highest address is node2
   if( i_am->u8[0] < from->u8[0])
   {
     linkaddr_copy(&F->node1,i_am);
     linkaddr_copy(&F->node2,from);
   }else
   {
     linkaddr_copy(&F->node1,from);
     linkaddr_copy(&F->node2,i_am);
   }
}

uint8_t different_fragments(struct fragment_name F1,struct fragment_name F2)
{
  if(F1.name != F2.name )
  {
    DGHS_DBG_2("different_fragments\n");
    return 1;
  }else
  {
      if( linkaddr_cmp(&F1.node1,&F2.node1) && linkaddr_cmp(&F1.node2,&F2.node2) )
      {
        DGHS_DBG_2("Same_fragment\n");
        return 0;
      }
      else
      {
        DGHS_DBG_2("different_fragments\n");
        return 1;
      }
  }
}
void print_neighbor_list_debug(struct neighbor *neighbors_list_head)
{
    struct neighbor *n;

    if(neighbors_list_head == NULL)
    {
        DGHS_DBG_1("ERROR: neighbors_list_head is NULL \n");
    }

    for(n = neighbors_list_head; n != NULL; n = list_item_next(n))
    {
        DGHS_DBG_2("READ_NEIGHBOR_LIST %d %d %d.%02d %d \n", linkaddr_node_addr.u8[0], n->addr.u8[0],
        (int)(n->weight / SEQNO_EWMA_UNITY),
        (int)(((100UL * n->weight) / SEQNO_EWMA_UNITY) % 100),
        n->SE
        );
        /*DGHS_DBG_2("%d.%d weight=%d.%02d\n", n->addr.u8[0], n->addr.u8[1],
        (int)(n->weight / SEQNO_EWMA_UNITY),
        (int)(((100UL * n->weight) / SEQNO_EWMA_UNITY) % 100)
        );*/
    }
}

uint8_t is_basic(linkaddr_t *addr)
{
  struct neighbor *n;

  for(n = neighbors_list_p; n != NULL; n = list_item_next(n))
  {
      if(linkaddr_cmp(&n->addr, addr)) {
        break;
      }
  }

  if(n == NULL)
  {
      DGHS_DBG_1("ERROR: The neighbor that you intend to determine is_basic() does not exists\n");
      return 0;
  }else
  {
      if(n->SE == BASIC)
      {
        return 1;
      }else
      {
        return 0;
      }

  }
}

uint8_t is_branch(linkaddr_t *addr)
{
  struct neighbor *n;

  for(n = neighbors_list_p; n != NULL; n = list_item_next(n))
  {
      if(linkaddr_cmp(&n->addr, addr)) {
        break;
      }
  }

  if(n == NULL)
  {
      DGHS_DBG_1("ERROR: The neighbor that you intend to determine is_branch() does not exists\n");
      return 0;
  }else
  {
      if(n->SE == BRANCH)
      {
        return 1;
      }else
      {
        return 0;
      }

  }
}

uint32_t weight(linkaddr_t *addr)
{
  struct neighbor *n;

  for(n = neighbors_list_p; n != NULL; n = list_item_next(n))
  {
      if(linkaddr_cmp(&n->addr, addr)) {
        break;
      }
  }

  if(n == NULL)
  {
    DGHS_DBG_1("ERROR: The neighbor that you intend to determine weight() does not exists\n");
    return 0;
  }else
  {
      return (n->weight);
  }

}

void become_branch(linkaddr_t *addr)
{
  struct neighbor *n;

  for(n = neighbors_list_p; n != NULL; n = list_item_next(n))
  {
      if(linkaddr_cmp(&n->addr, addr)) {
        break;
      }
  }

  if(n == NULL)
  {
      DGHS_DBG_1("ERROR: The neighbor that you intend to become_branch() does not exists\n");
  }else
  {
      n->SE = BRANCH;
      DGHS_DBG_2("Neighbor %d.%d is now branch\n", n->addr.u8[0], n->addr.u8[1]);
  }
}

void become_rejected(linkaddr_t *addr)
{
  struct neighbor *n;

  for(n = neighbors_list_p; n != NULL; n = list_item_next(n))
  {
      if(linkaddr_cmp(&n->addr, addr)) {
        break;
      }
  }

  if(n == NULL)
  {
      DGHS_DBG_1("ERROR: The neighbor that you intend to become_rejected() does not exists\n");
  }else
  {
      n->SE = REJECTED;
      DGHS_DBG_2("Neighbor %d.%d is now rejected\n", n->addr.u8[0], n->addr.u8[1]);
  }
}

// Puts all the neighbors/edges in the BASIC state
void init_SE()
{
  struct neighbor *n;

  for(n = neighbors_list_p; n != NULL; n = list_item_next(n))
  {
    n->SE = BASIC;
  }

  DGHS_DBG_2("All the neighbors/edges are in the BASIC state\n");

}

// It sorts the list of neighbors/edges from the lowest weight to the highest weight.
void sort_neighbor_list()
{
  struct neighbor *i, *j, *lowest_edge, temp;

  /* Sort Linked List in Ascending Order:
     Encuentro el nodo con menor avg_seqno_gap de la lista,
     lo intercambio con el primer elemento de la lista,
     repito lo mismo comenzando del segundo elemento de la lista*/
  for(i = neighbors_list_p; i != NULL; i = list_item_next(i))
  {
    lowest_edge = i;

    for(j = i; j != NULL; j = list_item_next(j))
    {
      if(j->weight < lowest_edge->weight)
      {
        lowest_edge = j;
      }
    }

    change_positions(&temp, i);
    change_positions(i, lowest_edge);
    change_positions(lowest_edge, &temp);
  } //END for

  DGHS_DBG_2("The list of neighbors/edges has been sorted\n");

}

void change_positions(struct neighbor *destination, struct neighbor *from)
{
  linkaddr_copy (&destination->addr, &from->addr);
  destination->last_rssi                     = from->last_rssi;
  destination->last_lqi                      = from->last_lqi;
  destination->last_seqno                    = from->last_seqno;
  destination->avg_seqno_gap                 = from->avg_seqno_gap;
  destination->avg_seqno_gap_other_direction = from->avg_seqno_gap_other_direction;
  destination->weight                        = from->weight;
  destination->flags                         = from->flags;
}

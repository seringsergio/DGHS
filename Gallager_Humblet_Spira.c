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


struct neighbor * find_edge_of_minimum_weight(struct neighbor *neighbors_list_p)
{
  struct neighbor *i, *j, *lowest_edge, *temp = NULL;

  /* Sort Linked List in Ascending Order:
     Encuentro el nodo con menor avg_seqno_gap de la lista,
     lo intercambio con el primer elemento de la lista,
     repito lo mismo comenzando del segundo elemento de la lista*/
  for(i = neighbors_list_p; i != NULL; i = list_item_next(i))
  {
    lowest_edge = i;

    for(j = neighbors_list_p; j != NULL; j = list_item_next(j))
    {
      if(j->weight < lowest_edge->weight)
      {
        lowest_edge = j;
      }
    }

    change_positions(temp, i);
    change_positions(i, lowest_edge);
    change_positions(lowest_edge, temp);

  }

  return neighbors_list_p;

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




/*void sort_neighbor_list(struct neighbor *n_list_head)
{
    struct neighbor *n_aux, *first_position, *lowest_node = NULL, temp_node;
    uint32_t lowest_avg_seqno_gap;

    for(n_aux = n_list_head;
        n_aux != NULL; n_aux = list_item_next(n_aux)) // Recorrer toda la lista
    {
       flags &= !EXIST_LOWEST;
       //Recorrer desde la segunda posicion del nodo
       for(first_position = n_aux, lowest_avg_seqno_gap =  first_position->avg_seqno_gap,
           lowest_node = first_position;
           first_position != NULL; first_position = list_item_next(first_position))
       {
           if(first_position->avg_seqno_gap < lowest_avg_seqno_gap)
           {
                 lowest_avg_seqno_gap = first_position->avg_seqno_gap;
                 lowest_node = first_position;
                 flags |= EXIST_LOWEST;
           }
       }

       if(flags & EXIST_LOWEST) // Si existe un nodo menor, reemplazo los datos de los nodos
       {
         ghs_n_copy_data(&temp_node, lowest_node);
         ghs_n_copy_data(lowest_node, n_aux);
         ghs_n_copy_data(n_aux, &temp_node);
       }
    }
}*/

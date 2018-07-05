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

#ifndef BASIC_TREE_H
#define BASIC_TREE_H


////////////////////////////////////////////////////////////////////////
///////////////////INCLUDES/////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

#include "contiki.h"
#include "net/rime/rime.h"
#include <stdio.h>
//
#include "print_float.h"
#include "Bayes_Laplace_Classify.h"


////////////////////////////////////////////////////////////////////////
///////////////////DEFINE///////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

#define MAX_NEIGHBORS         16
#define INITIAL_T_WEIGHT      100  //Asume that the interference is the worst case: 100%
#define INITIAL_T_INT         100 //Asume that the interference is the worst case: 100%
#define INFINITE_T_WEIGHT     9999.9F /* max value of a float */
#define QUEUE_SIZE_T_BEACONS  MAX_NEIGHBORS * 2

//types of messages
#define T_BEACON     0x01

//#define TIME_INTERVAL_T_BEACON           CLOCK_SECOND * 1
#define TIME_UNION_IN_OUT                0.25f  // tengo que sacar los msg en menos tiempo de lo q entran (TIME_INTERVAL_T_BEACON) - repetido con la implementacion completa
#define TIME_PREVIOUS_MSG_IN_OUT_UNION   0.25f //  tengo que sacar los msg en menos tiempo de lo q entran (TIME_INTERVAL_T_BEACON)  - repetido con la implementacion completa

//FLAGS t_node.flags
//#define DATA_EST_INT_READY     0x01


////////////////////////////////////////////////////////////////////////
///////////////////GLOBALS//////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

extern struct t_node t_node;
extern struct csma_stats csma_stats;


/////////////////////////////////////////////////////////////////////////////
///////////////////////EVENTS////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

process_event_t e_send_bacon;
process_event_t e_execute;
////////////////////////////////////////////////////////////////////////
///////////////////STRUCT///////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////



struct t_beacon
{
   float weight;
   linkaddr_t from;
};

union types_msg_tree
{
  struct t_beacon t_beacon;
};

struct in_out_list_tree
{
  struct in_out_list_tree *next;
  uint8_t uniontype;
  union types_msg_tree type_msg;
};

struct t_node
{
   float weight;
   linkaddr_t parent;
   float est_int; //Estimated interference
   uint8_t flags;
};

struct t_neighbor
{
  struct t_neighbor *next;
  linkaddr_t neigh;
  float weight;
};



////////////////////////////////////////////////////////////////////////
///////////////////FUNCTION/////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

void initialize_tree();
void fill_beacon(struct t_beacon *t_beacon, float weight, linkaddr_t *from);
uint8_t I_am_the_sink();
void reset_csma_stats();


#endif /* BASIC_TREE_H */

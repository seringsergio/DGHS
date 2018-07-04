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


////////////////////////////////////////////////////////////////////////
///////////////////DEFINE///////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

#define MAX_NEIGHBORS     16
#define INITIAL_T_WEIGHT  1
#define INITIAL_T_INT     1
#define INFINITE_T_WEIGHT 9999.9F /* max value of a float */

////////////////////////////////////////////////////////////////////////
///////////////////GLOBALS//////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

struct t_node t_node;

////////////////////////////////////////////////////////////////////////
///////////////////STRUCT///////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

struct t_beacon
{
   float weight;
};


struct t_node
{
   float weight;
   linkaddr_t parent;
   float est_int; //Estimated interference
};

struct t_neighbor
{
  struct t_neighbor *next;
  linkaddr_t neigh;
  float weight;
};

//Stores the stats comming from csma.c
struct csma_stats
{
 uint16_t packets_dropped; //We can count up to 65535 message lost
 uint16_t delay;
};

////////////////////////////////////////////////////////////////////////
///////////////////FUNCTION/////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

void initialize_tree();
void fill_beacon(struct t_beacon *t_beacon, float weight);
uint8_t I_am_the_sink();

 #endif /* BASIC_TREE_H */

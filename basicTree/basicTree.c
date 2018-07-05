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


 ////////////////////////////////////////////////////////////////////////
 ///////////////////FUNCTION/////////////////////////////////////////////
 ////////////////////////////////////////////////////////////////////////
void initialize_tree()
{
  if(I_am_the_sink())
  {
    t_node.weight = INITIAL_T_WEIGHT;  //The initial weight of each node is 1
  }else
  {
    t_node.weight = INFINITE_T_WEIGHT;  //The initial weight of each node is 1
  }

   t_node.est_int = INITIAL_T_INT;
   linkaddr_copy(&t_node.parent,&linkaddr_node_addr);

}

void fill_beacon(struct t_beacon *t_beacon, float weight, linkaddr_t *from)
{
    t_beacon->weight = weight;
    linkaddr_copy(&t_beacon->from,from);
}

uint8_t I_am_the_sink()
{
   if( (linkaddr_node_addr.u8[0] == 1) && (linkaddr_node_addr.u8[1] == 0) )
   {
       printf("I am the sink\n");
       return 1;
   }else
   {
       return 0;
   }

}

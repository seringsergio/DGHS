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


#ifndef DYNAMIC_GALLAGER_HUMBLET_SPIRA_H
#define DYNAMIC_GALLAGER_HUMBLET_SPIRA_H


/////////////////////////////////////////////////////////////////////////////
///////////////////////INCLUDES//////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

#include "example-DGHS.h"

/////////////////////////////////////////////////////////////////////////////
///////////////////////EVENTS////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

process_event_t e_send_end_ghs;
process_event_t e_send_point_to_sink;
/////////////////////////////////////////////////////////////////////////////
///////////////////////DEFINES///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////


//types of messages
#define END_GHS_MSG          0x01
#define POINT_TO_SINK_MSG    0x02
#define INCLUDING_PARENT     0x04

/////////////////////////////////////////////////////////////////////////////
///////////////////////STRUCTS///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

struct end_ghs
{
  linkaddr_t  to;
  linkaddr_t  from;
};

struct point_to_sink
{
  linkaddr_t  to;
  linkaddr_t  from;
};


union types_msg_dghs
{
  struct end_ghs        end_ghs;
  struct point_to_sink  point_to_sink;
};

struct in_out_list_dghs
{
  struct in_out_list_dghs *next;
  uint8_t uniontype;
  union types_msg_dghs type_msg;
};

/////////////////////////////////////////////////////////////////////////////
///////////////////////FUNCTIONS/////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

void fill_end_ghs_msg(struct end_ghs *end_ghs, linkaddr_t *to, linkaddr_t *from );
void fill_point_to_sink_msg(struct point_to_sink *point_to_sink, linkaddr_t *to, linkaddr_t *from );
uint8_t I_am_the_sink();
//git
#endif /* DYNAMIC_GALLAGER_HUMBLET_SPIRA_H */

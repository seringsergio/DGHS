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
#ifndef GALLAGER_HUMBLET_SPIRA_H
#define GALLAGER_HUMBLET_SPIRA_H

#include "example-DGHS.h"


/////////////////////////////////////////////////////////////////////////////
///////////////////////DEFINES///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

// n->SE: Edge state
#define BASIC    0x01
#define BRANCH   0x02
#define REJECTED 0x04

// node.SN: Node state
#define SLEEPING    0x01
#define FIND        0x02
#define FOUND       0x04

//uniontype
#define CONNECT_MSG 0x01


/////////////////////////////////////////////////////////////////////////////
///////////////////////EVENTS////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

process_event_t e_send_connect;
/////////////////////////////////////////////////////////////////////////////
///////////////////////FORWARD DECLARATIONS//////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 struct neighbor; // forward declaration of the struct


 /////////////////////////////////////////////////////////////////////////////
 ///////////////////////STRUCTS///////////////////////////////////////////////
 /////////////////////////////////////////////////////////////////////////////

struct connect_msg
{
  linkaddr_t addr;
  uint8_t LE; // level
};

union types_msg
{
  struct connect_msg co_msg;
};

struct out_list
{
  struct out_list *next;
  uint8_t uniontype;
  union types_msg type_msg;
};

/////////////////////////////////////////////////////////////////////////////
///////////////////////FUNTIONS//////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

void fill_connect_msg(struct connect_msg *co_msg, linkaddr_t *addr, uint8_t LE);
void print_neighbor_list_debug(struct neighbor *neighbors_list_head);
void become_branch(struct neighbor *n);
void init_SE();
void sort_neighbor_list();
void change_positions(struct neighbor *destination, struct neighbor *from);


#endif /* GALLAGER_HUMBLET_SPIRA_H */

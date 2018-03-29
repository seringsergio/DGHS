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

#define INFINITE UINT32_MAX

// n->SE: Edge state
enum
{
  BASIC,
  BRANCH,
  REJECTED
};

// node.SN: Node state
enum
{
  SLEEPING,
  FIND,
  FOUND
};

//Types of messages
enum
{
  CONNECT_MSG,
  INITIATE_MSG,
  TEST_MSG,
  REPORT_MSG,
  ACCEPT_MSG,
  REJECT_MSG,
  CHANGE_ROOT_MSG
};



//uniontype
//#define CONNECT_MSG 0x01


/////////////////////////////////////////////////////////////////////////////
///////////////////////EVENTS////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

process_event_t e_send_connect;
process_event_t e_send_initiate;
process_event_t e_send_test;
process_event_t e_send_accept;
process_event_t e_send_reject;
process_event_t e_send_report;
process_event_t e_send_change_root;

/////////////////////////////////////////////////////////////////////////////
///////////////////////FORWARD DECLARATIONS//////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 struct neighbor; // forward declaration of the struct


 /////////////////////////////////////////////////////////////////////////////
 ///////////////////////STRUCTS///////////////////////////////////////////////
 /////////////////////////////////////////////////////////////////////////////


 struct change_root_msg
 {
   linkaddr_t to;
   linkaddr_t from;
 };

 struct reject_msg
 {
   linkaddr_t to;
   linkaddr_t from;
 };

 struct accept_msg
 {
   linkaddr_t to;
   linkaddr_t from;
 };

 struct report_msg
 {
   linkaddr_t to;
   linkaddr_t from;
   uint32_t   w; //Fragment name
 };

struct test_msg
{
  linkaddr_t to;
  linkaddr_t from;
  uint8_t    L; // level
  uint32_t   F; //Fragment name
};

struct connect_msg
{
  linkaddr_t to;
  linkaddr_t from;
  uint8_t L; // level
};

struct initiate_msg
{
  linkaddr_t to;
  linkaddr_t from;
  uint8_t    L; // level
  uint32_t   F; //Fragment name
  uint8_t    S; // Node state
};

union types_msg
{
  struct connect_msg        co_msg;
  struct initiate_msg       i_msg;
  struct test_msg           t_msg;
  struct report_msg         rep_msg;
  struct accept_msg         a_msg;
  struct reject_msg         rej_msg;
  struct change_root_msg    cha_root_msg;
};

struct in_out_list
{
  struct in_out_list *next;
  uint8_t uniontype;
  union types_msg type_msg;
};

/////////////////////////////////////////////////////////////////////////////
///////////////////////FUNTIONS//////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

void fill_connect_msg(struct connect_msg *co_msg, linkaddr_t *to, linkaddr_t *from, uint8_t L);
void fill_initiate_msg(struct initiate_msg *i_msg, linkaddr_t *to, linkaddr_t *from, uint8_t L, uint32_t F, uint8_t S);
void fill_test_msg(struct test_msg *t_msg, linkaddr_t *to, linkaddr_t *from, uint8_t L, uint32_t F);
void fill_report_msg(struct report_msg *rep_msg, linkaddr_t *to, linkaddr_t *from, uint32_t w);
void fill_accept_msg(struct accept_msg *a_msg, linkaddr_t *to, linkaddr_t *from);
void fill_reject_msg(struct reject_msg *rej_msg, linkaddr_t *to, linkaddr_t *from);
void fill_change_root_msg(struct change_root_msg *cha_root_msg, linkaddr_t *to, linkaddr_t *from);
void print_neighbor_list_debug(struct neighbor *neighbors_list_head);
void become_branch(linkaddr_t *addr);
void become_rejected(linkaddr_t *addr);
uint8_t is_basic(linkaddr_t *addr);
uint8_t is_branch(linkaddr_t *addr);
uint32_t weight(linkaddr_t *addr);
void init_SE();
void sort_neighbor_list();
void change_positions(struct neighbor *destination, struct neighbor *from);


#endif /* GALLAGER_HUMBLET_SPIRA_H */

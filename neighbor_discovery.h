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

#ifndef NEIGHBOR_DISCOVERY_H
#define NEIGHBOR_DISCOVERY_H

#include "example-DGHS.h"


/////////////////////////////////////////////////////////////////////////////
///////////////////////TYPEDEF///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
///////////////////////DEFINES///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

#define SEQNO_EWMA_UNITY 0x100 // These two defines are used for computing the moving average for the broadcast sequence number gaps.
#define SEQNO_EWMA_ALPHA 0x040

/////////////////////////////////////////////////////////////////////////////
///////////////////////EVENTS////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

process_event_t e_send_broadcast;
process_event_t e_send_runicast;
process_event_t e_broadcast_evaluation;
process_event_t e_runicast_add_to_list;

/////////////////////////////////////////////////////////////////////////////
///////////////////////FLAGS/////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

//broadcast_message  - msg - flags
#define FLAG_BROADCAST_END 0x01
//OJO: al agregar otra flag por la asignacion de la funcion fill_broadcast_msg()

//struct neighbor - n - flags
//#define COMPROMISE_TO_SEND_AGREEMENT   0x01 // The node must send the agreement
#define AVG_SEQNO_GAP_OTHER_DIRECTION  0x01
#define NEIGHBOR_HAS_ENDED_BROADCAST   0x02
#define WEIGHT_HAS_BEEN_ASSIGNED       0x04

/////////////////////////////////////////////////////////////////////////////
///////////////////////STRUCTS///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////


/* OPTIONAL: Sender history.
 * Detects duplicate callbacks at receiving nodes.
 * Duplicates appear when ack messages are lost. */
struct history_entry {
  struct history_entry *next;
  linkaddr_t addr;
  uint8_t seq;
};

struct broadcast_message {
  uint8_t seqno;
  uint8_t flags;
};

struct runicast_message {
  linkaddr_t addr;
  uint32_t avg_seqno_gap;
};

struct runicast_list
{
    struct runicast_list *next;
    struct runicast_message msg;
};

/* This structure holds information about neighbors. */
 struct neighbor {
  /* The ->next pointer is needed since we are placing these on a
     Contiki list. */
  struct neighbor *next;

  /* The ->addr field holds the Rime address of the neighbor. */
  linkaddr_t addr;

  /* The ->last_rssi and ->last_lqi fields hold the Received Signal
     Strength Indicator (RSSI) and CC2420 Link Quality Indicator (LQI)
     values that are received for the incoming broadcast packets. */
  uint16_t last_rssi, last_lqi;

  /* Each broadcast packet contains a sequence number (seqno). The
     ->last_seqno field holds the last sequenuce number we saw from
     this neighbor. */
  uint8_t last_seqno;

  /* The ->avg_gap contains the average seqno gap that we have seen
     from this neighbor. */
  uint32_t avg_seqno_gap;

  uint32_t avg_seqno_gap_other_direction;

  uint32_t weight;

  uint8_t flags;

  uint8_t SE; //The state of edge j

};

/////////////////////////////////////////////////////////////////////////////
///////////////////////GLOBALS///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
struct neighbor *neighbors_list_p;



/////////////////////////////////////////////////////////////////////////////
///////////////////////INTERFACES////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void interface_get_neighbor_list_pointer(struct neighbor *neighbors_list_head);

/////////////////////////////////////////////////////////////////////////////
///////////////////////FUNTIONS//////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

void fill_broadcast_msg(struct broadcast_message *msg, uint8_t seqno, uint8_t flags);
void fill_runicast_msg(struct runicast_message *msg, linkaddr_t addr, uint32_t avg_seqno_gap);
uint8_t every_neighbor_agrees(struct neighbor *neighbors_list_head);
void print_neighbor_list(struct neighbor *neighbors_list_head);


#endif /* NEIGHBOR_DISCOVERY_H */

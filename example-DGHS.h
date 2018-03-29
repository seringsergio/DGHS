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

 #ifndef EXAMPLE_DGHS_H
 #define EXAMPLE_DGHS_H

/////////////////////////////////////////////////////////////////////////////
///////////////////////LIBRARIES/////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
#include "lib/list.h"
#include "contiki.h"
#include "lib/memb.h"
#include "lib/random.h"
#include "net/rime/rime.h"
#include <stdio.h>

#include "neighbor_discovery.h"
#include "Gallager_Humblet_Spira.h"
/////////////////////////////////////////////////////////////////////////////
///////////////////////EXTERN////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
///////////////////////PARAMETERS////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////


//Values test
#define NUM_MAX_RETRANSMISSIONS               50
#define NUM_BROADCAST_NEIGHBOR_DISCOVERY      20 //Must be greater than 1, at least 2. # of broadcast to send
#define TIME_BROADCAST_INTERVAL_DISCOVERY     2 //in seconds. Broadcast interval in neighbor discovery
#define TIME_BROADCAST_INTERVAL_END           5 //in seconds
#define NUM_MAX_NEIGHBORS                     16 // This #define defines the maximum amount of neighbors we can remember.
#define NUM_HISTORY_ENTRIES                   4
#define TIME_PREVIOUS_RU_MSG                  10 // time to transmit the previous ru_msg (in seconds)
#define TIME_DGHS_PROCESS                     1 // The process master_DGHS executes every TIME_DGHS_PROCESS
#define QUEUE_SIZE_GHS                        10
#define TIME_UNION_IN_OUT                     2  //Get out of queue
#define TIME_PREVIOUS_MSG_IN_OUT_UNION        5

//Values for 120 nodes
/*#define NUM_MAX_RETRANSMISSIONS               50
#define NUM_BROADCAST_NEIGHBOR_DISCOVERY      10 //Must be greater than 1, at least 2. # of broadcast to send
#define TIME_BROADCAST_INTERVAL_DISCOVERY     5 //in seconds. Broadcast interval in neighbor discovery
#define TIME_BROADCAST_INTERVAL_END           30 //in seconds
#define NUM_MAX_NEIGHBORS                     16 // This #define defines the maximum amount of neighbors we can remember.
#define NUM_HISTORY_ENTRIES                   4
#define TIME_PREVIOUS_RU_MSG                  15 // time to transmit the previous ru_msg (in seconds)
#define TIME_DGHS_PROCESS                     1 // The process master_DGHS executes every TIME_DGHS_PROCESS*/


/////////////////////////////////////////////////////////////////////////////
///////////////////////DEFINES///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

#define RUNICAST_CHANNEL_1 144
#define RUNICAST_CHANNEL_2 145



/////////////////////////////////////////////////////////////////////////////
///////////////////////FLAGS/////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

//struct sensor_node - node.control_flags_neighbor_discovery
#define NEIGHBOR_DISCOVERY_HAS_ENDED 0x01
#define GHS_HAS_ENDED                0x02

/////////////////////////////////////////////////////////////////////////////
///////////////////////EXTERNAL PROCESSES////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

PROCESS_NAME(master_neighbor_discovery);
PROCESS_NAME(send_neighbor_discovery);
PROCESS_NAME(wait);
PROCESS_NAME(broadcast_control);
PROCESS_NAME(runicast_control);
PROCESS_NAME(analyze_agreement);
PROCESS_NAME(procedure_wakeup);
PROCESS_NAME(send_Gallager_Humblet_Spira);
PROCESS_NAME(out_union_evaluation);
PROCESS_NAME(in_union_evaluation);
PROCESS_NAME(response_to_connect);
PROCESS_NAME(response_to_initiate);
PROCESS_NAME(procedure_test);
PROCESS_NAME(procedure_report);
PROCESS_NAME(response_to_test);
PROCESS_NAME(response_to_accept);
PROCESS_NAME(response_to_reject);
PROCESS_NAME(response_to_report);
PROCESS_NAME(procedure_change_root);
PROCESS_NAME(response_to_change_root);

/////////////////////////////////////////////////////////////////////////////
///////////////////////EVENTS////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

process_event_t e_initialize;
process_event_t e_execute;
/////////////////////////////////////////////////////////////////////////////
///////////////////////DEBUG/////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

//Priority 1
#define DGHS_DEBUG_1 1
#if DGHS_DEBUG_1
#include <stdio.h>
#define DGHS_DBG_1(...) printf(__VA_ARGS__)
#else
#define DGHS_DBG_1(...)
#endif

//Priority 2
#define DGHS_DEBUG_2 1
#if DGHS_DEBUG_2
#include <stdio.h>
#define DGHS_DBG_2(...) printf(__VA_ARGS__)
#else
#define DGHS_DBG_2(...)
#endif

/////////////////////////////////////////////////////////////////////////////
///////////////////////STRUCTS///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

struct sensor_node
{
    uint8_t    control_flags_neighbor_discovery;
    uint8_t    LN; // level
    uint32_t   FN; //Fragment name
    uint8_t    SN; // Node state
    uint8_t    find_count;
    linkaddr_t in_branch;
    linkaddr_t best_edge;
    uint32_t   best_wt; //Fragment name
    linkaddr_t test_edge;

}node;

/////////////////////////////////////////////////////////////////////////////
///////////////////////FUNCTIONS/////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////////
///////////////////////INTERFACES////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

void DGHS_interface_control_flags(uint8_t flags);


#endif /* EXAMPLE_DGHS_H */

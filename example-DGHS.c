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

#include "example-DGHS.h"


/////////////////////////////////////////////////////////////////////////////
///////////////////////FUNCTIONS/////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
///////////////////////INTERFACES////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

void DGHS_interface_control_flags(uint8_t flags)
{
    node.control_flags |= flags;
}

/////////////////////////////////////////////////////////////////////////////
///////////////////////PROCESSES/////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

PROCESS(master_DGHS, "master_DGHS");

AUTOSTART_PROCESSES(//example-DGHS
                    &master_DGHS,
                    //neighbor discovery
                    &master_neighbor_discovery);


PROCESS_THREAD(master_DGHS, ev, data)
{

    static struct etimer et;

    PROCESS_BEGIN();

    e_initialize = process_alloc_event();
    e_execute    = process_alloc_event();

    process_post(&master_neighbor_discovery,e_initialize,NULL);

    while(1)
    {
        //Execute Periodically
        etimer_set(&et, CLOCK_SECOND * TIME_DGHS_PROCESS);
        PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));

        if(node.control_flags & NEIGHBOR_DISCOVERY_HAS_ENDED)
        {
            DGHS_DBG_2("NEIGHBOR_DISCOVERY_HAS_ENDED\n");
            print_neighbor_list(neighbors_list_p);
        }
    }

    PROCESS_END();
}
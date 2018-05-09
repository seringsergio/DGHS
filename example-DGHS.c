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
    node.control_flags_neighbor_discovery |= flags;
}

/////////////////////////////////////////////////////////////////////////////
///////////////////////PROCESSES/////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

PROCESS(master_DGHS, "master_DGHS");

AUTOSTART_PROCESSES(//example-DGHS
                    &master_DGHS,
                    //neighbor discovery
                    &master_neighbor_discovery,
                    //Gallager Humblet Spira
                    &procedure_wakeup, &send_Gallager_Humblet_Spira, &out_union_evaluation, &in_union_evaluation,
                    &response_to_connect, &response_to_initiate, &procedure_test, &procedure_report, &response_to_test,
                    &response_to_accept, &response_to_reject, &response_to_report, &procedure_change_root,
                    &response_to_change_root,
                    //Dynamic Gallager Humblet Spira
                    &start_dynamic_ghs, &send_Dynamic_Gallager_Humblet_Spira, &procedure_retransmit,
                    &out_evaluation_dghs, &in_evaluation_dghs, &response_to_end_ghs, &response_to_point_to_sink,
                    //Data_Collection
                    &start_data_collection, &out_evaluation_data_collection, &in_evaluation_data_collection,
                    &send_Data_Collection, &response_to_data_collection
                    );


PROCESS_THREAD(master_DGHS, ev, data)
{

    static struct etimer et;
    static uint8_t print_just_once, start_dghs_just_once, start_data_collection_just_once;

    PROCESS_BEGIN();

    e_initialize = process_alloc_event();
    e_execute    = process_alloc_event();

    process_post(&master_neighbor_discovery,e_initialize,NULL);

    print_just_once = 1;
    start_dghs_just_once = 1;
    start_data_collection_just_once = 1;

    while(1)
    {
        //Execute Periodically
        etimer_set(&et, CLOCK_SECOND * TIME_DGHS_PROCESS);
        PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));

        if((node.control_flags_neighbor_discovery & NEIGHBOR_DISCOVERY_HAS_ENDED) && (print_just_once))
        {
            print_just_once = 0;
            DGHS_DBG_2("NEIGHBOR_DISCOVERY_HAS_ENDED\n");
            process_post(&procedure_wakeup,e_execute,NULL);//We call this process only when NEIGHBOR_DISCOVERY_HAS_ENDED

        }else
        if((node.control_flags_neighbor_discovery & GHS_HAS_ENDED ) && (start_dghs_just_once))
        {
            start_dghs_just_once = 0;
            process_post(&start_dynamic_ghs,e_execute,NULL);//We call this process only when NEIGHBOR_DISCOVERY_HAS_ENDED

        }else
        if((node.control_flags_neighbor_discovery & DATA_COLLECTION ) && (start_data_collection_just_once))
        {
            start_data_collection_just_once = 0;
            process_post(&start_data_collection,e_execute,NULL);

        }
    }

    PROCESS_END();
}

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

void fill_wait_struct(struct s_wait *sw, uint8_t num_seconds, struct process *p)
{
    sw->num_seconds = num_seconds;
    sw->p           = p;
}

/////////////////////////////////////////////////////////////////////////////
///////////////////////PROCESSES/////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

PROCESS(master_DGHS, "master_DGHS");

AUTOSTART_PROCESSES(//example-DGHS
                    &master_DGHS,
                    //neighbor discovery
                    &master_neighbor_discovery, &broadcast_control, &runicast_control,
                    &send_neighbor_discovery, &wait_broadcast_control, &wait_runicast_control
                    );


PROCESS_THREAD(master_DGHS, ev, data)
{
    PROCESS_BEGIN();

    e_initialize = process_alloc_event();
    e_execute    = process_alloc_event();

    process_post(&master_neighbor_discovery,e_initialize,NULL);

    PROCESS_END();
}

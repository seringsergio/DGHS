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
#include "neighbor_discovery.h"

/////////////////////////////////////////////////////////////////////////////
///////////////////////FUNTIONS//////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

void fill_broadcast_msg(struct broadcast_message *msg, uint8_t seqno, uint8_t flags)
{
 msg->seqno = seqno;
 msg->flags = flags;
}

void fill_runicast_msg(struct runicast_message *msg, linkaddr_t addr, uint32_t avg_seqno_gap)
{
 msg->addr = addr;
 msg->avg_seqno_gap = avg_seqno_gap;
}

uint8_t not_every_neighbor_agrees(struct neighbor *neighbors_list_head)
{
    struct neighbor *n;
    uint8_t flag_temp = 0;

    flag_temp |= WEIGHT_HAS_BEEN_ASSIGNED;
    for(n = neighbors_list_head; n != NULL; n = list_item_next(n))
    {
        flag_temp &= n->flags;
    }

    if(flag_temp & WEIGHT_HAS_BEEN_ASSIGNED)
    {
        //For every neighbor the  WEIGHT_HAS_BEEN_ASSIGNED
        return 0;
    }else
    {
        return 1;
    }

}

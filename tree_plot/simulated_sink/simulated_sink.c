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
 *    documentation and*or other materials provided with the distribution.
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

/*
 * \file
 *         Testing the broadcast layer in Rime
 * \author
 *         Adam Dunkels <adam@sics.se>
 */

#include "contiki.h"
#include "net/rime/rime.h"
#include "random.h"

#include "dev/button-sensor.h"

#include "dev/leds.h"

#include <stdio.h>
//---------------------------------------------------------------------------//
PROCESS(print_msg, "print_msg");
AUTOSTART_PROCESSES(&print_msg);

//---------------------------------------------------------------------------//
PROCESS_THREAD(print_msg, ev, data)
{

  static struct etimer et;
  static uint8_t cont;

  PROCESS_BEGIN();

  cont = 0;
  printf("MSG/1/%d/10/10/1/27380/3293\n", cont);


  while(1)
  {

    //execute periodically
    etimer_set(&et, CLOCK_SECOND / 1);
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));


    //format nodeID | seqno | X | Y | parent | tempC | VDD
    if(cont % 6 == 0)
    {
      printf("MSG/2/%d/5/15/1/27380/3293\n", cont);
    }else if(cont % 6 == 1)
    {
      printf("MSG/3/%d/15/15/1/27380/3293\n", cont);
    }else if(cont % 6 == 2)
    {
      printf("MSG/4/%d/0/17/2/27380/3293\n", cont);

    }else if(cont % 6 == 3)
    {
      printf("MSG/5/%d/5/20/2/27380/3293\n", cont);
    }else if(cont % 6 == 4)
    {
      printf("MSG/6/%d/15/20/3/27380/3293\n", cont);
    }else if(cont % 6 == 5)
    {
      printf("MSG/7/%d/20/17/3/27380/3293\n", cont);
    }else
    {
      //printf("We are out of msgs\n");
    }

    cont++;

  }


  PROCESS_END();
}
//---------------------------------------------------------------------------//

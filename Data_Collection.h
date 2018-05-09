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


#ifndef DATA_COLLECTION_H
#define DATA_COLLECTION_H

#include "example-DGHS.h"

// Sensors
#include "dev/light-sensor.h"
#include "lib/sensors.h"
#include "dev/sht11/sht11-sensor.h"
#include <math.h>


/////////////////////////////////////////////////////////////////////////////
///////////////////////EVENTS////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

process_event_t e_send_data_collection;

/////////////////////////////////////////////////////////////////////////////
///////////////////////DEFINES///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////


//types of messages
#define DATA_COLLECTION_MSG     0x01

/////////////////////////////////////////////////////////////////////////////
///////////////////////STRUCTS///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

struct data_collection_msg {
  //int light1;
  int light2;
  int temperature;
  int humidity;
  linkaddr_t  to;
  linkaddr_t  from;
  linkaddr_t  source;
};

union types_msg_data_coll
{
   struct data_collection_msg data_coll_msg;
};


struct in_out_list_data_coll
{
  struct in_out_list_data_coll *next;
  uint8_t uniontype;
  union types_msg_data_coll type_msg;
};

/////////////////////////////////////////////////////////////////////////////
///////////////////////FUNCTIONS/////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

//void print_temperature(int val);
void print_temperature_wismote(int val);
//void print_humidity(int val);
void print_humidity_wismote(int val);
void print_light(int val);
void fill_data_collection(struct data_collection_msg *data_coll_msg ,int light2, int temperature, int humidity,
                          linkaddr_t *to, linkaddr_t *from, linkaddr_t *source);


#endif /* GALLAGER_HUMBLET_SPIRA_H */

//Git: wismote ok. Data collection for 1 data packet per node

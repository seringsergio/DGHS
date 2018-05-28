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

#include "Data_Collection.h"


/////////////////////////////////////////////////////////////////////////////
///////////////////////FUNCTIONS/////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

//based on https://github.com/anthonygelibert/WiSMote-Contiki/blob/develop/apps/OsamiUDP/OsamiUDP.c
// http://anrg.usc.edu/contiki/index.php/Sensor_acquisition
void print_humidity_wismote(int val)
{
  float s = 0;
  int   dec;
  float frac;

  if(val != -1)
  {
       s    = ( - 2.0468 + (0.0367 * val) - (0.0000015955 * val * val)  );
       dec  = s;
       frac = s - dec;
       DGHS_DBG_2("Humidity=%d.%02u %% (%d)\n", dec, (unsigned int)(frac * 100),val);
  }else
  {
    #if WISMOTE
      DGHS_DBG_1("Warning: We assume humidity for the Wismote \n");
      s    = ( - 2.0468 + (0.0367 * HUMIDITY_WISMOTE) - (0.0000015955 * HUMIDITY_WISMOTE * HUMIDITY_WISMOTE)  );
      dec  = s;
      frac = s - dec;
      DGHS_DBG_2("Humidity=%d.%02u %% (%d)\n", dec, (unsigned int)(frac * 100),HUMIDITY_WISMOTE);
    #else
       DGHS_DBG_1("ERROR: The humidity value is incorrect \n");
    #endif
  }

}

//based on https://github.com/anthonygelibert/WiSMote-Contiki/blob/develop/apps/OsamiUDP/OsamiUDP.c
// http://anrg.usc.edu/contiki/index.php/Sensor_acquisition
void print_temperature_wismote(int val)
{
   float s = 0;
   int   dec;
   float frac;

  if(val != -1)
  {
	    s    = ((0.01*val) - 39.7);
      dec  = s;
      frac = s - dec;
      DGHS_DBG_2("Temperature=%d.%02u C (%d)\n", dec, (unsigned int)(frac * 100),val);
  }else
  {
    #if WISMOTE
      DGHS_DBG_1("Warning: We assume temperature for the Wismote \n");
      s    = ((0.01*TEMPERATURE_WISMOTE) - 39.7);
      dec  = s;
      frac = s - dec;
      DGHS_DBG_2("Temperature=%d.%02u C (%d)\n", dec, (unsigned int)(frac * 100),TEMPERATURE_WISMOTE);
    #else
       DGHS_DBG_1("ERROR: The temperature value is incorrect \n");
    #endif

  }
}

void fill_data_collection(struct data_collection_msg *data_coll_msg , int temperature, int humidity,
                          linkaddr_t *to, linkaddr_t *from, linkaddr_t *source)
{
    data_coll_msg->temperature = temperature;
    data_coll_msg->humidity    = humidity;
    linkaddr_copy(&data_coll_msg->to,to);
    linkaddr_copy(&data_coll_msg->from,from);
    linkaddr_copy(&data_coll_msg->source,source);

}
//git

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

#ifndef BASIC_TREE_H
#define BASIC_TREE_H


////////////////////////////////////////////////////////////////////////
///////////////////INCLUDES/////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

#include "contiki.h"
#include "net/rime/rime.h"
#include <stdio.h>
//
#include "print_float.h"
#include "Bayes_Laplace_Classify.h"

//To set the Transmission Power
#include "net/netstack.h"
#include "sys/stimer.h" //Para el lifetime de la ruta
////////////////////////////////////////////////////////////////////////
///////////////////DEBUGUEAR////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Priority 2
#define DGHS_DEBUG_2 0
#if DGHS_DEBUG_2
#include <stdio.h>
#define DGHS_DBG_2(...) printf(__VA_ARGS__)
#else
#define DGHS_DBG_2(...)
#endif

////////////////////////////////////////////////////////////////////////
///////////////////DEFINE///////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////


//Tiempo de los BEACONS, DATOS, RUTAS
#define DOBLE                 2
#define FREQUENCY_BEACON      2
#define TOLERANCIA_BEACON     4  //Cuantos beacons antes de un paquete de datos
#define FREQUENCY_DATA_COL    FREQUENCY_BEACON * TOLERANCIA_BEACON //Envio un paquete por cada 4 beacons
#define TOLERANCIA_DATA_COL   2  //Cuantos datos antes de que una ruta expire
#define LIFETIME_ROUTE        (FREQUENCY_DATA_COL*DOBLE) * TOLERANCIA_DATA_COL //Maximo se envia un beacon cada (FREQUENCY_BEACON * 2). Espero el tiempo de 4 beacons: q se pierdan 4 beacons . La ruta que me da un vecino es valida por X segundos
///////////////////////////////////////////////////////////////////////////////////
#define MAX_NEIGHBORS         16
#define INITIAL_T_WEIGHT      100  //Asume that the interference is the worst case: 100%
#define INITIAL_T_INT         100.0f //Asume that the interference is the worst case: 100%
#define INFINITE_T_WEIGHT     9999.9F /* max value of a float */
#define QUEUE_SIZE_T_BEACONS  MAX_NEIGHBORS * 3

//types of messages
#define T_BEACON     0x01
#define T_DATA       0x02

//#define TIME_INTERVAL_T_BEACON           CLOCK_SECOND * 1
#define TIME_UNION_IN_OUT                0.25f  // tengo que sacar los msg en menos tiempo de lo q entran (TIME_INTERVAL_T_BEACON) - repetido con la implementacion completa
#define TIME_PREVIOUS_MSG_IN_OUT_UNION   0.25f //  tengo que sacar los msg en menos tiempo de lo q entran (TIME_INTERVAL_T_BEACON)  - repetido con la implementacion completa

#define NUM_NODES 10
//FLAGS t_node.flags
//#define DATA_EST_INT_READY     0x01

//PLATFORM
#define REMOTE 1 // We are using the REMOTE PLATFORM

// Set Transmission Power in the Zolertia
// NETSTACK_RADIO.set_value(RADIO_PARAM_TXPOWER,<power in dbm>)
// Ref: https://github.com/contiki-os/contiki/issues/1259

//Transmission Power for the Zolertia
//REF: https://zolertia.io/docs/IoT_in_five_days-v1.0.pdf
//     Table 4.1. CC2538 Transmission power recommended values
/*#define PLUS7_DBM     0xFF
#define PLUS5_DBM     0xED
#define PLUS3_DBM     0xD5
#define PLUS1_DBM     0xC5
#define ZERO_DBM      0xB6
#define MINUS1_DBM    0xB0
#define MINUS3_DBM    0xA1
#define MINUS5_DBM    0x91
#define MINUS7_DBM    0x88
#define MINUS9_DBM    0x72
#define MINUS11_DBM   0x62
#define MINUS13_DBM   0x58
#define MINUS15_DBM   0x42
#define MINUS24_DBM   0x00*/

////////////////////////////////////////////////////////////////////////
///////////////////GLOBALS//////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

extern struct t_node t_node;
extern struct csma_stats csma_stats;


/////////////////////////////////////////////////////////////////////////////
///////////////////////EVENTS////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 process_event_t e_send_t_beacon;
 process_event_t e_send_t_data;
 process_event_t e_execute;
////////////////////////////////////////////////////////////////////////
///////////////////STRUCT///////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

struct t_data
{
   //seqno | X | Y | parent
   int seqno;
   uint8_t x;
   uint8_t y;
   float est_int; //Estimated interference
   linkaddr_t from;
   linkaddr_t to;
   linkaddr_t parent_plot;
   //uint8_t est_int; //Estimated interference
   //uint8_t variableX; //Estimated interference
};

struct t_beacon
{
   float weight;
   linkaddr_t from;
};

union types_msg_tree
{
  struct t_beacon t_beacon;
  struct t_data t_data;
};

struct in_out_list_tree
{
  struct in_out_list_tree *next;
  uint8_t uniontype;
  union types_msg_tree type_msg;
};

struct t_node
{
   float weight;
   linkaddr_t parent;
   float est_int; //Estimated interference
   uint8_t flags;
};

struct t_neighbor
{
  struct t_neighbor *next;
  linkaddr_t neigh;
  float weight;
  struct stimer lifetime; //Colocarle un tiempo de caducidad al vecino. Si no llega despues de cierto tiempo, se elimina la ruta
};



////////////////////////////////////////////////////////////////////////
///////////////////FUNCTION/////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

void initialize_tree();
void fill_beacon(struct t_beacon *t_beacon, float weight, linkaddr_t *from);
void fill_data(struct t_data *t_data, int seqno, uint8_t x, uint8_t y,
               float est_int,
               linkaddr_t *from, linkaddr_t *to, linkaddr_t *parent_plot);
uint8_t I_am_the_sink();
void reset_csma_stats();


#endif /* BASIC_TREE_H */

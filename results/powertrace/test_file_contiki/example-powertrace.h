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
#ifndef EXAMPLE_POWERTRACE_H
#define EXAMPLE_POWERTRACE_H

/////////////////////////////////////////////////////////////////////////////
///////////////////////DEFINE///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

#define POWERTRACE_PERIOD 10 //Number of seconds between executions of the powertrace measurements
#define REMOTE            1 // Indico que estoy usando el remote

// Set Transmission Power in the Zolertia
// NETSTACK_RADIO.set_value(RADIO_PARAM_TXPOWER,<power in dbm>)
// Ref: https://github.com/contiki-os/contiki/issues/1259
#define MY_TX_POWER_DBM  0 //This number is in dBm e.g., "0" "7"  "-24"

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
/////////////////////////////////////////////////////////////////////////////
///////////////////////STRUCTS///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

//Stores the stats comming from csma.c
struct csma_stats
{
 uint16_t packets_dropped; //We can count up to 65535 message lost
 uint16_t delay;
};



#endif /* EXAMPLE_POWERTRACE_H */

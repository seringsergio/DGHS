/*
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

#include "contiki.h"
#include "lib/random.h"
#include "sys/ctimer.h"
#include "net/ip/uip.h"
#include "net/ipv6/uip-ds6.h"
#include "net/ip/uip-udp-packet.h"
#include "sys/ctimer.h"
#ifdef WITH_COMPOWER
#include "powertrace.h"
#endif
#include <stdio.h>
#include <string.h>

#include "dev/serial-line.h"
#include "net/ipv6/uip-ds6-route.h"

#include "client_server.h"
//#include "powertrace.h"

#define UDP_CLIENT_PORT 8765
#define UDP_SERVER_PORT 5678

#define UDP_EXAMPLE_ID  190

#define DEBUG DEBUG_FULL
#include "net/ip/uip-debug.h"

#ifndef PERIOD
//#define PERIOD 60
#define PERIOD 2
#endif

#define START_INTERVAL		(15 * CLOCK_SECOND)
#define SEND_INTERVAL		(PERIOD * CLOCK_SECOND)
#define SEND_TIME		(random_rand() % (SEND_INTERVAL))
//#define SEND_TIME		    SEND_INTERVAL
#define MAX_PAYLOAD_LEN		30

static struct uip_udp_conn *client_conn;
static uip_ipaddr_t server_ipaddr;

/*---------------------------------------------------------------------------*/
PROCESS(udp_client_process, "UDP client process");
AUTOSTART_PROCESSES(&udp_client_process);
/*---------------------------------------------------------------------------*/
static int seq_id;
static int reply;

static void
tcpip_handler(void)
{
  char *str;

  if(uip_newdata()) {
    str = uip_appdata;
    str[uip_datalen()] = '\0';
    reply++;
    printf("DATA recv '%s' (s:%d, r:%d)\n", str, seq_id, reply);
  }
}

/****************************************************************************/

//Dado que las direcciones de los nodos estan en el rango de 00-FF en hexadecimal para dibujar el
//arbol con python necesito el nodeID que va de 1-9.
//Entonces en esta funcion convierto de las direcciones hexadecimales a los nodeID correspondientes.
uint8_t find_my_nodeID(uint8_t addr)
{//linkaddr_node_addr.u8[7]

  //El nodo numero 1 tiene direccion en hexadecimal 0x49
  if(addr == 0x49)
  {
    return 1;
  }else
  //El nodo numero 2 tiene direccion en hexadecimal 0x80
  if(addr == 0x80)
  {
      return 2;
  }else
  //El nodo numero 3 tiene direccion en hexadecimal 0x19
  if(addr == 0x19)
  {
      return 3;
  }else
  //El nodo numero 4 tiene direccion en hexadecimal 0x4F
  if(addr == 0x4F)
  {
      return 4;
  }else
  //El nodo numero 5 tiene direccion en hexadecimal 0x05
  if(addr == 0x05)
  {
      return 5;
  }else
  //El nodo numero 6 tiene direccion en hexadecimal 0xe3
  if(addr == 0xe3)
  {
      return 6;
  }else
  //El nodo numero 7 tiene direccion en hexadecimal 0x50
  if(addr == 0x50)
  {
      return 7;
  }else
  //El nodo numero 8 tiene direccion en hexadecimal 0x70
  if(addr == 0x70)
  {
      return 8;
  }else
  //El nodo numero 9 tiene direccion en hexadecimal 0x3f
  if(addr == 0x3f)
  {
      return 9;
  }else
  {
    printf("Warning: La direccion rime(linkaddr_node_addr.u8[7] no corresponde a ningun NodeID. No tengo padre aun?\n");
    return 99;
  }

}
/*---------------------------------------------------------------------------*/
static void
send_packet(void *ptr)
{
  char buf[MAX_PAYLOAD_LEN];
  uip_ds6_defrt_t *defrt;
  uip_ipaddr_t *ipaddr;

#ifdef SERVER_REPLY
  uint8_t num_used = 0;
  uip_ds6_nbr_t *nbr;

  nbr = nbr_table_head(ds6_neighbors);
  while(nbr != NULL) {
    nbr = nbr_table_next(ds6_neighbors, nbr);
    num_used++;
  }

  if(seq_id > 0) {
    ANNOTATE("#A r=%d/%d,color=%s,n=%d %d\n", reply, seq_id,
             reply == seq_id ? "GREEN" : "RED", uip_ds6_route_num_routes(), num_used);
  }
#endif /* SERVER_REPLY */

  seq_id++;
  /*printf("DATA send to %d 'Hello %d'\n",
         server_ipaddr.u8[sizeof(server_ipaddr.u8) - 1], seq_id);*/

  //////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////KNOW NEXT HOP ////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////

  defrt = NULL;
  if((ipaddr = uip_ds6_defrt_choose()) != NULL) {
    defrt = uip_ds6_defrt_lookup(ipaddr); //Lookup default router for address.
  }
  if(defrt != NULL) {
    printf("DefRT: :: -> %02x", defrt->ipaddr.u8[15]);
    printf(" lt:%lu inf:%d\n", stimer_remaining(&defrt->lifetime),
           defrt->isinfinite);
  } else {
    printf("DefRT: :: -> NULL\n");
  }

  //format TREE_PLOT nodeID seqno x y parent_plot estimated_interference/seq_id
  printf("DATA send to %d 'TREE_PLOT/%d/%d/%d/%d/%d/%d/'\n",
        server_ipaddr.u8[sizeof(server_ipaddr.u8) - 1], MY_NODEID,seq_id,MY_X_POS,MY_Y_POS,
                                                        find_my_nodeID(defrt->ipaddr.u8[15]),seq_id);

  printf("RIME addrs = %02x.%02x.%02x.%02x.%02x.%02x.%02x.%02x\n",
  linkaddr_node_addr.u8[0], linkaddr_node_addr.u8[1],
  linkaddr_node_addr.u8[2], linkaddr_node_addr.u8[3],
  linkaddr_node_addr.u8[4], linkaddr_node_addr.u8[5],
  linkaddr_node_addr.u8[6], linkaddr_node_addr.u8[7] );


  /*printf("TREE_PLOT/%d/%d/%d/%d/%d/%s/\n",t_data.from.u8[0], t_data.seqno, t_data.x, t_data.y,
                                          t_data.parent_plot.u8[0]
                                          , res1
                                        );*/

  //format TREE_PLOT nodeID seqno x y parent_plot estimated_interference/seq_id
  //sprintf(buf, "Hello %d from the client", seq_id);
  sprintf(buf, "TREE_PLOT/%d/%d/%d/%d/%d/%d/",MY_NODEID,seq_id,MY_X_POS,MY_Y_POS,
                                                 find_my_nodeID(defrt->ipaddr.u8[15]),seq_id);
  uip_udp_packet_sendto(client_conn, buf, strlen(buf),
                        &server_ipaddr, UIP_HTONS(UDP_SERVER_PORT));

  printf("Latency-PRR/%d/%d/\n",seq_id, find_my_nodeID(linkaddr_node_addr.u8[7])  );

}
/*---------------------------------------------------------------------------*/
static void
print_local_addresses(void)
{
  int i;
  uint8_t state;

  printf("Client IPv6 addresses: ");
  for(i = 0; i < UIP_DS6_ADDR_NB; i++) {
    state = uip_ds6_if.addr_list[i].state;
    if(uip_ds6_if.addr_list[i].isused &&
       (state == ADDR_TENTATIVE || state == ADDR_PREFERRED)) {
      PRINT6ADDR(&uip_ds6_if.addr_list[i].ipaddr);
      printf("\n");
      /* hack to make address "final" */
      if (state == ADDR_TENTATIVE) {
	uip_ds6_if.addr_list[i].state = ADDR_PREFERRED;
      }
    }
  }
}
/*---------------------------------------------------------------------------*/
static void
set_global_address(void)
{
  uip_ipaddr_t ipaddr;

  uip_ip6addr(&ipaddr, UIP_DS6_DEFAULT_PREFIX, 0, 0, 0, 0, 0, 0, 0);
  uip_ds6_set_addr_iid(&ipaddr, &uip_lladdr);
  uip_ds6_addr_add(&ipaddr, 0, ADDR_AUTOCONF);

/* The choice of server address determines its 6LoWPAN header compression.
 * (Our address will be compressed Mode 3 since it is derived from our
 * link-local address)
 * Obviously the choice made here must also be selected in udp-server.c.
 *
 * For correct Wireshark decoding using a sniffer, add the /64 prefix to the
 * 6LowPAN protocol preferences,
 * e.g. set Context 0 to fd00::. At present Wireshark copies Context/128 and
 * then overwrites it.
 * (Setting Context 0 to fd00::1111:2222:3333:4444 will report a 16 bit
 * compressed address of fd00::1111:22ff:fe33:xxxx)
 *
 * Note the IPCMV6 checksum verification depends on the correct uncompressed
 * addresses.
 */

#if 0
/* Mode 1 - 64 bits inline */
   uip_ip6addr(&server_ipaddr, UIP_DS6_DEFAULT_PREFIX, 0, 0, 0, 0, 0, 0, 1);
#elif 1
/* Mode 2 - 16 bits inline */
  uip_ip6addr(&server_ipaddr, UIP_DS6_DEFAULT_PREFIX, 0, 0, 0, 0, 0x00ff, 0xfe00, 1);
#else
/* Mode 3 - derived from server link-local (MAC) address */
  uip_ip6addr(&server_ipaddr, UIP_DS6_DEFAULT_PREFIX, 0, 0, 0, 0x0250, 0xc2ff, 0xfea8, 0xcd1a); //redbee-econotag
#endif
}
/*---------------------------------------------------------------------------*/
PROCESS_THREAD(udp_client_process, ev, data)
{
  static struct etimer periodic;
  static struct ctimer backoff_timer;
#if WITH_COMPOWER
  static int print = 0;
#endif

  static radio_value_t val;
  PROCESS_BEGIN();

  // Set Transmission Power in the Zolertia
  // NETSTACK_RADIO.set_value(RADIO_PARAM_TXPOWER,<power in dbm>)
  // Ref: https://github.com/contiki-os/contiki/issues/1259
  #if REMOTE
    if(NETSTACK_RADIO.set_value(RADIO_PARAM_TXPOWER, MY_TX_POWER_DBM) == RADIO_RESULT_OK)
    {
      NETSTACK_RADIO.get_value(RADIO_PARAM_TXPOWER, &val);
      printf("Transmission Power Set : %d dBm\n", val);
    }
    else if(NETSTACK_RADIO.set_value(RADIO_PARAM_TXPOWER, MY_TX_POWER_DBM) == RADIO_RESULT_INVALID_VALUE)
    {
      printf("ERROR: RADIO_RESULT_INVALID_VALUE\n");
    }else
    {
      printf("ERROR: The TX power could not be set\n");
    }
  #endif

  //NETSTACK_RADIO.get_value(RADIO_PARAM_TXPOWER, &val);
  //printf(" Transmission Power Set : %d dBm \n", val);

  printf("RTIMER_SECOND: %u\n", RTIMER_SECOND);

  PROCESS_PAUSE();

  set_global_address();

  printf("UDP client process started nbr:%d routes:%d\n",
         NBR_TABLE_CONF_MAX_NEIGHBORS, UIP_CONF_MAX_ROUTES);

  print_local_addresses();

  /* new connection with remote host */
  client_conn = udp_new(NULL, UIP_HTONS(UDP_SERVER_PORT), NULL);
  if(client_conn == NULL) {
    printf("No UDP connection available, exiting the process!\n");
    PROCESS_EXIT();
  }
  udp_bind(client_conn, UIP_HTONS(UDP_CLIENT_PORT));

  printf("Created a connection with the server ");
  PRINT6ADDR(&client_conn->ripaddr);
  printf(" local/remote port %u/%u\n",
	UIP_HTONS(client_conn->lport), UIP_HTONS(client_conn->rport));

#if WITH_COMPOWER
  powertrace_sniff(POWERTRACE_ON);
#endif

  etimer_set(&periodic, SEND_INTERVAL);
  while(1) {
    PROCESS_YIELD();
    if(ev == tcpip_event) {
      tcpip_handler();
    }

    if(ev == serial_line_event_message && data != NULL) {
      char *str;
      str = data;
      if(str[0] == 'r') {
        uip_ds6_route_t *r;
        uip_ipaddr_t *nexthop;
        uip_ds6_defrt_t *defrt;
        uip_ipaddr_t *ipaddr;
        defrt = NULL;
        if((ipaddr = uip_ds6_defrt_choose()) != NULL) {
          defrt = uip_ds6_defrt_lookup(ipaddr); //Lookup default router for address.
        }
        if(defrt != NULL) {
          printf("DefRT: :: -> %02d", defrt->ipaddr.u8[15]);
          printf(" lt:%lu inf:%d\n", stimer_remaining(&defrt->lifetime),
                 defrt->isinfinite);
        } else {
          printf("DefRT: :: -> NULL\n");
        }

        for(r = uip_ds6_route_head();
            r != NULL;
            r = uip_ds6_route_next(r)) {
          nexthop = uip_ds6_route_nexthop(r);
          printf("Route: %02d -> %02d", r->ipaddr.u8[15], nexthop->u8[15]);
          /* PRINT6ADDR(&r->ipaddr); */
          /* printf(" -> "); */
          /* PRINT6ADDR(nexthop); */
          printf(" lt:%lu\n", r->state.lifetime);

        }
      }
    }

    if(etimer_expired(&periodic)) {
      etimer_reset(&periodic);
      ctimer_set(&backoff_timer, SEND_TIME, send_packet, NULL);

#if WITH_COMPOWER
      if (print == 0) {
	powertrace_print("#P");
      }
      if (++print == 3) {
	print = 0;
      }
#endif

    }
  }

  PROCESS_END();
}
/*---------------------------------------------------------------------------*/

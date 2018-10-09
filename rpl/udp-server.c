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
#include "contiki-lib.h"
#include "contiki-net.h"
#include "net/ip/uip.h"
#include "net/rpl/rpl.h"

#include "net/netstack.h"
#include "dev/button-sensor.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define DEBUG DEBUG_PRINT
#include "net/ip/uip-debug.h"

#include "client_server.h"

#define UIP_IP_BUF   ((struct uip_ip_hdr *)&uip_buf[UIP_LLH_LEN])

#define UDP_CLIENT_PORT	8765
#define UDP_SERVER_PORT	5678

#define UDP_EXAMPLE_ID  190

static struct uip_udp_conn *server_conn;


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

PROCESS(udp_server_process, "UDP server process");
AUTOSTART_PROCESSES(&udp_server_process);
/*---------------------------------------------------------------------------*/
static void
tcpip_handler(void)
{
  char *appdata;
  uint16_t i;
  uint16_t count_spaces = 0;

  if(uip_newdata()) {
    appdata = (char *)uip_appdata;
    appdata[uip_datalen()] = 0;
    printf("DATA recv '%s' from ", appdata);
    //printf("%d",
      printf("%02x",
           UIP_IP_BUF->srcipaddr.u8[sizeof(UIP_IP_BUF->srcipaddr.u8) - 1]);
    printf("\n");

    /////////////////////////////////////////////////////////////////////////////////
    ///////////////////////  TREE-PLOT  /////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////
    printf("%s\n",appdata); // La info del paquete recibido TREE_PLOT/

    //format TREE_PLOT nodeID seqno x y parent_plot estimated_interference
    printf("TREE_PLOT/%d/%d/%d/%d/%d/%d/\n",MY_NODEID, 0 , MY_X_POS, MY_Y_POS, MY_NODEID, 0 ); // La info del mismo sink
    ////////////////////////////////////////////////////////////////////////////////
    ///////////////////////  Latency-PRR  //////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    printf("Latency-PRR/");
    for (i = 0; appdata[i] ; i++) // '\0' es igual a NULL
    {
      if(appdata[i] == '/')
      {
        count_spaces = count_spaces + 1;
      }
      if(count_spaces == 2 && appdata[i] != '/' )
      {
        printf("%c",appdata[i] );
        //printf("%c", *appdata );
      }
    }
    printf("/%d/\n", find_my_nodeID(UIP_IP_BUF->srcipaddr.u8[sizeof(UIP_IP_BUF->srcipaddr.u8) - 1]) );

#if SERVER_REPLY
    printf("DATA sending reply\n");
    uip_ipaddr_copy(&server_conn->ripaddr, &UIP_IP_BUF->srcipaddr);
    uip_udp_packet_send(server_conn, "Reply", sizeof("Reply"));
    uip_create_unspecified(&server_conn->ripaddr);
#endif
  }
}
/*---------------------------------------------------------------------------*/
static void
print_local_addresses(void)
{
  int i;
  uint8_t state;

  printf("Server IPv6 addresses: ");
  for(i = 0; i < UIP_DS6_ADDR_NB; i++) {
    state = uip_ds6_if.addr_list[i].state;
    if(state == ADDR_TENTATIVE || state == ADDR_PREFERRED) {
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
PROCESS_THREAD(udp_server_process, ev, data)
{
  uip_ipaddr_t ipaddr;
  struct uip_ds6_addr *root_if;
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

  SENSORS_ACTIVATE(button_sensor);

  printf("UDP server started. nbr:%d routes:%d\n",
         NBR_TABLE_CONF_MAX_NEIGHBORS, UIP_CONF_MAX_ROUTES);

#if UIP_CONF_ROUTER
/* The choice of server address determines its 6LoWPAN header compression.
 * Obviously the choice made here must also be selected in udp-client.c.
 *
 * For correct Wireshark decoding using a sniffer, add the /64 prefix to the
 * 6LowPAN protocol preferences,
 * e.g. set Context 0 to fd00::. At present Wireshark copies Context/128 and
 * then overwrites it.
 * (Setting Context 0 to fd00::1111:2222:3333:4444 will report a 16 bit
 * compressed address of fd00::1111:22ff:fe33:xxxx)
 * Note Wireshark's IPCMV6 checksum verification depends on the correct
 * uncompressed addresses.
 */

#if 0
/* Mode 1 - 64 bits inline */
   uip_ip6addr(&ipaddr, UIP_DS6_DEFAULT_PREFIX, 0, 0, 0, 0, 0, 0, 1);
#elif 1
/* Mode 2 - 16 bits inline */
  uip_ip6addr(&ipaddr, UIP_DS6_DEFAULT_PREFIX, 0, 0, 0, 0, 0x00ff, 0xfe00, 1);
#else
/* Mode 3 - derived from link local (MAC) address */
  uip_ip6addr(&ipaddr, UIP_DS6_DEFAULT_PREFIX, 0, 0, 0, 0, 0, 0, 0);
  uip_ds6_set_addr_iid(&ipaddr, &uip_lladdr);
#endif

  uip_ds6_addr_add(&ipaddr, 0, ADDR_MANUAL);
  root_if = uip_ds6_addr_lookup(&ipaddr);
  if(root_if != NULL) {
    rpl_dag_t *dag;
    dag = rpl_set_root(RPL_DEFAULT_INSTANCE,(uip_ip6addr_t *)&ipaddr);
    uip_ip6addr(&ipaddr, UIP_DS6_DEFAULT_PREFIX, 0, 0, 0, 0, 0, 0, 0);
    rpl_set_prefix(dag, &ipaddr, 64);
    printf("created a new RPL dag\n");
  } else {
    printf("failed to create a new RPL DAG\n");
  }
#endif /* UIP_CONF_ROUTER */

  print_local_addresses();

  /* The data sink runs with a 100% duty cycle in order to ensure high
     packet reception rates. */
  NETSTACK_MAC.off(1);
  printf("The sink runs with a 100 percent duty cycle\n");

  server_conn = udp_new(NULL, UIP_HTONS(UDP_CLIENT_PORT), NULL);
  if(server_conn == NULL) {
    printf("No UDP connection available, exiting the process!\n");
    PROCESS_EXIT();
  }
  udp_bind(server_conn, UIP_HTONS(UDP_SERVER_PORT));

  printf("Created a server connection with remote address ");
  PRINT6ADDR(&server_conn->ripaddr);
  printf(" local/remote port %u/%u\n", UIP_HTONS(server_conn->lport),
         UIP_HTONS(server_conn->rport));

  while(1) {
    PROCESS_YIELD();
    if(ev == tcpip_event) {
      tcpip_handler();
    } else if (ev == sensors_event && data == &button_sensor) {
      printf("Initiaing global repair\n");
      rpl_repair_root(RPL_DEFAULT_INSTANCE);
    }
  }

  PROCESS_END();
}
/*---------------------------------------------------------------------------*/

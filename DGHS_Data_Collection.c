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

LIST(history_table_4);
MEMB(history_mem_4, struct history_entry, NUM_HISTORY_ENTRIES);

LIST(out_union_list);
MEMB(out_union_mem, struct in_out_list_data_coll, QUEUE_SIZE_GHS);

LIST(in_union_list);
MEMB(in_union_mem, struct in_out_list_data_coll, QUEUE_SIZE_GHS);

// Reliable unicast that receives the GHS messages: Connect, initiate, test, accept, reject, report, change_root
static void recv_runicast(struct runicast_conn *c, const linkaddr_t *from, uint8_t seqno)
{
  static packetbuf_attr_t msg_type;
  static struct in_out_list_data_coll *in_l;

  void *msg = packetbuf_dataptr();

  /* OPTIONAL: Sender history */
  struct history_entry *e = NULL;
  for(e = list_head(history_table_4); e != NULL; e = e->next) {
    if(linkaddr_cmp(&e->addr, from)) {
      break;
    }
  }
  if(e == NULL) {
    /* Create new history entry */
    e = memb_alloc(&history_mem_4);
    if(e == NULL) {
      e = list_chop(history_table_4); /* Remove oldest at full history */
    }
    linkaddr_copy(&e->addr, from);
    e->seq = seqno;
    list_push(history_table_4, e);
  } else {
    /* Detect duplicate callback */
    if(e->seq == seqno) {
      DGHS_DBG_2("runicast message received from %d.%d, seqno %d (DUPLICATE)\n",
	     from->u8[0], from->u8[1], seqno);
      return;
    }
    /* Update existing history entry */
    e->seq = seqno;
  }

  msg_type = packetbuf_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG);

  //Adds the message to the list in_union_list according the type of message
  if(msg_type == DATA_COLLECTION_MSG)
  {

    //ADD to the list
    in_l = memb_alloc(&in_union_mem);
    if(in_l == NULL) {            // If we could not allocate a new entry, we give up.
      DGHS_DBG_1("ERROR: we could not allocate a new entry for <<in_union_list>> (data_collection)\n");
    }else
    {
        in_l->type_msg.data_coll_msg = *((struct data_collection_msg*) msg);
        in_l->uniontype              = DATA_COLLECTION_MSG;
        list_push(in_union_list,in_l); // Add an item to the start of the list.
        DGHS_DBG_2("runicast message received DATA_COLLECTION_MSG from %d.%d \n",
        in_l->type_msg.data_coll_msg.from.u8[0], in_l->type_msg.data_coll_msg.from.u8[1] );
    }

  }else
  {
    DGHS_DBG_1("ERROR: The type of the message ( msg_type ) is unkown in dghs \n");
  }

  //process_post_synch(&in_union_evaluation, e_execute, NULL);


}

static void sent_runicast(struct runicast_conn *c, const linkaddr_t *to, uint8_t retransmissions)
{
  DGHS_DBG_2("runicast (data_collection) message sent to %d.%d, retransmissions %d\n",
	 to->u8[0], to->u8[1], retransmissions);
}
static void timedout_runicast(struct runicast_conn *c, const linkaddr_t *to, uint8_t retransmissions)
{
  DGHS_DBG_1("ERROR: runicast message timed out (data_collection) when sending to %d.%d, retransmissions %d\n",
	 to->u8[0], to->u8[1], retransmissions);
}
static const struct runicast_callbacks runicast_callbacks = {recv_runicast,
							                                               sent_runicast,
							                                               timedout_runicast};
static struct runicast_conn runicast_4;

PROCESS(start_data_collection,"start_data_collection");
PROCESS(out_evaluation_data_collection, "out_evaluation_data_collection");
PROCESS(in_evaluation_data_collection, "in_evaluation_data_collection");
PROCESS(send_Data_Collection,"send_Data_Collection");
PROCESS(response_to_data_collection,"response_to_data_collection");

PROCESS_THREAD(start_data_collection, ev, data) //It can not have PROCESS_WAIT_EVENT_UNTIL()
{

  static struct data_collection_msg data_coll_msg;
  static struct in_out_list_data_coll *out_l;

  PROCESS_BEGIN();

  e_send_data_collection = process_alloc_event();

  /* OPTIONAL: Sender history */
  list_init(history_table_4);
  memb_init(&history_mem_4);

  list_init(out_union_list);
  memb_init(&out_union_mem);

  list_init(in_union_list);
  memb_init(&in_union_mem);

  while(1)
  {
    PROCESS_YIELD();
    if(ev == e_execute)
    {
      DGHS_DBG_2("#A color=#008000\n");


      if(I_am_the_sink())
      {

      }else
      {


        //SENSORS_ACTIVATE(light_sensor);
        SENSORS_ACTIVATE(sht11_sensor);

        //ADD to the list a runicast message POINT_TO_SINK_MSG
        fill_data_collection(&data_coll_msg, 0,
                             sht11_sensor.value(SHT11_SENSOR_TEMP), sht11_sensor.value(SHT11_SENSOR_HUMIDITY),
                             &node.in_branch, &linkaddr_node_addr, &linkaddr_node_addr);

           //print_light(data_coll_msg.light2);
           print_temperature_wismote(data_coll_msg.temperature);
           print_humidity_wismote(data_coll_msg.humidity);
        //ADD to the list a runicast message END_GHS
        out_l = memb_alloc(&out_union_mem);
        if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
          DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>> in DGHS\n");
        }else
        {
            out_l->type_msg.data_coll_msg  = data_coll_msg;
            out_l->uniontype               = DATA_COLLECTION_MSG;
            list_push(out_union_list,out_l); // Add an item to the start of the list.
        }

        //SENSORS_DEACTIVATE(light_sensor);
        SENSORS_DEACTIVATE(sht11_sensor);

      }

    }
  }

  PROCESS_END();

}

PROCESS_THREAD(response_to_data_collection, ev, data) //It can not have PROCESS_WAIT_EVENT_UNTIL()
{


  static struct in_out_list_data_coll *out_l;

  static struct data_collection_msg data_coll_msg, data_coll_msg_temp;
  static float s_temperature = 0;
  static int dec_temperature;
  static float frac_temperature;

  static float s_light = 0;
  static int dec_light;
  static float frac_light;

  static float s_humidity = 0;
  static int dec_humidity;
  static float frac_humidity;

  PROCESS_BEGIN();


  while(1)
  {
    PROCESS_YIELD();
    if(ev == e_execute)
    {
      data_coll_msg = *( (struct data_collection_msg *) data);

      if(I_am_the_sink())
      {
        //sink prints DATA_COLLECTION results

        //temperature
        if(data_coll_msg.temperature != -1)
        {
      	    s_temperature    = ((0.01*data_coll_msg.temperature) - 39.60);
            dec_temperature  = s_temperature;
            frac_temperature = s_temperature - dec_temperature;
            //printf("Temperature=%d.%02u C (%d)\n", dec_temperature, (unsigned int)(frac_temperature * 100),data_coll_msg.temperature);
        }else
        {
          DGHS_DBG_1("ERROR: The temperature value is incorrect \n");
        }

        //Light
        if(data_coll_msg.light2 != -1)
        {
           s_light    = (float)(data_coll_msg.light2 * 0.4071);
           dec_light  = s_light;
           frac_light = s_light - dec_light;
           //printf("Light=%d.%02u lux (%d)\n", dec_light, (unsigned int)(frac_light * 100),data_coll_msg.light2);
        }else
        {
          DGHS_DBG_1("ERROR: The light value is incorrect \n");
        }

        //humidity
        if(data_coll_msg.humidity != -1)
        {
             s_humidity    = (((0.0405*data_coll_msg.humidity) - 4) + ((-2.8 * 0.000001)*(pow(data_coll_msg.humidity,2))));
             dec_humidity  = s_humidity;
             frac_humidity = s_humidity - dec_humidity;
             //printf("Humidity=%d.%02u %% (%d)\n", dec_humidity, (unsigned int)(frac_humidity * 100),data_coll_msg.humidity);
        }else
        {
          DGHS_DBG_1("ERROR: The humidity value is incorrect \n");
        }
        //format:
        //DATA_COLLECTION source temperature light humidity
        DGHS_DBG_1("DATA_COLLECTION %d %d.%02u %d.%02u %d.%02u\n", data_coll_msg.source.u8[0],
                                                            dec_temperature, (unsigned int)(frac_temperature * 100),
                                                            dec_light, (unsigned int)(frac_light * 100),
                                                            dec_humidity, (unsigned int)(frac_humidity * 100)  );
      }else
      {
        //Node re-tx the data_collection_msg

        //ADD to the list a runicast message POINT_TO_SINK_MSG
        fill_data_collection(&data_coll_msg_temp, data_coll_msg.light2,
                             data_coll_msg.temperature, data_coll_msg.humidity,
                             &node.in_branch, &linkaddr_node_addr, &data_coll_msg.source);

           //print_light(data_coll_msg.light2);
           //print_temperature(data_coll_msg.temperature);
           //print_humidity(data_coll_msg.humidity);
        //ADD to the list a runicast message END_GHS
        out_l = memb_alloc(&out_union_mem);
        if(out_l == NULL) {            // If we could not allocate a new entry, we give up.
          DGHS_DBG_1("ERROR: we could not allocate a new entry for <<out_union_list>> in DGHS\n");
        }else
        {
            out_l->type_msg.data_coll_msg  = data_coll_msg_temp;
            out_l->uniontype               = DATA_COLLECTION_MSG;
            list_push(out_union_list,out_l); // Add an item to the start of the list.
        }

      }


    }
  }

  PROCESS_END();

}

PROCESS_THREAD(out_evaluation_data_collection, ev, data) //It can not have PROCESS_WAIT_EVENT_UNTIL()
{
  static struct etimer et1, et2;
  static struct in_out_list_data_coll *out_l;

  PROCESS_BEGIN();

  while(1)
  {
    //REMOVE from the list
    //execute periodically
    etimer_set(&et1, CLOCK_SECOND * TIME_UNION_IN_OUT);
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et1));

        //We start to analize outgoing messages when the GHS_HAS_ENDED
        //if(node.control_flags_neighbor_discovery & GHS_HAS_ENDED)
        //{
          while(list_length(out_union_list))
          {
              //DGHS_DBG_2("while(list_length(out_union_list))\n");
              //Give enough time to transmit the previous msg
              etimer_set(&et2, CLOCK_SECOND * TIME_PREVIOUS_MSG_IN_OUT_UNION);
              PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et2));

              if(!runicast_is_transmitting(&runicast_4))
              {
                  //remove from list
                  out_l = list_chop(out_union_list); // Remove the last object on the list.
                  if(out_l->uniontype == DATA_COLLECTION_MSG)
                  {
                    process_post(&send_Data_Collection, e_send_data_collection, &out_l->type_msg.data_coll_msg);
                  }else
                  {
                      DGHS_DBG_1("ERROR: The type of msg in out_union_list is unkown (data_collection) \n");
                  }
                  memb_free(&out_union_mem,out_l);
              }else
              {
                  //DGHS_DBG_2("WARNING: break from runicast_control\n"); //"Enough" time is not enough!!
                  break;
              }
          } //END while list_length()
        //}
  } //while (1)

  PROCESS_END();
}

PROCESS_THREAD(in_evaluation_data_collection, ev, data) //It can not have PROCESS_WAIT_EVENT_UNTIL()
{
  static struct etimer et1, et2;
  static struct in_out_list_data_coll *in_l;
  PROCESS_BEGIN();

  while(1)
  {
    //REMOVE from the list
    //execute periodically
    etimer_set(&et1, CLOCK_SECOND * TIME_UNION_IN_OUT);
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et1));
        //We start to analize incoming messages when GHS_HAS_ENDED
        //if(node.control_flags_neighbor_discovery & GHS_HAS_ENDED)
        //{
            while(list_length(in_union_list))
            {
              //DGHS_DBG_2("while(list_length(in_union_list))\n");
              //Give enough time to transmit the previous msg
              etimer_set(&et2, CLOCK_SECOND * TIME_PREVIOUS_MSG_IN_OUT_UNION);
              PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et2));
              //remove from list
              in_l = list_chop(in_union_list); // Remove the last object on the list.
              if(in_l->uniontype == DATA_COLLECTION_MSG)
              {
                  process_post(&response_to_data_collection, e_execute, &in_l->type_msg.data_coll_msg);
              }else
                {
                  DGHS_DBG_1("ERROR: The type of msg in in_union_list is unkown (data_collection) \n");
                }
              memb_free(&in_union_mem,in_l);
            } //while(list_length(in_union_list))
        //}
  }
  PROCESS_END();
}

PROCESS_THREAD(send_Data_Collection, ev, data) //It can not have PROCESS_WAIT_EVENT_UNTIL()
{
  static struct data_collection_msg data_coll_msg;

  PROCESS_EXITHANDLER(runicast_close(&runicast_4);)

  PROCESS_BEGIN();

  runicast_open(&runicast_4, RUNICAST_CHANNEL_4, &runicast_callbacks);

  while(1)
  {
    PROCESS_YIELD();
    if(ev == e_send_data_collection)
    {
        data_coll_msg = *( (struct data_collection_msg*) data );

        packetbuf_copyfrom(&data_coll_msg, sizeof(struct data_collection_msg));
        packetbuf_set_attr(PACKETBUF_ATTR_PACKET_GHS_TYPE_MSG, DATA_COLLECTION_MSG);
        runicast_send(&runicast_4, &data_coll_msg.to, NUM_MAX_RETRANSMISSIONS);

        DGHS_DBG_2("Send e_send_data_collection to %d.%d \n" , data_coll_msg.to.u8[0], data_coll_msg.to.u8[1] );
    }else
    {
      DGHS_DBG_1("ERROR: The type of msg in send_Dynamic_Gallager_Humblet_Spira is unkown \n");
    }
  }

  PROCESS_END();


}

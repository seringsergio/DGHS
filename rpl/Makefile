all: udp-client udp-server
CONTIKI = ../contiki

CFLAGS += -DPROJECT_CONF_H=\"project-conf.h\"


$(info MY_X_POS is ${MY_X_POS})
$(info MY_Y_POS is ${MY_Y_POS})


CFLAGS += -DMY_X_POS=${MY_X_POS}
CFLAGS += -DMY_Y_POS=${MY_Y_POS}

ifdef WITH_COMPOWER
APPS+=powertrace
CFLAGS+= -DCONTIKIMAC_CONF_COMPOWER=1 -DWITH_COMPOWER=1 -DQUEUEBUF_CONF_NUM=4
endif

ifdef SERVER_REPLY
CFLAGS+=-DSERVER_REPLY=$(SERVER_REPLY)
endif
ifdef PERIOD
CFLAGS+=-DPERIOD=$(PERIOD)
endif

ifeq ($(MAKE_WITH_NON_STORING),1)
CFLAGS += -DWITH_NON_STORING=1
endif

CONTIKI_WITH_IPV6 = 1
include $(CONTIKI)/Makefile.include

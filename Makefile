CONTIKI = contiki


PROJECT_SOURCEFILES +=   DGHS_neighbor_discovery.c neighbor_discovery.c  DGHS_Gallager_Humblet_Spira.c Gallager_Humblet_Spira.c

CONTIKI_PROJECT = example-DGHS
all: $(CONTIKI_PROJECT)

CONTIKI_WITH_RIME = 1

CFLAGS += -DPROJECT_CONF_H=\"project-conf.h\"

include $(CONTIKI)/Makefile.include

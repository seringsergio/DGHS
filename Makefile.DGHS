CONTIKI = contiki

PROJECT_SOURCEFILES +=  neighbor_discovery.c DGHS_neighbor_discovery.c \
                        Gallager_Humblet_Spira.c DGHS_Gallager_Humblet_Spira.c  \
												Dynamic_Gallager_Humblet_Spira.c DGHS_Dynamic_Gallager_Humblet_Spira.c \
												Data_Collection.c DGHS_Data_Collection.c

CONTIKI_PROJECT = example-DGHS
all: $(CONTIKI_PROJECT)

CONTIKI_WITH_RIME = 1

CFLAGS += -DPROJECT_CONF_H=\"project-conf.h\"

include $(CONTIKI)/Makefile.include

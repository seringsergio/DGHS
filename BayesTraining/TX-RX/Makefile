CONTIKI = ../../contiki


all: unmodulated_carrier example-abc example-mesh example-collect example-trickle example-polite \
     example-rudolph1 example-rudolph2 example-rucb \
     example-runicast example-unicast example-neighbors

CONTIKI_WITH_RIME = 1

CFLAGS += -DPROJECT_CONF_H=\"project-conf.h\"
include $(CONTIKI)/Makefile.include

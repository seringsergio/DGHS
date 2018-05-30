CONTIKI = contiki

PROJECT_SOURCEFILES +=  Bayes_Laplace.c

CONTIKI_PROJECT = DGHS_Bayes_Laplace.c
all: $(CONTIKI_PROJECT)

CONTIKI_WITH_RIME = 1

CFLAGS += -DPROJECT_CONF_H=\"project-conf.h\"

include $(CONTIKI)/Makefile.include

CONTIKI = ../contiki

PROJECT_SOURCEFILES +=  basicTree.c print_float.c Bayes_Laplace_Classify.c


CONTIKI_WITH_RIME = 1

$(info MY_TX_POWER_DBM is ${MY_TX_POWER_DBM})
$(info NODEID is ${NODEID})

CFLAGS += -DMY_TX_POWER_DBM=${MY_TX_POWER_DBM}

CFLAGS += -DPROJECT_CONF_H=\"project-conf.h\"

include $(CONTIKI)/Makefile.include

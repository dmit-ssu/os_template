TARGET  := main
TARGETS := second third
SRCS    := main.c
OBJS    := ${SRCS:.c=.o} 
DEPS    := ${SRCS:.c=.dep} 
XDEPS   := $(wildcard ${DEPS}) 

CCFLAGS = -std=gnu99 -O2 -Wall -Werror -ggdb 
LDFLAGS = 
LIBS    = 

CC      = gcc

.PHONY: all all_targets clean clean_targets distclean
all:: ${TARGET} all_targets

ifneq (${XDEPS},) 
include ${XDEPS} 
endif 

all_targets: $(patsubst %, Makefile.%, $(TARGETS))
	$(patsubst %,make -f Makefile.%;, $(TARGETS))

${TARGET}: ${OBJS} 
	${CC} ${LDFLAGS} -o $@ $^ ${LIBS} 

${OBJS}: %.o: %.c %.dep 
	${CC} ${CCFLAGS} -o $@ -c $< 

${DEPS}: %.dep: %.c Makefile 
	${CC} ${CCFLAGS} -MM $< > $@ 

clean_targets: $(patsubst %, Makefile.%, $(TARGETS))
	$(patsubst %,make -f Makefile.% clean;, $(TARGETS))

clean: clean_targets
	rm -f *~ ${DEPS} ${OBJS} ${TARGET}

distclean:: clean

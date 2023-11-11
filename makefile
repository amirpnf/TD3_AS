# Makefile Flex and Bison

# $@ : the current target
# $^ : the current prerequisites
# $< : the first current prerequisite

CC=gcc
CFLAGS=-Wall 
LDLIBS=-lfl

all: td3-1 td3-2

td3-1: ex1.o
	$(CC) $^ $(LDLIBS) -o $@

td3-2: ex2.o
	$(CC) $^ $(LDLIBS) -o $@

#%.c: %.y 
#	bison -d $< -o $@

%.c: %.lex
	flex -o $@ $<

clean:
	rm -f lex.yy.*
	rm -f *.o
	rm -f td3
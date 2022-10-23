# Makefile for supernovadb parse
CC = cc -g
LEX = flex
YACC = bison
CFLAGS = -DYYDEBUG=1
PROGRAMS5 = ssql
all: ${PROGRAMS5}
# chapter 5
ssql: ssql.tab.o ssql.o
		${CC} -o $@ ssql.tab.o ssql.o
ssql.tab.c ssql.tab.h: ssql_gram.y
		${YACC} -vd ssql_gram.y
ssql.c: ssql_scan.l
		${LEX} -o $*.c $<
ssql.o: ssql.c ssql.tab.h
.SUFFIXES: .pgm .l .y .c
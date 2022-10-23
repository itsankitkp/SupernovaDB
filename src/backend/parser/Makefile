# Makefile for supernovadb parse
CC = cc -g
LEX = flex
YACC = bison
CFLAGS = -DYYDEBUG=1
PROGRAMS5 = ssql
all: ${PROGRAMS5}
# chapter 5
ssql: ssql_gram.tab.o ssql_gram.o
		${CC} -o $@ ssql_gram.tab.o ssql_gram.o
ssql_gram.tab.c ssql_gram.tab.h: ssql_gram.y
		${YACC} -vd ssql_gram.y
ssql_gram.c: ssql_scan.l
		${LEX} -o $*.c $<
ssql.o: ssql_gram.c ssql_gram.tab.h
.SUFFIXES: .pgm .l .y .c
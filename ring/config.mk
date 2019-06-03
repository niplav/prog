PREFIX=/usr/local

CC=cc

CFLAGS=-Wall -Wextra -std=c89 -pedantic -O2
LDFLAGS=-s -lgsasl

BIN=md5pl
OBJ=$(BIN:=.o)
CONF=config.mk

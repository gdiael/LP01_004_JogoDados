# Arquivo de Script Makefile
# 
# Aula de LP1 2018.2
# 20/09/2018
# Clonagem atual para teste :
# 				git clone https://github.com/gdiael/LP01_003_corridaSapos.git
#
# Gdiael Souto Barros
#

CC = g++

OBJ = ./build
SRC = ./src
BIN = ./bin
INC = ./include

PROG1 = $(BIN)/JogoDados

CPPFLAGS = -Wall -pedantic -std=c++11 -I$(INC)

OBJ1 = $(OBJ)/dado.o $(OBJ)/jogador.o $(OBJ)/jogo.o $(OBJ)/main.o
OBJ2 = $(SRC)/dado.cpp $(SRC)/jogador.cpp $(SRC)/jogo.cpp $(SRC)/main.cpp

all: mkdirs $(PROG1)

mkdirs:
	mkdir -p $(BIN)
	mkdir -p $(OBJ)

$(PROG1): $(OBJ1)
	$(CC) $(CPPFLAGS) -o $(PROG1) $(OBJ1)

db$(PROG1): $(OBJ2)
	$(CC) -g $(CPPFLAGS) -o $(PROG1) $(OBJ2)

$(OBJ)/dado.o: $(SRC)/dado.cpp $(INC)/dado.h
	$(CC) $(CPPFLAGS) -c $(SRC)/dado.cpp -o $(OBJ)/dado.o

$(OBJ)/jogador.o: $(SRC)/jogador.cpp $(INC)/dado.h $(INC)/jogador.h
	$(CC) $(CPPFLAGS) -c $(SRC)/jogador.cpp -o $(OBJ)/jogador.o

$(OBJ)/jogo.o: $(SRC)/jogo.cpp $(INC)/jogo.h $(INC)/dado.h $(INC)/jogador.h
	$(CC) $(CPPFLAGS) -c $(SRC)/jogo.cpp -o $(OBJ)/jogo.o

$(OBJ)/main.o: $(SRC)/main.cpp $(INC)/dado.h $(INC)/jogador.h $(INC)/jogo.h
	$(CC) $(CPPFLAGS) -c $(SRC)/main.cpp -o $(OBJ)/main.o

clean: 
	rm -f $(BIN)/*
	rm -f $(OBJ)/*

debug: db$(PROG1)
	gdb $(PROG1)

run:
	$(PROG1)
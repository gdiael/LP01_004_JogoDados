# Arquivo de Script Makefile
# 
# Aula de LP1 2018.2
# 30/08/2018
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

PROG1 = $(BIN)/CorridaSapos

CPPFLAGS = -Wall -pedantic -std=c++11 -I$(INC)

OBJ1 = $(OBJ)/sapo.o $(OBJ)/jogosapo.o $(OBJ)/mainSapo.o
OBJ2 = $(SRC)/sapo.cpp $(SRC)/jogosapo.cpp $(SRC)/mainSapo.cpp

all: mkdirs $(PROG1)

mkdirs:
	mkdir -p $(BIN)
	mkdir -p $(OBJ)

$(PROG1): $(OBJ1)
	$(CC) $(CPPFLAGS) -o $(PROG1) $(OBJ1)

db$(PROG1): $(OBJ2)
	$(CC) -g $(CPPFLAGS) -o $(PROG1) $(OBJ2)

$(OBJ)/sapo.o: $(SRC)/sapo.cpp $(INC)/sapo.h
	$(CC) $(CPPFLAGS) -c $(SRC)/sapo.cpp -o $(OBJ)/sapo.o

$(OBJ)/jogosapo.o: $(SRC)/jogosapo.cpp $(INC)/sapo.h $(INC)/jogosapo.h
	$(CC) $(CPPFLAGS) -c $(SRC)/jogosapo.cpp -o $(OBJ)/jogosapo.o

$(OBJ)/mainSapo.o: $(SRC)/mainSapo.cpp $(INC)/sapo.h $(INC)/jogosapo.h
	$(CC) $(CPPFLAGS) -c $(SRC)/mainSapo.cpp -o $(OBJ)/mainSapo.o

clean: 
	rm -f $(BIN)/*
	rm -f $(OBJ)/*

debug: db$(PROG1)
	gdb $(PROG1)

run:
	$(PROG1)
OBJS  := util.o core.o
SRC   := util.c core.c
CFLAGS := -O2 -fPIC -DASM_STREEBOG



all: streebog.o util.o core.o
	
	#gcc -c -fPIC -O2 core.c -o core.o
	#gcc -c -fPIC -O2 util.c -o util.o
	gcc -lc -fPIC util.o streebog.o core.o  -o streebog 
	

streebog.o:  streebog.s 
	$(CC) $(CFLAGS) -c streebog.s -o streebog.o
	
$(OBJ): $(SRC)
	$(CC) $(CFLAGS) -c $< -o $@


	

OBJS  := util.o core.o
SRC   := util.c core.c
#-ggdb 
CFLAGS := -O2 -fPIC -DASM_STREEBOG=1 -no-pie -mavx -mavx2 -masm=intel

all: streebog.o util.o core.o
	
	#gcc -c -fPIC -O2 core.c -o core.o
	#gcc -c -fPIC -O2 util.c -o util.o
	gcc -no-pie -lc -fPIC util.o streebog.o core.o  -o streebog 
	

streebog.o:  streebog.s add.s const.s debug.s lps.s
	$(CC) $(CFLAGS)  -c streebog.s -o streebog.o
	
$(OBJ): $(SRC) Makefile
	$(CC) $(CFLAGS)  -c $< -o $@
	
clear:
	rm streebog 
	rm *.o


	

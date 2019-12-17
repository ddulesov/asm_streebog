OBJDIR=build

SRC = util.c core.c
O=$(SRC:%.c=%.o)
OBJS = $(addprefix $(OBJDIR)/, $O )
#-ggdb 
CFLAGS = -DASM_STREEBOG=1 -O2 -fPIC -no-pie -mavx2

all: asm_streebog c_streebog v_streebog

asm_streebog: $(OBJDIR)/streebog.o $(OBJS)
	#gcc -c -fPIC -O2 core.c -o core.o
	#gcc -c -fPIC -O2 util.c -o util.o
	gcc -no-pie  -lc -fPIC  $(OBJDIR)/streebog.o $(OBJS)  -o ./build/asm_streebog 
	
c_streebog: $(SRC)
	$(CC) -lc -mavx2 -O3 -fPIC $(SRC)  -o ./build/c_streebog
	
v_streebog: $(SRC)
	$(CC) -lc -mavx2 -O3 -D_VERBOSE=1 -fPIC $(SRC)  -o ./build/v_streebog	

$(OBJDIR)/%.o : %.c
	$(CC)  $(CFLAGS) -c $< -o $@
	
$(OBJDIR)/streebog.o:  streebog.s add.s const.s debug.s lps.s
	$(CC) $(CFLAGS)  -c streebog.s -o $(OBJDIR)/streebog.o
	
	
clean:
	rm $(OBJDIR)/streebog.o 
	rm $(OBJ)
	rm ./build/*
	
gdb:
	gdb --args ./build/asm_streebog -b




	

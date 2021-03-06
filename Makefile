OBJDIR=build

SRC = util.c
O=$(SRC:%.c=%.o)
OBJS = $(addprefix $(OBJDIR)/, $O )
#-ggdb 
CFLAGS=-O3 -fPIC -no-pie -mavx -mavx2 -masm=intel


all: asm_streebog c_streebog d_streebog

dlib:   $(OBJDIR)/streebog.o  
	$(CC) -fPIC -shared -o $(OBJDIR)/libstreebog.so $(OBJDIR)/streebog.o

asm_streebog: $(OBJDIR)/streebog.o $(OBJS)
	$(CC) -no-pie  -lc -fPIC  $(OBJDIR)/streebog.o $(OBJS)  -o ./build/asm_streebog 

asm_streebog_dyn: dlib $(OBJS)
	$(CC) -L./build/    $(OBJS) -lstreebog  -o ./build/asm_streebog_dyn 
	
c_streebog: $(SRC)
	$(CC) -lc -mavx2 -s  -DSIMD_ALIGN=32 -DC_STREEBOG -O3 -fPIC $(SRC) chash.c  -o ./build/c_streebog
	
d_streebog: $(SRC)
	$(CC) -lc -mavx2 -s  -DD_STREEBOG -O3 -fPIC $(SRC) dhash.c  -o ./build/d_streebog


#v_streebog: $(SRC)
#	$(CC) -lc -mavx2 -O3 -D_VERBOSE=1 -fPIC $(SRC) debug.c  -o ./build/v_streebog	

$(OBJDIR)/%.o : %.c
	$(CC)  $(CFLAGS) -c $< -o $@
	
$(OBJDIR)/streebog.o:  streebog.s add.s const.s debug.s lps.s
	$(CC) $(CFLAGS)  -c streebog.s -o $(OBJDIR)/streebog.o
	
clean:
	rm $(OBJDIR)/streebog.o 
	rm $(OBJ)
	rm ./build/*
	
gdb:
	gdb --args ./build/asm_streebog
	#gdb --args ./build/asm_streebog -b

	                                          


	

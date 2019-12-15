#include <stdio.h>
#include <string.h>
#include "core.h"

const char *sep = "\n       ------------------------------------------------------------------------------------------------";

//const char *data = "012345678901234567890123456789012345678901234567890123456789012";
const char *data = "01234567890123456789012345678901234567890123456789012345678901200000000";
static  unsigned char digest[64];

void print_buffer(const unsigned char* ptr, int ptr_len){
	/*
	for(int i=0; i<64; i++){
		if(i>0 && i % 16 == 0) printf("  ");
		printf("%02i ", i);
	}
	*/
	
	for(int i=0;i<ptr_len;i++){
		if(i>0 && i % 16 == 0) printf("  ");
	 	printf("%02x ", ptr[i] );
	}
	puts("");
}

void print_digest(){
	printf("digest:\n");
	print_buffer(digest, 64);
}

void print_ymm(const unsigned char *ptr){
	puts(sep);
	printf("      "); 
	for(int j=0; j<32; j++){
		if(j==16) printf("  ");
		printf("%02i ", j);
	}
	puts("");
	for(int i=0;i<10;i++){
		printf("ymm%02i ", i);
		
		
		for(int j=0;j<32;j++, ptr++){
			if(j==16) printf("  ");
			printf("%02x ",*ptr);
		}
		puts("");
	}
	puts(sep);
	
}

extern void _test();
extern int  init(GOST34112012Context *CTX, const unsigned int digest_size);


int main(){
	int len = strlen( data );
	
	_test();
	
	GOST34112012Context ctx;	
	GOST34112012Init(&ctx, 64 );
	
	GOST34112012Update(&ctx, data, len );
	GOST34112012Final(&ctx, &digest[0]);
	
	/*
	ctx.h.QWORD[0] = 0x0102030405060708ULL;
	ctx.h.QWORD[1] = 0x0101010101010101ULL;
	ctx.h.QWORD[2] = 0x0101010101010101ULL;
	ctx.h.QWORD[3] = 0x0000000000000000ULL;
	
	ctx.N.QWORD[0] = 0xF9F9F9F9F9F9F9F9ULL;
	ctx.N.QWORD[1] = 0x0000000000000000ULL;
	ctx.N.QWORD[2] = 0x0101010101010101ULL;
	ctx.N.QWORD[3] = 0x0101010101010101ULL;
	
	GOST34112012Dump(&ctx);
	add_bytes( CTX_FIELD(&ctx,h), CTX_FIELD(&ctx,N));
    GOST34112012Dump(&ctx);
	*/
	print_digest();
	GOST34112012Cleanup( &ctx );
 	return 0;
}
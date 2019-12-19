#include <stdio.h>
#include <string.h>

#include <time.h>

#include "core.h"

const char *sep = "\n       ------------------------------------------------------------------------------------------------";

const char ALIGNED *data_test = "012345678901234567890123456789012345678901234567890123456789012";
const unsigned char hash_test[]=
{
	0x1b,0x54,0xd0,0x1a,0x4a,0xf5,0xb9,0xd5,
	0xcc,0x3d,0x86,0xd6,0x8d,0x28,0x54,0x62,
	0xb1,0x9a,0xbc,0x24,0x75,0x22,0x2f,0x35,
	0xc0,0x85,0x12,0x2b,0xe4,0xba,0x1f,0xfa,
	0x0,0xad,0x30,0xf8,0x76,0x7b,0x3a,0x82,
	0x38,0x4c,0x65,0x74,0xf0,0x24,0xc3,0x11,
	0xe2,0xa4,0x81,0x33,0x2b,0x8,0xef,0x7f,
	0x41,0x79,0x78,0x91,0xc1,0x64,0x6f,0x48
};

#define min(a,b)	( (a<b)?a:b )

const char ALIGNED *data = "012345678901234567890123456789012345678901234567890123456789012"
        "00000000000000000000000000000000000000000000000000000000000000000000"
        "11111111111111111111111111111111111111111111111111111111111111111111"
        "22222222222222222222222222222222222222222222222222222222222222222222"
        "33333333333333333333333333333333333333333333333333333333333333333333"
        "44444444444444444444444444444444444444444444444444444444444444444444"
        "55555555555555555555555555555555555555555555555555555555555555555555"
        "66666666666666666666666666666666666666666666666666666666666666666666"
        "77777777777777777777777777777777777777777777777777777777777777777777"
        "88888888888888888888888888888888888888888888888888888888888888888888"
        "99999999999999999999999999999999999999999999999999999999999999999999"
        "00000000000000000000000000000000000000000000000000000000000000000000";

const unsigned char hash[]=
{
	0x39, 0x42, 0xf2, 0xc2, 0xf3, 0x48, 0x4b, 0xc4,
	0xd8, 0x77, 0xe6, 0xcc, 0x72, 0xa9, 0x68, 0xdf,
	0xd7, 0x71, 0x97, 0x06, 0xfc, 0xd5, 0x14, 0xa8,
	0x72, 0x80, 0x71, 0x38, 0xc3, 0x22, 0xaa, 0x99,
	0x76, 0xe7, 0x7c, 0xe1, 0x8e, 0x19, 0x00, 0xf8,
	0x8a, 0x56, 0x7c, 0xfd, 0x7f, 0xc1, 0xe6, 0xd6,
	0x85, 0xa1, 0x0a, 0x78, 0xab, 0xe6, 0x39, 0x60,
	0xfb, 0xd2, 0x89, 0x25, 0x38, 0x88, 0x86, 0x4e
};		
		
//const char *data = "01234567890123456789012345678901234567890123456789012345678901200000000";
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

#define CHECK_BIT(var,pos) ((var) & (1<<(pos)))

void print_ymm(const unsigned char *ptr, int idx){
	puts(sep);
	printf("      "); 
	for(int j=0; j<32; j++){
		if(j==16) printf("  ");
		printf("%02i ", j);
	}
	puts("");
	for(int i=0;i<10;i++){
		if( !CHECK_BIT(idx, i) ) continue;
		
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
const int MAX = 1000000;
	/*
	__asm(
	"xor		rcx, rcx;"
	"dec		ecx;"
"_test_1:	"
	"vpxor	xmm0, xmm0, xmm9;"
	"vpxor	xmm1, xmm1, xmm9;"
	"dec     rcx;"
	"jne	_test_1;"
		
	);
	*/
	
int benchmark(){
	GOST34112012Context ctx;
	struct timespec mt1, mt2; 
	long int tt; 
	
	int len = strlen( data );
	clock_gettime (CLOCK_REALTIME, &mt1);
	
	GOST34112012Init(&ctx, 64 );
	for(int i=0;i<MAX;i++){
		GOST34112012Update(&ctx, data, len );
		GOST34112012Final(&ctx, &digest[0]);
		GOST34112012Cleanup( &ctx );		
	}
	clock_gettime (CLOCK_REALTIME, &mt2);
	
	tt=1000000000*(mt2.tv_sec - mt1.tv_sec)+(mt2.tv_nsec - mt1.tv_nsec);
	
	double perf =  len * (double) MAX * 1000 / tt;
	
	printf("took %.1f seconds , %.2f Mbps \n", (double)tt * 1e-9, perf);
	return 0;
}

int i1(){
	GOST34112012Context ctx;	
	int len = strlen( data );
	
	GOST34112012Init( &ctx, 64 );
	GOST34112012Update( &ctx, data, len );
	GOST34112012Final( &ctx, &digest[0] );
	GOST34112012Cleanup( &ctx );
	
	print_digest();
	
	return 0;
}


int test(){
	GOST34112012Context ctx;	
	int len = strlen( data_test );
	
	GOST34112012Init( &ctx, 64 );
	GOST34112012Update( &ctx, data_test, len );
	GOST34112012Final( &ctx, &digest[0] );
	GOST34112012Cleanup( &ctx );
	
	print_digest();
	if(memcmp(&digest[0], hash_test, 64 )!= 0 ){
		puts("ERROR");
		
		print_buffer(hash_test, 64);
		return 1;
	}
	
	len = strlen( data );
	
	GOST34112012Init( &ctx, 64 );
	GOST34112012Update( &ctx, data, len );
	GOST34112012Final( &ctx, &digest[0] );
	GOST34112012Cleanup( &ctx );
	
	print_digest();
	puts("chunk test");
	for(int i=32; i< min(len,128); i+=16){
		
		GOST34112012Init( &ctx, 64 );
		GOST34112012Update( &ctx, data, i );
		GOST34112012Update( &ctx, data+i, len-i );
		GOST34112012Final( &ctx, &digest[0] );
		GOST34112012Cleanup( &ctx );
		
		if(memcmp(&digest[0], hash, 64 )!= 0 ){
			puts("ERROR");
			print_digest();
			
			printf("data length =%i split on position %i \n",len, i);
			return 1;
		}
	}
		
	puts("OK");
	return 0;
}


int main(int argc, const char* argv[]){
	//_test();
	//return 0;
	

	if(argc>1 && strcmp(argv[1], "-b")==0 ){
		return benchmark();
	}else if( argc>1 && strcmp(argv[1], "-i1")==0  ){
		return i1();
	}else{
		return test();
	}
	
 	return 0;
}
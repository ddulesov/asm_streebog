#include <stdio.h>
#include <string.h>

#include <time.h>
#include "core.h"

#define cRED	"\033[1;31m"
#define cDRED	"\033[0;31m"
#define cGREEN	"\033[1;32m"
#define cDGREEN	"\033[0;32m"
#define cBLUE	"\033[1;34m"
#define cDBLUE	"\033[0;34m"
#define cNORM	"\033[m"

const char *sep = "\n       ------------------------------------------------------------------------------------------------";

static const char *data_test1 = "012345678901234567890123456789012345678901234567890123456789012";
static const unsigned char hash_test1[]=
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

static const unsigned char hash_test1_32[]=
{
    0x9d,0x15,0x1e,0xef,0xd8,0x59,0x0b,0x89,
    0xda,0xa6,0xba,0x6c,0xb7,0x4a,0xf9,0x27,
    0x5d,0xd0,0x51,0x02,0x6b,0xb1,0x49,0xa4,
    0x52,0xfd,0x84,0xe5,0xe5,0x7b,0x55,0x00,
};

static const unsigned char data_test2[]= {
    0xd0,0xcf,0x11,0xe0,0xa1,0xb1,0x1a,0xe1,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x3e,0x00,0x03,0x00,0xfe,0xff,0x09,0x00,
    0x06,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,
    0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x10,0x00,0x00,0x24,0x00,0x00,0x00,
    0x01,0x00,0x00,0x00,0xfe,0xff,0xff,0xff,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
    0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
    0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
    0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
    0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
    0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
    0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
    0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff
};


static const unsigned char hash_test2[]={
    0xc7,0x66,0x08,0x55,0x40,0xca,0xaa,0x89,
    0x53,0xbf,0xcf,0x7a,0x1b,0xa2,0x20,0x61,
    0x9c,0xee,0x50,0xd6,0x5d,0xc2,0x42,0xf8,
    0x2f,0x23,0xba,0x4b,0x18,0x0b,0x18,0xe0
};

#define min(a,b)    ( (a<b)?a:b )

static const char *data = 
        "012345678901234567890123456789012345678901234567890123456789012"
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

static const unsigned char hash[]=
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
        
static  unsigned char digest[64];

static void 
inline print_hex(const unsigned char* ptr, int ptr_len){
    for(int i=0;i<ptr_len;i++){
        if(i>0 && i % 16 == 0) printf("  ");
        printf("%02x ", ptr[i] );
    }
}

void 
print_buffer(const unsigned char* ptr, int ptr_len){
    print_hex(ptr, ptr_len);
    puts(cNORM"");
}

static void 
print_digest(){
    printf(cBLUE "digest:\n  "cNORM);
    print_buffer(digest, 64);
}

#define CHECK_BIT(var,pos) ((var) & (1<<(pos)))

extern void _test();
const int MAX = 400000;
    
static int 
benchmark(int bz){
    GOST34112012Context ctx;
    struct timespec mt1, mt2; 
    long int tt; 
    
    unsigned char *block = malloc( bz );
    
    for (int i = 0; i < bz; i++)
        block[i] = (unsigned char) (i & 0xff);
    
	puts(cGREEN "start benchmark ..."cNORM);
    __sync_synchronize();
    clock_gettime (CLOCK_REALTIME, &mt1);
    
    for(int i=0;i<MAX;i++){
        GOST34112012Init(&ctx, 64 );
        GOST34112012Update(&ctx, block, bz );
        GOST34112012Final(&ctx, &digest[0]);
        GOST34112012Cleanup( &ctx );        
    }
    clock_gettime (CLOCK_REALTIME, &mt2);
    __sync_synchronize();
    
    free(block);
    
    tt=1000000000*(mt2.tv_sec - mt1.tv_sec)+(mt2.tv_nsec - mt1.tv_nsec);
    
    double perf =  bz * (double) MAX * 1000 / tt;
    
    printf("%i rounds of gost-34.11-2012(512) hash block size " cGREEN"%i" cNORM " bytes took %.1f seconds. speed: " cGREEN "%.2f" cNORM " Mbps \n", MAX, bz, (double)tt * 1e-9, perf);
    return 0;
}

static int 
matrix_bench(int series, int bit){
	GOST34112012Context ctx;
	struct timespec mt1, mt2; 
    long int tt; 
	const int R=50000;
	const size_t bz[]={16, 64, 256, 1024, 8*1024, 64 * 1024};
	double  perf[ sizeof(bz)/sizeof(  bz[0] )  ];
	
	printf(cGREEN "start benchmark gost 34.11-2012 (%i bit) ...\n"cNORM, bit);
	printf("Mbps calculated on %i hashes\n", R);
	for(int j=0; j< sizeof(bz)/sizeof(  bz[0] ); j++ ){
		int s = bz[j];
		
		if(s>1024){
			printf(" %6i kb",s/1024 );
			
		}else{
			printf(" %7i b",s );
		}
		
	}
	puts("");
	for(int j=0; j< sizeof(bz)/sizeof(  bz[0] ); j++ ){
		printf("-----------");
	}
	puts("");
	for(int i=0; i<series; i++){
		
		for(int j=0; j< sizeof(bz)/sizeof(  bz[0] ); j++ ){
			GOST34112012Init(&ctx, bit>>3 );
			unsigned char *block = malloc( bz[j] );
			if(block==NULL){
				puts("memory allocation failed");
				return 2;
			}
			
			memset(block, 0xF0, bz[j] );
			__sync_synchronize();
			clock_gettime (CLOCK_REALTIME, &mt1);
	
			for(int k=0; k< R; k++){
					GOST34112012Update(&ctx, block, bz[j] );
					GOST34112012Final(&ctx, &digest[0]);
					GOST34112012Cleanup( &ctx ); 
			}
			clock_gettime (CLOCK_REALTIME, &mt2);
			__sync_synchronize();
			
			free( block );
			
			tt=1000000000*(mt2.tv_sec - mt1.tv_sec)+(mt2.tv_nsec - mt1.tv_nsec);
    
			perf[j] = bz[j] * (double) R * 1000 / tt;
	
		}
		for(int j=0; j< sizeof(bz)/sizeof(  bz[0] ); j++ ){
			printf(" %9.2f", perf[j] );
		}
		puts("");
		
	}
	
	
}

static int 
i1(){
    GOST34112012Context ctx;    
    int len = strlen( data );
    
    GOST34112012Init( &ctx, 64 );
    GOST34112012Update( &ctx, data, len );
    GOST34112012Final( &ctx, &digest[0] );
    GOST34112012Cleanup( &ctx );
    
    print_digest();
	puts(cGREEN "OK"cNORM);
    return 0;
}

static int 
test(){
	puts(cDGREEN "M1 test 512 bit"cNORM);
    GOST34112012Context ctx;    
    int len = strlen( data_test1 );
    
    GOST34112012Init( &ctx, 64 );
    GOST34112012Update( &ctx, data_test1, len );
    GOST34112012Final( &ctx, &digest[0] );
    GOST34112012Cleanup( &ctx );
    
    print_digest();
    if(memcmp(&digest[0], hash_test1, 64 )!= 0 ){
        puts(cRED"ERROR"cNORM);
        print_buffer(hash_test1, 64);
        return 1;
    }
	puts(cDGREEN "M1 test256 bit"cNORM);
    // 32 bit hash
    len = strlen( data_test1 );
    
    GOST34112012Init( &ctx, 32 );
    GOST34112012Update( &ctx, data_test1, len );
    GOST34112012Final( &ctx, &digest[0] );
    GOST34112012Cleanup( &ctx );
    print_digest();
    if(memcmp(&digest[0], hash_test1_32, 32 )!= 0 ){
        puts(cRED"ERROR"cNORM);
        
        print_buffer(hash_test1_32, 32);
        return 1;
    }
    puts(cDGREEN "M2 test 256 bit"cNORM);
    //32 bit on the troublesome data https://habr.com/ru/post/450024/
    len = sizeof( data_test2 );
    
    GOST34112012Init( &ctx, 32 );
    GOST34112012Update( &ctx, data_test2, len );
    GOST34112012Final( &ctx, &digest[0] );
    GOST34112012Cleanup( &ctx );
    print_digest();
    if(memcmp(&digest[0], hash_test2, 32 )!= 0 ){
        puts(cRED"ERROR"cNORM);
        
        print_buffer(hash_test2, 32);
        return 1;
    }
	
	puts(cDGREEN "long test"cNORM);
	
    //split long data on chunks
    len = strlen( data );
    
    GOST34112012Init( &ctx, 64 );
    GOST34112012Update( &ctx, data, len );
    GOST34112012Final( &ctx, &digest[0] );
    GOST34112012Cleanup( &ctx );
    
    print_digest();
    puts(cDGREEN "chunk test"cNORM);
    for(int i=32; i< min(len,128); i+=16){
        
        GOST34112012Init( &ctx, 64 );
        GOST34112012Update( &ctx, data, i );
        GOST34112012Update( &ctx, data+i, len-i );
        GOST34112012Final( &ctx, &digest[0] );
        GOST34112012Cleanup( &ctx );
        
        if(memcmp(&digest[0], hash, 64 )!= 0 ){
            puts(cRED"ERROR"cNORM);
            print_digest();
            
            printf("data length =%i split on position %i \n",len, i);
            return 1;
        }
    }
    puts(cGREEN "OK");
    return 0;
}


int main(int argc, const char* argv[]){
    if(argc>1 && strcmp(argv[1], "-b")==0 ){
        int bz = 1024 * 8;
        if(argc>2){
            bz = atoi( argv[2] );
        }
        return benchmark(bz);
	}else if(argc>1 && strcmp(argv[1], "-h")==0 ){
		puts("-b benchmark\n-i1 simple digest call\nm - matrix hash speed computation");
	}else if(argc>1 && strcmp(argv[1], "-m")==0 ){
		if(argc<3){
			puts( cRED " specify the number of rounds");
			return 1;
		}
		
		int series = atoi( argv[2] );
		if(series<=0){
			series = 10;
		}
		
		int bits = 512;
		
		if(argc>3){
			bits = atoi( argv[3] );
			if(bits!=512 && bits!=256){
				bits = 512;
			}
		}
		
		matrix_bench(series, bits);
    }else if( argc>1 && strcmp(argv[1], "-i1")==0  ){
        return i1();
    }else{
        return test();
    }
    
	
	
	
    return 0;
}

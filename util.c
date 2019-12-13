#include <stdio.h>
#include <string.h>
#include "core.h"

//const char *data = "012345678901234567890123456789012345678901234567890123456789012";
const char *data = "01234567890123456789012345678901234567890123456789012345678901200000000";
static  unsigned char digest[64];

void print_digest(){
	printf("digest:");
	for(int i=0;i<64;i++){
	 	printf("%02x ", digest[i] );
	}
	printf("\n");
}


int main(){
	int len = strlen( data );
	
	GOST34112012Context ctx;
	GOST34112012Init(&ctx, 64 );
	GOST34112012Update(&ctx, data, len );
	GOST34112012Final(&ctx, &digest[0]);
	
    GOST34112012Dump(&ctx);
	
	print_digest();
	GOST34112012Cleanup( &ctx );
 	return 0;
}
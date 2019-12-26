#include <string.h>
#include <stdio.h>

#ifdef _DEBUG
static void 
print_hex(const unsigned char* ptr, int ptr_len){
    for(int i=0; i<ptr_len; i++){
        printf("%02x ", ptr[i] );
    }
}

void
GOST34112012Dump(GOST34112012Context *CTX)
{
   CTX->name[63]='\0';
   printf("%s", CTX->name );

    printf("\ndig  :%2u", CTX->digest_size);
    printf("\nh    :"); print_hex(CTX_FIELD(CTX,h), sizeof(CTX->h));
    printf("\nn    :"); print_hex(CTX_FIELD(CTX,N), sizeof(CTX->N));
    printf("\nsigma:"); print_hex(CTX_FIELD(CTX,Sigma), sizeof(CTX->Sigma));
    printf("\nbuff :"); print_hex(CTX_FIELD(CTX,buffer), CTX->bufsize); printf(" (%i) bytes\n", CTX->bufsize );
}

void 
print_ymm(const unsigned char *ptr, int idx){
    puts(sep);
    printf("      "); 
    for(int j=0; j<32; j++){
        if(j==16) printf("  ");
        printf("%02i ", j);
    }
    puts("");
    for(int i=0;i<16;i++){
        if( !CHECK_BIT(idx, i) ) continue;
        
        printf("ymm%02i ", i);
        const unsigned char* yptr = ptr + i * 32;
        
        for(int j=0;j<32;j++, yptr++){
            if(j==16) printf("  ");
            printf("%02x ",*yptr);
        }
        puts("");
    }
    puts(sep);
}

void 
print_g(const unsigned char *ptr){
    puts(sep);
    puts("key xmm0 xmm2 xmm1 xmm3");
    
    print_hex(ptr, 16); print_hex(ptr+2 * 32, 16);
    puts("");
    print_hex(ptr+32, 16); print_hex(ptr+3*32, 16);

    puts("\nbuff xmm4 xmm6 xmm5 xmm7");
    
    print_hex(ptr+4*32, 16); print_hex(ptr+6 * 32, 16);
    puts("");
    print_hex(ptr+5*32, 16); print_hex(ptr+7*32, 16);   
    puts(sep);
}
#endif
#include "core.h"
#include <string.h>

#ifdef _DEBUG
#include <stdio.h>
#endif

#ifdef ASM_STREEBOG

extern void
stage3(GOST34112012Context *CTX);

void
stage2(GOST34112012Context *CTX, const unsigned char *data);


#else
void
stage3(GOST34112012Context *CTX){
	printf("stage 3 (c)\n");
}

void
stage2(GOST34112012Context *CTX, const unsigned char *data){
	
}

#endif

void
GOST34112012Cleanup(GOST34112012Context *CTX)
{
    memset(CTX, 0x00, sizeof (GOST34112012Context));
}

#ifdef _DEBUG
static void print_hex(const unsigned char* ptr, int ptr_len){
	for(int i=0; i<ptr_len; i++){
	 	printf("%02x ", ptr[i] );
	}
}

void
GOST34112012Dump(GOST34112012Context *CTX)
{
#ifdef _DEBUG
	printf("%s", CTX->name );
#endif
    printf("\nh    :"); print_hex(CTX_FIELD(CTX,h), sizeof(CTX->h));
    printf("\nn    :"); print_hex(CTX_FIELD(CTX,N), sizeof(CTX->N));
    printf("\nsigma:"); print_hex(CTX_FIELD(CTX,Sigma), sizeof(CTX->Sigma));
    printf("\nbuff :"); print_hex(CTX_FIELD(CTX,buffer), CTX->bufsize); printf(" (%i) bytes\n", CTX->bufsize );
}
#endif

void
GOST34112012Init(GOST34112012Context *CTX, const unsigned int digest_size)
{
    unsigned int i;
    memset(CTX, 0x00, sizeof(GOST34112012Context));
    CTX->digest_size = digest_size;
	if (digest_size == 256) {
		for (i = 0; i < 8; i++)
		{
			CTX->h.QWORD[i] = 0x0101010101010101ULL;
		}
	}
#ifdef _DEBUG
	strncpy (&(CTX->name[0]), "GOST34112012Context", 63);
	CTX->name[63] = '\0';
#endif
	
}

void
GOST34112012Update(GOST34112012Context *CTX, const unsigned char *data, size_t len)
{
    size_t chunksize;

    if (CTX->bufsize) {
        chunksize = 64 - CTX->bufsize;
        if (chunksize > len)
            chunksize = len;

        memcpy(&CTX->buffer[CTX->bufsize], data, chunksize);

        CTX->bufsize += chunksize;
        len -= chunksize;
        data += chunksize;
        
        if (CTX->bufsize == 64)
        {
            stage2(CTX, CTX->buffer);
            CTX->bufsize = 0;
        }
    }

    while (len > 63)
    {
        stage2(CTX, data);
        data += 64;
        len  -= 64;
    }

    if (len) {
        memcpy(&CTX->buffer, data, len);
        CTX->bufsize = len;
    }
}

void
GOST34112012Final(GOST34112012Context *CTX, unsigned char *digest)
{
    stage3(CTX);
    CTX->bufsize = 0;

    if (CTX->digest_size == 256)
        memcpy(digest, &(CTX->h.QWORD[4]), 32);
    else
        memcpy(digest, &(CTX->h.QWORD[0]), 64);
}

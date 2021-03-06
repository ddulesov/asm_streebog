#include "core.h"
#include <string.h>

#ifdef C_STREEBOG

#include <immintrin.h>
#if defined(__GNUC__)
#include <x86intrin.h>
#endif

#include "gost3411-2012-const.h"
#include "gost3411-2012-precalc.h"
#include "gost3411-2012-avx.h"

static inline void
pad(GOST34112012Context *CTX)
{
    if (CTX->bufsize > 63)
        return;

    memset(CTX->buffer + CTX->bufsize,
    0x00, sizeof(CTX->buffer) - CTX->bufsize);

    CTX->buffer[CTX->bufsize] = 0x01;
}


static inline  void
add512(u512_t* x, const u512_t* y)
{
    unsigned char cf = 0;
    unsigned int i;

    for (i = 0; i < 8; i++)
    {
        cf = _addcarry_u64(cf, x->QWORD[i], y->QWORD[i], &(x->QWORD[i]));
    }
}

static inline void g(u512_t *h, const u512_t *N, const unsigned char *m) {

    __m256i ymm0, ymm1;
    __m256i ymm2, ymm3;
    register unsigned long long r0, r1, r2, r3;
    
    //key
    LOAD_YMM(h, ymm0, ymm1);
    //into_xor_m ( n )
    XOR_YMM((*N), ymm0, ymm1);
    
    YMM_LPS(ymm0, ymm1);
    //buffer
    LOADU_YMM(m, ymm2, ymm3);

    for (int i = 0; i < 12; i++) {
        XOR_YMM2(ymm2, ymm3, ymm0, ymm1);   
        //buffer.lps()
        YMM_LPS(ymm2, ymm3);
        
        //key.into_xor( c[i] )
        XOR_YMM(C[i], ymm0, ymm1);
        //key.lps()
        YMM_LPS(ymm0, ymm1);
    }
    //key.xor_r( buffer )
    XOR_YMM2(ymm0, ymm1, ymm2, ymm3 );
    //use ymm2 ymm3 as buffer is not need anymore
    LOADU_YMM(m, ymm2, ymm3);
    //key.xor_m ( m )
    XOR_YMM2(ymm0, ymm1, ymm2, ymm3);
    //key.xor_m ( h )
    XOR_YMM( (*h), ymm0, ymm1);
    STORE_YMM(h, ymm0, ymm1);
}

static inline void
stage2(GOST34112012Context *CTX, const unsigned char *data)
{   
    g(&(CTX->h), &(CTX->N), data );

    add512(&(CTX->N), &buffer512);

    add512(&(CTX->Sigma), (const u512_t *)data);
}

static void
stage3(GOST34112012Context *CTX)
{
    ALIGNED u512_t buf = {{ 0 }};

    buf.QWORD[0] = CTX->bufsize << 3;

    pad(CTX);
    g(&(CTX->h), &(CTX->N), (const unsigned char *) &(CTX->buffer));

    add512(&(CTX->N), &buf);
    add512(&(CTX->Sigma), (const u512_t *) &CTX->buffer[0]);
    
    g(&(CTX->h), &buffer0, (const unsigned char *) &(CTX->N));
    g(&(CTX->h), &buffer0, (const unsigned char *) &(CTX->Sigma));
}

void
GOST34112012Cleanup(GOST34112012Context *CTX)
{
    memset(CTX, 0x00, sizeof (GOST34112012Context));
}

void
GOST34112012Init(GOST34112012Context *CTX, const unsigned int digest_size)
{
    unsigned int i;
    memset(CTX, 0x00, sizeof(GOST34112012Context));
    CTX->digest_size = digest_size;
    if (digest_size == 32) {
        memset(&(CTX->h), 0x01, 64 );

    }    
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

    
    memcpy(&CTX->buffer, data, len);
    
    CTX->bufsize = len;
}

void
GOST34112012Final(GOST34112012Context *CTX, unsigned char *digest)
{
    stage3(CTX);
    CTX->bufsize = 0;

    if (CTX->digest_size == 32)
        memcpy(digest, &(CTX->h.QWORD[4]), 32);
    else
        memcpy(digest, &(CTX->h.QWORD[0]), 64);
}

#endif

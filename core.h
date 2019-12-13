#define __GOST3411_HAS_AVX__
#define _DEBUG


#if defined _MSC_VER
	#define ALIGN(x) __declspec(align(x))
#else
	#define ALIGN(x) __attribute__ ((__aligned__(x)))
#endif

#if defined   __GOST3411_HAS_SSE41__
	#define ALIGNED  ALIGN(16)
#elif defined __GOST3411_HAS_AVX__
	#define ALIGNED  ALIGN(32)
#else
	#error "for configuration set env variables or edit config.h"
#endif

#include <stdlib.h>

typedef ALIGNED union u512
{
    unsigned long long QWORD[8];
} u512_t;

ALIGNED typedef struct GOST34112012Context
{
    
    ALIGNED u512_t h;
    ALIGNED u512_t N;
    ALIGNED u512_t Sigma;
    ALIGNED unsigned char buffer[64];
    unsigned int bufsize;
    unsigned int digest_size;
#ifdef _DEBUG
	char	name[64];
#endif
} GOST34112012Context;

#define  CTX_FIELD(C, fn)		(unsigned char*)&((C)->fn)


void GOST34112012Dump(GOST34112012Context *CTX);

void GOST34112012Init(GOST34112012Context *CTX, const unsigned int digest_size);
void GOST34112012Update(GOST34112012Context *CTX, const unsigned char *data, size_t len); 

void GOST34112012Final(GOST34112012Context *CTX, unsigned char *digest); 

void GOST34112012Cleanup(GOST34112012Context *CTX);

void 
add_bytes(unsigned char* dst, const unsigned char* src);

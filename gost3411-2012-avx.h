
#ifndef _SSE41_H
#define _SSE41_H

#ifndef __GOST3411_HAS_AVX__
#error "require __GOST3411_HAS_AVX__ in config.h"
#endif

#include "gost3411-2012-precalc.h"

#include <mmintrin.h>
#include <emmintrin.h>
#include <smmintrin.h>
#include <immintrin.h>

#define STORE_YMM(M, ymm0, ymm1 ) \
	_mm256_store_si256((__m256i *) &(M->QWORD[0]), ymm0 ); \
	_mm256_store_si256((__m256i *) &(M->QWORD[4]), ymm1 ); 

#define LOAD_YMM(MP, ymm0, ymm1) \
	ymm0 = _mm256_load_si256((const __m256i *) &(MP->QWORD[0])); \
	ymm1 = _mm256_load_si256((const __m256i *) &(MP->QWORD[4])); 

#define LOADU_YMM(M, ymm0, ymm1) \
	ymm0 = _mm256_loadu_si256((const __m256i *) (M   )); \
	ymm1 = _mm256_loadu_si256((const __m256i *) (M+32)); 

#define XOR_YMM(MP, ymm0, ymm1) { \
	ymm0 = _mm256_xor_si256(ymm0, _mm256_load_si256((const __m256i *)  &(MP.QWORD[0])));\
	ymm1 = _mm256_xor_si256(ymm1, _mm256_load_si256((const __m256i *)  &(MP.QWORD[4])));\
}

#define XOR_YMM2( ymm0, ymm1, ymm2, ymm3) {\
	ymm0 = _mm256_xor_si256(ymm0, ymm2); \
	ymm1 = _mm256_xor_si256(ymm1, ymm3); \
}
/*
#define YMM_EXTRACT(shift, rr, ymm0, ymm1 ) {\
	rr  = Ax[0] [ (_mm256_extract_epi64(ymm0, 0) >> shift ) & 0xFF ];\
	rr ^= Ax[1] [ (_mm256_extract_epi64(ymm0, 1) >> shift ) & 0xFF ];\
	rr ^= Ax[2] [ (_mm256_extract_epi64(ymm0, 2) >> shift ) & 0xFF ];\
	rr ^= Ax[3] [ (_mm256_extract_epi64(ymm0, 3) >> shift ) & 0xFF ];\
	rr ^= Ax[4] [ (_mm256_extract_epi64(ymm1, 0) >> shift ) & 0xFF ];\
	rr ^= Ax[5] [ (_mm256_extract_epi64(ymm1, 1) >> shift ) & 0xFF ];\
	rr ^= Ax[6] [ (_mm256_extract_epi64(ymm1, 2) >> shift ) & 0xFF ];\
	rr ^= Ax[7] [ (_mm256_extract_epi64(ymm1, 3) >> shift ) & 0xFF ];\
}
*/
#define YMM_EXTRACT2(shift, outymm, ymm0, ymm1 ) {\
	register unsigned long long i = _mm256_extract_epi64(ymm0, 0) >> shift; \
	r0 = Ax[0][ i & 0xFF ]; \
	i=i>>8; \
	r1 = Ax[0][ i & 0xFF ]; \
	i=i>>8; \
	r2 = Ax[0][ i & 0xFF ]; \
	i=i>>8; \
	r3 = Ax[0][ i & 0xFF ];	\
	i = _mm256_extract_epi64(ymm0, 1) >> shift; \
	r0 ^= Ax[1][ i & 0xFF ]; \
	i=i>>8; \
	r1 ^= Ax[1][ i & 0xFF ]; \
	i=i>>8; \
	r2 ^= Ax[1][ i & 0xFF ]; \
	i=i>>8; \
	r3 ^= Ax[1][ i & 0xFF ]; \
	\
	i = _mm256_extract_epi64(ymm0, 2) >> shift; \
	r0 ^= Ax[2][ i & 0xFF ]; \
	i=i>>8; \
	r1 ^= Ax[2][ i & 0xFF ]; \
	i=i>>8; \
	r2 ^= Ax[2][ i & 0xFF ]; \
	i=i>>8; \
	r3 ^= Ax[2][ i & 0xFF ]; \
	\
	i = _mm256_extract_epi64(ymm0, 3) >> shift; \
	r0 ^= Ax[3][ i & 0xFF ]; \
	i=i>>8; \
	r1 ^= Ax[3][ i & 0xFF ]; \
	i=i>>8; \
	r2 ^= Ax[3][ i & 0xFF ]; \
	i=i>>8; \
	r3 ^= Ax[3][ i & 0xFF ]; \
	\
	i = _mm256_extract_epi64(ymm1, 0) >> shift; \
	r0 ^= Ax[4][ i & 0xFF ]; \
	i=i>>8; \
	r1 ^= Ax[4][ i & 0xFF ]; \
	i=i>>8; \
	r2 ^= Ax[4][ i & 0xFF ]; \
	i=i>>8; \
	r3 ^= Ax[4][ i & 0xFF ]; \
	\
	i = _mm256_extract_epi64(ymm1, 1) >> shift; \
	r0 ^= Ax[5][ i & 0xFF ]; \
	i=i>>8; \
	r1 ^= Ax[5][ i & 0xFF ]; \
	i=i>>8; \
	r2 ^= Ax[5][ i & 0xFF ]; \
	i=i>>8; \
	r3 ^= Ax[5][ i & 0xFF ]; \
	\
	i = _mm256_extract_epi64(ymm1, 2) >> shift; \
	r0 ^= Ax[6][ i & 0xFF ]; \
	i=i>>8; \
	r1 ^= Ax[6][ i & 0xFF ]; \
	i=i>>8; \
	r2 ^= Ax[6][ i & 0xFF ]; \
	i=i>>8; \
	r3 ^= Ax[6][ i & 0xFF ]; \
	\
	i = _mm256_extract_epi64(ymm1, 3) >> shift; \
	r0 ^= Ax[7][ i & 0xFF ]; \
	i=i>>8; \
	r1 ^= Ax[7][ i & 0xFF ]; \
	i=i>>8; \
	r2 ^= Ax[7][ i & 0xFF ]; \
	i=i>>8; \
	r3 ^= Ax[7][ i & 0xFF ]; \
	\
	outymm = _mm256_set_epi64x(r3, r2, r1, r0); \
}


#define YMM_LPS(ymm0, ymm1)  { \
    __m256i tx0, tx1; \
	YMM_EXTRACT2(0, tx0, ymm0, ymm1); \
	YMM_EXTRACT2(32, tx1, ymm0, ymm1); \
	ymm0 = tx0; ymm1 = tx1;  \
} 
/*
                                                     x i32 sh  i64 sh
    r0  = Ax[0][ _mm_extract_epi8(xmm0, 0 + 0)]; \   1  0  0   0   0
    r0 ^= Ax[1][ _mm_extract_epi8(xmm0, 0 + 8)]; \   1  2  0   1   0
    r0 ^= Ax[2][ _mm_extract_epi8(xmm1, 0 + 0)]; \   1  4  0   2   0
    r0 ^= Ax[3][ _mm_extract_epi8(xmm1, 0 + 8)]; \   1  6  0   3   0
    r0 ^= Ax[4][ _mm_extract_epi8(xmm2, 0 + 0)]; \   2  0  0   0   0
    r0 ^= Ax[5][ _mm_extract_epi8(xmm2, 0 + 8)]; \   2  2  0   1   0
    r0 ^= Ax[6][ _mm_extract_epi8(xmm3, 0 + 0)]; \   2  4  0   2   0
    r0 ^= Ax[7][ _mm_extract_epi8(xmm3, 0 + 8)]; \   2  6  0   3   0
	\
    r1  = Ax[0][ _mm_extract_epi8(xmm0, 0 + 1)]; \   1  0  1   0   1
    r1 ^= Ax[1][ _mm_extract_epi8(xmm0, 0 + 9)]; \   1  2  1   1   1
    r1 ^= Ax[2][ _mm_extract_epi8(xmm1, 0 + 1)]; \   1  4  1   2   1
    r1 ^= Ax[3][ _mm_extract_epi8(xmm1, 0 + 9)]; \   1  6  1   3   1
    r1 ^= Ax[4][ _mm_extract_epi8(xmm2, 0 + 1)]; \   2  0  1   0   1
    r1 ^= Ax[5][ _mm_extract_epi8(xmm2, 0 + 9)]; \   2  2  1   1   1
    r1 ^= Ax[6][ _mm_extract_epi8(xmm3, 0 + 1)]; \   2  4  1   2   1
    r1 ^= Ax[7][ _mm_extract_epi8(xmm3, 0 + 9)]; \   2  6  1   3   1
    
	tx0 = _mm_set_epi64x(r1, r0); \
	
	r0  = Ax[0][ _mm_extract_epi8(xmm0, 2 + 0)]; \   1  0  2   0   2
    r0 ^= Ax[1][ _mm_extract_epi8(xmm0, 2 + 8)]; \   1  2  2   1   2
    r0 ^= Ax[2][ _mm_extract_epi8(xmm1, 2 + 0)]; \   1  4  2   2   2
    r0 ^= Ax[3][ _mm_extract_epi8(xmm1, 2 + 8)]; \   1  6  2   3   2
    r0 ^= Ax[4][ _mm_extract_epi8(xmm2, 2 + 0)]; \   2  0  2   0   2
    r0 ^= Ax[5][ _mm_extract_epi8(xmm2, 2 + 8)]; \   2  2  2   1   2
    r0 ^= Ax[6][ _mm_extract_epi8(xmm3, 2 + 0)]; \   2  4  2   2   2
    r0 ^= Ax[7][ _mm_extract_epi8(xmm3, 2 + 8)]; \   2  6  2   3   2
	\ 
    r1  = Ax[0][ _mm_extract_epi8(xmm0, 2 + 1)]; \   1  0  3   0   3
    r1 ^= Ax[1][ _mm_extract_epi8(xmm0, 2 + 9)]; \   1  2  3   1   3
    r1 ^= Ax[2][ _mm_extract_epi8(xmm1, 2 + 1)]; \   1  4  3   2   3
    r1 ^= Ax[3][ _mm_extract_epi8(xmm1, 2 + 9)]; \   1  6  3   3   3
    r1 ^= Ax[4][ _mm_extract_epi8(xmm2, 2 + 1)]; \   2  0  3   0   3
    r1 ^= Ax[5][ _mm_extract_epi8(xmm2, 2 + 9)]; \   2  2  3   1   3
    r1 ^= Ax[6][ _mm_extract_epi8(xmm3, 2 + 1)]; \   2  4  3   2   3
    r1 ^= Ax[7][ _mm_extract_epi8(xmm3, 2 + 9)]; \   2  6  3   3   3
    \
	tx1 = _mm_set_epi64x(r1, r0); \
	
	----------------------------
	
	r0  = Ax[0][ _mm_extract_epi8(xmm0, 4 + 0)]; \   1  1  0   0   4
    r0 ^= Ax[1][ _mm_extract_epi8(xmm0, 4 + 8)]; \   1  3  0   1   4
    r0 ^= Ax[2][ _mm_extract_epi8(xmm1, 4 + 0)]; \   1  5  0
    r0 ^= Ax[3][ _mm_extract_epi8(xmm1, 4 + 8)]; \   1  7  0
    r0 ^= Ax[4][ _mm_extract_epi8(xmm2, 4 + 0)]; \   2  1  0
    r0 ^= Ax[5][ _mm_extract_epi8(xmm2, 4 + 8)]; \   2  3  0
    r0 ^= Ax[6][ _mm_extract_epi8(xmm3, 4 + 0)]; \   2  5  0
    r0 ^= Ax[7][ _mm_extract_epi8(xmm3, 4 + 8)]; \   2  7  0
	\
    r1  = Ax[0][ _mm_extract_epi8(xmm0, 4 + 1)]; \   1  1  1
    r1 ^= Ax[1][ _mm_extract_epi8(xmm0, 4 + 9)]; \   1
    r1 ^= Ax[2][ _mm_extract_epi8(xmm1, 4 + 1)]; \   1
    r1 ^= Ax[3][ _mm_extract_epi8(xmm1, 4 + 9)]; \   1
    r1 ^= Ax[4][ _mm_extract_epi8(xmm2, 4 + 1)]; \   2
    r1 ^= Ax[5][ _mm_extract_epi8(xmm2, 4 + 9)]; \   2
    r1 ^= Ax[6][ _mm_extract_epi8(xmm3, 4 + 1)]; \   2
    r1 ^= Ax[7][ _mm_extract_epi8(xmm3, 4 + 9)]; \   2
    \
	tx2 = _mm_set_epi64x(r1, r0); \
	
	
	r0  = Ax[0][ _mm_extract_epi8(xmm0, 6 + 0)]; \   1
    r0 ^= Ax[1][ _mm_extract_epi8(xmm0, 6 + 8)]; \   1
    r0 ^= Ax[2][ _mm_extract_epi8(xmm1, 6 + 0)]; \   1
    r0 ^= Ax[3][ _mm_extract_epi8(xmm1, 6 + 8)]; \   1
    r0 ^= Ax[4][ _mm_extract_epi8(xmm2, 6 + 0)]; \   2
    r0 ^= Ax[5][ _mm_extract_epi8(xmm2, 6 + 8)]; \   2
    r0 ^= Ax[6][ _mm_extract_epi8(xmm3, 6 + 0)]; \   2
    r0 ^= Ax[7][ _mm_extract_epi8(xmm3, 6 + 8)]; \   2
	\
    r1  = Ax[0][ _mm_extract_epi8(xmm0, 6 + 1)]; \   1           0   7
    r1 ^= Ax[1][ _mm_extract_epi8(xmm0, 6 + 9)]; \   1
    r1 ^= Ax[2][ _mm_extract_epi8(xmm1, 6 + 1)]; \   1
    r1 ^= Ax[3][ _mm_extract_epi8(xmm1, 6 + 9)]; \   1
    r1 ^= Ax[4][ _mm_extract_epi8(xmm2, 6 + 1)]; \   2
    r1 ^= Ax[5][ _mm_extract_epi8(xmm2, 6 + 9)]; \   2
    r1 ^= Ax[6][ _mm_extract_epi8(xmm3, 6 + 1)]; \   2
    r1 ^= Ax[7][ _mm_extract_epi8(xmm3, 6 + 9)]; \   2
    \
	tx3 = _mm_set_epi64x(r1, r0); \

*/
#endif
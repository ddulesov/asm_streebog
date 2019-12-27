// Copyright (c) 2020, Dmitry Dulesov  <dmitry.dulesov@gmail.com>
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#ifndef _AVX_H
#define _AVX_H

#ifndef __AVX2__
#error "require avx2 compiler support. gcc -mavx2 -dM -E - </dev/null"
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
#endif
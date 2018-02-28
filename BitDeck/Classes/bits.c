//
//  bits.c
//  BitDeck
//
//  Created by Ryan Lardinois on 2/27/18.
//

#include "bits.h"

static const uint32_t MultiplyDeBruijnBitPosition32[32] =
    {0, 1, 28, 2, 29, 14, 24, 3, 30, 22, 20, 15, 25, 17, 4, 8,
    31, 27, 13, 23, 21, 19, 16, 7, 26, 12, 18, 6, 11, 5, 10, 9};

uint32_t popcount32(uint32_t x) {
    return __builtin_popcount(x);
}

uint64_t popcount(uint64_t x) {
    return __builtin_popcountll(x);
    //return popcount32((uint32_t)x) + popcount32(x >> 32);
}

static uint32_t trailingZeros32(uint32_t x) {
    return __builtin_ctz(x);
    //return MultiplyDeBruijnBitPosition32[(((x & -x) * 0x077CB531U)) >> 27];
}

static uint64_t trailingZeros(uint64_t x) {
    return __builtin_ctzll(x);
    //uint32_t first = trailingZeros32((uint32_t)x);
    //return first == 0 ? 32 + trailingZeros32(x >> 32) : first;
}

static inline uint32_t deposit_bits32(uint32_t x, uint32_t mask, uint32_t b, uint32_t res) {
    return mask != 0 ? deposit_bits32(x, mask & (mask - 1), b << 1, ((x & b) ? (res | (mask & (-mask))) : res)) : res;
}

static inline uint64_t deposit_bits(uint64_t x, uint64_t mask, uint64_t b, uint64_t res) {
    return mask != 0 ? deposit_bits(x, mask & (mask - 1), b << 1, ((x & b) ? (res | (mask & (-mask))) : res)) : res;
}

extern inline uint32_t indexOfNthSetBit32(uint32_t x, uint32_t n) {
    return trailingZeros32(deposit_bits32(1 << n, x, 1, 0));
}
extern inline uint64_t indexOfNthSetBit(uint64_t x, uint64_t n) {
    return trailingZeros(deposit_bits(1U << n, x, 1, 0));
}


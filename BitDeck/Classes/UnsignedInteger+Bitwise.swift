//
//  UnsignedInteger+Bitwise.swift
//  BitDeck
//
//  Created by Ryan Lardinois on 2/23/18.
//

import Foundation

extension UnsignedInteger {
    
    /*
     * Counts the number of set bits in parallel. Based on the algorithms described
     * in Hackers Delight (2nd) by Henry S. Warren, Jr., pgs. 81-96.
     *
     * Runs in constant time with respect to the number of set bits.  Another
     * method may be preferable if it is known that only few bits are set.
     *
     */
    var popCount: Self {
        var i = self - (self >> 1) & 0x5555555555555555
        i = (i & 0x3333333333333333) + ((i >> 2) & 0x3333333333333333)
        i = (i + (i >> 4)) & 0x0f0f0f0f0f0f0f0f
        i += i >> 8
        i += i >> 16
        i += i >> 32
        return i & 0x7f
    }
}

extension UnsignedInteger {
    /*
     * Returns true if and only if this unsigned integer's nth bit is
     * set (i.e. is equal to 1).  Bits are zero indexed as normal.
     *
     *      let num: UInt64 = 0b1001_0000
     *      num.hasSetBit(4)
     *          // true
     *
     * - Parameters:
     *      n: any type that conforms to the Swift standard library's
     *         BinaryInteger protocol, which includes all of the basic
     *         integer types, including Int, UInt32, etc.
     *
     *         Note: To provide compatability with all integer types,
     *         any BinaryInteger can be provided, however, behavior
     *         of any n < 0 is undefined.
     *
     */
    func hasSetBit<N:BinaryInteger>(n: N) -> Bool {
        return ((self >> n) & 1) == 1
    }
}

extension UnsignedInteger {
    /*
     *
     */
    mutating func set(bit: Self) {
        self |= (1 << bit)
    }
}

extension UnsignedInteger {
    /*
     *
     */
    mutating func unset(bit: Self) {
        self &= ~(1 << bit)
    }
}

extension UnsignedInteger {
    /*
     * Creates an iterator that traverses the bits of the unsigned
     * integer in ascending order of bit index.  See the BitIterator
     * struct for more detail.
     *
     * With the extension, all conforming unsigned integers can
     * immediately declare conformance to Sequence.
     */
    public func makeIterator() -> BitIterator<Self> {
        return BitIterator(self)
    }
}

/*
 * An iterator for traversing the set bits of an unsigned integer.
 * Proceeds from the least significant set bit (lowest index or rightmost)
 * to the most significant set bit (highest index or leftmost).  Returns
 * the index of the current bit.  The type of the bit will be that of the
 * integer traversed.
 *
 */
public struct BitIterator<N:UnsignedInteger>: IteratorProtocol {
    
    // Holds the remaining bits to be iterated through. After each call to
    // next(), the returned bit is zeroed from the integer.
    // The next() method will return nil once the integer value is
    // zero (no more set bits).
    private var integer: N
    
    init(_ integer: N) {
        self.integer = integer
    }
    mutating public func next() -> N? {
        if integer == 0 { return nil }
        let nextBit = integer.trailingZeroBitCount
        integer &= (1 << nextBit)
        return integer
    }
}

func sdf() {
    
}

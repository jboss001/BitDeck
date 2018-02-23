//
//  BitCard.swift
//  BitDeck
//
//  Created by Ryan Lardinois on 2/23/18.
//

import Foundation

enum BitSuit: UInt64 {
    case diamonds = 0x1FFF
    case hearts = 0x3FFD000
    case clubs = 0x7FFC000000
    case spades = 0xFFF8000000000
}

/* Each bit index zero to fifty-one of a 64-bit integer represents
 * one of the fifty-two cards of the playing card deck.
 *
 * 0  : 2♦︎     13 : 2♥︎     26 : 2♣︎      39 : 2♠︎
 * 1  : 3♦︎     14 : 3♥︎     27 : 3♣︎      40 : 3♠︎
 * 2  : 4♦︎     15 : 4♥︎     28 : 4♣︎      41 : 4♠︎
 * 3  : 5♦︎     16 : 5♥︎     29 : 5♣︎      42 : 5♠︎
 * 4  : 6♦︎     17 : 6♥︎     30 : 6♣︎      43 : 6♠︎
 * 5  : 7♦︎     18 : 7♥︎     31 : 7♣︎      44 : 7♠︎
 * 6  : 8♦︎     19 : 8♥︎     32 : 8♣︎      45 : 8♠︎
 * 7  : 9♦︎     20 : 9♥︎     33 : 9♣︎      46 : 9♠︎
 * 8  : T♦︎     21 : T♥︎     34 : T♣︎      47 : T♠︎
 * 9  : J♦︎     22 : J♥︎     35 : J♣︎      48 : J♠︎
 * 10 : Q♦︎     23 : Q♥︎     36 : Q♣︎      49 : Q♠︎
 * 11 : K♦︎     24 : K♥︎     37 : K♣︎      50 : K♠︎
 * 12 : A♦︎     25 : A♥︎     38 : A♣︎      51 : A♠︎
 *
 */
typealias BitCard = UInt64

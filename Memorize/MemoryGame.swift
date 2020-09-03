//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ryan Yu on 9/1/20.
//  Copyright © 2020 Ryan. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose (card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }
    
    struct Card: Identifiable{
        var isFacedUp = true
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}

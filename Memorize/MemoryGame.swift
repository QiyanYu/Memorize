//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ryan Yu on 9/1/20.
//  Copyright © 2020 Ryan. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    var indexOfTheOneAndOnlyFacedUp: Int? {
        get {
            cards.indices.filter { cards[$0].isFacedUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = index == newValue
            }
        }
    }
    
    mutating func choose (card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFacedUp, !cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheOneAndOnlyFacedUp {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFacedUp = true
            } else {
                indexOfTheOneAndOnlyFacedUp = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable{
        var isFacedUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}

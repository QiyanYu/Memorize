//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ryan Yu on 9/1/20.
//  Copyright © 2020 Ryan. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    private(set) var theme: Theme
    private(set) var score = 0
    private var time = Date.init()
    private var indexOfTheOneAndOnlyFacedUp: Int? {
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
                    let interval = time.timeIntervalSinceNow
                    print("interval \(interval)")
                    print("Double interval \(Double(interval))")
                    score += max(Int(6 + Double(interval)), 2)
                } else {
                    if cards[chosenIndex].isSeen {
                        score -= 1
                    }
                    if cards[potentialMatchIndex].isSeen {
                        score -= 1
                    }
                }
                self.cards[chosenIndex].isFacedUp = true
                self.cards[chosenIndex].isSeen = true
                self.cards[potentialMatchIndex].isSeen = true
            } else {
                indexOfTheOneAndOnlyFacedUp = chosenIndex
                time = Date.init()
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, theme: Theme, cardContentFactory: (Int) -> CardContent) {
        self.theme = theme
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
        var isSeen = false
        var content: CardContent
        var id: Int
    }
}

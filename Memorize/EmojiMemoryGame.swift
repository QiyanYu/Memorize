//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ryan Yu on 9/2/20.
//  Copyright © 2020 Ryan. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let theme = Theme(chooseTheme: Int.random(in: 1...6))
        
        return MemoryGame<String> (numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    //MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

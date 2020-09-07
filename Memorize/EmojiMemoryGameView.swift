//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ryan Yu on 9/1/20.
//  Copyright © 2020 Ryan. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid (viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
        		.padding(5)
        }
        .foregroundColor(Color.orange)
        .padding()
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFacedUp {
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .stroke(lineWidth: self.edgeLineWidth)
                Text(self.card.content)
            }else{
                if !card.isMatched {
                	RoundedRectangle(cornerRadius: self.cornerRadius).fill()
                }
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    //MARK： - Drawing Constants
    
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}    

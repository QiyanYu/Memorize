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
        HStack{
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(Color.orange)
        .padding()
//        .font(viewModel.cards.count == 5*2 ? Font.body : Font.largeTitle)
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
            if(self.card.isFacedUp){
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .stroke(lineWidth: self.edgeLineWidth)
                Text(self.card.content)
            }else{
                RoundedRectangle(cornerRadius: self.cornerRadius).fill()
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

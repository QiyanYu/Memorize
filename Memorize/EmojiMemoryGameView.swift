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
        let theme = self.viewModel.getTheme()
        return VStack {
            HStack{
                Text(theme.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("LizardDark"), Color("LizardLight")]), startPoint: .leading, endPoint: .trailing))
                    
                Text("Score ")
                    .font(.title)
                    .fontWeight(.bold)
            }
            Divider()
            
            Grid (viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .padding(5)
            }
            .foregroundColor(theme.color)
            	.padding()
        	
            Divider()
            Button(action: {
                self.viewModel.restart()
            }) {
                HStack{
                    Image(systemName: "play")
                        .font(.largeTitle)
                    Text("NEW GAME")
                        .fontWeight(.semibold)
                        .font(.title)
                }
            	.padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color("OrangeMasterCardDark"), Color("OrangeMasterCardLight")]), startPoint: .leading, endPoint: .trailing))
            	.cornerRadius(40)
            }
        }
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

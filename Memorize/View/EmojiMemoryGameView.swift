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
            VStack{
                Text(theme.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("LizardDark"), Color("LizardLight")]), startPoint: .leading, endPoint: .trailing))
                    
                Text("Score: \(viewModel.getScore())")
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
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFacedUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(100 - 90), clockwise: true) // lefttop is (0, 0) in IOS
                    .padding(5)
                    .opacity(0.4)
                Text(self.card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFacedUp: card.isFacedUp)
        }
    }
    
    //MARK： - Drawing Constants

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}    

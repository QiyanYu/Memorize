//
//  Theme.swift
//  Memorize
//
//  Created by Ryan Yu on 9/7/20.
//  Copyright © 2020 Ryan. All rights reserved.
//

import SwiftUI

struct Theme {
    var name: String
    var color: Color
    var emojis: [String]
    var numberOfPairs = Int.random(in: 2...5)
    
    init(chooseTheme: Int) {
        switch chooseTheme {
        case 1:
            (self.name, self.color, self.emojis) =
                ("animal", Color.yellow, ["🐻","🦊","🐶","🐱","🐭","🐼","🐨","🐯","🦁","🐮","🐷","🐸"])
        case 2:
            (self.name, self.color, self.emojis) =
                ("halloween", Color.orange, ["🎃","👻","🕷","🕸","🌚","☠️","🧹","🦇","💀","🏴‍☠️","🌪","🧟‍♂️"])
        case 3:
            (self.name, self.color, self.emojis) =
                ("plant", Color.green, ["🌵","🌲","🌳","🌴","🌱","🎋","☘️","🍀","🌿","🍃","🍂","🍁"])
        case 4:
            (self.name, self.color, self.emojis) =
                ("fruit", Color.pink, ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🍈","🍒","🍑"])
        case 5:
            (self.name, self.color, self.emojis) =
                ("sports", Color.blue, ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🪀","🏓"])
        case 6:
            (self.name, self.color, self.emojis) =
                ("nationflag", Color.gray, ["🇩🇿","🇦🇸","🇦🇹","🇦🇿","🇧🇪","🇧🇯","🇻🇬","🇰🇾","🇨🇦","🇨🇱","🇨🇳","🇨🇻"])
        default:
        	(self.name, self.color, self.emojis) =
                ("ERROR",Color.black,[]) //TODO: Bogus!
        }
    }
}


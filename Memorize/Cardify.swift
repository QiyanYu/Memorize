//
//  Cardify.swift
//  Memorize
//
//  Created by Ryan Yu on 10/8/20.
//  Copyright © 2020 Ryan. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier{
    var isFacedUp: Bool
    
    func body(content: Content) -> some View {
        ZStack{
            if isFacedUp {
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .stroke(lineWidth: self.edgeLineWidth)
                content
            }else{
            	RoundedRectangle(cornerRadius: self.cornerRadius).fill()
        	}
        }
    }
    
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify(isFacedUp: Bool) -> some View{
        self.modifier(Cardify(isFacedUp: isFacedUp))
    }
}

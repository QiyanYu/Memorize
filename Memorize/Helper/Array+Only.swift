//
//  Array+Only.swift
//  Memorize
//
//  Created by Ryan Yu on 9/7/20.
//  Copyright © 2020 Ryan. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil 
    }
}

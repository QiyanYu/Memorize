//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Ryan Yu on 9/6/20.
//  Copyright © 2020 Ryan. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if matching.id == self[index].id{
                return index
            }
        }
        return nil
    }
}

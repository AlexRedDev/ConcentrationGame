//
//  Card.swift
//  ConcentrationGame
//
//  Created by Alex Cheipesh on 11.05.2021.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var indetifier: Int
    
    private static var indetifierNumber = 0
    
    static func idetifierGenerator() -> Int {
        indetifierNumber += 1
        return indetifierNumber
    }
    
    init() {
        self.indetifier = Card.idetifierGenerator()
    }
}

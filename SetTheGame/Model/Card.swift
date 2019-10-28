//
//  Card.swift
//  SetTheGame
//
//  Created by Max on 28/10/2019.
//

import Foundation

struct Card {
    var isMatched = false
    var cardId: Int
    

    var shape = ""
    var color = ""
    var fill = ""
    var number = 0
    
    private static var cardIdFactory = 0
    
    private static func getUniqueId() -> Int{
        cardIdFactory += 1
        return cardIdFactory
    }
    
    
    init() {
        self.cardId = Card.getUniqueId()
    }
}

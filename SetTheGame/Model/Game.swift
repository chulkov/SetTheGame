//
//  Game.swift
//  SetTheGame
//
//  Created by Max on 28/10/2019.
//

import Foundation

class Game {
    
    private(set) var cards = [Card]()
    
    
    
    
    init() {
        for _ in 1...81{
            cards.append(Card())
        }
        
        
    }
    
}

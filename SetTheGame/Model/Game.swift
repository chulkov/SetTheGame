//
//  Game.swift
//  SetTheGame
//
//  Created by Max on 28/10/2019.
//

import Foundation

class Game {
    
    private(set) var cards = [Card]()
    private(set) var cardsOnTable = [Card]()

    
    private func initTable() {
        if cards.count > 0{
            for _ in 1...12{
                cardsOnTable.append(cards.remove(at: cards.randomIndex))
            }
        }
        
        
    }
    
    init() {
        for color in Card.Color.all{
            for shape in Card.Shape.all{
                for fill in Card.Fill.all{
                    for number in Card.Number.all{
                        let card = Card(s: shape, c: color, f: fill, n: number)
                        cards.append(card)
                    }
                }
            }
        }
        
        initTable()
    }
    
}
extension Array {
    var randomIndex: Int {
        return Int(arc4random_uniform(UInt32(count - 1)))
    }
}

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
    private var selectedCard = [Card]()
    private(set) var score = 0
    var hintCard = [Int]()
    
    
    func chooseCard(at index: Int) {
        if selectedCard.contains(cardsOnTable[index]) {
            selectedCard.remove(at: selectedCard.firstIndex(of: cardsOnTable[index])!)
            return
        }
        if selectedCard.count == 3 {
            if isSet(on: selectedCard) {
                for card in selectedCard {
                    cardsOnTable.remove(at: cardsOnTable.firstIndex(of: card)!)
                }
                
                selectedCard.removeAll()
                draw()
                score += 1
            } else {
                selectedCard.removeAll()
                score -= 1
            }
        }
        selectedCard += [cardsOnTable[index]]
        print(selectedCard)
    }
    
    
    func hint() {
        hintCard.removeAll()
        for i in 0..<cardsOnTable.count {
            for j in (i + 1)..<cardsOnTable.count {
                for k in (j + 1)..<cardsOnTable.count {
                    let hints = [cardsOnTable[i], cardsOnTable[j], cardsOnTable[k]]
                    if isSet(on: hints) {
                        hintCard += [i, j, k]
                    }
                }
            }
        }
    }
    
    func draw() {
        if cards.count > 0 {
            for _ in 1...3 {
                cardsOnTable += [cards.remove(at: cards.randomIndex)]
            }
        }
    }
    
    
    func isSet(on selectedCard: [Card]) -> Bool {
        
        let color = Set(selectedCard.map{ $0.color }).count
        let shape = Set(selectedCard.map{ $0.shape }).count
        let number = Set(selectedCard.map{ $0.number }).count
        let fill = Set(selectedCard.map{ $0.fill }).count
        
        
        return color != 2 && shape != 2 && number != 2 && fill != 2
    }
    
    
    
    
    
    
    private func initTable() {
        for _ in 1...4 {
            draw()
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

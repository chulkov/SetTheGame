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
    

    var shape : Shape
    var color : Color
    var fill : Fill
    var number : Number
    
    private static var cardIdFactory = 0
    
    private static func getUniqueId() -> Int{
        cardIdFactory += 1
        return cardIdFactory
    }
    
    enum Shape: String {
        case square = "square"
        case circle = "circle"
        case triangle = "triangle"
        static let all = [Shape.square, .circle, .triangle]
    }
    
    enum Color: String {
        case red = "red"
        case blue = "blue"
        case green = "green"
        static let all = [Color.red, .blue, .green]
    }
    
    enum Fill: String {
        case solid = "solid"
        case empty = "empty"
        case stripe = "stripe"
        static let all = [Fill.solid, .empty, .stripe]
    }
    
    enum Number : Int {
        case one = 1
        case two = 2
        case three = 3
        static let all = [Number.one, .two, .three]
    }
    
    
    
    
    
    
    init(s: Shape, c: Color, f: Fill, n: Number ) {
        self.cardId = Card.getUniqueId()
        self.color = c
        self.shape = s
        self.fill = f
        self.number = n
    }
}

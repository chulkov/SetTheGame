//
//  ViewController.swift
//  SetTheGame
//
//  Created by Max on 28/10/2019.
//

import UIKit

class ViewController: UIViewController {
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        for card in cardButtons{
            card.titleLabel!.font = card.titleLabel!.font.withSize(21)
            card.layer.cornerRadius = 8.0
            card.titleLabel?.numberOfLines = 3
            
        }
    }
    
    @IBAction func newGameAction(_ sender: UIButton) {
        startNewGame()
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    func startNewGame() {
        game = Game()
        updateView()
    }
    
    func updateView(){
        for index in game.cardsOnTable.indices{
            cardButtons[index].setAttributedTitle(setCardTitle(with: game.cardsOnTable[index]), for: .normal)
            cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    
    
    
    
    func setCardTitle(with card: Card) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeColor: ModelToView.colors[card.color]!,
            .strokeWidth: ModelToView.strokeWidth[card.fill]!,
            .foregroundColor: ModelToView.colors[card.color]!.withAlphaComponent(ModelToView.alpha[card.fill]!),
        ]
        var cardTitle = ModelToView.shapes[card.shape]!
        switch card.number {
        case .two: cardTitle = "\(cardTitle)\n\(cardTitle)"
        case .three: cardTitle = "\(cardTitle)\n\(cardTitle)\n\(cardTitle)"
        default:
            break
        }
        
        return NSAttributedString(string: cardTitle, attributes: attributes)
    }
}







struct ModelToView {
    
    static let shapes: [Card.Shape: String] = [.circle: "●", .triangle: "▲", .square: "■"]
    static var colors: [Card.Color: UIColor] = [.red: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), .blue: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), .green: #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)]
    static var alpha: [Card.Fill: CGFloat] = [.solid: 1.0, .empty: 0.40, .stripe: 0.15]
    static var strokeWidth: [Card.Fill: CGFloat] = [.solid: -5, .empty: 5, .stripe: -5]
}

var cardsOnDesk = [Int:NSAttributedString]()

    






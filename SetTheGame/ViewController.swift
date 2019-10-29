//
//  ViewController.swift
//  SetTheGame
//
//  Created by Max on 28/10/2019.
//

import UIKit

class ViewController: UIViewController {
    var game = Game()
    private var selectedButton = [UIButton]()
    
    private var hintedButton = [UIButton]()
    @IBOutlet weak var scoreLabel: UILabel!
    
    
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
    
    
    @IBAction func cardsButtonPressed(_ sender: UIButton) {
        
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            if cardIndex < game.cardsOnTable.count {
                game.chooseCard(at: cardIndex)
                chooseButton(at: sender)
                updateView()
            }
        } else {
            print("chosen card was not in cardButtons")
        }
        //print(selectedButton.count)
    }
    
    @IBAction private func hintButtonPressed(_ sender: UIButton) {
        game.hint()
        if game.hintCard.count > 0 {
            for hint in 0...2 {
                let index = game.hintCard[hint]
                cardButtons[index].layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
                cardButtons[index].layer.borderWidth = 3.0
                hintedButton.append(cardButtons[index])
            }
            hintedButton.removeAll()
        }
    }
    
    
    
    private func updateScore() {
        scoreLabel.text = "\(game.score)"
    }
    
    private func chooseButton(at card: UIButton) {
        if selectedButton.contains(card) {
            card.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            card.layer.borderWidth = 3.0
            selectedButton.remove(at: selectedButton.firstIndex(of: card)!)
            return
        } else if selectedButton.count == 3 {
            cardButtons.forEach() { $0.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0) }
            selectedButton.removeAll()
            updateScore()
        }
        selectedButton += [card]
        card.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        card.layer.borderWidth = 3.0
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

//var cardsOnDesk = [Int:NSAttributedString]()

    






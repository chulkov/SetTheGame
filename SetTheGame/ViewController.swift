//
//  ViewController.swift
//  SetTheGame
//
//  Created by Max on 28/10/2019.
//

import UIKit

class ViewController: UIViewController {
    let game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        for card in cardButtons{
            card.titleLabel!.font = card.titleLabel!.font.withSize(30)
            card.layer.cornerRadius = 8.0
            card.titleLabel?.numberOfLines = 3

        }
    }

    @IBAction func newGameAction(_ sender: UIButton) {
        startNewGame()
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    func startNewGame() {
        cardsOnDesk.removeAll()
        updateView()
    }
    
    func updateView(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            button.setAttributedTitle(randomSetCard(for: card), for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    private var shape = ["▲", "●", "■"]
    private var color = [#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 0.1487585616), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 0.1464041096), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 0.1522902397)]
     private var fill = [4.0, -1.0]
    
    private var cardsOnDesk = [Int:NSAttributedString]()
    
    private func randomSetCard(for card: Card) -> NSAttributedString {
        
        if cardsOnDesk[card.cardId] == nil {
            
            
            let chosenShape = shape.randomElement() ?? "?"
            var finalImage = ""
            for _ in 0...Int.random(in: 0..<3){
                finalImage.append(chosenShape)
            }
            
            
            let font = UIFont.systemFont(ofSize: 36)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            paragraphStyle.firstLineHeadIndent = 5.0
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: color.randomElement() ?? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                .strokeWidth: fill.randomElement() ?? 1.0
            ]
            
            let attributedQuote = NSAttributedString(string: finalImage , attributes: attributes)
            
            
            
            cardsOnDesk[card.cardId] = attributedQuote
        }
        return cardsOnDesk[card.cardId] ?? NSAttributedString.init(string: "?")
    }
}


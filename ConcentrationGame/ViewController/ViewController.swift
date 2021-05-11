//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Alex Cheipesh on 10.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toucheLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!
    
    private lazy var game = ConcentrationGame(numberOfPairsOfCards: (buttonCollection.count + 1) / 2)
    private var emojiCollection = ["🦊", "🐹", "🐻", "🐸"];
    private var emojiDictionary = [Int: String]()
    
    private var touches = 0 {
        didSet {
            toucheLabel.text = "Touches: \(touches)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize ButtonCard
        for button in buttonCollection {
            button.layer.cornerRadius = 15
        }
        
    }
    
    func emojiIndetifier(for card: Card) -> String {
        if emojiDictionary[card.indetifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.indetifier] = emojiCollection.remove(at: randomIndex)
            
        }
        return emojiDictionary[card.indetifier] ?? "?"
        
    }
    
    private func updateViewFromModel() -> Void {
        
        for index in buttonCollection.indices {
            
            let button = buttonCollection[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emojiIndetifier(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 0): #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
            }
        }
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.choseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
}


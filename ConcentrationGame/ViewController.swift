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
    
    private let emojiCollection = ["🦊", "🐹", "🐻", "🐸"];
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
    
    func flipButton(emoji: String, button: UIButton) -> Void {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            flipButton(emoji: emojiCollection[buttonIndex], button: sender)
        }
    }
}


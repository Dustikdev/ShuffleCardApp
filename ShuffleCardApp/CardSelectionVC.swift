//
//  ViewController.swift
//  ShuffleCardApp
//
//  Created by Никита Швец on 09.11.2022.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var rulesButton: UIButton!
    
    var timer: Timer!
    let myDeck = Deck.valuesOfCards
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomCard() {
        cardImageView.image = myDeck.randomElement() ?? UIImage(named: "AS")
    }

    @IBAction func stopButtonTap(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTap(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
    @IBAction func rulesButtonTap(_ sender: UIButton) {
        let SB = UIStoryboard(name: "Main", bundle: nil)
        let userVC = SB.instantiateViewController(withIdentifier: "rulesVC") as! RulesVC
        present(userVC, animated: true)
    }
    
    
    func configureButtons() {
        stopButton.layer.cornerRadius = 8
        restartButton.layer.cornerRadius = 8
        rulesButton.layer.cornerRadius = 8
    }
}





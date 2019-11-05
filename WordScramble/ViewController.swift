//  ViewController.swift
//  WordScramble
//

import UIKit

class ViewController: UIViewController {
  
  let wordManager = WordManager()
  let gameManager = GameManager()
  
  @IBOutlet weak var scrambledDisplay: UILabel!
  @IBOutlet weak var guessWord: UITextField!
  @IBOutlet weak var countDisplay: UILabel!
  @IBOutlet weak var correctDisplay: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startNewRound()
  }
  
  @IBAction func guessTapped() {
    gameManager.evaluateGuess(guessedWord: guessWord.text!, actualWord: wordManager.currentWord!.text)
    generateAlert()
  }
  
  func updateLabels() {
    countDisplay.text = String(gameManager.numGuesses)
    correctDisplay.text = String(gameManager.numCorrect)
    scrambledDisplay.text = wordManager.currentWord!.scrambled()
    guessWord.text = ""
  }
  
  func generateAlert() {
    let title = gameManager.determineTitle()
    let message = gameManager.generateMessage(actualWord: wordManager.currentWord!.text)
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: { action in self.startNewRound() })
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  func startNewRound() {
    wordManager.drawRandomWord()
    updateLabels()
  }
}


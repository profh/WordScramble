//  GameManager.swift
//  WordScramble
//

import Foundation

class GameManager {
  
  var numCorrect: Int
  var numGuesses: Int
  var correct: Bool
  
  init(){
    numCorrect = 0
    numGuesses = 0
    correct = false
  }
  
  func evaluateGuess(guessedWord: String, actualWord: String) {
    numGuesses += 1
    if actualWord == guessedWord {
      numCorrect += 1
      correct = true
    } else {
      correct = false
    }
  }
  
  func determineTitle() -> String {
    var title: String = ""
    if correct {
      title = "You Got It Right!"
    } else {
      title = "Sorry, but no..."
    }
    return title
  }
  
  func generateMessage(actualWord: String) -> String {
    let message = "The word was: \(actualWord) \nBest luck on the next word."
    return message
  }
  
}

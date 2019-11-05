//  WordManager.swift
//  WordScramble
//

import Foundation

class WordManager {
  
  var allWords: [Word]?
  var currentWord: Word?
  var guessedWord: String?
  
  init(){
    let words = getWordData()
    self.allWords = words.map{ Word(text: $0) }
    drawRandomWord()
  }
  
  func getWordData() -> [String] {
    var allWords: [String]
    if let startWordsPath = Bundle.main.path(forResource: "startWords", ofType: "txt") {
      var startWords: String?
      do {
        startWords = try String(contentsOfFile: startWordsPath)
//        startWords = try String(contentsOfFile: startWordsPath, usedEncoding: nil)
      } catch _ {
        startWords = nil
      }
      allWords = startWords!.components(separatedBy: "\n")
    } else {
      allWords = ["silkworm"]  // an array of one 8-letter word (as opposed to six letters in startWords)
    }
    return allWords
  }
  
  func drawRandomWord() {
    let wordCount = allWords!.count
    currentWord = allWords![Int(arc4random_uniform(UInt32(wordCount - 1)))]
  }
  
}

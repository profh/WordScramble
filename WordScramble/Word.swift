//  Word.swift
//  WordScramble
//

import Foundation

extension Array {
  // this method shuffles order of items in an array
  func shuffled() -> [Element] {
    if count < 2 { return self }
    var list = self
    for i in 0..<(list.count - 2) {
      let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
      if i != j {
        list.swapAt(i, j)
      }
    }
    return list
  }
}

class Word {
  
  var text: String
  
  init(text: String){
    self.text = text
  }
  
  func scrambled() -> String {
    let arrayText = Array(self.text.characters)
    let shuffledArray = arrayText.shuffled()
    let shuffledText = String(shuffledArray)
    return shuffledText
  }
}

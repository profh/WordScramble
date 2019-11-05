//
//  WordManagerTests.swift
//  WordScramble
//

import XCTest
@testable import WordScramble

class WordManagerTests: XCTestCase {
  
  let wordManager = WordManager()
  
  func testDrawRandomWordMethod() {
    // this method set currentWord to a randomly drawn word using the arc4random_uniform() fn
    // arc4random_uniform(upper_bound: UInt32) will return a uniformly distributed random 
    // integer less than upper_bound
    let current = wordManager.currentWord!.text
    wordManager.drawRandomWord()
    let newWord = wordManager.currentWord!.text
    
    XCTAssertNotEqual(current, "silkworm")
    XCTAssertNotEqual(newWord, "silkworm")
    XCTAssertNotEqual(newWord, current)
  
  }
}
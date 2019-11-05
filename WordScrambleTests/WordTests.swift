//
//  WordTests.swift
//  WordScramble
//

import XCTest
@testable import WordScramble

class WordTests: XCTestCase {
  
  let word = Word(text: "starship")  
  
  func testScrambledMethod() {
    let scrambled = word.scrambled()
    XCTAssertEqual(word.text.characters.count, 8)
    XCTAssertEqual(scrambled.characters.count, 8)
    XCTAssertNotEqual(scrambled, word.text)
  }

}
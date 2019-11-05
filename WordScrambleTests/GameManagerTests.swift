//
//  GameManagerTests.swift
//  WordScramble
//

import XCTest
@testable import WordScramble

class GameManagerTests: XCTestCase {
  
  let gameManager = GameManager()
  
  func testEvaluateGuessMethod() {
    XCTAssertEqual(gameManager.numGuesses,0)
    XCTAssertEqual(gameManager.numCorrect,0)
    gameManager.evaluateGuess("fred", actualWord: "fred")
    XCTAssertEqual(gameManager.numGuesses,1)
    XCTAssertEqual(gameManager.numCorrect,1)
    gameManager.evaluateGuess("derf", actualWord: "fred")
    XCTAssertEqual(gameManager.numGuesses,2)
    XCTAssertEqual(gameManager.numCorrect,1)
  }
  
  func testDetermineTitleMethod() {
    gameManager.evaluateGuess("fred", actualWord: "fred")
    var title = gameManager.determineTitle()
    XCTAssertEqual(title,"You Got It Right!")
    gameManager.evaluateGuess("derf", actualWord: "fred")
    title = gameManager.determineTitle()
    XCTAssertEqual(title,"Sorry, but no...")
  }
  
  func testGenerateMessageMethod() {
    let resultMsg = gameManager.generateMessage("actualWord")
    let actualMsg = "The word was: actualWord \nBest luck on the next word."
    XCTAssertEqual(resultMsg, actualMsg)
  }
  
}

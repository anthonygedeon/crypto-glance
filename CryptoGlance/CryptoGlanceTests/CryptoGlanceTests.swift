//
//  CryptoGlanceTests.swift
//  CryptoGlanceTests
//
//  Created by Anthony Gedeon on 2/11/21.
//

import XCTest
@testable import CryptoGlance

class CryptoGlanceTests: XCTestCase {
    
    let bigNumber = 1.2345678

    func testTruncation() {
        let shortenFloat = bigNumber.truncate()
        let expected = String(1.23)
        XCTAssertEqual(shortenFloat, expected)
    }
    
    func testTruncationBy3() {
        let shortenFloat = bigNumber.truncate(to: "%.3f")
        let expected = String(1.234)
        XCTAssertEqual(shortenFloat, expected)
    }
    
    func testTruncationBy4() {
        let shortenFloat = bigNumber.truncate(to: "%.3f")
        let expected = String(1.2345)
        XCTAssertEqual(shortenFloat, expected)
    }
    
    func testTruncationBy5() {
        let shortenFloat = bigNumber.truncate(to: "%.4f")
        let expected = String(1.2345)
        XCTAssertEqual(shortenFloat, expected)
    }

}

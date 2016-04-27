//
//  MarvelAuthenticationTests.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/19/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import XCTest
@testable import Marvel

class MarvelAuthenticationTests: XCTestCase {

    // SUT: stands for - System Under Test.
    var sut:MarvelFactory?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        sut = MarvelFactory()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()

        sut = nil
    }

    func testTimestamp_ShouldNotChangeOnTheSameInstance() {
        let ts1 = sut?.generateTimeStamp()
        let ts2 = sut?.generateTimeStamp()

        XCTAssertEqual(ts1, ts2)
    }

    func testTimestamp_ShouldChangeAcrossDifferentInstances() {
        let ts1 = MarvelFactory().generateTimeStamp()
        let ts2 = MarvelFactory().generateTimeStamp()

        XCTAssertNotEqual(ts1, ts2)
    }

    func testPublicKey_ShouldHave32Characters() {
        let key = sut!.KMarvelFactory_PublicKey
        XCTAssertEqual(key.characters.count, 32)
    }

    func testPrivateKey_ShouldHave40Characters() {
        let key = sut!.KMarvelFactory_PrivateKey
        XCTAssertEqual(key.characters.count, 40)
    }

    func testMD5OfKnownString_ShouldYieldKnownResult() {

        let md5 = sut?.calculateMD5("abc")
        XCTAssertEqual(md5, "900150983cd24fb0d6963f7d28e17f72")
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}

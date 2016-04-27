//
//  ListInteractorTests.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/26/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import XCTest
@testable import Marvel

class ListInteractorTests: XCTestCase {

    // Mock object from ListPresenter

    class PresenterMock: ListPresenter {

    }

    // Mock Factory class 
    class MarvelFactoryMock: MarvelFactory {
    }

    // SUT: stands for - System Under Test.
    var sut: ListInteractor!
    var presenterMock: PresenterMock!
    var marvelFactoryMocked: MarvelFactoryMock!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        marvelFactoryMocked = MarvelFactoryMock()

        sut = ListInteractor(marvelgateway: marvelFactoryMocked)
        presenterMock = PresenterMock()
        sut.output = presenterMock
        presenterMock.listInteractor = sut
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()

        sut = nil
        presenterMock = nil
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

    func testGettingCharacters() {

        let expectation = expectationWithDescription("Get Characters")
        
        sut.gateway?.characters(10, completionHandler: { (characters) in

            XCTAssertNotNil(characters, "characters should not be nil")

            expectation.fulfill()

            }, failure: { (error) in

        })

        waitForExpectationsWithTimeout(20) { (error) in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }

        }
    }
    
}

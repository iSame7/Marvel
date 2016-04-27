//
//  FilterInteractorTests.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/26/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import XCTest
@testable import Marvel

class FilterInteractorTests: XCTestCase {

    // Mock ListPresenter Class
    class PresenterMock: FilterPresenter {

    }

    // Mock Factory class
    class MarvelFactoryMock: MarvelFactory {
    }

    // SUT: stands for - System Under Test.
    var sut: FilterInteractor!
    var presenterMock: PresenterMock!
    var marvelFactoryMocked: MarvelFactoryMock!

    let characterNameToFilter = "Abyss"

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        marvelFactoryMocked = MarvelFactoryMock()

        sut = FilterInteractor(marvelgateway: marvelFactoryMocked)
        presenterMock = PresenterMock()
        sut.output = presenterMock
        presenterMock.filterInteractor = sut

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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

    func testFilterCharacters() {

        let expectation = expectationWithDescription("Filter Characters")

        sut.gateway!.filterCharacters(10, name: characterNameToFilter, completionHandler: { (characters) in

            XCTAssertNotNil(characters, "characters should not be nil")

            expectation.fulfill()

        }) { (error) -> Void in
        }

        waitForExpectationsWithTimeout(20) { (error) in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
        }
    }
    
}

//
//  DetailsInteractorTests.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/26/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import XCTest
@testable import Marvel

class DetailsInteractorTests: XCTestCase {
    
    // Mock ListPresenter Class
    class PresenterMock: DetailsPresenter {

    }

    // Mock Factory class
    class MarvelFactoryMock: MarvelFactory {
    }

    // SUT: stands for - System Under Test.
    var sut: DetailsInteractor!
    var presenterMock: PresenterMock!
    var marvelFactoryMocked: MarvelFactoryMock!

    let characterId = "1009144"

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        marvelFactoryMocked = MarvelFactoryMock()

        sut = DetailsInteractor(marvelgateway: marvelFactoryMocked)
        presenterMock = PresenterMock()
        sut.output = presenterMock
        presenterMock.detailsInteractor = sut
        
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

    func testGetCharacterComics() {

        let expectation = expectationWithDescription("Get Characters Comics")

        sut.gateway!.charactersComics(0, charachterId: characterId, completionHandler: { (comics) in

            XCTAssertNotNil(comics, "comics should not be nil")

            expectation.fulfill()

        }) { (error) in

        }

        waitForExpectationsWithTimeout(20) { (error) in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
        }
    }

    func testGetCharacterSeries() {

        let expectation = expectationWithDescription("Get Characters Series")

        sut.gateway!.charactersSeries(0, charachterId: characterId, completionHandler: { (series) in

            XCTAssertNotNil(series, "series should not be nil")

            expectation.fulfill()

        }) { (error) in

        }

        waitForExpectationsWithTimeout(20) { (error) in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
        }
    }

    func testGetCharacterStories() {

        let expectation = expectationWithDescription("Get Characters Stories")

        sut.gateway!.charactersStories(0, charachterId: characterId, completionHandler: { (stories) in

            XCTAssertNotNil(stories, "stories should not be nil")

            expectation.fulfill()

        }) { (error) in

        }

        waitForExpectationsWithTimeout(20) { (error) in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
        }
    }

    func testGetCharacterEvents() {

        let expectation = expectationWithDescription("Get Characters Events")

        sut.gateway!.charactersEvents(0, charachterId: characterId, completionHandler: { (events) in

            XCTAssertNotNil(events, "events should not be nil")

            expectation.fulfill()

        }) { (error) in

        }

        waitForExpectationsWithTimeout(20) { (error) in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
        }
    }

    
}

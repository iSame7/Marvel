//
//  DetailsPresenterTests.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/26/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import XCTest
@testable import Marvel

class DetailsPresenterTests: XCTestCase {

    // Since there is no Mock framwork for swift like OCMock for Objective C, so for now the only way I see is to create a hand rolled mock. In swift this is a little bit less painful since you can create inner classes within a method, but still is not as handy as a mocking framework.

    // Mock Factory class
    class DetailsWireframeMock: DetailsWireframe {
    }

    // Mock Factory class
    class MarvelHeroesDetailsTableViewControllerMock: DetailsViewInterface {

        // This variable to achieve the XCTest expect method like OCMock framework expect method.
        var showCharactersWasCalled = false

        func showCharacterComics(comics: [Comic]) {
            showCharactersWasCalled = true
        }
        func showCharacterSeries(series: [Series]) {
            showCharactersWasCalled = true
        }
        func showCharacterStories(stories: [Stories]) {
            showCharactersWasCalled = true
        }
        func showCharacterEvents(events: [Events]) {
            showCharactersWasCalled = true
        }
    }

    var sut: DetailsPresenter!
    var ui: MarvelHeroesDetailsTableViewControllerMock!
    var detailsWireframeMocked: DetailsWireframeMock!

    var comics:[Comic] = []
    var series:[Series] = []
    var stories:[Stories] = []
    var events:[Events] = []

    override func setUp() {
        super.setUp()

        ui = MarvelHeroesDetailsTableViewControllerMock()

        detailsWireframeMocked = DetailsWireframeMock()

        sut = DetailsPresenter()
        sut.userInterface = ui
        sut.detialsWireframe = detailsWireframeMocked

        /* Parse json testing data files */
        
        // Parse the local test json data as Array of Comic dictionaries.
        if let characterJsonFileURL = NSBundle(forClass: self.dynamicType).URLForResource("Comics", withExtension: "json") {
            XCTAssertNotNil(characterJsonFileURL)

            if let data = NSData(contentsOfURL: characterJsonFileURL), resultDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: [])) as? NSDictionary{

                 let rootClass:ComicRootClass = ComicRootClass(fromDictionary: resultDictionary)
                comics = rootClass.data.results
            }
            
        }

        // Parse the local test json data as Array of Series dictionaries.
        if let characterJsonFileURL = NSBundle(forClass: self.dynamicType).URLForResource("Series", withExtension: "json") {
            XCTAssertNotNil(characterJsonFileURL)

            if let data = NSData(contentsOfURL: characterJsonFileURL), resultDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: [])) as? NSDictionary{

                let rootClass:SeriesRootClass = SeriesRootClass(fromDictionary: resultDictionary)
                series = rootClass.data.results
            }

        }

        // Parse the local test json data as Array of Stories dictionaries.
        if let characterJsonFileURL = NSBundle(forClass: self.dynamicType).URLForResource("Stories", withExtension: "json") {
            XCTAssertNotNil(characterJsonFileURL)

            if let data = NSData(contentsOfURL: characterJsonFileURL), resultDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: [])) as? NSDictionary{

                let rootClass:StoriesRootClass = StoriesRootClass(fromDictionary: resultDictionary)
                stories = rootClass.data.results
            }
            
        }

        // Parse the local test json data as Array of Events dictionaries.
        if let characterJsonFileURL = NSBundle(forClass: self.dynamicType).URLForResource("Events", withExtension: "json") {
            XCTAssertNotNil(characterJsonFileURL)

            if let data = NSData(contentsOfURL: characterJsonFileURL), resultDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: [])) as? NSDictionary{

                let rootClass:EventsRootClass = EventsRootClass(fromDictionary: resultDictionary)
                events = rootClass.data.results
            }

        }
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

    func testFoundCharactersComics() {

        // Test
        sut.foundCharactersComics(comics)

        // Verify
        XCTAssertTrue(ui.showCharactersWasCalled)
    }

    func testFoundCharactersSeries() {

        // Test
        sut.foundCharactersSeries(series)

        // Verify
        XCTAssertTrue(ui.showCharactersWasCalled)
    }

    func testFoundCharactersStories() {

        // Test
        sut.foundCharactersStories(stories)

        // Verify
        XCTAssertTrue(ui.showCharactersWasCalled)
    }

    func testFoundCharactersEvents() {

        // Test
        sut.foundCharactersEvents(events)

        // Verify
        XCTAssertTrue(ui.showCharactersWasCalled)
    }
    
}

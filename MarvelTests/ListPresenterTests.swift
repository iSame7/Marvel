//
//  ListPresenterTests.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/26/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import XCTest
@testable import Marvel

class ListPresenterTests: XCTestCase {


    // Since there is no Mock framwork for swift like OCMock for Objective C, so for now the only way I see is to create a hand rolled mock. In swift this is a little bit less painful since you can create inner classes within a method, but still is not as handy as a mocking framework.

    // Mock Factory class
    class ListWireframeMock: ListWireframe {

        // This variable to achieve the XCTest expect method like OCMock framework expect method. 
        var presentFilterInterfaceWasCalled = false

        override func presentFilterInterface() {
            presentFilterInterfaceWasCalled = true
        }
        override func PresentDetailsInterface(selectedCellIndex: Int, characters: [Marvel.Character]) {
            presentFilterInterfaceWasCalled = true
        }
    }

    // Mock Factory class
    class ListCharactersViewControllerMock: ListViewInterface {

        // This variable to achieve the XCTest expect method like OCMock framework expect method.
        var showCharactersWasCalled = false

        func showCharacters(characters: [Marvel.Character]) {
            showCharactersWasCalled = true
        }
    }
    
    var sut: ListPresenter!
    var ui: ListCharactersViewControllerMock!
    var listWireframeMocked: ListWireframeMock!
    
    var characters:[Marvel.Character] = []

    override func setUp() {
        super.setUp()

        ui = ListCharactersViewControllerMock()

        listWireframeMocked = ListWireframeMock()

        sut = ListPresenter()
        sut.userInterface = ui
        sut.listWireframe = listWireframeMocked


        // Parse the local test json data as Array of Character dictionaries.
        if let characterJsonFileURL = NSBundle(forClass: self.dynamicType).URLForResource("Characters", withExtension: "json") {
            XCTAssertNotNil(characterJsonFileURL)

            if let data = NSData(contentsOfURL: characterJsonFileURL), langDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: [])) as? NSDictionary{

                let rootClass:RootClass = RootClass(fromDictionary: langDictionary)
                characters = rootClass.data.results
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

    func testSearchCharactersActionPresentsFilterUI() {

        // Test
        sut.searchCharacters()

        // Verify
        XCTAssertTrue(listWireframeMocked.presentFilterInterfaceWasCalled)
    }

    func testFoundCharacters() {

        // Test
        sut.foundCharacters(characters)

        // Verify
        XCTAssertTrue(ui.showCharactersWasCalled)
    }

    func testOpenDetailsViewActionPresentsDetailsUI() {

        // Test
        sut.openDetailsView(1, characters: characters)

        // Verify
        XCTAssertTrue(listWireframeMocked.presentFilterInterfaceWasCalled)
    }
}

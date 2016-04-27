//
//  ListViewTests.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/26/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import XCTest
@testable import Marvel

class ListViewTests: XCTestCase {

    var sut: ListCharactersViewController!

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        sut = storyboard.instantiateViewControllerWithIdentifier(ListViewControllerIdentifier) as! ListCharactersViewController
        sut.viewDidLoad()
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

    func testShowCharacters() {
        sut.showCharacters([])

        XCTAssertEqual(sut.view, sut.collectionView, "the collection view should be the view")
    }
    
}

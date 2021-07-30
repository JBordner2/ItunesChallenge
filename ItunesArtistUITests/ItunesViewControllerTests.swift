//
//  ItunesViewControllerTests.swift
//  ItunesArtistUITests
//
//  Created by Jack Bordner on 7/29/21.
//

import XCTest
@testable import ItunesArtist

class ItunesViewControllerTests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
    }

    override func tearDownWithError() throws {
    
    }
    
    func testDoesHideDisplaySpinner() {
        app.searchFields["search artist"].tap()
        app.searchFields["search artist"].typeText("Elvis")
        app.buttons["Search Artist"].tap()
        let activityIndicator = app.activityIndicators.element
        XCTAssertFalse(activityIndicator.exists)
    }
    
    //Time is low so get opinion from interviewer: I don't want to use production API and Mock API is too quick for code below to ever be able to pass. How would interviewer reccomend testing this?
    func testDoesShowDisplaySpinner() {
//        app.searchFields["search artist"].tap()
//        app.searchFields["search artist"].typeText("Elvis")
//        app.buttons["Search Artist"].tap()
//
//        let activityIndicator = app.activityIndicators.element
//        XCTAssertTrue(activityIndicator.exists)
    }
    
    func testDoesDisplayCorrectAmountOfData() {
        app.searchFields["search artist"].tap()
        app.searchFields["search artist"].typeText("Elvis")
        app.buttons["Search Artist"].tap()
        
        let tables = app.tables.matching(identifier: "itunesTableView")
        
        XCTAssertTrue(tables.cells.count == 50)
    }
}

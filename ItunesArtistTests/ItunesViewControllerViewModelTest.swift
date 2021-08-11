//
//  ItunesViewControllerViewModelTest.swift
//  ItunesArtistTests
//
//  Created by Jack Bordner on 8/11/21.
//

import XCTest
@testable import ItunesArtist

class ItunesViewControllerViewModelTest: XCTestCase {
    
    var sut: ItunesViewControllerViewModel!

    override func setUpWithError() throws {
        sut = ItunesViewControllerViewModel(service: MockItunesAPIClient())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testHidePriceLessThanZero() {
        
        // given
        sut.fetchData(for: "Mock Data")
        
        // when
        let data = sut.data
        
        // then
        let lessThanZero = data.filter({$0.trackPrice < 0})
        XCTAssertTrue(lessThanZero.count == 0)
    }
}

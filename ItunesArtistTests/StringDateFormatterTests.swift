//
//  StringDateFormatterTests.swift
//  ItunesArtistTests
//
//  Created by Jack Bordner on 7/29/21.
//

import XCTest
@testable import ItunesArtist

class StringDateFormatterTests: XCTestCase {
    
    var sut: StringDateFormatter!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = StringDateFormatter.dayMonthYear
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testFormatAsStringReturnsEmptyWithInvalidData() {
        
        // given
        sut = StringDateFormatter.dayMonthYear
        
        // when
        let formattedString = sut.formatAsString(for: "InvalidDate")
        
        // then
        XCTAssertEqual(formattedString, "")
    }
    
    func testFormatAsStringReturnsFormattedDateWithValidData() {
     
        // given
        sut = StringDateFormatter.dayMonthYear
        
        // when
        let formattedString = sut.formatAsString(for: "2021-07-29T12:00:00Z")
        
        // then
        XCTAssertEqual(formattedString, "Jul 29, 2021")
    }
}

//
//  ArtistModelTests.swift
//  ItunesArtistTests
//
//  Created by Jack Bordner on 7/29/21.
//

import XCTest
@testable import ItunesArtist

class ArtistModelTests: XCTestCase {
    
    var sut: AlbumModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = AlbumModel(artistName: UUID().description, trackName: UUID().description, releaseDateString: UUID().description, primaryGenreName: UUID().description, trackPrice: 9.99)
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }

    func testArtistNameIsArtistName() {
        //given
        sut = AlbumModel(artistName: "Jack", trackName: UUID().description, releaseDateString: UUID().description, primaryGenreName: UUID().description, trackPrice: 0)
        
        //when
        let value = sut.artistName
        
        //then
        XCTAssertEqual(value, "Jack")
    }
    
    func testTrackNameIsTrackName() {
        //given
        sut = AlbumModel(artistName: UUID().description, trackName: "7 Summers", releaseDateString: UUID().description, primaryGenreName: UUID().description, trackPrice: 0)
        
        //when
        let value = sut.trackName
        
        //then
        XCTAssertEqual(value, "7 Summers")
    }
    
    func testReleaseDateIsReleaseDate() {
        //given
        sut = AlbumModel(artistName: UUID().description, trackName: UUID().description, releaseDateString: "May 5, 2017", primaryGenreName: UUID().description, trackPrice: 0)
        
        //when
        let value = sut.releaseDateString
        
        //then
        XCTAssertEqual(value, "May 5, 2017")
    }
    
    func testPrimaryGenreNameIsprimaryGenreName() {
        //given
        sut = AlbumModel(artistName: UUID().description, trackName: UUID().description, releaseDateString: UUID().description, primaryGenreName: "Country", trackPrice: 0)
        
        //when
        let value = sut.primaryGenreName
        
        //then
        XCTAssertEqual(value, "Country")
    }
    
    func testTrackPriceIsTrackPrice() {
        //given
        sut = AlbumModel(artistName: UUID().description, trackName: UUID().description, releaseDateString: UUID().description, primaryGenreName: UUID().description, trackPrice: 12.75)
        
        //when
        let value = sut.trackPrice
        
        //then
        XCTAssertEqual(value, 12.75)
    }
}

//
//  ItunesAPIClientFactory.swift
//  ItunesArtist
//
//  Created by Jack Bordner on 7/29/21.
//

import Foundation

class ItunesAPIClientFactory {
    
    static func create() -> ItunesAPIProtocol {
         
        let environment = ProcessInfo().environment["ENV"]

        if environment == "TEST" {
            return MockItunesAPIClient()
        } else {
            return ItunesAPIClient()
        }
    }
}

//
//  MockItunesAPIClient.swift
//  ItunesArtist
//
//  Created by Jack Bordner on 7/29/21.
//

import Foundation

class MockItunesAPIClient: ItunesAPIProtocol {
    func retrieveData(for searchTerm: String, completion: @escaping ([AlbumModel]) -> Void) {
        
        guard let url = Bundle(for: MockItunesAPIClient.self).url(forResource: "itunes-success-response", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            completion([]) ; return
        }
        
        var returnedData = [AlbumModel]()
        
        let json = try? JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String:Any]
        
        guard let resultsArray = json?["results"] as? Array<Any> else {
            completion(returnedData) ; return
        }
        
        for (_, value) in resultsArray.enumerated() {
            
            let dictionary = value as? [String: Any]
            
            guard let artistName = dictionary?["artistName"] as? String else { continue }
            guard let trackName = dictionary?["trackName"] as? String else { continue }
            guard let releaseDateString = dictionary?["releaseDate"] as? String else { continue }
            guard let primaryGenreName = dictionary?["primaryGenreName"] as? String else { continue }
            guard let trackPrice = dictionary?["trackPrice"] as? Double else { continue }
            
            let artistModel = AlbumModel(artistName: artistName, trackName: trackName, releaseDateString: releaseDateString, primaryGenreName: primaryGenreName, trackPrice: trackPrice)
            returnedData.append(artistModel)
        }
        
        completion(returnedData)
    }
}

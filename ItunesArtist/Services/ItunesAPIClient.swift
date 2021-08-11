//
//  ItunesAPIClient.swift
//  ItunesArtist
//
//  Created by Jack Bordner on 7/29/21.
//

import Foundation

protocol ItunesAPIProtocol {
    func retrieveData(for searchTerm: String, url: URL, completion: @escaping(_ retrievedData: [AlbumModel]) -> Void)
}

class ItunesAPIClient: ItunesAPIProtocol {
    
    public init() { }
    
    public func retrieveData(for searchTerm: String, url: URL, completion: @escaping(_ retrievedData: [AlbumModel]) -> Void) {
        
        var returnedData = [AlbumModel]()
        
        let artistName = searchTerm.replacingOccurrences(of: " ", with: "+")
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(artistName)") else {
            completion(returnedData) ; return
        }
        
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            // Need requirements for how to handle error
            guard error == nil else {
                completion(returnedData) ; return
            }
            
            guard let data = data else {
                completion(returnedData) ; return
            }
            
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
        
        task.resume()
    }
}

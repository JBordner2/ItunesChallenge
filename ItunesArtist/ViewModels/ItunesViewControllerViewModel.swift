//
//  ViewControllerViewModel.swift
//  ItunesArtist
//
//  Created by Jack Bordner on 7/29/21.
//

import Foundation

protocol ItunesViewControllerViewModelDelegate: class {
    func didRetrieveData()
}

class ItunesViewControllerViewModel {
    
    var data = [AlbumModel]()
    weak var delegate: ItunesViewControllerViewModelDelegate?
    private let service: ItunesAPIProtocol
    
    init(service: ItunesAPIProtocol) {
        self.service = service
    }
    
    public func fetchData(for artistName: String) {
        // Use userInitiated because tasks are second only to user-interactive tasks in priority on system
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.service.retrieveData(for: artistName) { (retrievedData) in
                self?.data = retrievedData
                self?.delegate?.didRetrieveData()
            }
        }
    }
}

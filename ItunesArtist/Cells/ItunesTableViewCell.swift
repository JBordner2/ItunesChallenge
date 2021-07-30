//
//  ItunesTableViewCell.swift
//  ItunesArtist
//
//  Created by Jack Bordner on 7/29/21.
//

import UIKit

class ItunesTableViewCell: UITableViewCell {

    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var primaryGenreLabel: UILabel!
    @IBOutlet weak var trackPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with artist: AlbumModel) {
        self.artistNameLabel.text = artist.artistName
        self.trackNameLabel.text = artist.trackName
        self.releaseDateLabel.text = "Released On: \(StringDateFormatter.dayMonthYear.formatAsString(for: artist.releaseDateString))"
        self.primaryGenreLabel.text = "Genere: \(artist.primaryGenreName)"
        self.trackPriceLabel.text = String("$\(artist.trackPrice)")
    }
}

//
//  MovieTableViewCell.swift
//  Movie
//
//  Created by Sterling Mortensen on 2/17/17.
//  Copyright © 2017 Sterling Mortensen. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    //==============================================================
    // MARK: - Outlets
    //==============================================================
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    var movie: Movie? {
        didSet{
            self.updateViews()
        }
    }
    
    func updateViews() {
        guard let movie = movie else { return }
        ratingLabel.text = "\(movie.rating)"
        infoLabel.text = movie.summary
        titleLabel.text = movie.title
        ImageController.image(forURL: movie.image) { (image) in
            self.movieImage.image = image
        }
    }
}

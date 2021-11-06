//
//  CustomTableViewCell.swift
//  TheMovieDb
//
//  Created by Reddy Tintaya Conde on 6/11/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie! {
        didSet {
            let posterPath = "https://image.tmdb.org/t/p/w500" + self.movie.posterPath
            self.posterImageView.setImage(imageUrl: posterPath)
            self.titleLabel.text = movie.title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

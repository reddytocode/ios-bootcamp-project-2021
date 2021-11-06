//
//  UIImageView.swift
//  TheMovieDb
//
//  Created by Reddy Tintaya Conde on 6/11/21.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imageUrl: String) {
        self.kf.setImage(with: URL(string: imageUrl))
    }
}

//
//  MovieCell.swift
//  CombineFramework
//
//  Created by Tolga İskender on 18.04.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit
import SDWebImage
class MovieCell: UITableViewCell {

    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        movieImage.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell(movie:Search) {
        if let type = movie.type {
             movieDesc.text = "\(movie.year ?? "")/\(type)"
        }
        movieTitle.text = movie.title
        movieImage.sd_setImage(with: URL(string: movie.poster ?? ""), placeholderImage:nil)
    }
    
}

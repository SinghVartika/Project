//
//  PosterCollectionViewCell.swift
//  Project
//
//  Created by TTN on 26/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import AlamofireImage

class PosterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var poster : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setPoster (img : Image)
    {
        self.poster.image = img
        self.poster.contentMode = .scaleToFill
    }

}

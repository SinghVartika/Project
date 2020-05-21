//
//  TrendingCollectionViewCell.swift
//  Project
//
//  Created by TTN on 21/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class TrendingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var move_img : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func poster_mov(img :UIImage)
    {
        self.move_img.image = img
        self.move_img.contentMode = .scaleAspectFit
        self.move_img.contentMode = .scaleAspectFill
    }
    

}


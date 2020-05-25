//
//  OtherCollectionViewCell.swift
//  Project
//
//  Created by TTN on 23/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class OtherCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mov_image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func poster_mov(img :NSURL)
    {
        //self.mov_image.af_setImage(withURL: img as URL)
        self.mov_image.contentMode = .scaleAspectFit
        self.mov_image.contentMode = .scaleAspectFill
    }
    
    func title(ttl :String)
    {
        self.name.text = ttl
    }
    
    func movRating(rtn :String)
    {
        self.rating.text = rtn
    }
    
    func movType(typ :String)
    {
        self.type.text = typ
    }

}

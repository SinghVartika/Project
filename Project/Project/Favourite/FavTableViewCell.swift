//
//  FavTableViewCell.swift
//  Project
//
//  Created by TTN on 27/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    @IBOutlet weak var mv_rating: UILabel!
    @IBOutlet weak var mv_name: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage (movImgage : UIImage)
    {
        self.img.image = movImgage
        self.img.contentMode = .scaleToFill
    }
    
    func title(ttl :String)
    {
        self.mv_name.text = ttl
    }
    
    func movRating(rtn :String)
    {
        self.mv_rating.text = rtn
    }
}

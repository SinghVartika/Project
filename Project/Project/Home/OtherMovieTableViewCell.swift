//
//  OtherMovieTableViewCell.swift
//  Project
//
//  Created by TTN on 23/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class OtherMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mov_image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func poster_mov(img :UIImage)
    {
        self.mov_image.image = img
        self.mov_image.contentMode = .scaleAspectFit
        self.mov_image.contentMode = .scaleAspectFill
    }
    
    func title(ttl :String)
    {
        self.name.text = ttl
    }
    
    func movRating(rtn :String)
    {
        self.rating.text = String(describing:rtn)
    }
    
    func movType(typ :String)
    {
        self.type.text = typ
    }
    
}

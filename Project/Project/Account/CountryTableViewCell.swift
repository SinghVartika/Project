//
//  CountryTableViewCell.swift
//  Project
//
//  Created by TTN on 31/03/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var flag: UILabel!
    @IBOutlet weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCountryIconImageView(image: UIImage) {
        icon.image = image
    }
    
    func setCountryTitleLabel(text: String) {
        title.text = text
    }
    
    func setCountryFlagImageView(image: String) {
        flag.text = image
    }
    
    func setCountryNameLabel(text: String) {
        name.text = text
    }
    
}

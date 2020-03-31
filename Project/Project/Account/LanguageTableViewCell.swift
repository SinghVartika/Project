//
//  LanguageTableViewCell.swift
//  Project
//
//  Created by TTN on 31/03/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setLaguageIconImageView(image: UIImage) {
        icon.image = image
    }
    
    func setLanguageTitleLabel(text: String) {
        title.text = text
    }
    
    func setLanguageNameLabel(text: String) {
        name.text = text
    }
}

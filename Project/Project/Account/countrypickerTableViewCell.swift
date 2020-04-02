//
//  countrypickerTableViewCell.swift
//  Project
//
//  Created by TTN on 31/03/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class countrypickerTableViewCell: UITableViewCell {

    @IBOutlet weak var flag: UILabel!
    @IBOutlet weak var country: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setFlag(text: String) {
        
        flag.text = text
    }
    
    func setCountry(text: String) {
        
        country.text = text
    }
}

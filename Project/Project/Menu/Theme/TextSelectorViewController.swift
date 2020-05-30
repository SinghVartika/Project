//
//  SelectorViewController.swift
//  Project
//
//  Created by TTN on 28/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import SwiftHSVColorPicker

class TextSelectorViewController: UIViewController {
@IBOutlet weak var myview : UIView!
    let colorPicker = SwiftHSVColorPicker(frame: CGRect(x: 10, y: 20, width: 300, height: 400))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myview.addSubview(colorPicker)
        colorPicker.setViewColor(UIColor.red)
        
    }
    
    @IBAction func confirm(_ sender: Any) {
        CustomViewController.txtColor = colorPicker.color
        self.navigationController?.popViewController(animated: true)
    }
    
}
